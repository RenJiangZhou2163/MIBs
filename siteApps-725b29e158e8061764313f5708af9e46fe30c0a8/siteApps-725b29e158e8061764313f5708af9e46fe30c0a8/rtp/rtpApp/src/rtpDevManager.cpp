#include <iostream>
#include <aiRecord.h>
#include "rtpDevManager.h"

#define DEFAULT_RING_BUFFER_SIZE 10
#define MAX_ENUM_STATES 16
#define MAX_ENUM_STRING_SIZE 26
#define FLAG_BROADCAST                  0x1
#define FLAG_CONNECT_PER_TRANSACTION    0x2
#define FLAG_SHUTDOWN                   0x4

#if defined(__rtems__)
# define USE_SOCKTIMEOUT
#else
# define USE_POLL
# if defined(vxWorks)
#  define FAKE_POLL
# elif defined(_WIN32)
#  if defined(POLLIN)
#   define poll(fd,nfd,t) WSAPoll(fd,nfd,t)
#  else
#   define FAKE_POLL
#  endif
# else
#  include <sys/poll.h>
# endif
#endif


/* This delay is needed in cleanup() else sockets are not always really closed cleanly */
#define CLOSE_SOCKET_DELAY 0.02
/* This delay is how long to wait in seconds after a send fails with errno ==
 * EAGAIN or EINTR before trying again */
#define SEND_RETRY_DELAY 0.01

/*
 * This structure holds the hardware-specific information for a single
 * asyn link.  There is one for each IP socket.
 */
typedef struct {
    asynUser          *pasynUser;        /* Not currently used */
    char              *IPDeviceName;
    char              *IPHostName;
    char              *portName;
    int                socketType;
    int                flags;
    SOCKET             fd;
    unsigned long      nRead;
    unsigned long      nWritten;
    int                haveAddress;
    osiSockAddr        farAddr;
    asynInterface      common;
    asynInterface      octet;
} ttyController_t;

