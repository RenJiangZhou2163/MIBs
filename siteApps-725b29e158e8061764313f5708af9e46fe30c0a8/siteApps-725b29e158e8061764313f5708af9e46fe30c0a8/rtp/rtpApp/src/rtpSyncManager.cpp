#include <iostream>
#include "rtpSyncManager.h"

#define FLAG_BROADCAST                  0x1
#define FLAG_CONNECT_PER_TRANSACTION    0x2
#define FLAG_SHUTDOWN                   0x4


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
	sRCommand[0]= SYNC_BYTE;
	sRCommand[1]= mul_single; //Multi = 5, Single = 3
	sRCommand[2]= 0x00; 
	sRCommand[3]= node;  //Node = 0
	sRCommand[4]= type; // FLOAT_READ = 0x9D, INT_READ = 0x8D, BOOL_READ = 0x82
	sRCommand[5] = (unsigned char)(index % 256); // BOOL_START_INDEX = 485, FLOAT_START_INDEX = 9, INT_START_INDEX = 23
	sRCommand[6] = (unsigned char)(index / 256);
	sRCommand[7] = (unsigned char)(numtoread % 256);
	sRCommand[8] = (unsigned char)(numtoread / 256);
	unsigned short check = getCRC((unsigned char*)sRCommand, 7);
#endif

static RTPSyncManager mrtpSyncManager;
static bool bInit = false;
static epicsTimeStamp globalEPICSTime;

static int RTPConnectionTask(RTPSyncManager *pSyncMgr)
{
	return (pSyncMgr->ConnectDevice());

};

devRTP devSyncRTPReadAI  ={6, 0, 0, initAi, 0, processAi, 0};
epicsExportAddress(dset,devSyncRTPReadAI);

static long initAi (void *prec)
{
	aiRecord *pr = (aiRecord*)prec;
	devPvt *rtpDevice = (devPvt*)malloc(sizeof(devPvt));
	// ai.inp must be an INST_IO
	int status = -1;
	switch (pr->inp.type) {
		case INST_IO:
			{
				status = mrtpSyncManager.ParseLink(pr->inp.value.instio.string, rtpDevice);
			};
			break;
		default :
			recGblRecordError(S_db_badField,(void *)pr,
					"devSyncRTPReadAI (init_record) Illegal INP field");
			return(S_db_badField);
	};

	if(status < 0)
		recGblRecordError(S_db_badField,(void *)pr,
				"devSyncRTPReadAI (init_record) Syntax error: INP field");

	pr->dpvt = rtpDevice;

	pr->udf = false;
	return (status);
}

static long processAi (void *precord)
{
	aiRecord *pr = (aiRecord*)precord;

	long status = dbGetLink(&(pr->inp),DBF_DOUBLE, &(pr->val),0,0);

	/*If return was succesful then set undefined false*/
	if(!status) pr->udf = FALSE;

	epicsFloat32 fvalue;
	mrtpSyncManager.ReadSFloatData(pr, fvalue);
	pr->val = (epicsFloat64)fvalue;

	//pr->rval = fvalue;
	//printf("INP:%s\n", instioStr);
	//printf("RTP AI:%f\n", pr->val);

	return (2);
}

devRTP devSyncRTPReadAO  ={6, 0, 0, initAo, 0, processAo, 0};
epicsExportAddress(dset,devSyncRTPReadAO);

static long initAo (void *prec)
{
	aoRecord *pr = (aoRecord*)prec;
	devPvt *rtpDevice = (devPvt*)malloc(sizeof(devPvt));
	// ao.inp must be an INST_IO
	int status = -1;
	switch (pr->out.type) {
		case INST_IO:
			{
				status = mrtpSyncManager.ParseLink(pr->out.value.instio.string, rtpDevice);
			};
			break;
		default :
			recGblRecordError(S_db_badField,(void *)pr,
					"devSyncRTPReadAO (init_record) Illegal OUT field");
			return(S_db_badField);
	};

	if(status < 0)
		recGblRecordError(S_db_badField,(void *)pr,
				"devSyncRTPReadAO (init_record) Syntax error: OUT field");

	pr->dpvt = rtpDevice;
	pr->udf = false;
	return (status);
}

