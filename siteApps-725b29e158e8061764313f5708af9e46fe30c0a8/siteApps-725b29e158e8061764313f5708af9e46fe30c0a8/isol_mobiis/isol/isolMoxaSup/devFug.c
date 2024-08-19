/*
 * MOBIIXA device support
 * TDK Gen Series Power Supply device support
 */

#include <epicsStdio.h>
#include <devCommonGpib.h>

#include <string.h>

/******************************************************************************
 *
 * The following define statements are used to declare the names to be used
 * for the dset tables.   
 *
 * A DSET_AI entry must be declared here and referenced in an application
 * database description file even if the device provides no AI records.
 *
 ******************************************************************************/
#define DSET_AI     devAiFug
#define DSET_AO     devAoFug
#define DSET_BO     devBoFug

#include <devGpib.h> /* must be included after DSET defines */

#define TIMEOUT     2.0    /* I/O must complete within this time */
#define TIMEWINDOW  1.0    /* Wait this long after device timeout */

epicsMutexId Mutex;

/*
* Custom conversion routines
*/

static int
check_validReply(char *buf, int len) 
{
	int	i, nPeriod = 0;
	
	for (i = 0; i < len; i++) {
		if ((buf[i] >= '0') && (buf[i] <= '9'))
			continue;
		if (buf[i] == '.') {
			nPeriod++;
			continue;
		}
		break;
	}
	buf[i] = '\0';
	
	if (nPeriod > 1)
		return -1;
		
	return 0;
}

static int
Fug_convertVoltageReplyAI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aiRecord *pai = ((struct aiRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len=0;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  strcpy(cmd, ">M0?\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

//	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 16,&len, NULL);

//printf("\n(%s)(%d)\n", cbuf, len);
	float val;
	sscanf(cbuf+3, "%E", &val);
	/* for test received dats */

#if 0
	printf("\nlen:%d\n", len);
	int i=0;
	for(;i<16;i++)
		printf("cbuf[%d]=%x ", i, cbuf[i]);

#endif
//printf("\n>M0? val:%f(%g)\n", val, val);

	if (cbuf[0] != 'M' || cbuf[1] != '0') {
//	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
#if 0
	if (check_validReply(cbuf, len) < 0) { /* invalid reply data	*/
		epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
		return -1;
	}
#endif

//	pai->val = val/1000;
	pai->val = val;
	pai->udf = 0;
	return 0;
}

static int
Fug_convertCurrentReplyAI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aiRecord *pai = ((struct aiRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  strcpy(cmd, ">M1?\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

//	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 16,&len, NULL);

//printf("\n(%s)(%d)\n", cbuf, len);
	float val;
	sscanf(cbuf+3, "%E", &val);

	/* for test received dats */
#if 0
	printf("\nlen:%d\n", len);
	int i=0;
	for(;i<16;i++)
		printf("cbuf[%d]=%x ", i, cbuf[i]);
#endif
//printf("\n>M1? val:%f(%g)\n", val, val);

	if (cbuf[0] != 'M' || cbuf[1] != '1') {
//	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
#if 0
	if (check_validReply(cbuf, len) < 0) { /* invalid reply data	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;
	}
#endif

	pai->val = val*1000;
	pai->udf = 0;
	return 0;
}

static int
Fug_convertVoltageReplyAO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aoRecord *pao = ((struct aoRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};
	char i=0;

//	sprintf(cmd, "U%E", pao->val*1000);
	sprintf(cmd, "U%E", pao->val);
  
 	/* for test setting value */
printf("=>%s\n", cmd);
	strcat(cmd, "\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	if (cbuf[0] != 'E' || cbuf[1] != '0') {
//	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	
	/* for test received dats */
printf("Set Voltage ACK: %s\n", cbuf);

	pao->udf = 0;
	return 0;
}

static int
Fug_convertCurrentReplyAO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aoRecord *pao = ((struct aoRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

	sprintf(cmd, "I%E", pao->val/1000);

 	/* for test setting value */
printf("=>%s\n", cmd);
  	strcat(cmd, "\r");

	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);

	if (cbuf[0] != 'E' || cbuf[1] != '0') {
//	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	
	/* for test received dats */
printf("Set Current ACK: %s\n", cbuf);

	pao->udf = 0;
	return 0;
}

static int
Fug_convertOutputReplyBO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct boRecord *pbo = ((struct boRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

	if(pbo->val == 0 || pbo->val == 1)
		sprintf(cmd, "F%d", (int)pbo->val);
  
 	/* for test setting value */
printf("\ncmd:(%s)\n", cmd);
	strcat(cmd, "\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->flush(asynOctetPvt,pdpvt->pasynUser) != asynSuccess)
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
//	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 3,&len, NULL);

	printf("len:%d\n", len);
#if 0
	int i=0;
	for(;i<16;i++)
		printf("cbuf[%d]=%x ", i, cbuf[i]);
#endif
	if (cbuf[0] != 'E' || cbuf[1] != '0') {
//	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
//			return -1;	
	}
	
	/* for test received dats */
printf("\nSet Current ACK: %s\n", cbuf);

	pbo->udf = 0;
	return 0;
}

/******************************************************************************
 * Array of structures that define all GPIB messages
 * supported for this type of instrument.
 ******************************************************************************/

static struct gpibCmd gpibCmds[] = {
    /* Param 0 -- Get Voltage A */
    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Fug_convertVoltageReplyAI, 0, 0, NULL, NULL, NULL},

    /* Param 1 - Get Current A */
    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Fug_convertCurrentReplyAI, 0, 0, NULL, NULL, NULL},

    /* Param 2 -- Set Voltage A */
    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Fug_convertVoltageReplyAO, 0, 0, NULL, NULL, NULL},

    /* Param 3 - Set Current A */
    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Fug_convertCurrentReplyAO,  0, 0, NULL, NULL, NULL},

    /* Param 4 - Turn Output On Off */
    {&DSET_BO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Fug_convertOutputReplyBO, 0, 0, NULL, NULL, NULL},

    /* Param 5 - Turn Output On Off */
//    {&DSET_BO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Fug_convertOutputReplyBO, 0, 0, NULL, NULL, NULL},
};

/* The following is the number of elements in the command array above.  */
#define NUMPARAMS sizeof(gpibCmds)/sizeof(struct gpibCmd)

/******************************************************************************
 * Initialize device support parameters
 *
 *****************************************************************************/
static long init_ai(int parm)
{
	if(parm==0) {
		devSupParms.name = "devFug";
		devSupParms.gpibCmds = gpibCmds;
		devSupParms.numparams = NUMPARAMS;
		devSupParms.timeout = TIMEOUT;
		devSupParms.timeWindow = TIMEWINDOW;
		devSupParms.respond2Writes = -1;
	}

	return(0);
}
