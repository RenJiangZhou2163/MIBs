#include<stdio.h>
#include<time.h>

#include<dbDefs.h>
#include<registryFunction.h>
#include <errlog.h>
#include <menuFtype.h>
#include <aSubRecord.h>
#include <epicsExport.h>


static long TimeStampProcess(aSubRecord *prec)
{
	struct tm timeinfo;
	
	time_t now = time(NULL);
	localtime_r(&now, &timeinfo);

	if(prec->ftva != menuFtypeLONG || prec->ftvb != menuFtypeLONG || prec->ftvc != menuFtypeLONG ||
	prec->ftvd != menuFtypeLONG || prec->ftve != menuFtypeLONG || prec->ftvf != menuFtypeLONG || 
	prec->ftvg != menuFtypeLONG || prec->ftvh != menuFtypeLONG || prec->ftvi != menuFtypeLONG)
	{
		errlogPrintf("%s incorrect output type" , prec->name);
		return -1;
	}

	long *sec = prec->vala;
	long *min = prec->valb;
	long *hour = prec->valc;
	long *mday = prec->vald;
	long *mon = prec->vale;
	long *year = prec->valf;
	long *wday = prec->valg;
	long *yday = prec->valh;
	long *isdst = prec->vali;

	*min = (long)timeinfo.tm_min;
	*sec = (long)timeinfo.tm_sec;
	*hour = (long)timeinfo.tm_hour;
	*mday = (long)timeinfo.tm_mday;
	*mon = (long)timeinfo.tm_mon;
	*year = (long)timeinfo.tm_year;
	*wday = (long)timeinfo.tm_wday;
	*yday= (long)timeinfo.tm_yday;
	*isdst = (long)timeinfo.tm_isdst;

/*	prec->valc = (long*)&(timeinfo.tm_hour);
	prec->vala = (long*)&(timeinfo.tm_sec);
	prec->valb = (long*)&(timeinfo.tm_min);
	
	prec->vald = (long*)&(timeinfo.tm_mday);
	prec->vale = (long*)&(timeinfo.tm_mon);
	prec->valf = (long*)&(timeinfo.tm_year);
	prec->valg = (long*)&(timeinfo.tm_wday);
	prec->valh = (long*)&(timeinfo.tm_yday);
	prec->vali = (long*)&(timeinfo.tm_isdst);*/
//	printf("The time is %d:%2d:%2d\n", timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec);
	return 0;
}
	
	 
static registryFunctionRef asub_TimeStamp_Ref[] = {
{"TimeStampCalc" , (REGISTRYFUNCTION) TimeStampProcess}
};

static void asub_TimeStamp(void)
{
	registryFunctionRefAdd(asub_TimeStamp_Ref, NELEMENTS(asub_TimeStamp_Ref));
}

epicsExportRegistrar(asub_TimeStamp);
