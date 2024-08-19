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
#ifndef _FAILOVER_H
#define _FAILOVER_H
#include <fstream>
#include <algorithm>
#include <vector>
#include <set>
#include <string>
#include <cstring>
#include <iostream>
#include <ostream>
#include <iterator>
#include "icmpsocket.h"

using namespace std;

class FailOver
{
public:
	//Default constaructor.
	FailOver();

	//Destructor.
	~FailOver();

	enum CHNET_e{MASTER=1, SLAVE=2, GATEWAY=4};

	void setMaster(const string ipaddr);
	void setSlave(const string ipaddr);
	string getMaster();
	string getSlave();
	string getHostname();
	string getMyIPAddr();
	string getMode();
	//int checksvc(const string &svcname);

	unsigned int checkCHNet();
private:
	ICMPSocket *micmpsocket;
	string msMaster;
	string msSlave;
	string msGate;
	vector<string> miplist;
	vector<string> mhostlist;
	set<string> setRAddr;
	char mcHostname[255];
	int checkSlave(const string ipaddr);
	int checkMaster(const string ipaddr);
	void addIpList();
};
#endif
