/* devIfstatSoft.c */
/* Example device support module */

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "alarm.h"
#include "cvtTable.h"
#include "dbDefs.h"
#include "dbAccess.h"
#include "recGbl.h"
#include "recSup.h"
#include "devSup.h"
#include "link.h"
#include "menuScan.h"
#include "ifstatRecord.h"
#include "epicsExport.h"
#include "ifstat.h"

/*Create the dset for devIfstatSoft */
static long init_record();
static long read_ifstat();

struct ifstat_list ifs;
struct ifstat_driver driver;

struct {
	long		number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	read_ifstat;
}devIfstatSoft={
	5,
	NULL,
	NULL,
	init_record,
	NULL,
	read_ifstat
};

epicsExportAddress(dset,devIfstatSoft);

int IfstatDebug = 0;
epicsExportAddress(int, IfstatDebug);

static long init_record(struct ifstatRecord	*pifstat)
{
	char *dopts = NULL;

#if 1
	if (!ifstat_get_driver("proc", &driver)) {
		printf("Get Driver Error!!\n");
		return -1;
	}
#endif
	
	if (driver.open_driver != NULL && !driver.open_driver(&driver, dopts))
	{
		printf("Open Driver Error!!\n");
		return -1;
	};

	ifs.flags = 0;
	ifs.first = NULL;

	ifstat_add_interface(&ifs, pifstat->nic, 0); 

    if(recGblInitConstantLink(&pifstat->inp,DBF_DOUBLE,&pifstat->val))
         pifstat->udf = FALSE;

	pifstat->dpvt = &driver;
    return(0);
}

static long read_ifstat(struct ifstatRecord	*pifstat)
{
    long status;
	//struct ifstat_driver *driver = (struct ifstat_driver*)pifstat->dpvt;
	struct ifstat_data *ptr;
	epicsTimeStamp currTime;
	epicsTimeGetCurrent (&currTime);

	int type = pifstat->tonc;
    if(driver.get_stats != NULL && !driver.get_stats(&driver, &ifs)) return -1;

	ptr = ifs.first;
	double scale;
	
	switch(pifstat->scan)
	{
		case menuScanPassive:
		case menuScanEvent:
		case menuScanI_O_Intr:
		case menuScan_5_second:
		case menuScan_2_second:
		case menuScan_1_second:
		case menuScan1_second:
		default:
			scale = 1024*1;
			break;
		case menuScan2_second:
			scale = 1024*2;
			break;
		case menuScan5_second:
			scale = 1024*5;
			break;
		case menuScan10_second:
			scale = 1024*10;
			break;
	}

	double kbin, kbout, delay;
	kbin = (double) (ptr->bin - ptr->obin)/scale;
	kbout = (double) (ptr->bout - ptr->obout)/scale;
	if(!pifstat->osec) 
		kbin = kbout = 0;

	if(IfstatDebug)
		printf("Name:%s, Scan(%d), In-B:%f Out-B:%f, Delay:%f \n",ptr->name, pifstat->scan, kbin, kbout, delay);

	switch(type)
	{
		case 0:
			pifstat->val = kbin;
			break;
		case 1:
			pifstat->val = kbout;
			break;
		case 2:
			pifstat->val = kbin+kbout;
			break;
	};

	pifstat->osec = currTime.secPastEpoch;
	pifstat->ouse = currTime.nsec;

    status = dbGetLink(&(pifstat->inp),DBF_DOUBLE, &(pifstat->val),0,0);
    /*If return was succesful then set undefined false*/
    if(!status) pifstat->udf = FALSE;
    return(0);
}
