#!/bin/env python2.4

import os, pty, sys, Queue, traceback, time, socket, types, traceback
from threading import Thread
from SocketServer import ThreadingTCPServer,BaseRequestHandler,ThreadingUDPServer
from debug_server import debug_server

class scheduler:

    def __init__(self,parent,func,delay,times=None):
        self.parent = parent
        self.func = func
        self.delay = delay
        self.times = times
        
    def go(self):
        if type(self.times) == int:
            while self.times>0:
                time.sleep(self.delay)
                if self.parent.inq:
                    self.parent.inq.put(self.func)
                self.times -= 1
        else:
            while True:
                time.sleep(self.delay)
                if self.parent.inq:                
                    self.parent.inq.put(self.func)

class serial_device:
    """Subclass this to create your own python serial simulations. The
    following attributes should be set:
    Terminator = Default terminator.
    InTerminator = String to mark the end of a message recieved over the 
                   comms port. It is stripped off and the rest of the
                   message is passed to reply.
    OutTerminator = String that is added to anything sent out over the comms
                    port.
       
    You will probably need to reimplement the reply method to do something
    useful.

    Usage in IOC:
    First create an instance of your simulation, then run either start_ip
    or start_serial to start listening for data. You can also start_debug
    to start a debug server that you can type python at to debug your code
    """

    # terminator
    Terminator = "\r\n"
    # input and output terminators, if None, defaults to Terminator
    InTerminator = None
    OutTerminator = None
    # input queue, output queue
    inq = None
    outq = None
    # server type so we know what to send
    server_type = None
    # server started?
    started = False
    debug_started = False
    rpc_started = False
    # Test framework support
    power = True
    coverage = None
    diagLevel = 0
    branches = None    

    def __init__(self, protocolBranches=[], power=True, ui=None):
        # Test framework support
        self.power = power
        self.branches = protocolBranches
        self.ui = None
        self.diagLevel = 1
        self.udp = False
        if ui is not None:
            self.ui = ui.declareSimulation(self)

    def __daemon(self,f):
        # create a daemon thread
        t = Thread(target = f)
        t.setDaemon(True)
        t.start()
        
    def start_serial(self,var):
        """Create a pseudo serial port pair, and start listening for data on
        the server port. The slave port name is declared in an environment
        variable var, so drvAsynSerialPortConfigure should connect to $(var)"""
        if self.started:
            self.diagnostic("Server already started")
        else:
            self.inq, self.outq = Queue.Queue(), Queue.Queue()
            self.started = True
            # create a pseudo serial port, open slave port so listening doesn't fail
            self.mfd,sname = pty.master_open()
            self.sfd = pty.slave_open(sname)
            # start to listen on the master port
            self.__daemon(self.__serial_in)
            # start to respond to any messages put on the outq
            self.__daemon(self.__serial_out)    
            # start the worker thread
            self.__daemon(self.__process)
            # put the portname for the IOC to connect to in var
            os.environ[var] = sname

    def __serial_in(self):
        "put the next character on the queue"
        while True:
            self.inq.put(os.read(self.mfd,1))

    def __serial_out(self):
        "put anything in the out queue onto the serial bus"
        while True:
            os.write(self.mfd,self.outq.get())

    def onHandlerSetup(self, handler):
        "Overwrite to do something when a connection is made. e.g. write a WELCOME banner "
