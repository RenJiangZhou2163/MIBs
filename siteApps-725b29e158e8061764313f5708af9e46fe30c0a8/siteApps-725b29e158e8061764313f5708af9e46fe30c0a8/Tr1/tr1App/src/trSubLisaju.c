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
#include <waveformRecord.h>


/*subroutine record*/
static long subLisajuInit(subRecord *precord)
{
	return 0;
}

static long subLisajuProc(subRecord *precord)
{
	DBADDR *pdbAddrA = dbGetPdbAddrFromLink(&precord->inpa);
	DBADDR *pdbAddrB = dbGetPdbAddrFromLink(&precord->inpb);

	float *pfieldLinkA =  (float*)pdbAddrA->pfield;
	float *pfieldLinkB =  (float*)pdbAddrB->pfield;

	long no_elements = pdbAddrA->no_elements;
	int index = 0;

	waveformRecord *precordLinkA = (waveformRecord *)pdbAddrA->precord;
	waveformRecord *precordLinkB = (waveformRecord *)pdbAddrB->precord;

	float con_inpA = (float)precord->c;
	float con_inpB = (float)precord->d;
	float con_inpDelta = (float)precord->e;

	for(index = 0; index < no_elements;index++)
	{
		pfieldLinkA[index] =  cos(con_inpA*M_PI/(float)no_elements * (float)index);
		pfieldLinkB[index] =  cos(con_inpB*M_PI/(float)no_elements * (float)index + con_inpDelta);
	};

	precordLinkA->nord = no_elements;
	precordLinkB->nord = no_elements;

	dbProcess(precordLinkA);
	dbProcess(precordLinkB);

	return 0;
}

epicsRegisterFunction(subLisajuInit);
epicsRegisterFunction(subLisajuProc);