static long processAo (void *precord)
{
	aoRecord *pr = (aoRecord*)precord;
	if(pr->dpvt == NULL) return(-1);

	mrtpSyncManager.WriteSFloatData(pr);

	return (0);
}

static long	convertAi(void *precord, int pass)
{
	aiRecord *airec = (aiRecord*)precord;
    if (pass==0) return 0;

	airec->val = airec->rval*2;
    return 0;
}

devRTP devSyncRTPReadBI  ={6, 0, 0, initBi, 0, processBi, 0};
epicsExportAddress(dset,devSyncRTPReadBI);

static long initBi (void *prec)
{
	biRecord *pr = (biRecord*)prec;
	devPvt *rtpDevice = (devPvt*)malloc(sizeof(devPvt));
	// bi.inp must be an INST_IO
	int status = -1;
	switch (pr->inp.type) {
		case INST_IO:
			{
				status = mrtpSyncManager.ParseLink(pr->inp.value.instio.string, rtpDevice);
			};
			break;
		default :
			recGblRecordError(S_db_badField,(void *)pr,
					"devSyncRTPReadBI (init_record) Illegal INP field");
			return(S_db_badField);
	};

	if(status < 0)
		recGblRecordError(S_db_badField,(void *)pr,
				"devSyncRTPReadBI (init_record) Syntax error: INP field");

	pr->dpvt = rtpDevice;
	pr->udf = false;
	return (status);
}

static long processBi (void *precord)
{
	biRecord *pr = (biRecord*)precord;

	bool bvalue;

	mrtpSyncManager.ReadSBoolData(pr, bvalue);
	pr->val = (epicsEnum16)bvalue;

	return (2);
}

devRTP devSyncRTPReadBO  ={6, 0, 0, initBo, 0, processBo, 0};
epicsExportAddress(dset,devSyncRTPReadBO);

static long initBo (void *prec)
{
	boRecord *pr = (boRecord*)prec;
	devPvt *rtpDevice = (devPvt*)malloc(sizeof(devPvt));
	// bi.inp must be an INST_IO
	int status = -1;
	switch (pr->out.type) {
		case INST_IO:
			{
				status = mrtpSyncManager.ParseLink(pr->out.value.instio.string, rtpDevice);
			};
			break;
		default :
			recGblRecordError(S_db_badField,(void *)pr,
					"devSyncRTPReadBI (init_record) Illegal INP field");
			return(S_db_badField);
	};

	if(status < 0)
		recGblRecordError(S_db_badField,(void *)pr,
				"devSyncRTPReadBI (init_record) Syntax error: INP field");

	pr->dpvt = rtpDevice;
	pr->udf = false;
	return (status);
}

static long processBo (void *precord)
{
	boRecord *pr = (boRecord*)precord;

	if(pr->dpvt == NULL) return(-1);

	mrtpSyncManager.WriteSBoolData(pr);

	return (0);
}

devRTP devSyncRTPReadLI  ={6, 0, 0, initLi, 0, processLi, 0};
epicsExportAddress(dset,devSyncRTPReadLI);

static long initLi (void *prec)
{
	longinRecord *pr = (longinRecord*)prec;
	devPvt *rtpDevice = (devPvt*)malloc(sizeof(devPvt));
	// longin.inp must be an INST_IO
	int status = -1;
	switch (pr->inp.type) {
		case INST_IO:
			{
				status = mrtpSyncManager.ParseLink(pr->inp.value.instio.string, rtpDevice);
			};
			break;
		default :
			recGblRecordError(S_db_badField,(void *)pr,
					"devSyncRTPReadLI (init_record) Illegal INP field");
			return(S_db_badField);
	};

	if(status < 0)
		recGblRecordError(S_db_badField,(void *)pr,
				"devSyncRTPReadLI (init_record) Syntax error: INP field");

	pr->dpvt = rtpDevice;
	pr->udf = false;
	return (status);
}

static long processLi (void *precord)
{
	longinRecord *pr = (longinRecord*)precord;

	epicsInt32 ivalue;

	mrtpSyncManager.ReadSIntData(pr, ivalue);
	pr->val = (epicsInt32)ivalue;

	return (2);
}

