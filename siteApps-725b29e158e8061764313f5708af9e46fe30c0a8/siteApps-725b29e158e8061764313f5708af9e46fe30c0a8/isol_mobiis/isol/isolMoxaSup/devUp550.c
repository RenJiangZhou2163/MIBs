/*
 * MOBIIXA device support
 * Yokogawa UP550 Temp Controller device support
 */

#include <epicsStdio.h>
#include <devCommonGpib.h>

/******************************************************************************
 *
 * The following define statements are used to declare the names to be used
 * for the dset tables.   
 *
 * A DSET_AI entry must be declared here and referenced in an application
 * database description file even if the device provides no AI records.
 *
 ******************************************************************************/
#define DSET_AI     devAiUp550
#define DSET_AO     devAoUp550


#include <devGpib.h> /* must be included after DSET defines */

#define TIMEOUT     1.0    /* I/O must complete within this time */
#define TIMEWINDOW  2.0    /* Wait this long after device timeout */

/*
* Custom conversion routines
*/

/*	make_UP550_commandString(1, "WWRD0301,01,00C8", buf);	
                                     write D0301 register, 1 word, value 200(0x00c8)	*/
static int
make_Up550_commandString(int dev, char *command, char *cmdbuf)
{
	int	i, n, checksum = 0;
	
	cmdbuf[0] = 0x02;		/* STX	*/
	cmdbuf[1] = dev / 10 + '0';	/* device address number 00 ~ 99 */
	cmdbuf[2] = dev % 10 + '0';
	cmdbuf[3] = '0';		/* cpu number 01 fixed		*/
	cmdbuf[4] = '1';
	cmdbuf[5] = '0';		/* time to wait '1' fixed	*/
	strcpy(cmdbuf+6, command);
	n = 6 + strlen(command);
	for (i = 1; i < n; i++)
		checksum += cmdbuf[i];
	checksum = checksum & 0xff;
	sprintf(cmdbuf+n, "%02X", checksum);
	cmdbuf[n+2] = 0x03;		/* ETX		*/
	cmdbuf[n+3] = 0x0d;		/* CR			*/
	cmdbuf[n+4] = NULL;
	
	return (n+4);
}

static int
check_validReply(char *buf, int len) 
{
	int	i, n, checksum = 0;


/*	check string STX$+ 0301OK00C839+ETX$+CR$	*/
	for (i = 1; i < len-4; i++)
		checksum += buf[i];
	sscanf(buf+11, "%2X", &n);
	checksum &= 0xff;
	if (n != checksum)
		return -1;
			
	return 0;
}

static int
Up550_convertPVReplyAI(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aiRecord *pai = ((struct aiRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	len;
	int	rval;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};

	int addr;
	addr = pai->inp.value.gpibio.addr;
	if(addr == 1)
		make_Up550_commandString(3, "WRD0003,01", cmd);	/* PV.1 value	*/
	else if(addr == 2)
		make_Up550_commandString(3, "WRD0019,01", cmd);	/* PV.2 value	*/

	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);

	if (len < 15){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	if (check_validReply(cbuf, len) < 0) { /* invalid reply data	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;
	}

	float val;

	sscanf(cbuf+7, "%4X", &rval);
	val = rval / 10.0;
	
	pai->val = val;
	pai->udf = 0;
	return 0;
}

static int
Up550_convertSPReplyAO(struct gpibDpvt *pdpvt, int P1, int P2, char **P3)
{
	struct aoRecord *pao = ((struct aoRecord *)(pdpvt->precord));

	asynOctet *pasynOctet =pdpvt->pasynOctet;
	void *asynOctetPvt = pdpvt->asynOctetPvt;

	int	len;
	int 	sval;
	char cmd[64] = {0,};
	char cbuf[64] = {0,};
	short	word;

	int addr;
	addr = pao->out.value.gpibio.addr;
	
	word = (short) (pao->val * 10);	/* make word by multiplyng 10	*/
	strcpy(cbuf, "WWR0301,01,xxxx");
	sprintf(cbuf+11, "%4X", word);
	
	if(addr == 1)
		make_Up550_commandString(1, cbuf, cmd);	/* SP.1 value	*/
	else if(addr == 2)
		make_Up550_commandString(1, cbuf, cmd);	/* SP.2 value	*/

	if((pasynOctet->setInputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if((pasynOctet->setOutputEos(asynOctetPvt,pdpvt->pasynUser,NULL,0) != asynSuccess))
		return -1;
	if(pasynOctet->write(asynOctetPvt,pdpvt->pasynUser,cmd,strlen(cmd),&len) != asynSuccess)
		return -1;

	pasynOctet->read(asynOctetPvt,pdpvt->pasynUser,cbuf, sizeof(cbuf),&len, NULL);

	if (len < 11){	/* invalid length	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;	
	}
	if (check_validReply(cbuf, len) < 0) { /* invalid reply data	*/
			epicsSnprintf(pdpvt->pasynUser->errorMessage, pdpvt->pasynUser->errorMessageSize, "Invalid reply %d", pdpvt->msgInputLen);
			return -1;
	}

	pao->udf = 0;

	return 0;
}

/******************************************************************************
 * Array of structures that define all GPIB messages
 * supported for this type of instrument.
 ******************************************************************************/

static struct gpibCmd gpibCmds[] = {
    /* Param 0 -- Get PV.x Word (x: addr x)	*/
    {&DSET_AI, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 40, Up550_convertPVReplyAI, 0, 0, NULL, NULL, ""},
    {&DSET_AO, GPIBCVTIO, IB_Q_LOW, NULL, NULL, 0, 40, Up550_convertSPReplyAO, 0, 0, NULL, NULL, ""}
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
        devSupParms.name = "devUp550";
        devSupParms.gpibCmds = gpibCmds;
        devSupParms.numparams = NUMPARAMS;
        devSupParms.timeout = TIMEOUT;
        devSupParms.timeWindow = TIMEWINDOW;
        devSupParms.respond2Writes = 0;
    }
    return(0);
}
