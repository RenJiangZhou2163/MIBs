/* rdbmySQLRecord.c */
/* Example record support module */
  
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "epicsMath.h"
#include "alarm.h"
#include "dbAccess.h"
#include "recGbl.h"
#include "dbEvent.h"
#include "dbDefs.h"
#include "dbAccess.h"
#include "devSup.h"
#include "errMdef.h"
#include "recSup.h"
#include "special.h"
#define GEN_SIZE_OFFSET
#include "rdbmySQLRecord.h"
#undef  GEN_SIZE_OFFSET
#include "epicsExport.h"
#include "rdbmySQLEPICS.h"

/* Create RSET - Record Support Entry Table */
#define report NULL
#define initialize NULL
#define special NULL
#define get_value NULL
#define cvt_dbaddr NULL
#define get_array_info NULL
#define put_array_info NULL
#define get_enum_str NULL
#define get_enum_strs NULL
#define put_enum_str NULL

rset rdbmySQLRSET={
	RSETNUMBER,
	report,
	initialize,
	init_record,
	process,
	special,
	get_value,
	cvt_dbaddr,
	get_array_info,
	put_array_info,
	get_units,
	get_precision,
	get_enum_str,
	get_enum_strs,
	put_enum_str,
	get_graphic_double,
	get_control_double,
	get_alarm_double
};
epicsExportAddress(rset,rdbmySQLRSET);

typedef struct rdbmySQLset {
	long		number;
	DEVSUPFUN	dev_report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record; /*returns: (-1,0)=>(failure,success)*/
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	read_rdbmySQL;
}rdbmySQLdset;


static long init_record(void *precord,int pass)
{
    rdbmySQLRecord	*prec = (rdbmySQLRecord *)precord;
    rdbmySQLdset	*pdset;
    long	status;

    if (pass==0) return(0);

    if(!(pdset = (rdbmySQLdset *)(prec->dset))) {
	recGblRecordError(S_dev_noDSET,(void *)prec,"rdbmySQL: init_record");
	return(S_dev_noDSET);
    }
    /* must have read_rdbmySQL function defined */
    if( (pdset->number < 5) || (pdset->read_rdbmySQL == NULL) ) {
	recGblRecordError(S_dev_missingSup,(void *)prec,"rdbmySQL: init_record");
	return(S_dev_missingSup);
    }

    if( pdset->init_record ) {
	if((status=(*pdset->init_record)(prec))) return(status);
    }
    return(0);
}

static long process(void *precord)
{
	rdbmySQLRecord	*prec = (rdbmySQLRecord *)precord;
	rdbmySQLdset		*pdset = (rdbmySQLdset *)(prec->dset);
	long		 status;
	unsigned char    pact=prec->pact;

	if( (pdset==NULL) || (pdset->read_rdbmySQL==NULL) ) {
		prec->pact=TRUE;
		recGblRecordError(S_dev_missingSup,(void *)prec,"read_rdbmySQL");
		return(S_dev_missingSup);
	}

	/* pact must not be set until after calling device support */
	status=(*pdset->read_rdbmySQL)(prec);
	/* check if device support set pact */
	if ( !pact && prec->pact ) return(0);
	prec->pact = TRUE;

	recGblGetTimeStamp(prec);
	/* check for alarms */
	checkAlarms(prec);
	/* check event list */
	monitor(prec);
	/* process the forward scan link record */
        recGblFwdLink(prec);

	prec->pact=FALSE;
	return(status);
}

static long get_units(DBADDR *paddr, char *units)
{
    rdbmySQLRecord	*prec=(rdbmySQLRecord *)paddr->precord;

    strncpy(units,prec->egu,DB_UNITS_SIZE);
    return(0);
}

static long get_precision(DBADDR *paddr, long *precision)
{
    rdbmySQLRecord	*prec=(rdbmySQLRecord *)paddr->precord;

    *precision = prec->prec;
    if(paddr->pfield == (void *)&prec->val) return(0);
    recGblGetPrec(paddr,precision);
    return(0);
}

static long get_graphic_double(DBADDR *paddr,struct dbr_grDouble *pgd)
{
    rdbmySQLRecord	*prec=(rdbmySQLRecord *)paddr->precord;
    int		fieldIndex = dbGetFieldIndex(paddr);

    if(fieldIndex == rdbmySQLRecordVAL
    || fieldIndex == rdbmySQLRecordHIHI
    || fieldIndex == rdbmySQLRecordHIGH
    || fieldIndex == rdbmySQLRecordLOW
    || fieldIndex == rdbmySQLRecordLOLO
    || fieldIndex == rdbmySQLRecordHOPR
    || fieldIndex == rdbmySQLRecordLOPR) {
        pgd->upper_disp_limit = prec->hopr;
        pgd->lower_disp_limit = prec->lopr;
    } else recGblGetGraphicDouble(paddr,pgd);
    return(0);
}