unsigned char maskBit[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned short fcstab[256] = {
// 16 bit FCS lookup table per RFC1331 : For HDLC CRC calculation
0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf, 
0x8c48, 0x9dc1, 0xaf5a, 0xbed3, 0xca6c, 0xdbe5, 0xe97e, 0xf8f7, 
0x1081, 0x0108, 0x3393, 0x221a, 0x56a5, 0x472c, 0x75b7, 0x643e, 
0x9cc9, 0x8d40, 0xbfdb, 0xae52, 0xdaed, 0xcb64, 0xf9ff, 0xe876, 
0x2102, 0x308b, 0x0210, 0x1399, 0x6726, 0x76af, 0x4434, 0x55bd, 
0xad4a, 0xbcc3, 0x8e58, 0x9fd1, 0xeb6e, 0xfae7, 0xc87c, 0xd9f5, 
0x3183, 0x200a, 0x1291, 0x0318, 0x77a7, 0x662e, 0x54b5, 0x453c, 
0xbdcb, 0xac42, 0x9ed9, 0x8f50, 0xfbef, 0xea66, 0xd8fd, 0xc974, 
0x4204, 0x538d, 0x6116, 0x709f, 0x0420, 0x15a9, 0x2732, 0x36bb, 
0xce4c, 0xdfc5, 0xed5e, 0xfcd7, 0x8868, 0x99e1, 0xab7a, 0xbaf3, 
0x5285, 0x430c, 0x7197, 0x601e, 0x14a1, 0x0528, 0x37b3, 0x263a, 
0xdecd, 0xcf44, 0xfddf, 0xec56, 0x98e9, 0x8960, 0xbbfb, 0xaa72, 
0x6306, 0x728f, 0x4014, 0x519d, 0x2522, 0x34ab, 0x0630, 0x17b9, 
0xef4e, 0xfec7, 0xcc5c, 0xddd5, 0xa96a, 0xb8e3, 0x8a78, 0x9bf1, 
0x7387, 0x620e, 0x5095, 0x411c, 0x35a3, 0x242a, 0x16b1, 0x0738, 
0xffcf, 0xee46, 0xdcdd, 0xcd54, 0xb9eb, 0xa862, 0x9af9, 0x8b70, 
0x8408, 0x9581, 0xa71a, 0xb693, 0xc22c, 0xd3a5, 0xe13e, 0xf0b7, 
0x0840, 0x19c9, 0x2b52, 0x3adb, 0x4e64, 0x5fed, 0x6d76, 0x7cff, 
0x9489, 0x8500, 0xb79b, 0xa612, 0xd2ad, 0xc324, 0xf1bf, 0xe036, 
0x18c1, 0x0948, 0x3bd3, 0x2a5a, 0x5ee5, 0x4f6c, 0x7df7, 0x6c7e, 
0xa50a, 0xb483, 0x8618, 0x9791, 0xe32e, 0xf2a7, 0xc03c, 0xd1b5, 
0x2942, 0x38cb, 0x0a50, 0x1bd9, 0x6f66, 0x7eef, 0x4c74, 0x5dfd, 
0xb58b, 0xa402, 0x9699, 0x8710, 0xf3af, 0xe226, 0xd0bd, 0xc134, 
0x39c3, 0x284a, 0x1ad1, 0x0b58, 0x7fe7, 0x6e6e, 0x5cf5, 0x4d7c, 
0xc60c, 0xd785, 0xe51e, 0xf497, 0x8028, 0x91a1, 0xa33a, 0xb2b3, 
0x4a44, 0x5bcd, 0x6956, 0x78df, 0x0c60, 0x1de9, 0x2f72, 0x3efb, 
0xd68d, 0xc704, 0xf59f, 0xe416, 0x90a9, 0x8120, 0xb3bb, 0xa232, 
0x5ac5, 0x4b4c, 0x79d7, 0x685e, 0x1ce1, 0x0d68, 0x3ff3, 0x2e7a, 
0xe70e, 0xf687, 0xc41c, 0xd595, 0xa12a, 0xb0a3, 0x8238, 0x93b1, 
0x6b46, 0x7acf, 0x4854, 0x59dd, 0x2d62, 0x3ceb, 0x0e70, 0x1ff9, 
0xf78f, 0xe606, 0xd49d, 0xc514, 0xb1ab, 0xa022, 0x92b9, 0x8330, 
0x7bc7, 0x6a4e, 0x58d5, 0x495c, 0x3de3, 0x2c6a, 0x1ef1, 0x0f78
};
#if 0 
// Format of RTP communications message frame.
==============================================
		SYNC	= 0xC3
----------------------------------------------
		LENGTH	= N+1		(L)
							(H)
----------------------------------------------
		NODE/PHASE
----------------------------------------------
		COMMAND/RESPONSE
----------------------------------------------
		DATA[1]
----------------------------------------------
		... 
		...
----------------------------------------------
		DATA[1392]
----------------------------------------------
		CRC[1]				(L)
							(H)
----------------------------------------------
		...
		...
----------------------------------------------
		CRC[58]				(L)
						    (H)
===============================================	
#endif

typedef struct ringBufferElement {
    epicsInt32      value;
    epicsTimeStamp  time;
    asynStatus      status;
} ringBufferElement;

typedef struct devInt32Pvt{
    dbCommon          *pr;
    asynUser          *pasynUser;
    asynUser          *pasynUserSync;
    asynUser          *pasynUserEnumSync;
    asynInt32         *pint32;
    void              *int32Pvt;
    void              *registrarPvt;
    int               canBlock;
    epicsInt32        deviceLow;
    epicsInt32        deviceHigh;
    epicsMutexId      mutexId;
    epicsAlarmCondition alarmStat;
    epicsAlarmSeverity alarmSevr;
    ringBufferElement *ringBuffer;
    int               ringHead;
    int               ringTail;
    int               ringSize;
    int               ringBufferOverflows;
    ringBufferElement result;
    interruptCallbackInt32 interruptCallback;
    double            sum;
    int               numAverage;
    int               bipolar;
    epicsInt32        mask;
    epicsInt32        signBit;
    CALLBACK          callback;
    IOSCANPVT         ioScanPvt;
    char              *portName;
    char              *userParam;
    int               addr;
    char              *enumStrings[MAX_ENUM_STATES];
    int               enumValues[MAX_ENUM_STATES];
    int               enumSeverities[MAX_ENUM_STATES];
}devInt32Pvt;

int		getCallbackValue (devInt32Pvt *pPvt);

devRTP devAsynRTPRead  ={6, NULL, NULL, initAi, getIoIntInfo, processAi, convertAi};
devRTP devAsynRTPWrite ={6, NULL, NULL, initAo, getIoIntInfo, processAo, convertAo};

epicsExportAddress(dset,devAsynRTPRead);
epicsExportAddress(dset,devAsynRTPWrite);

static void ttyCleanup(ttyController_t *tty);
static asynStatus readIt(void *drvPvt, asynUser *pasynUser, char *data, size_t maxchars,size_t *nbytesTransfered,int *gotEom);
static asynStatus readIt32(void *drvPvt, asynUser *pasynUser, epicsInt32 *data);
static asynStatus writeIt(void *drvPvt, asynUser *pasynUser, const char *data, size_t numchars,size_t *nbytesTransfered);
static asynStatus writeIt32(void *drvPvt, asynUser *pasynUser,epicsInt32 data);
static asynStatus flushIt(void *drvPvt,asynUser *pasynUser);
static asynStatus connectIt(void *drvPvt, asynUser *pasynUser);
static void asynCommonReport(void *drvPvt, FILE *fp, int details);
static asynStatus asynCommonConnect(void *drvPvt, asynUser *pasynUser);
static asynStatus asynCommonDisconnect(void *drvPvt, asynUser *pasynUser);
static void closeConnection(asynUser *pasynUser,ttyController_t *tty,const char *why);
static void cleanup (void *arg);

/*
 * asynCommon methods
 */
static const struct asynCommon drvAsynIPPortAsynCommon = {
    asynCommonReport,
    asynCommonConnect,
    asynCommonDisconnect
};

asynStatus initCommon(dbCommon *pr, DBLINK *plink,
    userCallback processCallback,interruptCallbackInt32 interruptCallback, interruptCallbackEnum callbackEnum,
    int maxEnums, char *pFirstString, int *pFirstValue, epicsEnum16 *pFirstSeverity)
{
    devInt32Pvt *pPvt;
    asynStatus status;
    asynUser *pasynUser;
    asynInterface *pasynInterface;
    epicsUInt32 mask=0;
    int nbits;

    pPvt = (devInt32Pvt*)callocMustSucceed(1, sizeof(*pPvt), "devAsynInt32::initCommon");
    pr->dpvt = pPvt;
    pPvt->pr = pr;
    /* Create asynUser */
    pasynUser = pasynManager->createAsynUser(processCallback, 0);
    pasynUser->userPvt = pPvt;
    pPvt->pasynUser = pasynUser;
    pPvt->mutexId = epicsMutexCreate();
 
    /* Parse the link to get addr and port */
    /* We accept 2 different link syntax (@asyn(...) and @asynMask(...)
     * If parseLink returns an error then try parseLinkMask. */
    status = pasynEpicsUtils->parseLink(pasynUser, plink, 
                &pPvt->portName, &pPvt->addr, &pPvt->userParam);
    if (status != asynSuccess) {
        status = pasynEpicsUtils->parseLinkMask(pasynUser, plink, 
                &pPvt->portName, &pPvt->addr, &mask, &pPvt->userParam);
    }
    if (status != asynSuccess) {
        printf("%s devAsynInt32::initCommon  %s\n",
                     pr->name, pasynUser->errorMessage);
        goto bad;
    }
    
    /* Parse nbits if it was specified */
    nbits = (int)mask;
    if (nbits) {
        if (nbits < 0) {
            nbits = -nbits;
            pPvt->bipolar = 1;
        }
        pPvt->signBit = (epicsInt32) ldexp(1.0, nbits-1);
        pPvt->mask = pPvt->signBit*2 - 1;
        if (pPvt->bipolar) {
            pPvt->deviceLow = ~(pPvt->mask/2)+1;
            pPvt->deviceHigh = (pPvt->mask/2);
        } else {
            pPvt->deviceLow = 0;
            pPvt->deviceHigh = pPvt->mask;
        }
    }
            
    /* Connect to device */
    status = pasynManager->connectDevice(pasynUser, pPvt->portName, pPvt->addr);
    if (status != asynSuccess) {
        printf("%s devAsynInt32::initCommon connectDevice failed %s\n",
                     pr->name, pasynUser->errorMessage);
        goto bad;
    }
    status = pasynManager->canBlock(pPvt->pasynUser, &pPvt->canBlock);
    if (status != asynSuccess) {
        printf("%s devAsynInt32::initCommon canBlock failed %s\n",
                     pr->name, pasynUser->errorMessage);
        goto bad;
    }
    /*call drvUserCreate*/
    pasynInterface = pasynManager->findInterface(pasynUser,asynDrvUserType,1);
    if(pasynInterface && pPvt->userParam) {
        asynDrvUser *pasynDrvUser;
        void       *drvPvt;

        pasynDrvUser = (asynDrvUser *)pasynInterface->pinterface;
        drvPvt = pasynInterface->drvPvt;
        status = pasynDrvUser->create(drvPvt,pasynUser,pPvt->userParam,0,0);
        if(status!=asynSuccess) {
            printf("%s devAsynInt32::initCommon drvUserCreate %s\n",
                     pr->name, pasynUser->errorMessage);
            goto bad;
        }
    };

    /* Get interface asynInt32 */
    pasynInterface = pasynManager->findInterface(pasynUser, asynInt32Type, 1);
    if (!pasynInterface) {
        printf("%s devAsynInt32::initCommon findInterface asynInt32Type %s\n",
                     pr->name,pasynUser->errorMessage);
        goto bad;
    };

    pPvt->pint32 = (asynInt32 *)pasynInterface->pinterface;
    pPvt->int32Pvt = pasynInterface->drvPvt;
    scanIoInit(&pPvt->ioScanPvt);
    pPvt->interruptCallback = interruptCallback;

    /* Initialize synchronous interface */
    status = pasynInt32SyncIO->connect(pPvt->portName, pPvt->addr, &pPvt->pasynUserSync, pPvt->userParam);
    if (status != asynSuccess) {
        printf("%s devAsynInt32::initCommon Int32SyncIO->connect failed %s\n",
               pr->name, pPvt->pasynUserSync->errorMessage);
        goto bad;
    };

    /* Initialize asynEnum interfaces */
    pasynInterface = pasynManager->findInterface(pPvt->pasynUser,asynEnumType,1);
    if (pasynInterface && (maxEnums > 0)) {
        size_t numRead;
        asynEnum *pasynEnum = (asynEnum*)pasynInterface->pinterface;
        void *registrarPvt;
        status = pasynEnumSyncIO->connect(pPvt->portName, pPvt->addr, 
                 &pPvt->pasynUserEnumSync, pPvt->userParam);
        if (status != asynSuccess) {
            printf("%s devAsynInt32::initCommon EnumSyncIO->connect failed %s\n",
                   pr->name, pPvt->pasynUserEnumSync->errorMessage);
            goto bad;
        }

        status = pasynEnumSyncIO->read (pPvt->pasynUserEnumSync, pPvt->enumStrings, pPvt->enumValues, pPvt->enumSeverities, maxEnums, 
                    &numRead, pPvt->pasynUser->timeout);

        if (status == asynSuccess) {
            setEnums(pFirstString, pFirstValue, pFirstSeverity, 
                     pPvt->enumStrings, pPvt->enumValues,  pPvt->enumSeverities, numRead, maxEnums);
        }

        status = pasynEnum->registerInterruptUser( pasynInterface->drvPvt, pPvt->pasynUser, callbackEnum, pPvt, &registrarPvt);

        if(status!=asynSuccess) {
            printf("%s devAsynInt32 enum registerInterruptUser %s\n",
                   pr->name,pPvt->pasynUser->errorMessage);
        }
    }
    return status;

bad:
   pr->pact=1;
   return asynError;
}

void setEnums(char *outStrings, int *outVals, epicsEnum16 *outSeverities, char *inStrings[], int *inVals, int *inSeverities, 
                     size_t numIn, size_t numOut)
{
    size_t i;
    
    for (i=0; i<numOut; i++) {
        if (outStrings) outStrings[i*MAX_ENUM_STRING_SIZE] = '\0';
        if (outVals) outVals[i] = 0;
        if (outSeverities) outSeverities[i] = 0;
    }
    for (i=0; (i<numIn && i<numOut); i++) {
        if (outStrings) strncpy(&outStrings[i*MAX_ENUM_STRING_SIZE], inStrings[i], MAX_ENUM_STRING_SIZE);
        if (outVals) outVals[i] = inVals[i];
        if (outSeverities) outSeverities[i] = inSeverities[i];
    }
}

long initAi (void *prec)
{
    devInt32Pvt *pPvt;
    asynStatus status;
	aiRecord *pr = (aiRecord*)prec;

    status = initCommon((dbCommon*)pr,&pr->inp,
        processCallbackInput, interruptCallbackInput, NULL, 0, NULL, NULL, NULL);

    if(status != asynSuccess) return 0;
    pPvt = (devInt32Pvt*) pr->dpvt;

    /* Don't call getBounds if we already have non-zero values from
     * parseLinkMask */

    if ((pPvt->deviceLow == 0) && (pPvt->deviceHigh == 0)) {
        pasynInt32SyncIO->getBounds(pPvt->pasynUserSync,
                                &pPvt->deviceLow, &pPvt->deviceHigh);
    }
    convertAi(pr, 1);
	return (0);
}

void processCallbackInput(asynUser *pasynUser)
{
    devInt32Pvt *pPvt = (devInt32Pvt *)pasynUser->userPvt;
    dbCommon *pr = (dbCommon *)pPvt->pr;

    pPvt->result.status = pPvt->pint32->read(pPvt->int32Pvt, pPvt->pasynUser, &pPvt->result.value);
    if (pPvt->bipolar && (pPvt->result.value & pPvt->signBit)) pPvt->result.value |= ~pPvt->mask;
    if (pPvt->result.status == asynSuccess) {
        asynPrint(pasynUser, ASYN_TRACEIO_DEVICE,
            "%s devAsynInt32 process value=%d\n",pr->name,pPvt->result.value);
    } else {
        asynPrint(pasynUser, ASYN_TRACE_ERROR,
              "%s devAsynInt32 process read error %s\n",
              pr->name, pasynUser->errorMessage);
    }
    if(pr->pact) callbackRequestProcessCallback(&pPvt->callback,pr->prio,pr);
}

void interruptCallbackInput(void *drvPvt, asynUser *pasynUser, epicsInt32 value)
{
    devInt32Pvt *pPvt = (devInt32Pvt *)drvPvt;
    dbCommon *pr = pPvt->pr;
    ringBufferElement *rp;

    if (pPvt->bipolar && (value & pPvt->signBit)) value |= ~pPvt->mask;

    asynPrint(pPvt->pasynUser, ASYN_TRACEIO_DEVICE,
        "%s devAsynInt32::interruptCallbackInput new value=%d\n",
        pr->name, value);

    if (!interruptAccept) return;
    epicsMutexLock(pPvt->mutexId);

    rp = &pPvt->ringBuffer[pPvt->ringHead];
    rp->value = value;
    rp->time = pasynUser->timestamp;
    rp->status = (asynStatus)pasynUser->auxStatus;
    pPvt->ringHead = (pPvt->ringHead==pPvt->ringSize) ? 0 : pPvt->ringHead+1;

    if (pPvt->ringHead == pPvt->ringTail) {
        /* There was no room in the ring buffer.  In the past we just threw away
         * the new value.  However, it is better to remove the oldest value from the
         * ring buffer and add the new one.  That way the final value the record receives
         * is guaranteed to be the most recent value */
        pPvt->ringTail = (pPvt->ringTail==pPvt->ringSize) ? 0 : pPvt->ringTail+1;
        pPvt->ringBufferOverflows++;
    } else {
        /* We only need to request the record to process if we added a new
         * element to the ring buffer, not if we just replaced an element. */
        scanIoRequest(pPvt->ioScanPvt);
    }
    epicsMutexUnlock(pPvt->mutexId);
}

long processAi (void *precord)
{
	aiRecord *pr = (aiRecord*)precord;
    devInt32Pvt *pPvt = (devInt32Pvt *)pr->dpvt;
    asynStatus status;

    if(!getCallbackValue(pPvt) && !pr->pact) {
        if(pPvt->canBlock) pr->pact = 1;
        status = pasynManager->queueRequest(pPvt->pasynUser, asynQueuePriority(0), 0);
        if((status==asynSuccess) && pPvt->canBlock) return 0;
        if(pPvt->canBlock) pr->pact = 0;
        if(status != asynSuccess) {
            pPvt->result.status = status;
            asynPrint(pPvt->pasynUser, ASYN_TRACE_ERROR,
                "%s devAsynInt32 queueRequest %s\n", 
                pr->name,pPvt->pasynUser->errorMessage);
        };
    };

    pr->rval = pPvt->result.value; 
    pr->time = pPvt->result.time; 

    if (pPvt->result.status == asynSuccess) {
        pr->udf = 0;
    }
    else {
        pasynEpicsUtils->asynStatusToEpicsAlarm(pPvt->result.status, READ_ALARM, &pPvt->alarmStat,
                                            INVALID_ALARM, &pPvt->alarmSevr);
        (void)recGblSetSevr(pr, pPvt->alarmStat, pPvt->alarmSevr);
    }
	return (0);
}

long	convertAi(void *precord, int pass)
{
	aiRecord *airec = (aiRecord*)precord;

    devInt32Pvt *pPvt = (devInt32Pvt *)airec->dpvt;
    double eguf,egul,deviceHigh,deviceLow;

    if (pass==0) return 0;

    /* set linear conversion slope */
    if(pPvt->deviceHigh!=pPvt->deviceLow) {
        eguf = airec->eguf;
        egul = airec->egul;
        deviceHigh = (double)pPvt->deviceHigh;
        deviceLow = (double)pPvt->deviceLow;
        airec->eslo = (eguf - egul)/(deviceHigh - deviceLow);
        airec->eoff = (deviceHigh*egul - deviceLow*eguf)/
                        (deviceHigh - deviceLow);
    }
    return 0;
}

long initAo (void *)
{
	return (0);
}

long processAo (void *)
{
	return (0);
}

long	convertAo(void *precord, int pass)
{
	return (0);
}

long getIoIntInfo(int cmd, dbCommon *prec, IOSCANPVT *iopvt)
{
	return (0);
}

int getCallbackValue(devInt32Pvt *pPvt)
{
    int ret = 0;
    epicsMutexLock(pPvt->mutexId);
    if (pPvt->ringTail != pPvt->ringHead) {
        if (pPvt->ringBufferOverflows > 0) {
            asynPrint(pPvt->pasynUser, ASYN_TRACEIO_DEVICE,
                "%s devAsynInt32 getCallbackValue warning, %d ring buffer overflows\n",
                                    pPvt->pr->name, pPvt->ringBufferOverflows);
            pPvt->ringBufferOverflows = 0;
        }
        pPvt->result = pPvt->ringBuffer[pPvt->ringTail];
        pPvt->ringTail = (pPvt->ringTail==pPvt->ringSize) ? 0 : pPvt->ringTail+1;
        asynPrint(pPvt->pasynUser, ASYN_TRACEIO_DEVICE,
            "%s devAsynInt32::getCallbackValue from ringBuffer value=%d\n",
                                            pPvt->pr->name,pPvt->result.value);
        ret = 1;
    }
    epicsMutexUnlock(pPvt->mutexId);
    return ret;
}

unsigned short getcrc(unsigned char *writecmd, int loopcnt) 
{
	int i;

	unsigned short fcsval = FCSINIT;
	
	for(i = 1; i < loopcnt; i++)
	{
		fcsval = ((fcsval >> 8) & 0xff) ^ fcstab[(fcsval ^ writecmd[i]) & 0xff]; 
	}
	
	writecmd[loopcnt] = fcsval & 0xff;
	writecmd[loopcnt + 1] = (fcsval >> 8) & 0xff;
	
	return fcsval;
}

char *ReadMsgCmd(const int node, const int type, const int mul_single, const int index)
{
	char *cmd = (char*)malloc(11);
	cmd[0]= SYNC_BYTE;
	cmd[1]= mul_single; //Multi = 5, Single = 3
	cmd[2]= 0x00; 
	cmd[3]= node;  //Node = 0
	cmd[4]= type; // FLOAT_READ = 0x9D, INT_READ = 0x8D, BOOL_READ = 0x82
	cmd[5] = (unsigned char)(index % 256); // BOOL_START_INDEX = 485, FLOAT_START_INDEX = 9, INT_START_INDEX = 23
	cmd[6] = 0x00;
	cmd[7] = (unsigned char)(NUMBER_TO_READ % 256);
	cmd[8] = (unsigned char)(NUMBER_TO_READ / 256);
	getcrc((unsigned char*)cmd, 9);                                     						// CRC °Ë»ç
	return cmd;
}

epicsShareFunc int
drvAsynRTPConfigure(const char *portName, const char *hostInfo, unsigned int priority, int noAutoConnect, int noProcessEos)
{
    ttyController_t *tty;
    asynInterface *pasynInterface;
    asynStatus status;
    char *cp;
    int port;
    char protocol[6];
    int nbytes;
    //asynOctet		*pasynOctet;
    asynInt32         *pint32;
    int isCom = 0;
    static int firstTime = 1;

    /*
     * Check arguments
     */
    if (portName == NULL) {
        printf("Port name missing.\n");
        return -1;
    }
    if (hostInfo == NULL) {
        printf("TCP host information missing.\n");
        return -1;
    }

    /*
     * Perform some one-time-only initializations
     */
    if (firstTime) {
        firstTime = 0;
        if (osiSockAttach() == 0) {
            printf("drvAsynRTPConfigure: osiSockAttach failed\n");
            return -1;
        }
    }

    /*
     * Create a driver
     */
    nbytes = sizeof(*tty) + sizeof(asynInt32);
    tty = (ttyController_t *)callocMustSucceed(1, nbytes,
          "drvAsynRTPConfigure()");
    pint32 = (asynInt32 *)(tty+1);
    tty->fd = INVALID_SOCKET;
    tty->IPDeviceName = epicsStrDup(hostInfo);
    tty->portName = epicsStrDup(portName);

    /*
     * Parse configuration parameters
     */
    protocol[0] = '\0';
    if (((cp = strchr(tty->IPDeviceName, ':')) == NULL)
     || (sscanf(cp, ":%d %5s", &port, protocol) < 1)) {
        printf("drvAsynRTPConfigure: \"%s\" is not of the form \"<host>:<port> [protocol]\"\n",
                                                        tty->IPDeviceName);
        ttyCleanup(tty);
        return -1;
    }
    *cp = '\0';
    tty->IPHostName = epicsStrDup(tty->IPDeviceName);
    *cp = ':';
    tty->farAddr.ia.sin_port = htons(port);
    tty->farAddr.ia.sin_family = AF_INET;
    tty->flags = 0;
    if ((protocol[0] ==  '\0')
     || (epicsStrCaseCmp(protocol, "tcp") == 0)) {
        tty->socketType = SOCK_STREAM;
    }
    else if (epicsStrCaseCmp(protocol, "com") == 0) {
        isCom = 1;
        tty->socketType = SOCK_STREAM;
    }
    else if (epicsStrCaseCmp(protocol, "http") == 0) {
        tty->socketType = SOCK_STREAM;
        tty->flags |= FLAG_CONNECT_PER_TRANSACTION;
    }
    else if (epicsStrCaseCmp(protocol, "udp") == 0) {
        tty->socketType = SOCK_DGRAM;
    }
    else if (epicsStrCaseCmp(protocol, "udp*") == 0) {
        tty->socketType = SOCK_DGRAM;
        tty->flags |= FLAG_BROADCAST;
    }
    else {
        printf("drvAsynRTPConfigure: Unknown protocol \"%s\".\n", protocol);
        ttyCleanup(tty);
        return -1;
    }

    /*
     *  Link with higher level routines
     */
    pasynInterface = (asynInterface *)callocMustSucceed(2, sizeof *pasynInterface, "drvAsynRTPConfigure");
    tty->common.interfaceType = asynCommonType;
    tty->common.pinterface  = (void *)&drvAsynIPPortAsynCommon;
    tty->common.drvPvt = tty;
    if (pasynManager->registerPort(tty->portName,
                                   ASYN_CANBLOCK,
                                   !noAutoConnect,
                                   priority,
                                   0) != asynSuccess) {
        printf("drvAsynRTPConfigure: Can't register myself.\n");
        ttyCleanup(tty);
        return -1;
    }
    status = pasynManager->registerInterface(tty->portName,&tty->common);
    if(status != asynSuccess) {
        printf("drvAsynRTPConfigure: Can't register common.\n");
        ttyCleanup(tty);
        return -1;
    }
    pint32->read = readIt32;
    pint32->write = writeIt32;
    //pint32->read = readIt;
    //pint32->write = writeIt;
    //pint32->flush = flushIt;
    tty->octet.interfaceType = asynOctetType;
    tty->octet.pinterface  = pint32;
    tty->octet.drvPvt = tty;
    status = pasynOctetBase->initialize(tty->portName,&tty->octet, 0, 0, 1);
    if(status != asynSuccess) {
        printf("drvAsynRTPConfigure: pasynOctetBase->initialize failed.\n");
        ttyCleanup(tty);
        return -1;
    }
    if (isCom && (asynInterposeCOM(tty->portName) != 0)) {
        printf("drvAsynRTPConfigure: asynInterposeCOM failed.\n");
        ttyCleanup(tty);
        return -1;
    }
    if (!noProcessEos)
        asynInterposeEosConfig(tty->portName, -1, 1, 1);
    tty->pasynUser = pasynManager->createAsynUser(0,0);
    status = pasynManager->connectDevice(tty->pasynUser,tty->portName,-1);
    if(status != asynSuccess) {
        printf("connectDevice failed %s\n",tty->pasynUser->errorMessage);
        ttyCleanup(tty);
        return -1;
    }

    /*
     * Register for socket cleanup
     */
    epicsAtExit(cleanup, tty);
    return 0;
}
/*
 * Read from the TCP port
 */
static asynStatus readIt32(void *drvPvt, asynUser *pasynUser, epicsInt32 *data)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    int thisRead;
    int readPollmsec;
    int reason = 0;
    asynStatus status = asynSuccess;

    assert(tty);
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "%s read.\n", tty->IPDeviceName);
    if (tty->fd == INVALID_SOCKET) {
        if (tty->flags & FLAG_CONNECT_PER_TRANSACTION) {
            if ((status = connectIt(drvPvt, pasynUser)) != asynSuccess)
                return status;
        }
        else {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s disconnected:", tty->IPDeviceName);
            return asynError;
        }
    }
    readPollmsec = (int) (pasynUser->timeout * 1000.0);
    if (readPollmsec == 0) readPollmsec = 1;
    if (readPollmsec < 0) readPollmsec = -1;

