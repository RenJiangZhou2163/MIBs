#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>
#include <math.h>

#include <dbAccess.h>
#include <link.h>
#include <dbDefs.h>
#include <dbLock.h>
#include <dbAddr.h>
#include <epicsThread.h>
#include <epicsMessageQueue.h>
#include <registryFunction.h>
#include <recSup.h>
#include <subRecord.h>
#include <epicsExport.h>

using namespace std;
static int gb_Debug = 0;
epicsExportAddress(int, gb_Debug); /*iocsh export variable*/
static bool gb_Var = true;

static char *pstrList[] = {
	">*>>>>> String <<<<<*<",
	">>*>>>> sTring <<<<*<<",
	">>>*>>> stRing <<<*<<<",
	">>>>*>> strIng <<*<<<<",
	">>>>>*> striNg <*<<<<<",
	">>>>>>* strinG *<<<<<<",
	NULL
};

class mySubRecord
{
public:
	mySubRecord():cnt(0)
	{
		printf("mySubRecord Constructor\n");
	};

	~mySubRecord()
	{
		printf("~mySubRecord Destructor\n");
	};

	int IncCount()
	{
		epicsPrintf("Count:%d\n",cnt);
		return cnt++;
	};

	int GetCount() 
	{
		return cnt;
	}

private:
	int cnt;
};

static mySubRecord g_mysubrecord;

static long mySubTStrInit(subRecord *psubrec)
{
	epicsPrintf("%s Init;\n",psubrec->name);
	mySubRecord mysubrecord;
	//g_mysubrecord.IncCount();
	return 0;
}

static long mySubTStrProc(subRecord *psubrec)
{
	DBADDR *pdbaddr = dbGetPdbAddrFromLink(&psubrec->flnk);
	char *pstr = (char*)pdbaddr->pfield;
	
	static int i = 0;
	sprintf(pstr,"%d, %s", i, pstrList[i]);
	i++;

	if(!pstrList[i]) i = 0;

	if(gb_Debug == 1)
	{
		epicsPrintf("Count: %d\n",g_mysubrecord.GetCount());
		if( g_mysubrecord.GetCount() == 20 ) gb_Debug = 0;
		epicsPrintf("R-Name: %s, INPB: %f\n",psubrec->name, psubrec -> b);
		string msg = "Set Debug";
		vector<string> vecstr;
		vecstr.push_back(msg+string("Option1"));
		vecstr.push_back(msg+string("Option2"));

		epicsPrintf("%s\n", msg.c_str());
		epicsPrintf("vecstring - %s\n", vecstr.at(0).c_str());
		epicsPrintf("vecstring - %s\n", vecstr.at(1).c_str());

		g_mysubrecord.IncCount();
	};

	return 0;
}

epicsRegisterFunction(mySubTStrInit);
epicsRegisterFunction(mySubTStrProc);