static long get_control_double(DBADDR *paddr,struct dbr_ctrlDouble *pcd)
{
    rdbmySQLRecord	*prec=(rdbmySQLRecord *)paddr->precord;
    int		fieldIndex = dbGetFieldIndex(paddr);

    if(fieldIndex == rdbmySQLRecordVAL
    || fieldIndex == rdbmySQLRecordHIHI
    || fieldIndex == rdbmySQLRecordHIGH
    || fieldIndex == rdbmySQLRecordLOW
    || fieldIndex == rdbmySQLRecordLOLO) {
	pcd->upper_ctrl_limit = prec->hopr;
	pcd->lower_ctrl_limit = prec->lopr;
    } else recGblGetControlDouble(paddr,pcd);
    return(0);
}

static long get_alarm_double(DBADDR *paddr,struct dbr_alDouble *pad)
{
    rdbmySQLRecord	*prec=(rdbmySQLRecord *)paddr->precord;
    int		fieldIndex = dbGetFieldIndex(paddr);

    if(fieldIndex == rdbmySQLRecordVAL) {
        pad->upper_alarm_limit = prec->hhsv ? prec->hihi : epicsNAN;
        pad->upper_warning_limit = prec->hsv ? prec->high : epicsNAN;
        pad->lower_warning_limit = prec->lsv ? prec->low : epicsNAN;
        pad->lower_alarm_limit = prec->llsv ? prec->lolo : epicsNAN;
    } else recGblGetAlarmDouble(paddr,pad);
    return(0);
}

static void checkAlarms(rdbmySQLRecord *prec)
{
	double		val;
	float		hyst, lalm, hihi, high, low, lolo;
	unsigned short	hhsv, llsv, hsv, lsv;

	if(prec->udf == TRUE ){
		recGblSetSevr(prec,UDF_ALARM,INVALID_ALARM);
		return;
	}
	hihi = prec->hihi; lolo = prec->lolo; high = prec->high; low = prec->low;
	hhsv = prec->hhsv; llsv = prec->llsv; hsv = prec->hsv; lsv = prec->lsv;
	val = prec->val; hyst = prec->hyst; lalm = prec->lalm;

	/* alarm condition hihi */
	if (hhsv && (val >= hihi || ((lalm==hihi) && (val >= hihi-hyst)))){
	        if (recGblSetSevr(prec,HIHI_ALARM,prec->hhsv)) prec->lalm = hihi;
		return;
	}

	/* alarm condition lolo */
	if (llsv && (val <= lolo || ((lalm==lolo) && (val <= lolo+hyst)))){
	        if (recGblSetSevr(prec,LOLO_ALARM,prec->llsv)) prec->lalm = lolo;
		return;
	}

	/* alarm condition high */
	if (hsv && (val >= high || ((lalm==high) && (val >= high-hyst)))){
	        if (recGblSetSevr(prec,HIGH_ALARM,prec->hsv)) prec->lalm = high;
		return;
	}

	/* alarm condition low */
	if (lsv && (val <= low || ((lalm==low) && (val <= low+hyst)))){
	        if (recGblSetSevr(prec,LOW_ALARM,prec->lsv)) prec->lalm = low;
		return;
	}

	/* we get here only if val is out of alarm by at least hyst */
	prec->lalm = val;
	return;
}

static void monitor(rdbmySQLRecord *prec)
{
	unsigned short	monitor_mask;
	double		delta;

        monitor_mask = recGblResetAlarms(prec);
	/* check for value change */
	delta = prec->mlst - prec->val;
	if(delta<0.0) delta = -delta;
	if (delta > prec->mdel) {
		/* post events for value change */
		monitor_mask |= DBE_VALUE;
		/* update last value monitored */
		prec->mlst = prec->val;
	}

	/* check for archive change */
	delta = prec->alst - prec->val;
	if(delta<0.0) delta = -delta;
	if (delta > prec->adel) {
		/* post events on value field for archive change */
		monitor_mask |= DBE_LOG;
		/* update last archive value monitored */
		prec->alst = prec->val;
	}

	/* send out monitors connected to the value field */
	if (monitor_mask){
		db_post_events(prec,&prec->val,monitor_mask);
	}
	return;
}
