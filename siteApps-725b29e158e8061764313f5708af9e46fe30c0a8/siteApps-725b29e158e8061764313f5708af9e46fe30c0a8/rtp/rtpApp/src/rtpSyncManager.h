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
#include "asynDriver.h"
#include "asynDrvUser.h"
#include "asynFloat64SyncIO.h"
#include "asynEpicsUtils.h"
#include "asynFloat64.h"
#include "aiRecord.h"
#include "aoRecord.h"
#include "biRecord.h"
#include "boRecord.h"
#include "longinRecord.h"
#include "longoutRecord.h"


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

//#define READ_COMMANDMSG_SIZE    11
#define SINGLE_READ_COMMANDMSG_SIZE		9
#define SINGLE_WRITE_COMMANDMSG_SIZE	13

#define FCSINIT			0xFFFF
#define DEFAULT_RING_BUFFER_SIZE 10

#define SINGLE_BOOL_VALUE_SIZE	9
#define SINGLE_INT_VALUE_SIZE	10
#define SINGLE_FLOAT_VALUE_SIZE	12

#define SINGLE_CRC_RINDEX 7

#define SINGLE_CRC_WBOOL_INDEX 8
#define SINGLE_CRC_WINT_INDEX 9
#define SINGLE_CRC_WFLOAT_INDEX 11

#define MULTIPLE	5
#define SINGLE	3


#ifdef __cplusplus
extern "C" {
#endif

typedef struct devRTP{
	long		number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	process;
	DEVSUPFUN	special_linconv;
}devRTP;

static long	convertAi(void *precord, int pass);
static long	initAi (void *prec);
static long	processAi (void *precord);
static long	initAo (void *prec);
static long	processAo (void *precord);
static long	initBi (void *prec);
static long	processBi (void *precord);
static long	initBo (void *prec);
static long	processBo (void *precord);
static long	initLi (void *prec);
static long	processLi (void *precord);
static long	initLo (void *prec);
static long	processLo (void *precord);

epicsShareFunc int drvSyncRTPConfigure(const char *portName, const char *hostInfo, unsigned int priority, int noAutoConnect);

#ifdef __cplusplus
}
#endif


using namespace std;
static unsigned short fcstab[256] = {
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


typedef struct devPvt{
	int cpu_node;
	int index_value;
}devPvt;


typedef struct {
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
} ttyController_t;

class RTPSyncManager
{

public:
	RTPSyncManager();
	~RTPSyncManager();

	//int ReadSFloatData(epicsFloat32 &fvalue);
	int ReadSBoolData(const biRecord *pr, bool &bvalue);
	int ReadSIntData(const longinRecord *pr, epicsInt32 &ivalue);
	int ReadSFloatData(const aiRecord *pr, epicsFloat32 &fvalue);
	int WriteSFloatData(const aoRecord *pr);
	int WriteSBoolData(const boRecord *pr);
	int WriteSIntData(const longoutRecord *pr);
	int ConnectThread(const char *portName, const char *hostInfo, unsigned int prio, int noAuto);
	int ConnectDevice();
	//int ParseLink(const char *linkString);
	int ParseLink(const char *linkString, devPvt *rtpDevice);

private:
	ttyController_t *mptty;
    epicsMutexId mutex;

	char		*sRCommand;
	char		*sWCommand;
	unsigned short getCRC(unsigned char *writecmd, int loopcnt);

	//int	readSMsgCommand(const int node, const int type, const int mul_single, const int index, const int numtoread);
	//int readSMsgCommand(const int type, const int mul_single);
	int readSMsgCommand(const int type, const int mul_single, const int cpu_node, const int index_value);
	int readMMsgCommand(const int node, const int type, const int mul_single, const int index, const int numtoread);
	//int writeSMsgCommand(const int type, const int length, epicsFloat32 fvalue);
	int writeSMsgCommand(const int type, const int length, const int cpu_node, const int index_value, epicsFloat32 fvalue);

	unsigned char maskBit[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
	void ttyCleanup(ttyController_t *tty);
 	int setNonBlock(SOCKET fd, int nonBlockFlag);
	epicsThreadId	connThread_id;
	string sportName;
	string shostInfo;
	unsigned int priority;
	unsigned int noAutoConnect;

	//int connectDevice(const char *portName, const char *hostInfo, unsigned int priority, int noAutoConnect);
	int checkValue(const char *sval);
};

#endif // __RTP_DEV_MANAGER_H


