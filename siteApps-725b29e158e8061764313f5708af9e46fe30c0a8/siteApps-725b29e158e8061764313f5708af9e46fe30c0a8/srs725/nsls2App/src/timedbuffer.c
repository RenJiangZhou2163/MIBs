
#include <stdlib.h>
#include <string.h>

#include <epicsMath.h>
#include <errlog.h>
#include <ellLib.h>
#include <cantProceed.h>

#include <alarm.h>
#include <dbAccess.h>
#include <menuFtype.h>
#include <aSubRecord.h>
#include <recGbl.h>
#include <alarm.h>

#include <registryFunction.h>

typedef struct {
    ELLNODE node;
    double value;
    char isValid;
    epicsTimeStamp stamp;
} Sample;

typedef struct {
    ELLLIST data;
    ELLLIST unused;

    size_t invalidCount;
} Priv;

static
Sample *allocSample(Priv *priv)
{
    ELLNODE *node;
    Sample *samp;
    
    node = ellGet(&priv->unused);
    if(node)
        return CONTAINER(node, Sample, node);

    return mallocMustSucceed(sizeof(*samp), "timedbuffer allocate Sample");
}

static
void freeSample(Priv *priv, Sample *samp)
{
    if(ellCount(&priv->unused)<20)
        ellInsert(&priv->unused, NULL, &samp->node);
    else
        free(samp);
}

static
char mustGetTime(epicsTimeStamp *out, const DBLINK* plink)
{
    epicsTimeStamp ts;
    
    ts.nsec = ts.secPastEpoch = 0;
    
    dbGetTimeStamp(plink, &ts);
    
    if(ts.nsec!=0 || ts.secPastEpoch!=0)
        goto done;
    
    epicsTimeGetCurrent(&ts);
    
    if(ts.nsec!=0 || ts.secPastEpoch!=0)
        goto done;

    return 0;
done:
    *out = ts;
    return 1;
}

/*
 * INPA - Input value [DOUBLE]
 * INPB - Time interval (sec) [DOUBLE]
 * INPC - 1==Reset [UCHAR]
 * 
 * OUTA - Sum [DOUBLE]
 * OUTB - Invalid Count [ULONG]
 * OUTC - Totoal Count [ULONG]
 */

static long init_buffer(aSubRecord *prec)
{
    Priv *priv;
    
    if(prec->fta!=menuFtypeDOUBLE || prec->ftb!=menuFtypeDOUBLE ||
       prec->ftc!=menuFtypeUCHAR ||
       prec->ftva!=menuFtypeDOUBLE || prec->ftvb!=menuFtypeULONG || prec->ftvc!=menuFtypeULONG)
    {
        errlogPrintf("%s: Invalid aSub field type\n", prec->name);
        (void)recGblSetSevr(prec, COMM_ALARM, INVALID_ALARM);
        return 0;
    }
    
    priv = mallocMustSucceed(sizeof(*priv), "timedbuffer init");
    ellInit(&priv->data);
    ellInit(&priv->unused);
    priv->invalidCount = 0;
    
    prec->dpvt = priv;
    return 0;
}

static long proc_buffer(aSubRecord *prec)
{
    Sample next;
    Priv *priv = prec->dpvt;
    double *value = prec->a, *interval = prec->b, *sum = prec->vala, result = 0.0;
    epicsUInt8 *reset = prec->c, forceReset = 0;
    epicsUInt32 *invlCnt = prec->valb, *totCnt = prec->valc;

    if(!priv || !finite(*interval) || *interval<=0.0) {
        errlogPrintf("%s: uninitialized or invalid interval\n", prec->name);
        (void)recGblSetSevr(prec, READ_ALARM, INVALID_ALARM);
        return 0;
    }

    /* Fill in next sample */
    {
        epicsEnum16 stat, sevr;
        
        next.value = *value;
        
        if(dbGetAlarm(&prec->inpa, &stat, &sevr)==0)
            next.isValid = sevr<INVALID_ALARM;
        else
            next.isValid = 0; /* dbGetAlarm()!=0 means disconnected CA link */

        if(!mustGetTime(&next.stamp, &prec->inpa))
            next.isValid = 0;
        
        if(ellCount(&priv->data)) {
            ELLNODE *node = ellFirst(&priv->data);
            Sample *prev = CONTAINER(node, Sample, node);
            if(epicsTimeDiffInSeconds(&next.stamp, &prev->stamp) <= 0.0) {
                /* next stamp is from the past??? */
                errlogPrintf("%s: Received sample w/ earlier timestamp!  Resetting sum!\n", prec->name);
                forceReset = 1;
            }
        }
    }
    
    if(*reset || forceReset) {
        ELLNODE *node;
        
        while((node=ellGet(&priv->data))!=NULL)
            freeSample(priv, CONTAINER(node, Sample, node));

        priv->invalidCount = 0;
        errlogPrintf("%s: reset sum\n", prec->name);
        (void)recGblSetSevr(prec, UDF_ALARM, INVALID_ALARM);
        goto report;
    }
    
    /* pop off old values which are now outside the time window */
    while(1) {
        Sample *prev = 0;
        ELLNODE *node = ellFirst(&priv->data);
        
        if(!node) /* if empty then nothing to do here */
            break;
        
        prev = CONTAINER(node, Sample, node);
        
        if(epicsTimeDiffInSeconds(&next.stamp, &prev->stamp) > *interval) {
            ellDelete(&priv->data, node);
            freeSample(priv, prev);
        
            if(!prev->isValid) {
                assert(priv->invalidCount>0);
                priv->invalidCount--;
            }
        } else
            break; /* all data within the interval */
    }

    /* push on the next sample */
    {
        Sample *samp = allocSample(priv);
        *samp = next;

        if(!next.isValid)
            priv->invalidCount++;
        
        
        ellAdd(&priv->data, &samp->node);
    }
    
    /* compute sum */
    {
        ELLNODE *node = ellFirst(&priv->data);
        
        for(; node; node=ellNext(node)) {
            Sample *samp = CONTAINER(node, Sample, node);
            result += samp->value;
        }
    }
    
report:
    /* fill out results */
    *sum = result;
    *invlCnt = priv->invalidCount;
    *totCnt = ellCount(&priv->data);
    
    if(priv->invalidCount>=ellCount(&priv->data)) {
        (void)recGblSetSevr(prec, UDF_ALARM, INVALID_ALARM);
    }
    
    return 0;
}


static registryFunctionRef asub_seq[] = {
    {"InitTimedBuffer", (REGISTRYFUNCTION) &init_buffer},
    {"ProcTimedBuffer", (REGISTRYFUNCTION) &proc_buffer},
};

static
void timedbufferRegister(void) {
    registryFunctionRefAdd(asub_seq, NELEMENTS(asub_seq));
}

#include <epicsExport.h>

epicsExportRegistrar(timedbufferRegister);
