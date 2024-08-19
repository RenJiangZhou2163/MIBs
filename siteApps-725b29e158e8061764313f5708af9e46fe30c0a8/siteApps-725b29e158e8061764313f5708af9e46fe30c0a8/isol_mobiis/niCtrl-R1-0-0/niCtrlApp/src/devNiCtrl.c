/* devNiCtrl.c */
/* Example device support module */

#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>
#include <limits.h>

#include <alarm.h>
#include <dbAccess.h>
#include <recGbl.h>
#include <devSup.h>
#include <devLib.h>
#include <errlog.h>

#include <epicsVersion.h>
#include <drvNiCtrl.h>

#include <aiRecord.h>
#include <aoRecord.h>
#include <biRecord.h>
#include <boRecord.h>

#if ((EPICS_VERSION==3 && EPICS_REVISION>=14) || EPICS_VERSION>3)
/* R3.14 */
#include <postfix.h>
#include <calcoutRecord.h>
#include <cantProceed.h>
#include <epicsExport.h>
#else
/* R3.13 */
#include "compat3_13.h"
#endif

#include <NIDAQmx.h>

#define isnan(x) ((x)!=(x))

/* suppress compiler warning concerning long long with __extension__ */
#if (!defined __GNUC__) || (__GNUC__ < 2) || (__GNUC__ == 2 && __GNUC_MINOR__ < 8)
#define __extension__
#endif

#ifndef epicsUInt64
#if (LONG_MAX > 2147483647L)
#define epicsUInt64 unsigned long
#define CONV64 "%016lx"
#else
#define epicsUInt64 unsigned long long
#define CONV64 "%016llx"
#endif
#endif

TaskHandle  inTaskHandle = 0;
TaskHandle  outTaskHandle = 0;
TaskHandle  outTaskHandle2 = 0;
TaskHandle  digInTaskHandle = 0;
TaskHandle  digOutTaskHandle = 0;

static epicsMutexId inMutex = NULL;
static float64 inData[16] = {0,};
static float64 outData[16] = {0,};
static float64 outData2[2] = {0,};
static uInt8 digInData[8] = {0,};
static uInt8 digOutData[8]={0,};

#define DAQmxErrChk(functionCall) if( DAQmxFailed(error=(functionCall)) ) goto Error; else

int32 CVICALLBACK EveryNCallback(TaskHandle taskHandle, int32 everyNsamplesEventType, uInt32 nSamples, void *callbackData);
int32 CVICALLBACK DoneCallback(TaskHandle taskHandle, int32 status, void *callbackData);


/* ai ***************************************************************/
STATIC long niCtrlInitRecordAi(aiRecord *);
STATIC long niCtrlReadAi(aiRecord *);

struct {
    long      number;
    DEVSUPFUN report;
    DEVSUPFUN init;
    DEVSUPFUN init_record;
    DEVSUPFUN get_ioint_info;
    DEVSUPFUN read;
    DEVSUPFUN special_linconv;
} niCtrlAi =
{
    6,
    NULL,
    NULL,
    niCtrlInitRecordAi,
    NULL,
    niCtrlReadAi,
    NULL
};
epicsExportAddress(dset, niCtrlAi);


/* ao ***************************************************************/
STATIC long niCtrlInitRecordAo(aoRecord *);
STATIC long niCtrlWriteAo(aoRecord *);

struct {
    long      number;
    DEVSUPFUN report;
    DEVSUPFUN init;
    DEVSUPFUN init_record;
    DEVSUPFUN get_ioint_info;
    DEVSUPFUN write;
    DEVSUPFUN special_linconv;
} niCtrlAo =
{
    6,
    NULL,
    NULL,
    niCtrlInitRecordAo,
    NULL,
    niCtrlWriteAo,
    NULL
};
epicsExportAddress(dset, niCtrlAo);

/* ao ***************************************************************/
STATIC long niCtrlInitRecordAo2(aoRecord *);
STATIC long niCtrlWriteAo2(aoRecord *);

struct {
    long      number;
    DEVSUPFUN report;
    DEVSUPFUN init;
    DEVSUPFUN init_record;
    DEVSUPFUN get_ioint_info;
    DEVSUPFUN write;
    DEVSUPFUN special_linconv;
} niCtrlAo2 =
{
    6,
    NULL,
    NULL,
    niCtrlInitRecordAo2,
    NULL,
    niCtrlWriteAo2,
    NULL
};
epicsExportAddress(dset, niCtrlAo2);


/* bi ***************************************************************/
STATIC long niCtrlInitRecordBi(biRecord *);
STATIC long niCtrlReadBi(biRecord *);

