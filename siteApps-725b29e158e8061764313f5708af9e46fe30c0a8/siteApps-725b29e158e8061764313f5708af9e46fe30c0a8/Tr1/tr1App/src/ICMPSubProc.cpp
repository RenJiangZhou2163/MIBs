#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <link.h>
#include <dbDefs.h>
#include <dbAccess.h>
#include <dbLock.h>
#include <dbAddr.h>
#include <epicsThread.h>
#include <epicsMessageQueue.h>
#include <registryFunction.h>
#include <recSup.h>
#include <subRecord.h>
#include <epicsExport.h>
#include <aiRecord.h>
#include "icmpsocket.h"

static int PingDebug = 0;
static int PingLogFile = 0;
epicsExportAddress(int, PingDebug); /*iocsh export variable*/
epicsExportAddress(int, PingLogFile);
//static ICMPSocket gpingSocket;
static set<string> gsetrequestAddr;
static vector<string> gvecNetAddrList;

//originally 32=MCR Temperature, 64=Computer Room Temperature.
enum gE_NETFAIL{GAWAY=1, CHANNEL=2, DATA=4, BACKUP=8, WEB=16, MDSPLUS=128, GAWAY2=256, TEST=32, TEST2=64};

static void print_binary ( unsigned int u )
{
	unsigned int c = ~0u - ( ~0u >> 1 );

	while ( c != 0 )
	{
		if ( ( u & c ) != 0 ) printf ("1");
		else printf ("0");
		c = c >> 1;
	};
	printf ("\n");
};

string IntToStr ( const int value, const char *format="%d")
{
	char tmpVal[8];
	snprintf    (tmpVal, sizeof(tmpVal), format, value );
	return (value > 32767 ? "IntOverflow": value < -32768 ? "IntUnderflow": tmpVal);
};

