
#include <stdlib.h>
#include <string.h>
#include <dbAccess.h>
#include <dbScan.h>
#include <link.h>
#include <epicsMath.h>
#include <devSup.h>
#include <recGbl.h>
#include <alarm.h>
#include <errlog.h>
#include <menuConvert.h>
#include <epicsTime.h>
#include <cvtTable.h>
#include <dbScan.h>
#include <registryFunction.h>


#include <subRecord.h>


static long TimeDiffInit(subRecord* prec) { return 0; }

static long TimeDiff(subRecord* prec)
{
    epicsTimeStamp A, B;

    if(dbGetTimeStamp(&prec->inpa, &A) || A.secPastEpoch==0 ||
       dbGetTimeStamp(&prec->inpb, &B) || B.secPastEpoch==0)
    {
        recGblSetSevr(prec, CALC_ALARM, INVALID_ALARM);
    } else {
        prec->val = epicsTimeDiffInSeconds(&B, &A);
    }
    return 0;
}

#include "epicsExport.h"

epicsRegisterFunction(TimeDiffInit);
epicsRegisterFunction(TimeDiff);