devRTP devSyncRTPReadLO  ={6, 0, 0, initLo, 0, processLo, 0};
epicsExportAddress(dset,devSyncRTPReadLO);

static long initLo (void *prec)
{
	longoutRecord *pr = (longoutRecord*)prec;
	devPvt *rtpDevice = (devPvt*)malloc(sizeof(devPvt));
	// bi.inp must be an INST_IO
	int status = -1;
	switch (pr->out.type) {
		case INST_IO:
			{
				status = mrtpSyncManager.ParseLink(pr->out.value.instio.string, rtpDevice);
			};
			break;
		default :
			recGblRecordError(S_db_badField,(void *)pr,
					"devSyncRTPReadLO (init_record) Illegal OUT field");
			return(S_db_badField);
	};

	if(status < 0)
		recGblRecordError(S_db_badField,(void *)pr,
				"devSyncRTPReadLO (init_record) Syntax error: OUT field");

	pr->dpvt = rtpDevice;
	pr->udf = false;
	return (status);
}

static long processLo (void *precord)
{
	longoutRecord *pr = (longoutRecord*)precord;

	mrtpSyncManager.WriteSIntData(pr);

	return (2);
}

epicsShareFunc int drvSyncRTPConfigure(const char *portName, const char *hostInfo, unsigned int priority, int noAutoConnect)
{
    int nbytes;
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
            printf("drvSyncRTPConfigure: osiSockAttach failed\n");
            return -1;
        }
    }

	///mptty
	mrtpSyncManager.ConnectThread(portName, hostInfo, priority, noAutoConnect);

#if 0
    /*
     * Register for socket cleanup
     */
    epicsAtExit(cleanup, tty);
#endif
    return 0;
}

/*
 * IOC shell command registration
 */
static const iocshArg drvSyncRTPConfigureArg0 = { "port name",iocshArgString};
static const iocshArg drvSyncRTPConfigureArg1 = { "host:port [protocol]",iocshArgString};
static const iocshArg drvSyncRTPConfigureArg2 = { "priority",iocshArgInt};
static const iocshArg drvSyncRTPConfigureArg3 = { "disable auto-connect",iocshArgInt};
static const iocshArg *drvSyncRTPConfigureArgs[] = {
    &drvSyncRTPConfigureArg0, &drvSyncRTPConfigureArg1,
    &drvSyncRTPConfigureArg2, &drvSyncRTPConfigureArg3};
static const iocshFuncDef drvSyncRTPConfigureFuncDef =
                      {"drvSyncRTPConfigure",4,drvSyncRTPConfigureArgs};
static void drvSyncRTPConfigureCallFunc(const iocshArgBuf *args)
{
    drvSyncRTPConfigure(args[0].sval, args[1].sval, args[2].ival, args[3].ival);
}

/*
 * This routine is called before multitasking has started, so there's
 * no race condition in the test/set of firstTime.
 */
static void
drvSyncRTPRegisterCommands(void)
{
    static int firstTime = 1;
    if (firstTime) {
        iocshRegister(&drvSyncRTPConfigureFuncDef,drvSyncRTPConfigureCallFunc);
        firstTime = 0;
    }
}
epicsExportRegistrar(drvSyncRTPRegisterCommands);


//RTPSyncManager
RTPSyncManager::RTPSyncManager()
{
	mptty = new ttyController_t;
	sRCommand = new char(SINGLE_READ_COMMANDMSG_SIZE);
	sWCommand = new char(SINGLE_WRITE_COMMANDMSG_SIZE);
	mutex    = epicsMutexCreate();
}

