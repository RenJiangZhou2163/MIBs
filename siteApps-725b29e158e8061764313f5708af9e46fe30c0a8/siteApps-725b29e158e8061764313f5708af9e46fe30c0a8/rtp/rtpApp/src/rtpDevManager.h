#ifndef __RTP_DEV_MANAGER_H
#define __RTP_DEV_MANAGER_H

#include <vector>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <ctype.h>
#include <fcntl.h>
#include "osiUnistd.h"
#include "osiSock.h"
#include "errlog.h"
#include "epicsAssert.h"
#include "epicsExit.h"
#include "epicsString.h"
#include "epicsTime.h"
#include "alarm.h"
#include "cvtTable.h"
#include "dbDefs.h"
#include "dbAccess.h"
#include "recGbl.h"
#include "recSup.h"
#include "devSup.h"
#include "link.h"
#include "menuScan.h"
#include "epicsExport.h"
#include "shareLib.h"
#include "dbCommon.h"
#include "dbScan.h"
#include "callback.h"
#include "cantProceed.h"
#include "epicsStdio.h"
#include "epicsMutex.h"
#include "epicsEvent.h"
#include "epicsThread.h"
#include "iocsh.h"
#include "shareLib.h"

#include "asynEpicsUtils.h"
#include "asynDriver.h"
#include "asynDrvUser.h"
#include "asynInt32.h"
#include "asynInt32SyncIO.h" 
#include "asynFloat64.h"
#include "asynOctet.h"
#include "asynEnum.h"
#include "asynEnumSyncIO.h"
#include "asynInterposeCom.h"
#include "asynInterposeEos.h"


// RTP 프로토콜 관련
#define SYNC_BYTE         0xC3                // sync byte                            
#define FLOAT_READ        0x9D                // float 읽기 명령                      
#define INT_READ          0x8D                // int 읽기 명령                        
#define BOOL_READ         0x82                // bool 읽기 명령                       
#define FLOAT_WRITE       0x9E                // float 쓰기 명령                      
#define INT_WRITE         0x8E                // int 쓰기 명령                        
#define BOOL_WRITE        0x83                // bool 쓰기 명령                       
#define NODE              0                   // NODE / PHASE                         
#define BOOL_START_INDEX  485                 // 연속된 Bool 변수들의 시작 Index      
#define FLOAT_START_INDEX 9                   // 연속된 Float 변수들의 시작 Index      
#define INT_START_INDEX   23                  // 연속된 Int 변수들의 시작 Index       
#define NUMBER_TO_READ    5                   // 읽어올 변수의 개수                   

#define FCSINIT			0xFFFF


#ifdef __cplusplus
extern "C" {
#endif

typedef struct devRTP{
	long		number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	long  (*get_ioint_info) (int, dbCommon*, IOSCANPVT*);
	//DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	process;
	//DEVSUPFUN	special_linconv;
	long  (*special_linconv) (void *, int pass);
}devRTP;

long	initAi  (void *);
long	processAi  (void *);
long	convertAi(void *precord, int pass);
long	initAo (void *);
long	processAo (void *);
long	convertAo(void *precord, int pass);
long	getIoIntInfo(int cmd, dbCommon *prec, IOSCANPVT *iopvt);
asynStatus	initCommon(dbCommon *pr, DBLINK *plink, userCallback processCallback,interruptCallbackInt32 interruptCallback, 
		interruptCallbackEnum callbackEnum, int maxEnums, char *pFirstString, int *pFirstValue, epicsEnum16 *pFirstSeverity);
void	setEnums(char *outStrings, int *outVals, epicsEnum16 *outSeverities, char *inStrings[], int *inVals, int *inSeverities, 
                     size_t numIn, size_t numOut);

void processCallbackInput(asynUser *pasynUser);
void interruptCallbackInput(void *drvPvt, asynUser *pasynUser, epicsInt32 value);
char *ReadMsgCmd(const int node, const int type, const int mul_single, const int index); 
unsigned short getcrc(unsigned char *writecmd, int loopcnt);

epicsShareFunc int drvAsynRTPConfigure(const char *portName, const char *hostInfo, unsigned int priority, int noAutoConnect, int noProcessEos);

#ifdef __cplusplus
}
#endif


using namespace std;

class RDBDEVManager
{

public:
	RDBDEVManager();
	~RDBDEVManager();

	//float ReadValue();

private:
};

#endif // __RTP_DEV_MANAGER_H


