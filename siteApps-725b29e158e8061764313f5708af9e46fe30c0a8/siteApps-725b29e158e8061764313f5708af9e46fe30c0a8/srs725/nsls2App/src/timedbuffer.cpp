
#include <exception>
#include <deque>
#include <memory>

#include <dbAccess.h>
#include <dbScan.h>
#include <link.h>
#include <epicsMath.h>
#include <devSup.h>
#include <recGbl.h>
#include <alarm.h>
#include <errlog.h>
#include <epicsTime.h>
#include <registryFunction.h>


#include <subRecord.h>

namespace {

struct Sample {
    double value;
    short isValid;
    epicsTimeStamp stamp;
};
    
struct Priv {
    std::deque<Sample> samples;
};


long BufferInit(subRecord* prec)
{
    try {
        std::auto_ptr<Sample> priv(new Sample);
        prec->dpvt = (void*)priv.release();
    }catch(std::exception& e){
        errlogPrintf("%s: init error: %s\n", prec->name, e.what());
        (void)recGblSetSevr(prec, COMM_ALARM, INVALID_ALARM);
    }
    return 0;
}

/*
 * INPA - Input data
 * INPB - Time period
 */
long BufferProc(subRecord* prec)
{
    Priv *priv = (Priv*)prec->dpvt;
    if(!priv)
        return 0;
    try {
        epicsEnum16 stat, sevr;
        Sample next;
        
        next.value = prec->a;
        
        if(dbGetAlarm(&prec->inpa, &stat, &sevr))==0)
            next.isValid = sevr<INVALID_ALARM;
        else
            next.isValid = 0; /* dbGetAlarm()!=0 means disconnected CA link */

        if(dbGetTimeStamp(&prec->inpa, &next.stamp)!=0) {
            /* dbGetTimeStamp()!=0 means disconnected CA link */
            if(epicsTimeGetCurrent(&next.stamp)) {
                /* oh no this is hard to handle... */
            }
            next.isValid = 0;
        }
        
        priv->samples.push_back(next);
            
    }catch(std::exception& e){
        errlogPrintf("%s: process error: %s\n", prec->name, e.what());
        (void)recGblSetSevr(prec, COMM_ALARM, INVALID_ALARM);
    }
    return 0;
    
    
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

} // namespace

#include "epicsExport.h"

extern "C" {
epicsRegisterFunction(TimeDiffInit);
epicsRegisterFunction(TimeDiff);
}