int RTPSyncManager::ConnectDevice()
{
    /*
     * Create a driver
     */
    SOCKET fd; int i;

    char *cp;
    int port;
    int isCom = 0;
    char protocol[6];

    mptty->fd = INVALID_SOCKET;
    mptty->IPDeviceName = epicsStrDup(shostInfo.c_str());
    mptty->portName = epicsStrDup(sportName.c_str());
    /*
     * Parse configuration parameters
     */
    protocol[0] = '\0';
    if (((cp = strchr(mptty->IPDeviceName, ':')) == NULL)
     || (sscanf(cp, ":%d %5s", &port, protocol) < 1)) {
        printf("drvSyncRTPConfigure: \"%s\" is not of the form \"<host>:<port> [protocol]\"\n",
                                                        mptty->IPDeviceName);
        ttyCleanup(mptty);
        return -1;
    }
    *cp = '\0';
    mptty->IPHostName = epicsStrDup(mptty->IPDeviceName);
    *cp = ':';
    mptty->farAddr.ia.sin_port = htons(port);
    mptty->farAddr.ia.sin_family = AF_INET;
    mptty->flags = 0;
    if ((protocol[0] ==  '\0')
     || (epicsStrCaseCmp(protocol, "tcp") == 0)) {
        mptty->socketType = SOCK_STREAM;
    }
    else if (epicsStrCaseCmp(protocol, "com") == 0) {
        isCom = 1;
        mptty->socketType = SOCK_STREAM;
    }
    else if (epicsStrCaseCmp(protocol, "udp") == 0) {
        mptty->socketType = SOCK_DGRAM;
    }
    else if (epicsStrCaseCmp(protocol, "udp*") == 0) {
        mptty->socketType = SOCK_DGRAM;
        mptty->flags |= FLAG_BROADCAST;
    }
    else {
        printf("drvSyncRTPConfigure: Unknown protocol \"%s\".\n", protocol);
        ttyCleanup(mptty);
        return -1;
    }


    assert(mptty);

    if (mptty->fd != INVALID_SOCKET) {
        printf("%s: Link already open!", mptty->IPDeviceName);
        return asynError;
    } else if(mptty->flags & FLAG_SHUTDOWN) {
        printf("%s: Link shutdown!", mptty->IPDeviceName);
        return asynError;
    }

	/*
	 * Create the socket
	 */
	if ((fd = epicsSocketCreate(PF_INET, mptty->socketType, 0)) < 0) {
		printf("Can't create socket: %s", strerror(SOCKERRNO));
		return asynError;
	}

	/*
	 * Enable broadcasts if so requested
	 */
	i = 1;
	if ((mptty->flags & FLAG_BROADCAST)
			&& (setsockopt(fd, SOL_SOCKET, SO_BROADCAST, (void *)&i, sizeof i) < 0)) {
		printf("Can't set %s socket BROADCAST option: %s", mptty->IPDeviceName, strerror(SOCKERRNO));
		epicsSocketDestroy(fd);
		return asynError;
	}

	/*
	 * Convert host name/number to IP address.
	 * We delay doing this until now in case a device
	 * has just appeared in a DNS database.
	 */
	if (!mptty->haveAddress) {
		if(hostToIPAddr(mptty->IPHostName, &mptty->farAddr.ia.sin_addr) < 0) {
			printf("Unknown host \"%s\"", mptty->IPHostName);
			epicsSocketDestroy(fd);
			return asynError;
		}
		mptty->haveAddress = 1;
	}

	/*
	 * Connect to the remote host
	 * If the connect fails, arrange for another DNS lookup in case the
	 * problem is just that the device has DHCP'd itself an new number.
	 */
	if (connect(fd, &mptty->farAddr.sa, sizeof mptty->farAddr.ia) < 0) {
		printf("Can't connect to %s: %s", mptty->IPDeviceName, strerror(SOCKERRNO));
		epicsSocketDestroy(fd);
		mptty->haveAddress = 0;
		return asynError;
	}

    i = 1;

	//struct timeval timeout;
	//timeout.tv_sec = 2;
	//timeout.tv_usec = 0;

    if ((mptty->socketType == SOCK_STREAM)
     && (setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, (void *)&i, sizeof i) < 0)) {
     //&& (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout, sizeof (timeout)) < 0)) {
        printf("Can't set %s socket NODELAY option: %s", mptty->IPDeviceName, strerror(SOCKERRNO));
        epicsSocketDestroy(fd);
        return asynError;
    }

#if 0
	//NonBlock Mode
    if (setNonBlock(fd, 1) < 0) {
        printf("Can't set %s O_NONBLOCK option: %s", mptty->IPDeviceName, strerror(SOCKERRNO));
        epicsSocketDestroy(fd);
        return asynError;
    }
#endif

    printf("Opened connection to %s\n", mptty->IPDeviceName);
    mptty->fd = fd;
    return asynSuccess;

}

