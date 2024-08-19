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


static long EXCalcASUB3(aSubRecord *p_asubrec)
{
	printf("EXCalcASUB3 Called\n");
	return 0;
}

epicsRegisterFunction(EXCalcASUB3);
/*subroutine record*/
