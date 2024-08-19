// Filename : icmpsocket.h
//
// ***************************************************************************
//
// Copyright(C) 2009, National Fusion Research Institute, All rights reserved.
// Proprietary information, National Fusion Research Institute.
//
// ***************************************************************************
//
// ***************************************************************************
#ifndef _ICMPSOCKET_H
#define _ICMPSOCKET_H
#include <errno.h>
#include <sys/time.h>

#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <fstream>
#include <algorithm>
#include <vector>
#include <set>
#include <string>
#include <cstring>
#include <iostream>
#include <ostream>
#include <iterator>
#include "exception.h"

using namespace std;

class ICMPSocket
{
public:
	static const int TIMEOUT_MSEC     = 3000;
	static const int DATA_SIZE        = 64;

	typedef enum IpAddrType_e {
		UNICAST =0, 
		BROADCAST=1 
	};

	//Default constaructor.
	ICMPSocket();
	//Destructor.
	~ICMPSocket();

	const int open() throw (Exception);
	void close();
	//single host
	const int ping (const char *ipAddr, const int timeOut = TIMEOUT_MSEC, const int size = DATA_SIZE);
	//multicast host
	const int ping (const char *ipAddr, vector<string> *replyAddrList, const int timeOut = TIMEOUT_MSEC, const int size = DATA_SIZE);
	const int ping (const IpAddrType_e ipAddrType, const int id, const char *ipAddr,
			vector<string> *replyAddrList, const int timeOut = TIMEOUT_MSEC, const int size = DATA_SIZE) throw (Exception);
	const int ping (set<string> *requestAddrList, set<string> *replyAddrList, 
			set<string> &setDiff, const int timeOut = TIMEOUT_MSEC, const int size = DATA_SIZE);
	const int ping (const int id, set<string> *requestAddrList,
			set<string> *replyAddrList,set<string> &setDiff, const int timeOut = TIMEOUT_MSEC, const int size = DATA_SIZE) throw (Exception);

private:
	const unsigned short checksum (unsigned short *p, int n);
	void IcmpPacket(const int ID, const int type, char *buffer, const int size);
	void getCurDateTimeMillis (int &sec, int &msec);
	const int CONST_PINGPACKET;
	int msockFD;
};
#endif