int RTPSyncManager::setNonBlock(SOCKET fd, int nonBlockFlag)
{
    int flags;
    if ((flags = fcntl(fd, F_GETFL, 0)) < 0)
        return -1;
    if (nonBlockFlag)
        flags |= O_NONBLOCK;
    else
        flags &= ~O_NONBLOCK;
    if (fcntl(fd, F_SETFL, flags) < 0)
        return -1;
    return 0;
}

/*
 * Clean up a ttyController
 */
void RTPSyncManager::ttyCleanup(ttyController_t *tty)
{
    if (tty) {
        if (tty->fd != INVALID_SOCKET)
            epicsSocketDestroy(tty->fd);
        free(tty->portName);
        free(tty->IPDeviceName);
        free(tty);
    }
}

RTPSyncManager::~RTPSyncManager()
{
	delete mptty;
	delete sRCommand;
	delete sWCommand;
	if (mutex) {
			epicsMutexDestroy(mutex);
			mutex = 0;
	}

}
unsigned short RTPSyncManager::getCRC(unsigned char *writecmd, int loopcnt) 
{
	unsigned short fcsval = FCSINIT;
	
	for(int i = 1; i < loopcnt; i++)
	{
		fcsval = ((fcsval >> 8) & 0xff) ^ fcstab[(fcsval ^ writecmd[i]) & 0xff]; 
	};
	
	writecmd[loopcnt] = fcsval & 0xff;
	writecmd[loopcnt + 1] = (fcsval >> 8) & 0xff;
	
	return fcsval;
}

//int RTPSyncManager::readSMsgCommand(const int node, const int type, const int mul_single, const int index, const int numtoread)
int RTPSyncManager::readSMsgCommand(const int type, const int mul_single, const int cpu_node, const int index_value)
{
	sRCommand[0]= SYNC_BYTE;
	sRCommand[1]= mul_single; //Multi = 5, Single = 3
	sRCommand[2]= 0x00; 
	sRCommand[3]= cpu_node;  //Node = 0
	sRCommand[4]= type; // FLOAT_READ = 0x9D, INT_READ = 0x8D, BOOL_READ = 0x82
	sRCommand[5] = (unsigned char)(index_value % 256); // BOOL_START_INDEX = 485, FLOAT_START_INDEX = 9, INT_START_INDEX = 23
	sRCommand[6] = (unsigned char)(index_value / 256);
	unsigned short check = getCRC((unsigned char*)sRCommand, SINGLE_CRC_RINDEX);

	return send(mptty->fd, (const char*)sRCommand, SINGLE_READ_COMMANDMSG_SIZE, 0);
}

int RTPSyncManager::writeSMsgCommand(const int type, const int length, const int cpu_node, const int index_value, epicsFloat32 fvalue)
{
	sWCommand[0]= SYNC_BYTE;
	sWCommand[1]= length; //Float Write Length = 7, Single = 3
	sWCommand[2]= 0x00; 
	sWCommand[3]= cpu_node;  //Node = 0
	sWCommand[4]= type;		// FLOAT_WRITE = 0x9E, INT_WRITE = 0x8E, BOOL_WRITE = 0x83
	sWCommand[5] = (unsigned char)(index_value % 256); // BOOL_START_INDEX = 485, FLOAT_START_INDEX = 9, INT_START_INDEX = 23
	sWCommand[6] = (unsigned char)(index_value / 256);

	size_t msgSize = 0;

	switch(type)
	{
		case BOOL_WRITE:
			{
				bool bval = (bool)fvalue;
				memcpy(&sWCommand[7], &bval, sizeof(bool));
				unsigned short check = getCRC((unsigned char*)sWCommand, SINGLE_CRC_WBOOL_INDEX);
				msgSize = SINGLE_CRC_WBOOL_INDEX + 2;
			}
			break;
		case INT_WRITE:	
			{
				int ival = (int)fvalue;
				memcpy(&sWCommand[7], &ival, sizeof(ival));
				unsigned short check = getCRC((unsigned char*)sWCommand, SINGLE_CRC_WINT_INDEX);
				msgSize = SINGLE_CRC_WINT_INDEX + 2;
			}
			break;
		case FLOAT_WRITE:
		default:
			{
				memcpy(&sWCommand[7], &fvalue, sizeof(epicsFloat32));
				unsigned short check = getCRC((unsigned char*)sWCommand, SINGLE_CRC_WFLOAT_INDEX);
				msgSize = SINGLE_CRC_WFLOAT_INDEX + 2;
			}
			break;
	}

	//return send(mptty->fd, (const char*)sWCommand, SINGLE_WRITE_COMMANDMSG_SIZE, 0);
	return send(mptty->fd, (const char*)sWCommand, msgSize, 0);
}

