/*
 * ISOL device support
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
#define DSET_AI     devAiDGH
#define DSET_AO     devAoDGH

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
DGH_convertVoltageReplyAI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aiRecord *pai = ((struct aiRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len=0;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

	strcpy(cmd, "$1RD\r");
  
	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

//	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);
	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, 11,&len, NULL);

printf("\n%s\n", cbuf);
	float val;
	sscanf(cbuf+2, "%f", &val);
	/* for test received dats */

#if 0
	printf("\nlen:%d\n", len);
	int i=0;
	for(;i<16;i++)
		printf("cbuf[%d]=%x ", i, cbuf[i]);

#endif
printf("\n$1RD val:%f(%g)\n", val, val);

	if (cbuf[0] != '*') {
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

	pai->val = val;
	pai->udf = 0;
	return 0;
}

static int
DGH_convertVoltageReplyAO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aoRecord *pao = ((struct aoRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	 len;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

  sprintf(cmd, "$1AO+%5.2f", pao->val);
  
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
	if (cbuf[0] != '*') {
//	if (len < 3){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	
	/* for test received dats */
printf("Set Voltage ACK: %s\n", cbuf);

	pao->udf = 0;
	return 0;
}


/******************************************************************************
 * Array of structures that define all GPIB messages
 * supported for this type of instrument.
 ******************************************************************************/

static struct gpibCmd gpibCmds[] = {
    /* Param 0 -- Get Voltage A */
    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, DGH_convertVoltageReplyAI, 0, 0, NULL, NULL, NULL},

    /* Param 1 - Get Current A */
    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, DGH_convertVoltageReplyAO, 0, 0, NULL, NULL, NULL},

//    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, DGH_convertCurrentReplyAI, 0, 0, NULL, NULL, NULL},

    /* Param 2 -- Set Voltage A */
//    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, DGH_convertVoltageReplyAO, 0, 0, NULL, NULL, NULL},

    /* Param 3 - Set Current A */
//    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, DGH_convertCurrentReplyAO,  0, 0, NULL, NULL, NULL},

    /* Param 4 - Output Control */
//    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 10, DGH_convertOutputControl, 0, 0, NULL, NULL, NULL},

    /* Param 5 - Turn Output Off */
//	{&DSET_BO, GPIBCMD, IB_Q_LOW, NULL, "OUT 0\r\n", 10, 10, NULL, 0, 0, NULL, NULL, "\r\n"},    
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
		devSupParms.name = "devDGH";
		devSupParms.gpibCmds = gpibCmds;
		devSupParms.numparams = NUMPARAMS;
		devSupParms.timeout = TIMEOUT;
		devSupParms.timeWindow = TIMEWINDOW;
		devSupParms.respond2Writes = -1;
	}

	return(0);
}
