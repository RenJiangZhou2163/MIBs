import sys
import socket

def nresponse_lines(command):
	""" commands expect different numbers of response lines 
	"""
	if command.startswith('OUT'): # poll command
		return 3 # ack, data. complete
	else:                         # reset, INP commands
	  return 2 # ack, complete

# command line args and defaults
script = 'tmc.dat'
if len(sys.argv) > 1:
script = sys.argv[1]

PORT = 8080          
if len(sys.argv) > 2:
PORT = int(sys.argv[2])

# responses to SCX controllers, copied from tmc.proto
term = '\n\r' # LF then CR at the end of each response line
ack = ' ' + term # acknowledgement string, begins response
complete = '$' + term  # last line of response

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Ensure we release listener socket immediately when program exits, 
#  to avoid socket.error: [Errno 48] Address already in use
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
rcvbuf = s.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF)
mss = s.getsockopt(socket.SOL_IP, socket.TCP_MAXSEG) # SOL_TCP returns 0
s.bind(('localhost', PORT))
s.listen(1) 
conn, addr = s.accept()
	print 'Connected by %s with RCVBUF %s, MAXSEG %s' % \
	(addr, rcvbuf, mss)

	fd = open(script, 'r')
	sn = 0 # command serial command
	linelen = 120
	reading_script = True

while True:
# first receive from IOC, EPICS protocol
		command = conn.recv(linelen) # block here waiting for IOC to send
		sn += 1
		if not command:
		print 'connection lost'
		break
		print command
#print '%d: %s'% (sn, command)

	nresponse = nresponse_lines(command)

	for iresponse in range(nresponse):
		if reading_script:
		response = fd.readline().rstrip('\n') # but keep blank for ack line
		if not response:
		reading_script = False; # readline on EOF returns empty string
		if not reading_script:
		response = raw_input('moxa>')
		print response
		conn.send(response + term) # add LF CR at the end of each response

conn.close()