int RTPSyncManager::readMMsgCommand(const int node, const int type, const int mul_single, const int index, const int numtoread)
{
	sRCommand[0]= SYNC_BYTE;
	sRCommand[1]= mul_single; //Multi = 5, Single = 3
	sRCommand[2]= 0x00; 
	sRCommand[3]= node;  //Node = 0
	sRCommand[4]= type; // FLOAT_READ = 0x9D, INT_READ = 0x8D, BOOL_READ = 0x82
	sRCommand[5] = (unsigned char)(index % 256); // BOOL_START_INDEX = 485, FLOAT_START_INDEX = 9, INT_START_INDEX = 23
	sRCommand[6] = (unsigned char)(index / 256);
	sRCommand[7] = (unsigned char)(numtoread % 256);
	sRCommand[8] = (unsigned char)(numtoread / 256);
	unsigned short check = getCRC((unsigned char*)sRCommand, 7);

	//getCRC((unsigned char*)sRCommand, sizeof(&sRCommand));
	//printf("Cmd Size:%d\n", sizeof(sRCommand));
	//return send(mptty->fd, (const char*)sRCommand, sizeof(sRCommand), 0);
	return send(mptty->fd, (const char*)sRCommand, 11, 0);
}

int RTPSyncManager::ReadSFloatData(const aiRecord *pr, epicsFloat32 &fvalue)
{
	devPvt *pRtp = (devPvt*)pr->dpvt;
	char ReadData[SINGLE_FLOAT_VALUE_SIZE];                 // float ÀÐ±â ¸í·É

	epicsMutexLock(mutex);

	int recByte = readSMsgCommand(FLOAT_READ, SINGLE, pRtp->cpu_node, pRtp->index_value);
	ssize_t recvbyte = recv(mptty->fd, (char*)&ReadData, sizeof(ReadData), 0);
	memcpy(&fvalue, (epicsFloat32*)&ReadData[5], sizeof(epicsFloat32));

	epicsMutexUnlock(mutex);


	if(recvbyte < 0)
	{
		printf("Recv-Error: %s\n", strerror(SOCKERRNO));
		return -1;
	};

	return (0);
}

int RTPSyncManager::WriteSFloatData(const aoRecord *pr)
{
	devPvt *pRtp = (devPvt*)pr->dpvt;
	char ReadData[7];

	epicsMutexLock(mutex);

	int recByte = writeSMsgCommand(FLOAT_WRITE, 7, pRtp->cpu_node, pRtp->index_value, pr->val);
	ssize_t recvbyte = recv(mptty->fd, (char*)&ReadData, sizeof(ReadData), 0);

	epicsMutexUnlock(mutex);

	if(recvbyte < 0) {
		printf("Recv-Error: %s\n", strerror(SOCKERRNO));
		return -1;
	};

	char resp = ReadData[4];
	//printf("Response-code: %d\n", resp);

	return (0);
}
int RTPSyncManager::WriteSBoolData(const boRecord *pr)
{
	devPvt *pRtp = (devPvt*)pr->dpvt;
	char ReadData[7];

	epicsMutexLock(mutex);

	int recByte = writeSMsgCommand(BOOL_WRITE, 4, pRtp->cpu_node, pRtp->index_value, pr->val);
	ssize_t recvbyte = recv(mptty->fd, (char*)&ReadData, sizeof(ReadData), 0);

	epicsMutexUnlock(mutex);

	if(recvbyte < 0) {
		printf("Recv-Error: %s\n", strerror(SOCKERRNO));
		return -1;
	};

	//char resp = ReadData[4];
	//printf("Response-code: %d\n", resp);
	return (0);
}
int RTPSyncManager::WriteSIntData(const longoutRecord *pr)
{
	devPvt *pRtp = (devPvt*)pr->dpvt;
	char ReadData[7];

	epicsMutexLock(mutex);

	int recByte = writeSMsgCommand(INT_WRITE, 5, pRtp->cpu_node, pRtp->index_value, pr->val);
	ssize_t recvbyte = recv(mptty->fd, (char*)&ReadData, sizeof(ReadData), 0);
	epicsMutexUnlock(mutex);

	if(recvbyte < 0) {
		printf("Recv-Error: %s\n", strerror(SOCKERRNO));
		return -1;
	};

	char resp = ReadData[4];
	//printf("Response-code: %d\n", resp);

	return (0);
}

