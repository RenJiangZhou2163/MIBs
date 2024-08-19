#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include "failover.h"

#if 0
static string IntToStr ( const int value, const char *format="%d")
{
	char tmpVal[8];
	snprintf    (tmpVal, sizeof(tmpVal), format, value );
	return (value > 32767 ? "IntOverflow": value < -32768 ? "IntUnderflow": tmpVal);
};

static string  Epoch2Datetimestr ( time_t epochtime = 0 )
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
#endif

FailOver::FailOver():msMaster("172.18.54.115"), msSlave("172.18.54.135"), msGate("172.18.0.1")
{
	micmpsocket = new ICMPSocket();
	gethostname(mcHostname, sizeof(mcHostname) );
	setRAddr.insert(msMaster);
	setRAddr.insert(msSlave);
	setRAddr.insert(msGate);

	addIpList();
	//printf("MyIP:%s\n", getMyIPAddr().c_str());
}

FailOver::~FailOver()
{
	delete micmpsocket;
}

void FailOver::setMaster(const string ipaddr)
{
	msMaster = ipaddr;
}
void FailOver::setSlave(const string ipaddr)
{
	msSlave = ipaddr;
}
string FailOver::getSlave()
{
	return msSlave;
}
string FailOver::getMaster()
{
	return msMaster;
}
string FailOver::getMode()
{
	string smode;
	if(getMaster() == getMyIPAddr() )
		smode = "MST";
	else
		smode = "SLV";
	return smode;
}
string FailOver::getMyIPAddr()
{
	size_t i = 0;
	string myIp;
	for (i = 0; i<miplist.size(); i++)
	{
		if (strcmp(mcHostname, mhostlist.at(i).c_str()) == 0 ) 
		{
			myIp = miplist.at(i);
			break;
		};
	};
	return myIp;
}
string FailOver::getHostname()
{
	return string(mcHostname);
}
unsigned int FailOver::checkCHNet()
{
	set<string> setreplyAddr, resultAddr;
	//ICMPSocket pingsock;
	try {
		//multiple host
		micmpsocket->ping( &setRAddr, &setreplyAddr, resultAddr);
		//pingsock.ping( &setRAddr, &setreplyAddr, resultAddr);
	} catch (Exception &sockErr) {
		//printf("Exception %s\n", sockErr.getReason());
		//pingSocket.close();
	};

	unsigned int svrfail = 0;
#if 1
	set<string>::iterator setRIter;
	size_t i = 0;
	for(setRIter = setreplyAddr.begin(); setRIter != setreplyAddr.end(); ++setRIter, i++)
	{ 
		string strReSvr = setRIter->c_str();
		if( msMaster.compare(strReSvr) == 0) 
			svrfail &= ~MASTER;
		else if( msSlave.compare(strReSvr) == 0) 
			svrfail &= ~SLAVE;
		else if( msGate.compare(strReSvr) == 0) 
			svrfail &= ~GATEWAY;
	};
#endif
	set<string>::iterator setIterFail;
	for( setIterFail= resultAddr.begin();setIterFail != resultAddr.end();++setIterFail)
	{
		//printf("Nework Fail IP Addr:(%s), time(%s)\n", 
		//		setIterFail->c_str(), Epoch2Datetimestr().c_str());
		string strFailSvr = setIterFail->c_str();
		if( msMaster.compare(strFailSvr) == 0) 
			svrfail |= MASTER;
		else if( msSlave.compare(strFailSvr) == 0) 
			svrfail |= SLAVE;
		else if( msGate.compare(strFailSvr) == 0) 
			svrfail |= GATEWAY;
	};
	setreplyAddr.clear();
	resultAddr.clear();
	return svrfail;
}
int FailOver::checkSlave(const string ipaddr)
{
	return 0;
}
int FailOver::checkMaster(const string ipaddr)
{
	return 0;
}
void FailOver::addIpList()
{
	miplist.push_back("172.17.100.198"); mhostlist.push_back("gateway2");
	miplist.push_back("172.17.100.199"); mhostlist.push_back("gateway");
	miplist.push_back("172.17.100.201"); mhostlist.push_back("channel");
	miplist.push_back("172.17.100.202"); mhostlist.push_back("mdsplus");
	miplist.push_back("172.18.54.115"); mhostlist.push_back("kstar");
	miplist.push_back("172.18.54.135"); mhostlist.push_back("opinote");
}
#if 0
int FailOver::checksvc(const string &svcname)
{
	string strresult;
	string chksvc;
	if( svcname.compare("tmsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4812\"") + string(" | wc -l");
	} else if( svcname.compare("vmsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4814\"") + string(" | wc -l");
	} else if( svcname.compare("clsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4813\"") + string(" | wc -l");
	} else if( svcname.compare("hrsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4817\"") + string(" | wc -l");
	} else if( svcname.compare("hdsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4818\"") + string(" | wc -l");
	} else if( svcname.compare("qdsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4815\"") + string(" | wc -l");
	} else if( svcname.compare("icrfengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4819\"") + string(" | wc -l");
	} else if( svcname.compare("echengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4816\"") + string(" | wc -l");
	} else if( svcname.compare("fuelengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4821\"") + string(" | wc -l");
	} else if( svcname.compare("ccsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4820\"") + string(" | wc -l");
	} else if( svcname.compare("mpsengine")==0 ) {
		chksvc = string("ps -ef|grep -v grep|grep ") + string("\"ArchiveEngine -port 4825\"") + string(" | wc -l");
	};
	FILE *fp = popen(chksvc.c_str(), "r");
	char buf[4];
	while( fgets(buf, sizeof(buf), fp)) {};
	pclose(fp);
	return atoi(buf);
};
#endif