#ifdef USE_SOCKTIMEOUT
    {
    struct timeval tv;
    tv.tv_sec = readPollmsec / 1000;
    tv.tv_usec = (readPollmsec % 1000) * 1000;
    if (setsockopt(tty->fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof tv) < 0) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "Can't set %s socket receive timeout: %s",
                      tty->IPDeviceName, strerror(SOCKERRNO));
        status = asynError;
    }
    }
#endif

#ifdef USE_POLL
    {
        struct pollfd pollfd;
        pollfd.fd = tty->fd;
        pollfd.events = POLLIN;
        poll(&pollfd, 1, readPollmsec);
    }
#endif
    thisRead = recv(tty->fd, data, sizeof(epicsInt32), 0);
    if (thisRead > 0) {
        //asynPrintIO(pasynUser, ASYN_TRACEIO_DRIVER, data, thisRead,
                   //"%s read %d\n", tty->IPDeviceName, thisRead);
        tty->nRead += (unsigned long)thisRead;
    }
    if (thisRead < 0) {
        if ((SOCKERRNO != SOCK_EWOULDBLOCK) && (SOCKERRNO != SOCK_EINTR)) {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s read error: %s",
                          tty->IPDeviceName, strerror(SOCKERRNO));
            closeConnection(pasynUser,tty,"Read error");
            status = asynError;
        } else {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s timeout: %s",
                          tty->IPDeviceName, strerror(SOCKERRNO));
            status = asynTimeout;
        }
    }
    /* If recv() returns 0 on a SOCK_STREAM (TCP) socket, the connection has closed */
    if ((thisRead == 0) && (tty->socketType == SOCK_STREAM)) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "%s connection closed",
                      tty->IPDeviceName);
        closeConnection(pasynUser,tty,"Read from broken connection");
        reason |= ASYN_EOM_END;
    }
    if (thisRead < 0)
        thisRead = 0;

    return status;
}
static asynStatus readIt(void *drvPvt, asynUser *pasynUser,
    char *data, unsigned int maxchars,unsigned int *nbytesTransfered,int *gotEom)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    int thisRead;
    int readPollmsec;
    int reason = 0;
    asynStatus status = asynSuccess;

    assert(tty);
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "%s read.\n", tty->IPDeviceName);
    if (tty->fd == INVALID_SOCKET) {
        if (tty->flags & FLAG_CONNECT_PER_TRANSACTION) {
            if ((status = connectIt(drvPvt, pasynUser)) != asynSuccess)
                return status;
        }
        else {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s disconnected:", tty->IPDeviceName);
            return asynError;
        }
    }
    if (maxchars <= 0) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                  "%s maxchars %d. Why <=0?",tty->IPDeviceName,(int)maxchars);
        return asynError;
    }
    readPollmsec = (int) (pasynUser->timeout * 1000.0);
    if (readPollmsec == 0) readPollmsec = 1;
    if (readPollmsec < 0) readPollmsec = -1;