int RTPSyncManager::ReadSBoolData(const biRecord *pr, bool &bvalue)
{
	devPvt *pRtp = (devPvt*)pr->dpvt;
	char ReadData[SINGLE_BOOL_VALUE_SIZE];                 // float ÀÐ±â ¸í·É

	epicsMutexLock(mutex);

	int recByte = readSMsgCommand(BOOL_READ, SINGLE, pRtp->cpu_node, pRtp->index_value);
	ssize_t recvbyte = recv(mptty->fd, (char*)&ReadData, sizeof(ReadData), 0);
	memcpy(&bvalue, (bool*)&ReadData[5], sizeof(bool));

	epicsMutexUnlock(mutex);

	if(recvbyte < 0) {
		printf("Recv-Error: %s\n", strerror(SOCKERRNO));
		return recvbyte;
	};


	return (0);
}

int RTPSyncManager::ReadSIntData(const longinRecord *pr, epicsInt32 &ivalue)
{
	devPvt *pRtp = (devPvt*)pr->dpvt;
	char ReadData[SINGLE_INT_VALUE_SIZE]; 

	epicsMutexLock(mutex);

	int recByte = readSMsgCommand(INT_READ, SINGLE, pRtp->cpu_node, pRtp->index_value);
	ssize_t recvbyte = recv(mptty->fd, (char*)&ReadData, sizeof(ReadData), 0);
	memcpy(&ivalue, (epicsInt32*)&ReadData[5], sizeof(epicsInt32));

	epicsMutexUnlock(mutex);

	if(recvbyte < 0) {
		printf("Recv-Error: %s\n", strerror(SOCKERRNO));
		return recvbyte;
	};

	return (0);
}

int RTPSyncManager::ConnectThread(const char *portName, const char *hostInfo, unsigned int prio, int noAuto)
{
	sportName = string(portName);
	shostInfo = string(hostInfo);
	priority = prio;
	noAutoConnect = noAuto;

	connThread_id = epicsThreadCreate("RTPConnThread", epicsThreadPriorityHigh,
                                 epicsThreadGetStackSize(epicsThreadStackSmall),
                                 (EPICSTHREADFUNC) RTPConnectionTask, this);

	return(0);
}

int RTPSyncManager::ParseLink(const char *linkString, devPvt *rtpDevice)
{
	//printf("LinkString:%s\n",linkString);
	const char seps[] = "(), \t";
	char *token = strtok((char*)linkString, seps);
	int index = 0;
	char *end;
	while (token != NULL)
	{
		printf("Token - %s\n", token);
		switch(index)
		{
			case 0:
				if(strcasecmp(token, "rtp") !=0) return (-1);
				break;
			case 1:
				if( checkValue(token) == 0 ) return (-1);
				rtpDevice->cpu_node = atoi(token);
				//cpu_node = atoi(token);
				break;
			case 2:
				if( checkValue(token) == 0 ) return (-1);
				rtpDevice->index_value = atoi(token);
				break;
		};
		token = strtok(NULL, seps);
		index++;
	};

	return (0);
}

int RTPSyncManager::checkValue(const char *sval)
{
	size_t size = strlen(sval);
	if (size == 0) return 0;

	for (int i = 0; i < (int) size; i++) 
	{
		//if (sval[i] == '.' || sval[i] == '-' || sval[i] == '+') continue; //exponential
		if (sval[i] < '0' || sval[i] > '9') return 0; 
	}

	return 1; // value
}
