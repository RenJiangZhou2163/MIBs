#include <stdio.h>
#include <stdlib.h>
#include <math.h>

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


static int mySubDebug = 0;
epicsExportAddress(int, mySubDebug); /*iocsh export variable*/

/*subroutine record*/
static long mySubInit(subRecord *precord)
{
#if 0
	if(mySubDebug == 1)
	{
		epicsPrintf("mySubInit: (rec) %s, (thread) %s\n", precord->name, epicsThreadGetNameSelf());
	};
#endif
	return 0;
}

static long mySubProc(subRecord *precord)
{
	precord->val = sin( precord->a * precord->b);
#if 0
	if(mySubDebug == 1)
	{
		epicsPrintf("mySubProc: (rec) %s, (thread) %s\n", precord->name, epicsThreadGetNameSelf());
	};
#endif
	return 0;
}

#if 0
static registryFunctionRef mySubRef[] = {
	{"mySubInit", (REGISTRYFUNCTION) mySubInit},
	{"mySubProc", (REGISTRYFUNCTION) mySubProc}
};
static void mySubRegistrar(void)
{
	registryFunctionAdd(mySubRef, NELEMENTS(mySubRef));
}
epicsExportRegistrar(mySubRegistrar);
#endif

epicsRegisterFunction(mySubInit);
epicsRegisterFunction(mySubProc);
