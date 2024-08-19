#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <link.h>
#include <dbDefs.h>
#include <dbLock.h>
#include <epicsThread.h>
#include <epicsMessageQueue.h>
#include <registryFunction.h>
#include <recSup.h>
#include <subRecord.h>
#include <epicsExport.h>
#include <errlog.h>


typedef struct {
    int instance_counter;
    int private_counter;
    subRecord *precord;
} myData;

static epicsThreadOnceId    threadOnceFlag = EPICS_THREAD_ONCE_INIT;
static epicsMessageQueueId   queueId;
static epicsThreadId        threadId;

static int dbSubFinalDebug  = 0;
epicsExportAddress(int, dbSubFinalDebug);

static EPICSTHREADFUNC calcThread(void *param)
{
    subRecord *precord;
    myData    *pmyData;
    struct rset    *prset;

    while(epicsMessageQueueReceive(queueId, (void*) &pmyData, sizeof(myData*))) {
        precord =  pmyData->precord;
        prset   = (struct rset*) precord->rset;

        if(dbSubFinalDebug) {
            epicsMessageQueueShow(queueId, 1);
            epicsPrintf("Thread %s: Record %s requested thread processing\n",
                        epicsThreadGetNameSelf(),
                        precord->name);
        }


        pmyData->private_counter ++;


        dbScanLock((struct dbCommon*) precord);
        (*prset->process)(precord);
        dbScanUnlock((struct dbCommon*) precord);
    
    }


    return 0;
}


static void spawnThread(void *param)
{
    subRecord *precord = (subRecord*) param;

    queueId      =  epicsMessageQueueCreate(20, sizeof(myData*));
    threadId     =  epicsThreadCreate("calcThread",
                                      epicsThreadPriorityLow,
                                      epicsThreadGetStackSize(epicsThreadStackSmall),
                                      calcThread,
                                      NULL);

   if(dbSubFinalDebug) {
        epicsPrintf("Thread Spawn by (thread) %s, (record) %s\n",
                     epicsThreadGetNameSelf(),
                     precord->name);
   }
}


static long subFinalInit(subRecord *precord)
{
    static int instance_counter = 0;
    myData *pmyData;

    if(dbSubFinalDebug) {
        epicsPrintf("Init SubRecord by (thread) %s, (record) %s\n",
                    epicsThreadGetNameSelf(),
                    precord->name);
    }

    pmyData = (myData*) malloc (sizeof(myData));
    pmyData->instance_counter = ++instance_counter;
    pmyData->private_counter = 0;
    pmyData->precord = precord;

    precord->dpvt    = (void*) pmyData;


    epicsThreadOnce(&threadOnceFlag, (void(*))spawnThread, (void*) precord);


    return 0;
}



static long subFinalProc(subRecord *precord)
{
    myData *pmyData = (myData*) precord->dpvt;

    if(precord->pact) {


        if(dbSubFinalDebug) {
            epicsPrintf("Proc Phase 2 execution by (thread) %s, (record) %s\n",
                        epicsThreadGetNameSelf(),
                        precord->name);
        }
       
        precord->val = pmyData->private_counter;
		precord->pact = FALSE;
        return 0;
    }


    precord->pact = TRUE;

    if(dbSubFinalDebug) {
        epicsPrintf("Proc Phase 1 execution by (thread) %s, (record) %s\n",
                    epicsThreadGetNameSelf(),
                    precord->name);
    }

    epicsMessageQueueSend(queueId, (void*) &pmyData, sizeof(myData*));
    return 0;
}


epicsRegisterFunction(subFinalInit);
epicsRegisterFunction(subFinalProc);