#ifdef USE_SOCKTIMEOUT
    {
    struct timeval tv;
    tv.tv_sec = readPollmsec / 1000;
    tv.tv_usec = (readPollmsec % 1000) * 1000;
    if (setsockopt(tty->fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof tv) < 0) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "Can't set %s socket receive timeout: %s",
                      tty->IPDeviceName, strerror(SOCKERRNO));
        status = asynError;
    }
    }
#endif
    if (gotEom) *gotEom = 0;
#ifdef USE_POLL
    {
        struct pollfd pollfd;
        pollfd.fd = tty->fd;
        pollfd.events = POLLIN;
        poll(&pollfd, 1, readPollmsec);
    }
#endif
    thisRead = recv(tty->fd, data, (int)maxchars, 0);
    if (thisRead > 0) {
        asynPrintIO(pasynUser, ASYN_TRACEIO_DRIVER, data, thisRead,
                   "%s read %d\n", tty->IPDeviceName, thisRead);
        tty->nRead += (unsigned long)thisRead;
    }
    if (thisRead < 0) {
        if ((SOCKERRNO != SOCK_EWOULDBLOCK) && (SOCKERRNO != SOCK_EINTR)) {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s read error: %s",
                          tty->IPDeviceName, strerror(SOCKERRNO));
            closeConnection(pasynUser,tty,"Read error");
            status = asynError;
        } else {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s timeout: %s",
                          tty->IPDeviceName, strerror(SOCKERRNO));
            status = asynTimeout;
        }
    }
    /* If recv() returns 0 on a SOCK_STREAM (TCP) socket, the connection has closed */
    if ((thisRead == 0) && (tty->socketType == SOCK_STREAM)) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "%s connection closed",
                      tty->IPDeviceName);
        closeConnection(pasynUser,tty,"Read from broken connection");
        reason |= ASYN_EOM_END;
    }
    if (thisRead < 0)
        thisRead = 0;
    *nbytesTransfered = thisRead;
    /* If there is room add a null byte */
    if (thisRead < (int) maxchars)
        data[thisRead] = 0;
    else
        reason |= ASYN_EOM_CNT;
    if (gotEom) *gotEom = reason;
    return status;
}
static asynStatus writeIt32(void *drvPvt, asynUser *pasynUser,epicsInt32 data)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    int thisWrite;
    asynStatus status = asynSuccess;
    int writePollmsec;
    int epicsTimeStatus;
    epicsTimeStamp startTime;
    epicsTimeStamp endTime;
    int haveStartTime;

    assert(tty);
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "%s write.\n", tty->IPDeviceName);
    //asynPrintIO(pasynUser, ASYN_TRACEIO_DRIVER, data, numchars,
     //           "%s write %lu\n", tty->IPDeviceName, (unsigned long)numchars);
    if (tty->fd == INVALID_SOCKET) {
        if (tty->flags & FLAG_CONNECT_PER_TRANSACTION) {
            if ((status = connectIt(drvPvt, pasynUser)) != asynSuccess)
                return status;
        }
        else {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s disconnected:", tty->IPDeviceName);
            return asynError;
        }
    }
    //if (numchars == 0)
        //return asynSuccess;
    writePollmsec = (int) (pasynUser->timeout * 1000.0);
    if (writePollmsec == 0) writePollmsec = 1;
    if (writePollmsec < 0) writePollmsec = -1;
