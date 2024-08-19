#!/bin/env python2.4

#look at win pdb?

import os, pty, sys, Queue, traceback, time, signal
from threading import Thread
from SocketServer import TCPServer,BaseRequestHandler
import socket
from code import InteractiveConsole, softspace
from StringIO import StringIO

class remoteIO:
    
    req = None

    def close(self):
        pass    
    
    def flush(self):
        pass
        
    def write(self,data):
        if self.req:
            try:          
                self.req.send(data)
            except socket.error:
                pass

class debug_server(InteractiveConsole):
    """An interactive console piped over a TCP server.
    This allows remote debugging of python applications by opening up an
    interactive shell and piping stdin and stdout over TCP to the remote
    user. This means that a user can telnet in and type python commands
    which are executed in the environment specified in the init function"""

    def __init__(self,port,queue=None,ls={}):
        """Initialise the object:
        port = TCP port to start the server on
        queue = In order to make this threadsafe we should really execute
                any code in the thread the rest of the program is running
                in, so we create a function from any code we get and put it
                on queue, a threadsafe queue. If you want to be lazy, then
                leave queue=None, and one will be created for you, but your
                application will not be threadsafe. The correct approach is
                to make sure the calling application checks the queue as 
                part of its main loop and executes any functions on it. See
                serial_device for an example.
        ls = a dictionary of locals, with ls[name] = object for each object
             that needs to be in the debug environment"""
        InteractiveConsole.__init__(self,ls)
        self.remoteout = remoteIO()
        self.stdout = sys.stdout
        self.stderr = sys.stderr
        self.inq = Queue.Queue()
        if queue == None:
            self.funcq = Queue.Queue()
            self.fthread = Thread(target = self.__process_forever)
            self.fthread.setDaemon(True)
            self.fthread.start()            
        else:
            self.funcq = queue                
        def MakeHandler(device):
            # make a udp handler that calls device.__exec on text
            class ProxyHandler(BaseRequestHandler):    
                def setup(self):
                    self.request.send("Welcome to a remote python interactive "
                        "console. Type your python commands below.\n>>> ")         
                def handle(self):
                    data = "none yet"
                    while data:
                        data = self.request.recv(1024)
                        if data == "\004":
                            self.request.send("Quit\n")
                            data = ""
                        elif data.endswith("\n"):
                            device.inq.put((data,self.request))
                            device.funcq.put(device.process)           
            return ProxyHandler
        TCPServer.allow_reuse_address = True            
        self.TCP = TCPServer( ("", port), MakeHandler(self) )  
        # start to listen on the debug port
        self.TCPt = Thread(target = self.TCP.serve_forever)
        self.TCPt.setDaemon(True)
        self.TCPt.start()

    def __process_forever(self):
        while True:
            f = self.funcq.get()
            f()
                                                    
    def process(self):
        "Call this from your program if you want to be threadsafe"
        data,req = self.inq.get()
        self.remoteout.req = req
        sys.stdout = self.remoteout
        sys.stderr = self.remoteout
        self.more = self.push(data.replace("\r\n","\n").rstrip("\n"))
        sys.stdout = self.stdout
        sys.stderr = self.stderr
        if self.more:
            data = "... "
        else:
            data = ">>> "
        try:          
            req.send(data)
        except socket.error:
            pass           
