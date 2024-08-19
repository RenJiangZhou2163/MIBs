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
#include "failover.h"

static int CHFailOverDebug = 0;
epicsExportAddress(int, CHFailOverDebug); /*iocsh export variable*/
//static FailOver gfailover;

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
int checksvc(const string &svcname)
{
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
//int runchild( const string command)
int runchild()
{
	//int svcchk = checksvc(command);
	//if (svcchk>0)	 return -1;

	pid_t pid = fork();
	if (pid == -1) return -1;
	if (pid == 0) 
	{
		string strcmd;
#if 0
		if (command.compare("tmsengine")== 0)
		{
			chdir("/SNFS/TMSArchivedData");
			strcmd = "./arch.cmd";
		} 
		else if (command.compare("vmsengine")== 0)
		{
			chdir("/SNFS/VMSArchivedData");
			strcmd = "./arch.cmd";
		} 
		else if (command.compare("clsengine")== 0)
		{
			chdir("/SNFS/CLSArchivedData");
			strcmd = "./arch.cmd";
		}
		else if (command.compare("hrsengine")== 0)
		{
			chdir("/SNFS/HRSArchivedData");
			strcmd = "./arch.cmd";
		} 
		else if (command.compare("hdsengine")== 0)
		{
			chdir("/SNFS/SHDSArchivedData");
			strcmd = "./arch.cmd";
		} 
		else if (command.compare("qdsengine")== 0)
		{
			chdir("/SNFS/QDSArchivedData");
			strcmd = "./arch.cmd";
		} 
		else if (command.compare("icrfengine")== 0)
		{
			chdir("/SNFS/ICRFArchivedData");
			strcmd = "./arch.cmd";
		}
		else if (command.compare("echengine")== 0)
		{
			chdir("/SNFS/ECHArchiveData");
			strcmd = "./arch.cmd";
		}
		else if (command.compare("fuelengine")== 0)
		{
			chdir("/SNFS/FUELArchivedData");
			strcmd = "./arch.cmd";
		}
		else if (command.compare("ccsengine")== 0)
		{
			chdir("/SNFS/PF1Test");
			strcmd = "./arch.cmd";
		}
		else if (command.compare("mpsengine")== 0)
		{
			chdir("/SNFS/MPSArchivedData");
			strcmd = "./arch.cmd";
		};
#endif
		strcmd = "Start.cmd &";
		execl( "/bin/bash", "sh", "-c", strcmd.c_str(), NULL);
		exit (-1);
	};
	return 1;
}
void StartChannelArchiver()
{
	FILE *fp = popen("StartChannelArchiver.sh &", "r");
	pclose(fp);
}

void StopChannelArchiver()
{
	FILE *fp = popen("StopChannelArchiver.sh &", "r");
	pclose(fp);
}

	//for test
	//DBADDR *pdbAddrA = dbGetPdbAddrFromLink(&precord->inpa);
	//aiRecord *precordLinkA = (aiRecord *)pdbAddrA->precord;
	//static int count = 0;
	//int *pfieldLinkA =  (int*)pdbAddrA->pfield;
	//long no_elements = pdbAddrA->no_elements;
	//*pfieldLinkA = count++;
		//printf("FailOver AutoSet :%d, Whoami:%s\n",*pfieldLinkA, failover.getMode().c_str());
	//dbProcess((dbCommon*)precordLinkA); //for test
static long ChNetFailoverSubProc (subRecord *precord)
{
	int autoFailover = (int)precord->a;
	if (autoFailover == 0) return(0);
	FailOver failover;
	DBADDR *pdbaddr = dbGetPdbAddrFromLink(&precord->flnk);
	char *pstr = (char*)pdbaddr->pfield ;
	unsigned int failNet = failover.checkCHNet();
	if (CHFailOverDebug == 1) {
		printf("FailOver AutoSet :%d, Whoami:%s\n",autoFailover, failover.getMode().c_str());
	};
	switch (failNet)
	{
		case 0: // Network All Good
			if(failover.getMode().compare("SLV")==0) {
				StopChannelArchiver();
			} else if(failover.getMode().compare("MST")==0) {
				StartChannelArchiver();
			};
			if (CHFailOverDebug == 1) {
				printf("Stop - Slave ChannelArchiver\n");
				printf("AllStandBy:Start Master ChannelArchiver\n");
			};
			strcpy(pstr,"M-Start:ALLSTANDBY");
			break;
		case 1: // Master Fail, Slave confirm.
			StartChannelArchiver();
			if (CHFailOverDebug == 1) {
				printf("Master Fail: -> Start - Slave ChannelArchiver\n");
			};
			strcpy(pstr,"S-Start:MaterFail");
			break;
		case 2: // Slave Fail, Master confirm.
			StartChannelArchiver();
			if (CHFailOverDebug == 1) {
				printf("Slave Fail: -> Start - Master ChannelArchiver\n");
			};
			strcpy(pstr,"M-Start:SlaveFail");
			break;
		case 5: // Slave Self Check... Slave Network Fail
			StopChannelArchiver();
			if (CHFailOverDebug == 1) {
				printf("SlaveFail:Slave Network Fail\n");
			};
			strcpy(pstr,"S-NETWORKFAIL");
			break;
		case 6: // Master Self Check... Master Network Fail
			StopChannelArchiver();
			if (CHFailOverDebug == 1) {
				printf("MasterFail:Start Slave ChannelArchiver\n");
			};
			strcpy(pstr,"M-NETWORKFAIL");
			break;
	};
	if (CHFailOverDebug == 1) print_binary(failNet);
	precord->val = failNet;
	return 0;
}
/*subroutine record*/
static long ChNetFailoverInit(const subRecord *precord)
{
	return 0;
}

epicsRegisterFunction(ChNetFailoverSubProc);
epicsRegisterFunction(ChNetFailoverInit);