#ifdef USE_SOCKTIMEOUT
    {
    struct timeval tv;
    tv.tv_sec = writePollmsec / 1000;
    tv.tv_usec = (writePollmsec % 1000) * 1000;
    if (setsockopt(tty->fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof tv) < 0) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "Can't set %s socket send timeout: %s",
                      tty->IPDeviceName, strerror(SOCKERRNO));
        return asynError;
    }
    }
#endif
    haveStartTime = 0;
    for (;;) {
#ifdef USE_POLL
        struct pollfd pollfd;
        pollfd.fd = tty->fd;
        pollfd.events = POLLOUT;
        poll(&pollfd, 1, writePollmsec);
#endif
        for (;;) {
            thisWrite = send(tty->fd, (char *)data, sizeof(epicsInt32), 0);
            if (thisWrite >= 0) break;
            if (SOCKERRNO == SOCK_EWOULDBLOCK || SOCKERRNO == SOCK_EINTR) {
                if (!haveStartTime) {
                    epicsTimeStatus = epicsTimeGetCurrent(&startTime);
                    assert(epicsTimeStatus == epicsTimeOK);
                    haveStartTime = 1;
                } else if (pasynUser->timeout >= 0) {
                    epicsTimeStatus = epicsTimeGetCurrent(&endTime);
                    assert(epicsTimeStatus == epicsTimeOK);
                    if (epicsTimeDiffInSeconds(&endTime, &startTime) >
                            pasynUser->timeout) {
                        thisWrite = 0;
                        break;
                    }
                }
                epicsThreadSleep(SEND_RETRY_DELAY);
            } else break;
        }
        if (thisWrite > 0) {
            tty->nWritten += (unsigned long)thisWrite;
            //*nbytesTransfered += thisWrite;
            //numchars -= thisWrite;
            //if (numchars == 0)
                break;
            data += thisWrite;
        }
        else if (thisWrite == 0) {
            status = asynTimeout;
            break;
        }
        else {
            epicsSnprintf(pasynUser->errorMessage, pasynUser->errorMessageSize,
                                     "%s write error: %s", tty->IPDeviceName,
                                                           strerror(SOCKERRNO));
            closeConnection(pasynUser,tty,"Write error");
            status = asynError;
            break;
        }
    }
    //asynPrint(pasynUser, ASYN_TRACE_FLOW,
              //"wrote %lu to %s, return %s.\n", (unsigned long)*nbytesTransfered,
                                               //tty->IPDeviceName,
                                               //pasynManager->strStatus(status));
    return status;
}
static asynStatus writeIt(void *drvPvt, asynUser *pasynUser,
    const char *data, size_t numchars,size_t *nbytesTransfered)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    int thisWrite;
    asynStatus status = asynSuccess;
    int writePollmsec;
    int epicsTimeStatus;
    epicsTimeStamp startTime;
    epicsTimeStamp endTime;
    int haveStartTime;

    assert(tty);
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "%s write.\n", tty->IPDeviceName);
    asynPrintIO(pasynUser, ASYN_TRACEIO_DRIVER, data, numchars,
                "%s write %lu\n", tty->IPDeviceName, (unsigned long)numchars);
    *nbytesTransfered = 0;
    if (tty->fd == INVALID_SOCKET) {
        if (tty->flags & FLAG_CONNECT_PER_TRANSACTION) {
            if ((status = connectIt(drvPvt, pasynUser)) != asynSuccess)
                return status;
        }
        else {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "%s disconnected:", tty->IPDeviceName);
            return asynError;
        }
    }
    if (numchars == 0)
        return asynSuccess;
    writePollmsec = (int) (pasynUser->timeout * 1000.0);
    if (writePollmsec == 0) writePollmsec = 1;
    if (writePollmsec < 0) writePollmsec = -1;
