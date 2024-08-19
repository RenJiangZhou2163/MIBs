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
#define DSET_AI     devAiGenesys
#define DSET_AO     devAoGenesys
#define DSET_BI     devBiGenesys
#define DSET_BO     devBoGenesys

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
Gensys_convertVoltageReplyAI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aiRecord *pai = ((struct aiRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len=0;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  strcpy(cmd, "MV?\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

//	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 7,&len, NULL);

	float val;
	sscanf(cbuf, "%E", &val);
	/* for test received dats */

#if 0
	printf("\nlen:%d\n", len);
	int i=0;
	for(;i<16;i++)
		printf("cbuf[%d]=%x ", i, cbuf[i]);

printf("\nMV? val:%f(%g)\n", val, val);
#endif

	if (len < 3){	/* invalid length	*/
		epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);

		memset(cmd, 0x00, sizeof(cmd));
		memset(cbuf, 0x00, sizeof(cbuf));
		strcpy(cmd, "ADR 6\r");
		if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
			return -1;
		pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 7,&len, NULL);

		if (cbuf[0] == 'O' || cbuf[1] == 'K') {
			printf("Remote control initialized");
		}

		return -1;	
	}
	if (check_validReply(cbuf, len) < 0) { /* invalid reply data	*/
		epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
		return -1;
	}


	pai->val = val;
	pai->udf = 0;
	return 0;
}

static int
Gensys_convertCurrentReplyAI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aiRecord *pai = ((struct aiRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  strcpy(cmd, "MC?\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

//	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 7,&len, NULL);

	float val;
	sscanf(cbuf, "%E", &val);
	/* for test received dats */

#if 0
	printf("\nlen:%d\n", len);
	int i=0;
	for(;i<16;i++)
		printf("cbuf[%d]=%x ", i, cbuf[i]);

printf("\nMC? val:%f(%g)\n", val, val);
#endif

	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	if (check_validReply(cbuf, len) < 0) { /* invalid reply data	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;
	}

	pai->val = val;
	pai->udf = 0;
	return 0;
}

static int
Gensys_convertVoltageReplyAO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aoRecord *pao = ((struct aoRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};
	char i=0;

  sprintf(cmd, "PV %6.3f", pao->val);
  
 	/* for test setting value */
printf("PV (%s)\n", cmd);
	strcat(cmd, "\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	if (cbuf[0] != 'O' || cbuf[1] != 'K') {
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
Gensys_convertCurrentReplyAO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aoRecord *pao = ((struct aoRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  sprintf(cmd, "PC %6.3f", pao->val);
  
 	/* for test setting value */
printf("PC (%s)\n", cmd);
  	strcat(cmd, "\r");

	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);

	if (cbuf[0] != 'O' || cbuf[1] != 'K') {
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
Gensys_convertOutputReplyBI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct biRecord *pbi = ((struct biRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  sprintf(cmd, "OUT?\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);

	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	
	if (cbuf[0] == 'O' && cbuf[1] == 'N') {
		pbi->rval = 1;
		pbi->udf = 0;
	  return 0;
	}
	if (cbuf[0] == 'O' && cbuf[1] == 'F') {
		pbi->rval = 0;
		pbi->udf = 0;
	  return 0;
	}

	return -1;
}

static int
Gensys_convertOutputReplyBO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct boRecord *pbo = ((struct boRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

	if(pbo->val == 0 || pbo->val == 1)
		sprintf(cmd, "OUT %d", (int)pbo->val);
	else if(pbo->val == 2)
		sprintf(cmd, "ADR 6");
	else if(pbo->val == 3)
		sprintf(cmd, "RMT 1");
	else if(pbo->val == 4)
		sprintf(cmd, "RMT?");
	else if(pbo->val == 5)
		sprintf(cmd, "RST");
  	else if(pbo->val == 6)
		sprintf(cmd, "MV?");
  	else if(pbo->val == 7)
		sprintf(cmd, "PV %f", (float)pbo->val);
  
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
	if (cbuf[0] != 'O' || cbuf[1] != 'K') {
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
    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Gensys_convertVoltageReplyAI, 0, 0, NULL, NULL, NULL},

    /* Param 1 - Get Current A */
    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Gensys_convertCurrentReplyAI, 0, 0, NULL, NULL, NULL},

    /* Param 2 -- Set Voltage A */
    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Gensys_convertVoltageReplyAO, 0, 0, NULL, NULL, NULL},

    /* Param 3 - Set Current A */
    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Gensys_convertCurrentReplyAO,  0, 0, NULL, NULL, NULL},

    /* Param 4 - Output Status */
    {&DSET_BI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Gensys_convertOutputReplyBI, 0, 0, NULL, NULL, NULL},

    /* Param 5 - Turn Output On Off */
    {&DSET_BO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, Gensys_convertOutputReplyBO, 0, 0, NULL, NULL, NULL},
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
		devSupParms.name = "devGenesys";
		devSupParms.gpibCmds = gpibCmds;
		devSupParms.numparams = NUMPARAMS;
		devSupParms.timeout = TIMEOUT;
		devSupParms.timeWindow = TIMEWINDOW;
		devSupParms.respond2Writes = -1;
	}

	return(0);
}
