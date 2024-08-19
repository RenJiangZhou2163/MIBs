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
#include <aSubRecord.h>
#include <epicsExport.h>
#include <waveformRecord.h>


/*subroutine record*/
static long InitASUB3(aSubRecord *precord)
{
	return 0;
}

static long CalcASUB3(aSubRecord *p_asubrec)
{
	double *aval = (double*)p_asubrec->a;
	double *bval = (double*)p_asubrec->b;

	DBADDR *pdbAddr = dbGetPdbAddrFromLink(&p_asubrec->outa);
	waveformRecord *precordLinkA = (waveformRecord *)pdbAddr->precord;

	double *wf = (double*)p_asubrec->vala;
	long noe = pdbAddr->no_elements;

	long noa = p_asubrec->noa;
	long nob = p_asubrec->nob;

	//long* sin_phase = (long*)p_asubrec->c;
	//long* cos_phase = (long*)p_asubrec->d;

	int i = 0;
	for( i = 0; i < noa; i++)
	{
		//wf[i] = (aval[i]*sin_phase[0])*abs(bval[i]*cos_phase[0]);
		wf[i] = 5*fabs(aval[i])-fabs(bval[i]);
	};
		//printf("\n", wf[i]);
		//printf("\n");

	precordLinkA->nord = noe;
	dbProcess(precordLinkA);

	return 0;
}

static long EXCalcASUB3(aSubRecord *p_asubrec)
{
	printf("EXCalucASUB3 Called\n");
	return 0;
}

epicsRegisterFunction(InitASUB3);
epicsRegisterFunction(CalcASUB3);
epicsRegisterFunction(EXCalcASUB3);