#ifdef USE_SOCKTIMEOUT
    {
    struct timeval tv;
    tv.tv_sec = writePollmsec / 1000;
    tv.tv_usec = (writePollmsec % 1000) * 1000;
    if (setsockopt(tty->fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof tv) < 0) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "Can't set %s socket send timeout: %s",
                      tty->IPDeviceName, strerror(SOCKERRNO));
        return asynError;
    }
    }
#endif
    haveStartTime = 0;
    for (;;) {
#ifdef USE_POLL
        struct pollfd pollfd;
        pollfd.fd = tty->fd;
        pollfd.events = POLLOUT;
        poll(&pollfd, 1, writePollmsec);
#endif
        for (;;) {
            thisWrite = send(tty->fd, (char *)data, (int)numchars, 0);
            if (thisWrite >= 0) break;
            if (SOCKERRNO == SOCK_EWOULDBLOCK || SOCKERRNO == SOCK_EINTR) {
                if (!haveStartTime) {
                    epicsTimeStatus = epicsTimeGetCurrent(&startTime);
                    assert(epicsTimeStatus == epicsTimeOK);
                    haveStartTime = 1;
                } else if (pasynUser->timeout >= 0) {
                    epicsTimeStatus = epicsTimeGetCurrent(&endTime);
                    assert(epicsTimeStatus == epicsTimeOK);
                    if (epicsTimeDiffInSeconds(&endTime, &startTime) >
                            pasynUser->timeout) {
                        thisWrite = 0;
                        break;
                    }
                }
                epicsThreadSleep(SEND_RETRY_DELAY);
            } else break;
        }
        if (thisWrite > 0) {
            tty->nWritten += (unsigned long)thisWrite;
            *nbytesTransfered += thisWrite;
            numchars -= thisWrite;
            if (numchars == 0)
                break;
            data += thisWrite;
        }
        else if (thisWrite == 0) {
            status = asynTimeout;
            break;
        }
        else {
            epicsSnprintf(pasynUser->errorMessage, pasynUser->errorMessageSize,
                                     "%s write error: %s", tty->IPDeviceName,
                                                           strerror(SOCKERRNO));
            closeConnection(pasynUser,tty,"Write error");
            status = asynError;
            break;
        }
    }
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "wrote %lu to %s, return %s.\n", (unsigned long)*nbytesTransfered,
                                               tty->IPDeviceName,
                                               pasynManager->strStatus(status));
    return status;
}
static void
closeConnection(asynUser *pasynUser,ttyController_t *tty,const char *why)
{
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "Close %s connection (fd %d): %s\n", tty->IPDeviceName, tty->fd, why);
    if (tty->fd != INVALID_SOCKET) {
        epicsSocketDestroy(tty->fd);
        tty->fd = INVALID_SOCKET;
    }
    if (!(tty->flags & FLAG_CONNECT_PER_TRANSACTION))
        pasynManager->exceptionDisconnect(pasynUser);
}
/*
 * OSI function to control blocking/non-blocking I/O
 */