#        handler.request.send("Welcome from serial_sim")
        
    def onHandlerFinish(self, handler):
        "Overwrite to do something when a connection is closed."
        
    def start_ip(self,port):
        """Create a TCP server and start listening for data. Put any input data
        on the inq for listen to read, and send and data on the outq. The
        drvAsynIPPortConfigure should connect to localhost:port if the
        simulation is on the same machine as the IOC."""
        if self.started:
            self.diagnostic("Server already started")
        else:
            self.inq, self.outq = Queue.Queue(), Queue.Queue()
            self.started = True       
            # store the request to respond to
            self.outreq = None
            def MakeHandler(device):
                # make a basic tcp handler that puts messages on a queue
                class ProxyHandler(BaseRequestHandler):
                    def setup(self):
                        BaseRequestHandler.setup(self)
                        device.onHandlerSetup(self)
                    def finish(self):
                        BaseRequestHandler.finish(self)
                        device.onHandlerFinish(self)
                    def handle(self):
                        if self.request != None:
                            data = "nothing yet"
                            device.outreq = self.request
                            while data:
                                data = self.request.recv(1024)
                                for char in data:
                                    device.inq.put(char)
                return ProxyHandler
            ThreadingTCPServer.allow_reuse_address = True
            self.server = ThreadingTCPServer( ("", port), MakeHandler(self) )
            # start to listen on the master port
            self.__daemon(self.server.serve_forever)
            # start to respond to any messages put on the outq
            self.__daemon(self.__ip_out)
            # start the worker thread
            self.__daemon(self.__process)

    def start_udp(self,port):
        """Create a UDP server and start listening for data. Put any input data
        on the inq for listen to read, and send any data on the outq. The
        drvAsynIPPortConfigure should connect to localhost:port if the
        simulation is on the same machine as the IOC."""
        if self.started:
            self.diagnostic("Server already started")
        else:
            self.inq, self.outq = Queue.Queue(), Queue.Queue()
            self.started = True
            self.udp = True
            # store the request to respond to
            self.outreq = None
            def MakeHandler(device):
                # make a basic tcp handler that puts messages on a queue
                class ProxyHandler(BaseRequestHandler):
                    def setup(self):
                        BaseRequestHandler.setup(self)
                        device.onHandlerSetup(self)
                    def finish(self):
                        BaseRequestHandler.finish(self)
                        device.onHandlerFinish(self)
                    def handle(self):
                        if self.request != None:
                            data = "nothing yet"
                            device.outreq = (self.request[1], self.client_address)
                            device.inq.put(self.request[0])
                return ProxyHandler
            self.server = ThreadingUDPServer( ("", port), MakeHandler(self) )
            # start to listen on the master port
            self.__daemon(self.server.serve_forever)
            # start to respond to any messages put on the outq
            self.__daemon(self.__ip_out)
            # start the worker thread
            self.__daemon(self.__process)

    def __ip_out(self):
        "respond to the last requestor with anything in the out queue"
        while True:
            data = self.outq.get()
            if self.outreq!=None:
                try:
                    if self.udp:
                        self.outreq[0].sendto(data, self.outreq[1])
                    else:
                        self.outreq.send(data)
                except:
                    pass

    def start_debug(self,port):
        """Start a debugging ip port that will execute python commands sent to 
        it with self = the current object. Connect by typing:
        telnet localhost port
        in a terminal window."""
        if self.debug_started:
            self.diagnostic("Debug server already started")
        elif not self.started:
            self.diagnostic("Start a serial server first")
        else:
            self.debug_started = True
            self.debug_server = debug_server(port,self.inq,{"self":self})

    def start_rpc(self, port, quiet = True):
        """Start a classic rpyc instance with a simulation() function. 
        To get the simulation object do the following from the remote machine:
        import rpyc
        # this is the machine running the simulation
        hostname = "pc43"
        # this is the port passed to start_rpc
        port = 9050
        conn = rpyc.classic.connect(hostname, port = port)
        sim = conn.root.simulation()"""
        if self.rpc_started:
            self.diagnostic("RPC server already started")
        elif not self.started:
            self.diagnostic("Start a serial server first")
        else:
            self.rpc_started = True
            from rpyc.utils.server import ThreadedServer
            from rpyc.core import SlaveService      
            class MyService(SlaveService):
                sim = self
                def exposed_simulation(self):
                    return self.sim
            self.rpc_server = ThreadedServer(MyService, port = port, auto_register = True)
            self.rpc_server.logger.quiet = quiet
            self.__daemon(self.rpc_server.start)

    def start_no_io(self):
        """Start the serial device with no I/O.  This is useful for simulations
        that do not have I/O but want to take advantage of other serial_device
        features."""
        if self.started:
            self.diagnostic("Server already started")
        else:
            self.inq, self.outq = Queue.Queue(), Queue.Queue()
            self.started = True       
            # store the request to respond to
            self.outreq = None
            # start to respond to any messages put on the outq
            self.__daemon(self.__ip_out)
            # start the worker thread
            self.__daemon(self.__process)

    def listen(self,command):
        """Decide what to do with the command so far, return either command or
        tuple of new command and what to put on the queue. This method
        returns command unless command ends with InTerminator, in which
        case it returns ("",command_without_InTerminator). Reimplement
        this function if your device doesn't use terminators."""
        if self.InTerminator != None:
            Terminator = self.InTerminator
        else:
            Terminator = self.Terminator
        if command.endswith(Terminator):
            return ("",command[:-len(Terminator)])
        else:
            return command

    def reply(self,command):
        """Take command and return a string response or None. If the response
        is a string, it will have OutTerminator appended and will be sent
        over the comms port. This is a sample method that just returns
        command. This is the only method that needs to be changed in a
        typical simulation device"""
        return command

    def schedule(self,function,delay,times=None):
        """Wait delay seconds, call function, if the result is not None,
        append OutTerminator and send it over the comms port. If times!=None
        do this <times> times, otherwise do this forever."""
        s = scheduler(self,function,delay,times)
        self.__daemon(s.go)

    def __process(self):
        "process the inq using listen, and put responses on the outq using reply"
        command = ""
        if self.OutTerminator != None:
            Terminator = self.OutTerminator
        else:
            Terminator = self.Terminator
        while True:
            try:
                data = self.inq.get()
                # check if it a function produced by talk() or the debug server
                if type(data) in [ types.MethodType, types.FunctionType ]:
                    # run it and put any result on the outq
                    result = data()
                    if result != None:            
                        if self.isPowerOn():                            
                            self.diagnostic("Send: %s %s"%(result.__repr__(),[ord(x) for x in Terminator]), 2)                    
                            if Terminator != None :
                                self.outq.put(result+Terminator)                            
                            else:
                                self.outq.put(result)
                elif self.udp:
                    response = self.reply(data)
                    if response != None:
                        self.outq.put(response)
                else:
                    # it is a command to be processed
                    command += data
                    self.diagnostic("Input so far: %s"%([ord(x) for x in command]), 4)
                    decision = self.listen(command)
                    if type(decision)!=tuple:
                        # just keep parsing the stream
                        command = decision
                    else:
                        # process this command
                        command = decision[0]
                        self.diagnostic("Got: %s"%(decision[1].__repr__()), 3)
                        if self.isPowerOn():
                            response = self.reply(decision[1])
                            if response != None:
                                response = str(response)
                                self.diagnostic("Reply: %s %s"%(response.__repr__(),[ord(x) for x in Terminator]), 2)
                                if Terminator != None :
                                    self.outq.put(response+Terminator)
                                else:
                                    self.outq.put(response)
            except:
                # never want to fail, just print the error and continue
                traceback.print_exc()


    def isPowerOn(self):
        '''Returns true if the device power is on.'''
        return self.power

    def powerOn(self):
        '''Switch the power on.'''
        if not self.power:
            self.initialise()
        self.power = True
 
    def powerOff(self):
        '''Switch the power off.'''
        self.power = False

    def diagnosticLevel(self):
        '''Returns the current diagnostic level.'''
        return self.diagLevel

    def setDiagnosticLevel(self, level):
        '''Set the current diagnostic level.'''
        self.diagLevel = int(level)

    def diagnostic(self, text, level=0):
        if self.diagLevel >= level:
            if self.ui is None:
                print text
            else:
                self.ui.output(text + "\n")

    def clearCoverage(self):
        self.coverage = set()

    def covered(self, branchName):
        '''Indicates that a branch has been executed.'''
        if self.coverage is None:
            self.clearCoverage()
        self.coverage.add(branchName)

    def command(self, text):
        '''The interface for the test framework.  The text must be a space
        seperated list of arguments.  Results are 'returned' by just
        printing them out.  This super class implementation provides the
        common commands for all simulation devices.  Override to provide
        specific commands but don't forget to call this base class version
        when the override is not applicable.'''
        args = text.split()
        if args[0] == "off":
            self.power = False
        elif args[0] == "on":
            if not self.power:
                self.initialise()
            self.power = True
        elif args[0] == "power":
            self.response("power %d" % self.power)
        elif args[0] == "coverage":
            reply = "coverage"
            for item in self.coverage:
                reply = reply + " " + item
            self.response(reply)
        elif args[0] == "covclear":
            self.clearCoverage()
        elif args[0] == "covbranches":
            reply = "covbranches"
            if self.branches is not None:
	        for item in self.branches:
                    reply = reply + " " + item
            self.response(reply)
        elif args[0] == "diaglevel":
            self.diagLevel = int(args[1])

    def initialise(self):
        '''Override this function to implement power on initialisation.'''
        pass

    def response(self, text):
        '''Call the function to return text to the test framework.  The current
        implementation just prints it out on the assumption that the test
        framework is monitoring standard out.  One day, a proper protocol
        may be invented.'''
        print text

    def createUi(self):
        '''Override to create the user interface for the simulation.'''
        return None


def CreateSimulation(cls, *pargs, **kwargs):
    '''Options parser for a serial_device. Takes a cls, instantiates it with
    any extra arguments, then uses the options parser to start ip, rpc and debug
    services on the device. Returns (ob, options, args)'''
    from optparse import OptionParser
    parser = OptionParser("usage: %prog")
    parser.add_option("-i", dest = "ip", help = "Start an ip port on PORT")
    parser.add_option("-r", dest = "rpc", help = "Start an rpc port on PORT")    
    parser.add_option("-d", dest = "debug", help = "Start a debug port on PORT")    
    options, args = parser.parse_args()
    ob = cls(*pargs, **kwargs)
    if options.ip:
        ob.start_ip(int(options.ip))
    if options.rpc:
        ob.start_rpc(int(options.rpc))
    if options.debug:
        ob.start_debug(int(options.debug))
    return ob, options, args
