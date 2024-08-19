#include <stdio.h>
#include <stdlib.h>
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


static char *pstrList[] = {
	">>>>>>>>> String <<<<<<<<<",
	">>>>>>>>> sTring <<<<<<<<<",
	">>>>>>>>> stRing <<<<<<<<<",
	">>>>>>>>> strIng <<<<<<<<<",
	">>>>>>>>> striNg <<<<<<<<<",
	">>>>>>>>> strinG <<<<<<<<<",
	NULL
};

/*subroutine record*/
static long mySubStrInit(subRecord *precord)
{
	return 0;
}

static long mySubStrProc(subRecord *precord)
{
	DBADDR *pdbAddr = dbGetPdbAddrFromLink(&precord->flnk);
	char *string = (char*)pdbAddr->pfield;

	static int i = 0;

	sprintf(string, "%d, %s", i, pstrList[i++]);

	if(!pstrList[i]) i = 0;
	return 0;
}

epicsRegisterFunction(mySubStrInit);
epicsRegisterFunction(mySubStrProc);