static int setNonBlock(SOCKET fd, int nonBlockFlag)
{
#if defined(vxWorks)
    int flags;
    flags = nonBlockFlag;
    if (ioctl(fd, FIONBIO, (int)&flags) < 0)
        return -1;
#elif defined(_WIN32)
    unsigned long int flags;
    flags = nonBlockFlag;
    if (socket_ioctl(fd, FIONBIO, &flags) < 0)
        return -1;
#else
    int flags;
    if ((flags = fcntl(fd, F_GETFL, 0)) < 0)
        return -1;
    if (nonBlockFlag)
        flags |= O_NONBLOCK;
    else
        flags &= ~O_NONBLOCK;
    if (fcntl(fd, F_SETFL, flags) < 0)
        return -1;
#endif
    return 0;
}
static asynStatus
flushIt(void *drvPvt,asynUser *pasynUser)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    char cbuf[512];

    assert(tty);
    asynPrint(pasynUser, ASYN_TRACE_FLOW, "%s flush\n", tty->IPDeviceName);
    if (tty->fd != INVALID_SOCKET) {
        /*
         * Toss characters until there are none left
         */
#ifndef USE_POLL
        setNonBlock(tty->fd, 1);
#endif
        while (recv(tty->fd, cbuf, sizeof cbuf, 0) > 0)
            continue;
#ifndef USE_POLL
        setNonBlock(tty->fd, 0);
#endif
    }
    return asynSuccess;
}
static asynStatus
connectIt(void *drvPvt, asynUser *pasynUser)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    SOCKET fd;
    int i;

    /*
     * Sanity check
     */
    assert(tty);
    asynPrint(pasynUser, ASYN_TRACE_FLOW,
              "Open connection to %s  reason:%d  fd:%d\n", tty->IPDeviceName,
                                                           pasynUser->reason,
                                                           tty->fd);

    if (tty->fd != INVALID_SOCKET) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                              "%s: Link already open!", tty->IPDeviceName);
        return asynError;
    } else if(tty->flags & FLAG_SHUTDOWN) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                              "%s: Link shutdown!", tty->IPDeviceName);
        return asynError;
    }

    /* If pasynUser->reason > 0) then use this as the file descriptor */
    if (pasynUser->reason > 0) {
        fd = pasynUser->reason;
    } else {

        /*
         * Create the socket
         */
        if ((fd = epicsSocketCreate(PF_INET, tty->socketType, 0)) < 0) {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                                  "Can't create socket: %s", strerror(SOCKERRNO));
            return asynError;
        }

        /*
         * Enable broadcasts if so requested
         */
        i = 1;
        if ((tty->flags & FLAG_BROADCAST)
         && (setsockopt(fd, SOL_SOCKET, SO_BROADCAST, (void *)&i, sizeof i) < 0)) {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "Can't set %s socket BROADCAST option: %s",
                          tty->IPDeviceName, strerror(SOCKERRNO));
            epicsSocketDestroy(fd);
            return asynError;
        }

        /*
         * Convert host name/number to IP address.
         * We delay doing this until now in case a device
         * has just appeared in a DNS database.
         */
        if (!tty->haveAddress) {
            if(hostToIPAddr(tty->IPHostName, &tty->farAddr.ia.sin_addr) < 0) {
                epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                                            "Unknown host \"%s\"", tty->IPHostName);
                epicsSocketDestroy(fd);
                return asynError;
            }
            tty->haveAddress = 1;
        }

        /*
         * Connect to the remote host
         * If the connect fails, arrange for another DNS lookup in case the
         * problem is just that the device has DHCP'd itself an new number.
         */
        if (connect(fd, &tty->farAddr.sa, sizeof tty->farAddr.ia) < 0) {
            epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                          "Can't connect to %s: %s",
                          tty->IPDeviceName, strerror(SOCKERRNO));
            epicsSocketDestroy(fd);
            tty->haveAddress = 0;
            return asynError;
        }
    }
    i = 1;
    if ((tty->socketType == SOCK_STREAM)
     && (setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, (void *)&i, sizeof i) < 0)) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                      "Can't set %s socket NODELAY option: %s",
                      tty->IPDeviceName, strerror(SOCKERRNO));
        epicsSocketDestroy(fd);
        return asynError;
    }