struct {
    long      number;
    DEVSUPFUN report;
    DEVSUPFUN init;
    DEVSUPFUN init_record;
    DEVSUPFUN get_ioint_info;
    DEVSUPFUN read;
    DEVSUPFUN special_linconv;
} niCtrlBi =
{
    6,
    NULL,
    NULL,
    niCtrlInitRecordBi,
    NULL,
    niCtrlReadBi,
    NULL
};
epicsExportAddress(dset, niCtrlBi);

/* bo ***************************************************************/
STATIC long niCtrlInitRecordBo(boRecord *);
STATIC long niCtrlWriteBo(boRecord *);

struct {
    long      number;
    DEVSUPFUN report;
    DEVSUPFUN init;
    DEVSUPFUN init_record;
    DEVSUPFUN get_ioint_info;
    DEVSUPFUN write;
    DEVSUPFUN special_linconv;
} niCtrlBo =
{
    6,
    NULL,
    NULL,
    niCtrlInitRecordBo,
    NULL,
    niCtrlWriteBo,
    NULL
};
epicsExportAddress(dset, niCtrlBo);


/* ai ***************************************************************/
STATIC long niCtrlInitRecordAi(aiRecord *record)
{
	int32       error=0;
	TaskHandle  taskHandle=0;
	char        errBuff[2048]={'\0'};
	char channel[4] = {0,};
//	char taskName[32] = {0,};

	struct instio *pinstio = (struct instio *)&(record->inp.value);
//	printf("pinstio->string:[%s]\n", pinstio->string);
	strcpy(channel, pinstio->string+7);
//	printf("channel:%s\n", channel);
//	sprintf(taskName, "Input%d", atoi(channel));

	if(inMutex == NULL)
	{
		printf("epicsMutexMustCreate\n");
		inMutex = epicsMutexMustCreate();
	}

	if(inTaskHandle == 0)
	{
		/*********************************************/
		// DAQmx Configure Code
		/*********************************************/
		DAQmxErrChk (DAQmxCreateTask("MeasureVoltage",&inTaskHandle));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai0","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai1","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai2","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai3","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai4","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai5","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai6","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai7","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai8","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai9","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai10","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai11","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai12","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai13","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai14","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAIVoltageChan(inTaskHandle,"Dev1/ai15","",DAQmx_Val_RSE,-10.0,10.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCfgSampClkTiming(inTaskHandle,"",1000.0,DAQmx_Val_Rising,DAQmx_Val_ContSamps,1000));

//		DAQmxErrChk (DAQmxRegisterEveryNSamplesEvent(inTaskHandle,DAQmx_Val_Acquired_Into_Buffer,1000,0,EveryNCallback,NULL));
		DAQmxErrChk (DAQmxRegisterEveryNSamplesEvent(inTaskHandle,DAQmx_Val_Acquired_Into_Buffer,1,0,EveryNCallback,NULL));
		DAQmxErrChk (DAQmxRegisterDoneEvent(inTaskHandle,0,DoneCallback,NULL));

		/*********************************************/
		// DAQmx Start Code
		/*********************************************/
		DAQmxErrChk (DAQmxStartTask(inTaskHandle));
	}

Error:
	if( DAQmxFailed(error) )
	{
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( taskHandle!=0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(inTaskHandle);
			DAQmxClearTask(inTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}

	record->udf = FALSE;
	return 0;
}

STATIC long niCtrlReadAi(aiRecord *record)
{
	struct instio *pinstio = (struct instio *)&(record->inp.value);
	char channel[4] = {0,};

//	printf("pinstio->string: %s\n", pinstio->string);
	strcpy(channel, pinstio->string+7);
//	printf("channel:%s, value:%lf\n", channel, inData[atoi(channel)][0]);
//	printf("channel:%s, value:%lf\n", channel, inData[atoi(channel)]);

//	epicsMutexMustLock(inMutex);
//	record->val = inData[atoi(channel)][0];
#if 0
	record->val = inData[atoi(channel)];
#else
	record->val = inData[atoi(channel)]*862.0689655172414;
#endif

	if(atoi(channel) == 14)
		record->val = record->val * -1;

//	epicsMutexUnlock(inMutex);

	record->udf = FALSE;
	record->dpvt = &niCtrlAi;        /* Any non-zero value */
	
	return 2;
}

int32 CVICALLBACK EveryNCallback(TaskHandle taskHandle, int32 everyNsamplesEventType, uInt32 nSamples, void *callbackData)
{
	int32       error=0;
	char        errBuff[2048]={'\0'};
//	static int  totalRead=0;
	int32       read=0;
//	int channel=0;

	/*********************************************/
	// DAQmx Read Code
	/*********************************************/
//	epicsMutexMustLock(inMutex);
//	DAQmxErrChk (DAQmxReadAnalogF64(taskHandle,1000,10.0,DAQmx_Val_GroupByChannel,inData[0],16000,&read,NULL));
	DAQmxErrChk (DAQmxReadAnalogF64(taskHandle,1,10.0,DAQmx_Val_GroupByChannel,inData,16,&read,NULL));
//	if( read>0 ) {
//		printf("Acquired %ld samples. Total %d\r",read,totalRead+=read);
//		fflush(stdout);
//	}
//	epicsMutexUnlock(inMutex);

#if 0
	int i, j;
	for(j=0;j<16;j++)
	{
//		for(i=0;i<1000;i++)
//			printf("[%d][%d]:%lf ", j, i, inData[j][i]);
		printf("[%d]:%lf ", j, inData[j]);
	}
#endif

Error:
	if( DAQmxFailed(error) ) {
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		/*********************************************/
		// DAQmx Stop Code
		/*********************************************/
		DAQmxStopTask(taskHandle);
		DAQmxClearTask(taskHandle);
		printf("DAQmx Error: %s\n",errBuff);
	}
	return 0;
}

int32 CVICALLBACK DoneCallback(TaskHandle taskHandle, int32 status, void *callbackData)
{
	int32   error=0;
	char    errBuff[2048]={'\0'};

	// Check to see if an error stopped the task.
	DAQmxErrChk (status);

Error:
	if( DAQmxFailed(error) ) {
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		DAQmxClearTask(taskHandle);
		printf("DAQmx Error: %s\n",errBuff);
	}
	return 0;
}



/* ao ***************************************************************/
STATIC long niCtrlInitRecordAo(aoRecord *record)
{
	int32       error=0;
	char        errBuff[2048]={'\0'};

//	struct instio *pinstio = (struct instio *)&(record->out.value);
//	char channel[4] = {0,};
//	char taskName[32] = {0,};

//	printf("pinstio->string:[%s]\n", pinstio->string);
//	strcpy(channel, pinstio->string+7);
//	printf("channel:%s\n", channel);
//	sprintf(taskName, "Output%s", channel);

//	for(;i<1000;i++)
//		data[i] = 9.95*sin((double)i*2.0*PI/1000.0);

	if(outTaskHandle == 0)
	{
		/*********************************************/
		// DAQmx Configure Code
		/*********************************************/
		DAQmxErrChk (DAQmxCreateTask("GenerateVoltage",&outTaskHandle));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao0","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao1","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao2","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao3","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao4","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao5","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao6","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao7","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao8","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao9","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao10","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao11","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao12","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao13","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao14","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle,"Dev2/ao15","",0.0,5.0,DAQmx_Val_Volts,NULL));

		/*********************************************/
		// DAQmx Start Code
		/*********************************************/
		DAQmxErrChk (DAQmxStartTask(outTaskHandle));

		/*********************************************/
		// DAQmx Write Code
		/*********************************************/
		DAQmxErrChk (DAQmxWriteAnalogF64(outTaskHandle,1,0,10.0,DAQmx_Val_GroupByChannel,outData,NULL,NULL));
	//	DAQmxErrChk (DAQmxWriteAnalogScalarF64(outTaskHandle,0,10.0,0.0,NULL));
	}

Error:
	if( DAQmxFailed(error) ){
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( outTaskHandle != 0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(outTaskHandle);
			DAQmxClearTask(outTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}

	record->udf = FALSE;
	return 0;
}

STATIC long niCtrlWriteAo(aoRecord *record)
{
	int32 error=0;
	char errBuff[2048]={'\0'};
	char channel[4] = {0,};
	int intCha;

	struct instio *pinstio = (struct instio *)&(record->out.value);
	printf("pinstio->string: %s\n", pinstio->string);
//	printf("channel:%s\n", channel);

	strcpy(channel, pinstio->string+7);
	intCha = atoi(channel);

#if 0
	outData[intCha] = record->val;
#else
	if(record->val > 4000)
		outData[intCha] = 4.64;
	else if(record->val < 0)
		outData[intCha] = 0;
	else
		outData[intCha] = record->val/862.0689655172414;
#endif

	printf("outData[%d]:%lf\n", intCha, outData[intCha]);

	int i=0;
	for(;i<16;i++)
		printf("outData[%d]:%lf ", i, outData[i]);
	/*********************************************/
	// DAQmx Write Code
	/*********************************************/
	DAQmxErrChk (DAQmxWriteAnalogF64(outTaskHandle,1,0,10.0,DAQmx_Val_GroupByChannel,outData,NULL,NULL));
//	DAQmxErrChk (DAQmxWriteAnalogScalarF64(outTaskHandle,0,10.0,(float64)(record->val),NULL));

Error:
	if( DAQmxFailed(error) ) {
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( outTaskHandle != 0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(outTaskHandle);
			DAQmxClearTask(outTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}
	return 0;
}


/* ao ***************************************************************/
STATIC long niCtrlInitRecordAo2(aoRecord *record)
{
	int32       error=0;
	char        errBuff[2048]={'\0'};

	if(outTaskHandle2 == 0)
	{
		/*********************************************/
		// DAQmx Configure Code
		/*********************************************/
		DAQmxErrChk (DAQmxCreateTask("GenerateVoltage2",&outTaskHandle2));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle2,"Dev1/ao0","",0.0,5.0,DAQmx_Val_Volts,NULL));
		DAQmxErrChk (DAQmxCreateAOVoltageChan(outTaskHandle2,"Dev1/ao1","",0.0,5.0,DAQmx_Val_Volts,NULL));

		/*********************************************/
		// DAQmx Start Code
		/*********************************************/
		DAQmxErrChk (DAQmxStartTask(outTaskHandle2));

		/*********************************************/
		// DAQmx Write Code
		/*********************************************/
		DAQmxErrChk (DAQmxWriteAnalogF64(outTaskHandle2,1,0,10.0,DAQmx_Val_GroupByChannel,outData2,NULL,NULL));
	//	DAQmxErrChk (DAQmxWriteAnalogScalarF64(outTaskHandle,0,10.0,0.0,NULL));
	}

Error:
	if( DAQmxFailed(error) ){
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( outTaskHandle2 != 0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(outTaskHandle2);
			DAQmxClearTask(outTaskHandle2);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}

	record->udf = FALSE;
	return 0;
}

STATIC long niCtrlWriteAo2(aoRecord *record)
{
	int32 error=0;
	char errBuff[2048]={'\0'};
	char channel[4] = {0,};
	int intCha;

	struct instio *pinstio = (struct instio *)&(record->out.value);
	printf("pinstio->string: %s\n", pinstio->string);
//	printf("channel:%s\n", channel);

	strcpy(channel, pinstio->string+7);
	intCha = atoi(channel);
#if 0
	outData2[intCha] = record->val;
#else
	if(record->val > 1)
		outData2[intCha] = 4.64;
	else if(record->val < 0)
		outData2[intCha] = 0;
	else
		outData2[intCha] = record->val*4.64;
#endif

	printf("outData2[%d]:%lf\n", intCha, outData2[intCha]);

	int i=0;
	for(;i<2;i++)
		printf("outData2[%d]:%lf ", i, outData2[i]);
	/*********************************************/
	// DAQmx Write Code
	/*********************************************/
	DAQmxErrChk (DAQmxWriteAnalogF64(outTaskHandle2,1,0,10.0,DAQmx_Val_GroupByChannel,outData2,NULL,NULL));
//	DAQmxErrChk (DAQmxWriteAnalogScalarF64(outTaskHandle,0,10.0,(float64)(record->val),NULL));

Error:
	if( DAQmxFailed(error) ) {
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( outTaskHandle2 != 0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(outTaskHandle2);
			DAQmxClearTask(outTaskHandle2);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}
	return 0;
}



/* bi ***************************************************************/
STATIC long niCtrlInitRecordBi(biRecord *record)
{
	int32       error=0;
	char        errBuff[2048]={'\0'};
	int32 i;
	int32 read, bytesPerSamp;

	/*********************************************/
	// DAQmx Configure Code
	/*********************************************/
	if(digInTaskHandle == 0)
	{
		DAQmxErrChk (DAQmxCreateTask("",&digInTaskHandle));
		DAQmxErrChk (DAQmxCreateDIChan(digInTaskHandle,"Dev1/port0/line0:7","",DAQmx_Val_ChanForAllLines));
	//	DAQmxErrChk (DAQmxCreateDIChan(digInTaskHandle,"Dev1/port1/line0:7","",DAQmx_Val_ChanForAllLines));
	//	DAQmxErrChk (DAQmxCreateDIChan(digInTaskHandle,"Dev1/port2/line0:7","",DAQmx_Val_ChanForAllLines));

		/*********************************************/
		// DAQmx Start Code
		/*********************************************/
		DAQmxErrChk (DAQmxStartTask(digInTaskHandle));

		/*********************************************/
		// DAQmx Read Code
		/*********************************************/
		DAQmxErrChk (DAQmxReadDigitalLines(digInTaskHandle,1,10.0,DAQmx_Val_GroupByChannel,digInData,100,&read,&bytesPerSamp,NULL));

		// assuming 8 channels acquired
		for(i=0;i<8;++i)
			printf("Data acquired, channel %ld: 0x%X\n",i,digInData[i]);
	}
Error:
	if( DAQmxFailed(error) ){
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( digInTaskHandle != 0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(digInTaskHandle);
			DAQmxClearTask(digInTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}

	record->udf = FALSE;

	return 0;
}

STATIC long niCtrlReadBi(biRecord *record)
{
	int32       error=0;
	char        errBuff[2048]={'\0'};
	struct instio *pinstio = (struct instio *)&(record->inp.value);
	char port[4] = {0,};
	char	line[4] = {0,};
	int idx;
	int32 read, bytesPerSamp;

	port[0] = *(pinstio->string+9);
	line[0] = *(pinstio->string+15);
	idx = atoi(port)*8+atoi(line);
//	printf("pinstio->string: %s\n", pinstio->string);
//	printf("idx: %d\n", idx);

	/*********************************************/
	// DAQmx Read Code
	/*********************************************/
	DAQmxErrChk (DAQmxReadDigitalLines(digInTaskHandle,1,10.0,DAQmx_Val_GroupByChannel,digInData,100,&read,&bytesPerSamp,NULL));

//	epicsMutexMustLock(inMutex);
//	record->val = inData[atoi(channel)][0];
	record->val = digInData[idx];
//	epicsMutexUnlock(inMutex);

	record->udf = FALSE;
	record->dpvt = &niCtrlBi;        /* Any non-zero value */

Error:
	if( DAQmxFailed(error) ){
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( digInTaskHandle != 0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(digInTaskHandle);
			DAQmxClearTask(digInTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
		record->udf = TRUE;
	}

	return 2;
}

STATIC long niCtrlInitRecordBo(boRecord *record)
{
	int32       error=0;
	uInt8       data[8]={0,0,0,0,0,0,0,0};
	char        errBuff[2048]={'\0'};

	/*********************************************/
	// DAQmx Configure Code
	/*********************************************/
	if(digOutTaskHandle == 0)
	{
		DAQmxErrChk (DAQmxCreateTask("",&digOutTaskHandle));
		DAQmxErrChk (DAQmxCreateDOChan(digOutTaskHandle,"Dev2/port0/line0:7","",DAQmx_Val_ChanForAllLines));

		/*********************************************/
		// DAQmx Start Code
		/*********************************************/
		DAQmxErrChk (DAQmxStartTask(digOutTaskHandle));

		/*********************************************/
		// DAQmx Write Code
		/*********************************************/
		DAQmxErrChk (DAQmxWriteDigitalLines(digOutTaskHandle,1,1,10.0,DAQmx_Val_GroupByChannel,data,NULL,NULL));
	}

Error:
	if( DAQmxFailed(error) )
	{
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( digOutTaskHandle!=0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(digOutTaskHandle);
			DAQmxClearTask(digOutTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}

	return 0;
}

STATIC long niCtrlWriteBo(boRecord *record)
{
	int32       error=0;
	char        errBuff[2048]={'\0'};
	struct instio *pinstio = (struct instio *)&(record->out.value);
	char port[4] = {0,};
	char	line[4] = {0,};
	int idx;

	printf("pinstio->string: %s\n", pinstio->string);
	port[0] = *(pinstio->string+9);
	line[0] = *(pinstio->string+15);
	idx = atoi(port)*8+atoi(line);
	digOutData[idx] = record->val;
	printf("idx: %d\n", idx);

	int i;
	for(i=0;i<8;++i)
		printf("Data output, channel %ld: 0x%X\n",i,digOutData[i]);

	/*********************************************/
	// DAQmx Write Code
	/*********************************************/
	DAQmxErrChk (DAQmxWriteDigitalLines(digOutTaskHandle,1,1,10.0,DAQmx_Val_GroupByChannel,digOutData,NULL,NULL));

Error:
	if( DAQmxFailed(error) )
	{
		DAQmxGetExtendedErrorInfo(errBuff,2048);
		if( digOutTaskHandle!=0 ) {
			/*********************************************/
			// DAQmx Stop Code
			/*********************************************/
			DAQmxStopTask(digOutTaskHandle);
			DAQmxClearTask(digOutTaskHandle);
		}
		printf("DAQmx Error: %s\n",errBuff);
	}

	return 0;
}