string  Epoch2Datetimestr ( time_t epochtime = 0 )
{
	struct tm *ptime;
	int year = 0;
	int month = 0, day = 0, hour = 0, minute = 0, second = 0;

	//ptime = ( epochtime == 0 ) ? localtime ((const time_t*)time(NULL)) : localtime ( &epochtime );
	if ( epochtime == 0 ) epochtime = time (NULL);

	ptime =	localtime ( &epochtime );

	year	= ptime -> tm_year + 1900;
	month	= ptime -> tm_mon + 1;
	day		= ptime -> tm_mday;
	hour	= ptime -> tm_hour;
	minute  = ptime -> tm_min;
	second  = ptime -> tm_sec;

	return ( IntToStr (year) + "/" + IntToStr (month,"%02d") + "/" + IntToStr (day,"%02d")+ " "+ IntToStr (hour,"%02d") + ":" + IntToStr (minute,"%02d") + ":" + IntToStr(second,"%02d") );
};
static long PingSubProc (subRecord *precord)
{
	set<string> setreplyAddr, resultAddr;
	ICMPSocket pingSocket;
	try {
		//multiple host
		pingSocket.ping( &gsetrequestAddr, &setreplyAddr, resultAddr);
	} catch (Exception &sockErr) {
		//printf("Exception %s\n", sockErr.getReason());
		//pingSocket.close();
	};

	set<string>::iterator setIterFail;
	unsigned int svrfail = (unsigned int)precord->val;
#if 1
	set<string>::iterator setRIter;
	size_t i = 0;
	for(setRIter = setreplyAddr.begin(); setRIter != setreplyAddr.end(); ++setRIter, i++)
	{
		string strReSvr = setRIter->c_str();

		if( gvecNetAddrList.at(0).compare(strReSvr) == 0) 
			svrfail &= ~GAWAY2;
		else if( gvecNetAddrList.at(1).compare(strReSvr) == 0) 
			svrfail &= ~GAWAY;
		else if( gvecNetAddrList.at(2).compare(strReSvr) == 0) 
			svrfail &= ~DATA;
		else if( gvecNetAddrList.at(3).compare(strReSvr) == 0) 
			svrfail &= ~CHANNEL;
		else if( gvecNetAddrList.at(4).compare(strReSvr) == 0) 
			svrfail &= ~MDSPLUS;
		else if( gvecNetAddrList.at(5).compare(strReSvr) == 0) 
			svrfail &= ~BACKUP;
		else if( gvecNetAddrList.at(6).compare(strReSvr) == 0) 
			svrfail &= ~WEB;
		else if( gvecNetAddrList.at(7).compare(strReSvr) == 0) 
			svrfail &= ~TEST;
		else if( gvecNetAddrList.at(8).compare(strReSvr) == 0) 
			svrfail &= ~TEST2;
	};
#endif
	for( setIterFail= resultAddr.begin();setIterFail != resultAddr.end();++setIterFail)
	{
		if(PingDebug == 1)
			printf("Nework Fail IP Addr:(%s), time(%s)\n", 
				setIterFail->c_str(), Epoch2Datetimestr().c_str());
		string strFailSvr = setIterFail->c_str();
		if( gvecNetAddrList.at(0).compare(strFailSvr) == 0) 
			svrfail |= GAWAY2;
		else if( gvecNetAddrList.at(1).compare(strFailSvr) == 0) 
			svrfail |= GAWAY;
		else if( gvecNetAddrList.at(2).compare(strFailSvr) == 0) 
			svrfail |= DATA;
		else if( gvecNetAddrList.at(3).compare(strFailSvr) == 0) 
			svrfail |= CHANNEL;
		else if( gvecNetAddrList.at(4).compare(strFailSvr) == 0) 
			svrfail |= MDSPLUS;
		else if( gvecNetAddrList.at(5).compare(strFailSvr) == 0) 
			svrfail |= BACKUP;
		else if( gvecNetAddrList.at(6).compare(strFailSvr) == 0) 
			svrfail |= WEB;
		else if( gvecNetAddrList.at(7).compare(strFailSvr) == 0) 
			svrfail |= TEST;
		else if( gvecNetAddrList.at(8).compare(strFailSvr) == 0) 
			svrfail |= TEST2;
	};

	if(PingDebug == 1)
		print_binary(svrfail);
	precord->val = svrfail;
	setreplyAddr.clear();
	resultAddr.clear();

	//pfieldLinkA = &svrfail;
	//dbProcess((dbCommon*)precordLinkA);
	//setrequestAddr.clear();
	//pingSocket.close();
	return 0;
}
/*subroutine record*/
static long PingSubInit(const subRecord *precord)
{
	gsetrequestAddr.insert("172.18.54.135");
	gsetrequestAddr.insert("172.17.100.101"); gsetrequestAddr.insert("172.17.100.102");
	gsetrequestAddr.insert("172.17.100.103"); gsetrequestAddr.insert("172.17.100.104");
	gsetrequestAddr.insert("172.17.100.105"); gsetrequestAddr.insert("172.17.100.106");
	gsetrequestAddr.insert("172.17.100.107"); gsetrequestAddr.insert("172.17.100.108");
	gsetrequestAddr.insert("172.17.100.109"); gsetrequestAddr.insert("172.17.100.110"); 
	gsetrequestAddr.insert("172.17.100.111"); gsetrequestAddr.insert("172.17.100.112"); 
	gsetrequestAddr.insert("172.17.100.113"); gsetrequestAddr.insert("172.17.100.114"); 
	gsetrequestAddr.insert("172.17.100.115"); gsetrequestAddr.insert("172.17.100.116"); 
	gsetrequestAddr.insert("172.17.100.117"); gsetrequestAddr.insert("172.17.100.118"); 
	gsetrequestAddr.insert("172.17.100.119"); gsetrequestAddr.insert("172.17.100.120"); 
	gsetrequestAddr.insert("172.17.100.198"); gsetrequestAddr.insert("172.17.100.199"); 
	gsetrequestAddr.insert("172.17.100.200"); gsetrequestAddr.insert("172.17.100.201"); 
	gsetrequestAddr.insert("172.17.100.202"); gsetrequestAddr.insert("172.17.100.203");

	gvecNetAddrList.push_back("172.18.54.135");//0
	gvecNetAddrList.push_back("172.17.100.101"); gvecNetAddrList.push_back("172.17.100.102");
	gvecNetAddrList.push_back("172.17.100.103"); gvecNetAddrList.push_back("172.17.100.104");
	gvecNetAddrList.push_back("172.17.100.105"); gvecNetAddrList.push_back("172.17.100.106");
	gvecNetAddrList.push_back("172.17.100.107"); gvecNetAddrList.push_back("172.17.100.108");
	gvecNetAddrList.push_back("172.17.100.109"); gvecNetAddrList.push_back("172.17.100.110"); 
	gvecNetAddrList.push_back("172.17.100.111"); gvecNetAddrList.push_back("172.17.100.112"); 
	gvecNetAddrList.push_back("172.17.100.113"); gvecNetAddrList.push_back("172.17.100.114"); 
	gvecNetAddrList.push_back("172.17.100.115"); gvecNetAddrList.push_back("172.17.100.116"); 
	gvecNetAddrList.push_back("172.17.100.117"); gvecNetAddrList.push_back("172.17.100.118"); 
	gvecNetAddrList.push_back("172.17.100.119"); gvecNetAddrList.push_back("172.17.100.120"); 
	gvecNetAddrList.push_back("172.17.100.198"); gvecNetAddrList.push_back("172.17.100.199"); 
	gvecNetAddrList.push_back("172.17.100.200"); gvecNetAddrList.push_back("172.17.100.201"); 
	gvecNetAddrList.push_back("172.17.100.202"); gvecNetAddrList.push_back("172.17.100.203");
	return 0;
}

epicsRegisterFunction(PingSubInit);
epicsRegisterFunction(PingSubProc);