#ifdef USE_POLL
    if (setNonBlock(fd, 1) < 0) {
        epicsSnprintf(pasynUser->errorMessage,pasynUser->errorMessageSize,
                               "Can't set %s O_NONBLOCK option: %s",
                                       tty->IPDeviceName, strerror(SOCKERRNO));
        epicsSocketDestroy(fd);
        return asynError;
    }
#endif

    asynPrint(pasynUser, ASYN_TRACE_FLOW,
                          "Opened connection to %s\n", tty->IPDeviceName);
    tty->fd = fd;
    return asynSuccess;
}
static void
cleanup (void *arg)
{
    asynStatus status;
    ttyController_t *tty = (ttyController_t *)arg;

    if (!tty) return;
    status=pasynManager->lockPort(tty->pasynUser);
    if(status!=asynSuccess)
        asynPrint(tty->pasynUser, ASYN_TRACE_ERROR, "%s: cleanup locking error\n", tty->portName);

    if (tty->fd != INVALID_SOCKET) {
        asynPrint(tty->pasynUser, ASYN_TRACE_FLOW, "%s: shutdown socket\n", tty->portName);
        tty->flags |= FLAG_SHUTDOWN; /* prevent reconnect */
        epicsSocketDestroy(tty->fd);
        tty->fd = INVALID_SOCKET;
        /* If this delay is not present then the sockets are not always really closed cleanly */
        epicsThreadSleep(CLOSE_SOCKET_DELAY);
    }

    if(status==asynSuccess)
        pasynManager->unlockPort(tty->pasynUser);
}
/*
 * Clean up a ttyController
 */
static void ttyCleanup(ttyController_t *tty)
{
    if (tty) {
        if (tty->fd != INVALID_SOCKET)
            epicsSocketDestroy(tty->fd);
        free(tty->portName);
        free(tty->IPDeviceName);
        free(tty);
    }
}


static void
asynCommonReport(void *drvPvt, FILE *fp, int details)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;

    assert(tty);
    if (details >= 1) {
        fprintf(fp, "    Port %s: %sonnected\n",
                                                tty->IPDeviceName,
                                                tty->fd != INVALID_SOCKET ? "C" : "Disc");
    }
    if (details >= 2) {
        fprintf(fp, "                    fd: %d\n", tty->fd);
        fprintf(fp, "    Characters written: %lu\n", tty->nWritten);
        fprintf(fp, "       Characters read: %lu\n", tty->nRead);
    }
}

static asynStatus
asynCommonConnect(void *drvPvt, asynUser *pasynUser)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;
    asynStatus status = asynSuccess;

    if (!(tty->flags & FLAG_CONNECT_PER_TRANSACTION))
        status = connectIt(drvPvt, pasynUser);
    if (status == asynSuccess)
        pasynManager->exceptionConnect(pasynUser);
    return status;
}

static asynStatus
asynCommonDisconnect(void *drvPvt, asynUser *pasynUser)
{
    ttyController_t *tty = (ttyController_t *)drvPvt;

    assert(tty);
    closeConnection(pasynUser,tty,"Disconnect request");
    if (tty->flags & FLAG_CONNECT_PER_TRANSACTION)
        pasynManager->exceptionDisconnect(pasynUser);
    return asynSuccess;
}


/*
 * IOC shell command registration
 */
static const iocshArg drvAsynRTPConfigureArg0 = { "port name",iocshArgString};
static const iocshArg drvAsynRTPConfigureArg1 = { "host:port [protocol]",iocshArgString};
static const iocshArg drvAsynRTPConfigureArg2 = { "priority",iocshArgInt};
static const iocshArg drvAsynRTPConfigureArg3 = { "disable auto-connect",iocshArgInt};
static const iocshArg drvAsynRTPConfigureArg4 = { "noProcessEos",iocshArgInt};
static const iocshArg *drvAsynRTPConfigureArgs[] = {
    &drvAsynRTPConfigureArg0, &drvAsynRTPConfigureArg1,
    &drvAsynRTPConfigureArg2, &drvAsynRTPConfigureArg3,
    &drvAsynRTPConfigureArg4};
static const iocshFuncDef drvAsynRTPConfigureFuncDef =
                      {"drvAsynRTPConfigure",5,drvAsynRTPConfigureArgs};
static void drvAsynRTPConfigureCallFunc(const iocshArgBuf *args)
{
    drvAsynRTPConfigure(args[0].sval, args[1].sval, args[2].ival,
                           args[3].ival, args[4].ival);
}

/*
 * This routine is called before multitasking has started, so there's
 * no race condition in the test/set of firstTime.
 */
static void
drvAsynRTPRegisterCommands(void)
{
    static int firstTime = 1;
    if (firstTime) {
        iocshRegister(&drvAsynRTPConfigureFuncDef,drvAsynRTPConfigureCallFunc);
        firstTime = 0;
    }
}
epicsExportRegistrar(drvAsynRTPRegisterCommands);


static RDBDEVManager mrtpDevManager;

//RDBDEVManager
RDBDEVManager::RDBDEVManager()
{
#if 0
	try{
		mpConn = new connection("dbname=epics_db user=postgres password=qwer1234 hostaddr=127.0.0.1 port=5432");
		if (mpConn->is_open()) {
			cout << "Opened database successfully: " << mpConn->dbname() << endl;
		} else {
			cout << "Can't open database" << endl;
		}
		mpConn->disconnect ();
	}catch (const std::exception &e){
		cerr << e.what() << std::endl;
	}
#endif
}

RDBDEVManager::~RDBDEVManager()
{

}
