//#include <algorithm>
#include <sys/types.h>
#include <unistd.h>
#include "icmpsocket.h"

ICMPSocket::ICMPSocket():CONST_PINGPACKET(1024)
{
	open();
}
ICMPSocket::~ICMPSocket()
{
	close();
}
const int ICMPSocket::open() throw (Exception)
{
	if ((msockFD = socket (AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) 
	{
		throw Exception("[ICMPSocket::open] socket failed - %s\n", strerror(errno));
		return -1;
	};
	return msockFD;
}

//Single host.
const int ICMPSocket::ping (const char *ipAddr, const int timeOut, const int size)
{
	return (ping(ICMPSocket::UNICAST, (pid_t)getpid(), ipAddr, NULL, timeOut, size) );
}
//Multicast host.
const int ICMPSocket::ping (const char *ipAddr, vector<string> *replyAddrList, const int timeOut, const int size)
{
	return (ping(ICMPSocket::BROADCAST, (pid_t)getpid(), ipAddr, replyAddrList, timeOut, size) );
}
const int ICMPSocket::ping (const IpAddrType_e ipAddrType, const int id, const char *ipAddr,
		vector<string> *replyAddrList, const int timeOut, const int size) throw (Exception)
{
	if (NULL != replyAddrList) 
	{
		// enable broadcast
		int		option	= 1;
		if (setsockopt (msockFD, SOL_SOCKET, SO_BROADCAST, &option, sizeof(option)) < 0) 
		{
			throw Exception ("[ICMPSocket::ping] cannot set broadcast %s\n", strerror(errno));
		};
	};

    //printf ("ipAddr(%s) timeout(%d) size(%d)", ipAddr, timeOut, size);
    //printf ("Pinging %s with %d bytes of data:", ipAddr, size);
    
	struct sockaddr_in	addr;
	char buffer[CONST_PINGPACKET];

	// must initialize buffer
	memset ( buffer, 0x00, sizeof (buffer) );
	IcmpPacket (id, ICMP_ECHO, buffer, size);

	memset ( &addr, 0, sizeof (sockaddr_in));
	addr.sin_family			= AF_INET;
	addr.sin_addr.s_addr	= inet_addr(ipAddr);

	if ( 0 > sendto (msockFD, buffer, sizeof(icmp) + size, 0, (struct sockaddr*)&addr, sizeof(sockaddr_in)) ) 
	{
		throw Exception ("[ICMPSocket::ping] sendto failed %s", strerror(errno));
	};
	
	int		sendSec, sendMsec;		// send time
	int		recvSec, recvMsec;		// receive time
	
	getCurDateTimeMillis (sendSec, sendMsec);
	fd_set				reads;
	struct sockaddr_in	from;
	int                 nReadLen;
	int					sl  = sizeof (from);
	struct timeval		timeout;
	struct timeval		*pTimeout   = NULL;
    int     			termTime;
	int					nSleep;		// msec
	char				replyIpAddr[64];

	struct ip			*ip;
	struct icmp			*rp;
	
    if (0 != timeOut) {
    	pTimeout    = &timeout;
	}

    while (1) 
	{
		// select timeout
		if (pTimeout != 0) 
		{
			// get current time
			getCurDateTimeMillis (recvSec, recvMsec);

			// get milli seconds
			nSleep	= ((recvSec - sendSec) * 1000) + (recvMsec - sendMsec);
			nSleep	= timeOut - nSleep;

			timeout.tv_sec	= nSleep / 1000;
			timeout.tv_usec	= (nSleep % 1000) * 1000;
		};

    	FD_ZERO ((fd_set *)&reads);
    	FD_SET (msockFD, (fd_set *)&reads);

    	switch ( select (msockFD + 1, (fd_set *)&reads, (fd_set *)NULL, 
					(fd_set *)NULL, pTimeout) ) 
		{
    		case 0 :	// timeout
				printf ("Request timed out for %s\n", ipAddr);
    			return (-1);
    
    		case -1 :	// fail or EINTR
    			if (EINTR == errno) continue;
    			throw Exception ("[ICMPSocket::ping] select failed %s", strerror(errno));
    	};

		memset (&from, 0x00, sizeof(from));
    	
		while (((nReadLen = recvfrom (msockFD, buffer, sizeof(buffer), 0, (struct sockaddr*)&from, (socklen_t *)&sl)) < 0)
				&& (EINTR == errno) ) 
		{
			continue;
		};

		if (0 > nReadLen) 
		{
			throw Exception ("[ICMPSocket::ping] recvfrom failed %s", strerror(errno));
		};

		strcpy (replyIpAddr, inet_ntoa(from.sin_addr));

		if (replyAddrList != 0) 
		{
			replyAddrList->push_back(replyIpAddr);
		};

		// check ip address is equal
		if (strcmp (ipAddr, inet_ntoa (from.sin_addr)) != 0) 
		{
			printf ("ICMPSocket->ping: receive addresss %s is not match\n", replyIpAddr);
			continue;
		};

		ip	= (struct ip *) buffer;
		rp	= (struct icmp *) (buffer + ip->ip_hl * 4);		// number of 32-bit words * 4 = bytes

		if (ICMP_ECHOREPLY != rp->icmp_type) 
		{
			printf ("ICMPSocket->ping: receive message is not ICMP_ECHOREPLY\n");
			continue;
		};

		if (id != rp->icmp_id) 
		{
			printf ("ICMPSocket->ping: receive message id is not match : send(%d) recv(%d)\n", id, rp->icmp_id);
			continue;
		};

		if (ICMPSocket::UNICAST == ipAddrType) 
		{
			// ok
			break;
		};
    };
	getCurDateTimeMillis (recvSec, recvMsec);
    termTime    = ((recvSec - sendSec) * 1000) + (recvMsec - sendMsec);
    
    //printf ("Reply from %s: bytes=%d time=%d ms\n", ipAddr, size, termTime);
    //printf ("ping ok ...\n");
	return (termTime);
}
//const int ICMPSocket::ping (set<string> *requestAddrList, set<string> *replyAddrList, const int timeout, const int size)
const int ICMPSocket::ping (set<string> *requestAddrList, set<string> *replyAddrList, set<string> &setDiff, const int timeout, const int size)
{
	return (ping ((pid_t)getpid(), requestAddrList, replyAddrList, setDiff, timeout, size ));
};
const int ICMPSocket::ping (const int id, set<string> *requestAddrList,
		set<string> *replyAddrList,set<string> &setDiff, const int timeOut, const int size) throw (Exception)
		//set<string> *replyAddrList, const int timeOut, const int size) throw (Exception)
{
	if ( requestAddrList == 0 ) 
	{
		throw Exception ("[ICMPSocket::ping] input is invalid");
	};

    //printf("[ICMPSocket::ping] cnt(%d) timeout(%d) size(%d)", requestAddrList->size(), timeOut, size);
    
	struct sockaddr_in	addr;
	char				buffer[CONST_PINGPACKET];
	memset ( buffer, 0x00, sizeof (buffer) );

	IcmpPacket (id, ICMP_ECHO, buffer, size);
	memset ( &addr, 0, sizeof (sockaddr_in));

	set<string>::iterator reqIter;
#if 0
	for (size_t i = 0; i < requestAddrList->size(); i++) 
	{
		addr.sin_family			= AF_INET;
		addr.sin_addr.s_addr	= inet_addr(requestAddrList->at(i).c_str());
		sendto (msockFD, buffer, sizeof(icmp) + size, 0, (struct sockaddr*)&addr, sizeof(sockaddr_in));
	};
#else
	for (reqIter = requestAddrList->begin(); reqIter != requestAddrList->end(); ++reqIter) 
	{
		addr.sin_family			= AF_INET;
		addr.sin_addr.s_addr	= inet_addr(reqIter->c_str());
		sendto (msockFD, buffer, sizeof(icmp) + size, 0, (struct sockaddr*)&addr, sizeof(sockaddr_in));
	};
#endif
	
	// send time
	int		sendSec, sendMsec;
	// receive time
	int		recvSec, recvMsec;
	
	getCurDateTimeMillis (sendSec, sendMsec);
	
	fd_set				reads;
	struct sockaddr_in	from;
	int                 nReadLen;
	int					sl  = sizeof (from);
	struct timeval		timeout;
	struct timeval		*pTimeout   = NULL;
    int     			termTime;
	//int					nSleep;		// msec
	//char				replyIpAddr[64];
	string				replyIpAddr;

	struct ip			*ip;
	struct icmp			*rp;
	
    if (timeOut != 0) 
    	pTimeout    = &timeout;

	FD_ZERO ((fd_set *)&reads);
	FD_SET (msockFD, (fd_set *)&reads);
	timeout.tv_sec = TIMEOUT_MSEC/1000;
	timeout.tv_usec = 0;
	// special interator for container 
	insert_iterator<set <string> > setDiffIns(setDiff, setDiff.begin());

    while (1) 
	{
		//timeout
		switch ( select (msockFD + 1, (fd_set *)&reads, (fd_set *)NULL, (fd_set *)NULL, &timeout) ) 
		{
			case 0 :	// timeout
				//printf ("Request timed out ...\n");
				set_difference(requestAddrList->begin(), requestAddrList->end(), 
						replyAddrList->begin(), replyAddrList->end(), setDiffIns);
				return (-1);

			case -1 :	// fail or EINTR
				printf ("****select failed ****\n");
				return (-1);
				//continue;
				//if (EINTR == errno) continue;
				//throw Exception ("[ICMPSocket::ping] select failed", strerror(errno));
		};

		memset (&from, 0x00, sizeof(from));
		while (((nReadLen = recvfrom (msockFD, buffer, sizeof(buffer), 0, 
					(struct sockaddr*)&from, (socklen_t *)&sl)) < 0) && (EINTR == errno) ) 
		{
			continue;
		};

		if (0 > nReadLen) 
		{
			throw Exception ("[ICMPSocket::ping] recvfrom failed", strerror(errno));
		};

		// number of 32-bit words * 4 = bytes
		replyIpAddr = inet_ntoa(from.sin_addr);
		ip	= (struct ip *) buffer;
		rp	= (struct icmp *) (buffer + ip->ip_hl * 4);

		//printf ("[ICMPSocket::ping] received from %s : type(%d) id(%d)\n", replyIpAddr.c_str(), rp->icmp_type, rp->icmp_id);

		if (ICMP_ECHOREPLY != rp->icmp_type) 
		{
			//printf ("[ICMPSocket::ping] receive message is not ICMP_ECHOREPLY\n");
			continue;
		};
		if (id != rp->icmp_id) 
		{
			//printf ("[ICMPSocket::ping] receive message id is not match : send(%d) recv(%d)\n", id, rp->icmp_id);
			continue;
		};
		// set container has unique element.
		//set<string>::iterator sameAddrIter = find ( replyAddrList->begin(), replyAddrList->end(), replyIpAddr);
		//if(sameAddrIter != replyAddrList->end())
			//printf("*********SameAddr:%s*************\n", sameAddrIter->c_str());

		replyAddrList->insert (replyIpAddr);
		if( replyAddrList->size() == requestAddrList->size() ) break;
	};
	getCurDateTimeMillis (recvSec, recvMsec);
	//printf("recvSec[%d]-sendSec[%d], recvMsec[%d] - sendMsec[%d]\n", recvSec, sendSec, recvMsec, sendMsec);
    if((termTime = ((recvSec - sendSec) * 1000) + (recvMsec - sendMsec)) < 0) termTime = 0;
    
	return (termTime);
}
void ICMPSocket::getCurDateTimeMillis (int &sec, int &msec)
{
	struct timespec curTime;

	clock_gettime(CLOCK_REALTIME, &curTime);

	sec		= curTime.tv_sec;
	msec	= curTime.tv_nsec/1000000;
}
void ICMPSocket::IcmpPacket(const int ID, const int type, char *buffer, const int size)
{
	struct icmp *pIcmp = (struct icmp*) buffer;

	pIcmp->icmp_type	= type;
	pIcmp->icmp_code	= 0;
	pIcmp->icmp_seq		= 0;
	pIcmp->icmp_id		= ID;
	pIcmp->icmp_cksum	= checksum((u_short*)pIcmp, size);

	//printf("IcmpPacket type(%d), id(%d), checksum(%d)\n",
	//		pIcmp->icmp_type, pIcmp->icmp_id, pIcmp->icmp_cksum);
}
const unsigned short ICMPSocket::checksum (unsigned short *p, int n)
{
	register unsigned short answer;
	register long sum = 0;
	u_short odd_byte = 0;
	while ( n > 1 ) 
	{
		sum += *p++;
		n -= sizeof(u_short);
	};
	if ( n == 1 ) 
	{
		*( u_char *)( &odd_byte ) = *(u_char *)p;
		sum += odd_byte;
	};
	sum = ( sum >> 16 ) + ( sum & 0xffff );
	sum += ( sum >> 16 );
	answer = ~sum;
	return answer;
}
void ICMPSocket::close()
{
	::close(msockFD);
	msockFD = -1;
}
