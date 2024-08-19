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
static long InitASUB1(aSubRecord *precord)
{
	return 0;
}

static long CalcASUB1(aSubRecord *p_asubrec)
{
#if 1
	double *aval = (double*)p_asubrec->a;
	double *bval = (double*)p_asubrec->b;

	//DBADDR *pdbAddr = dbGetPdbAddrFromLink(&p_asubrec->flnk);
	DBADDR *pdbAddr = dbGetPdbAddrFromLink(&p_asubrec->outa);
	//static int count = 0;
	//printf("DBAddr(%d):%p\n", count++, pdbAddr);


	waveformRecord *precordLinkA = (waveformRecord *)pdbAddr->precord;

	double *wf = (double*)p_asubrec->vala;
	long noe = pdbAddr->no_elements;
	//printf("NOE: %d\n",noe);

	long noa = p_asubrec->noa;
	long nob = p_asubrec->nob;
	int i = 0;

	long* sin_phase = (long*)p_asubrec->c;
	long* cos_phase = (long*)p_asubrec->d;

	//printf("sinPhase:%d, cosPhase:%d\n", sin_phase[0], cos_phase[0]);

	for( i = 0; i < noa; i++)
	{
		wf[i] = sin(aval[i]*sin_phase[0])+cos(bval[i]*cos_phase[0]);
		//printf("%f ", wf[i]);
	};
		//printf("\n");

	precordLinkA->nord = noe;
	dbProcess(precordLinkA);

	return 0;

#else
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
#endif

	return 0;
}

epicsRegisterFunction(InitASUB1);
epicsRegisterFunction(CalcASUB1);
