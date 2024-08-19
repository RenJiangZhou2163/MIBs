/* epidRecord.c */

/* epidRecord.c - Record Support Routines for epid records */
/*
 *      Original Author: Bob Dalesio
 *      Current Author:  Mark Rivers
 *      Date:            5-19-89 
 *
 *      Experimental Physics and Industrial Control System (EPICS)
 *
 *      Copyright 1991, the Regents of the University of California,
 *      and the University of Chicago Board of Governors.
 *
 *      This software was produced under  U.S. Government contracts:
 *      (W-7405-ENG-36) at the Los Alamos National Laboratory,
 *      and (W-31-109-ENG-38) at Argonne National Laboratory.
 *
 *      Initial development by:
 *              The Controls and Automation Group (AT-8)
 *              Ground Test Accelerator
 *              Accelerator Technology Division
 *              Los Alamos National Laboratory
 *
 *      Co-developed with
 *              The Controls and Computing Group
 *              Accelerator Systems Division
 *              Advanced Photon Source
 *              Argonne National Laboratory
 *
 * Modification Log:
 * -----------------
 * .01  10-15-90        mrk changes for new record support
 * .02  11-11-91        jba     Moved set and reset of alarm stat and sevr to macros
 * .03  02-05-92        jba Changed function arguments from paddr to precord 
 * .04  02-28-92        jba     Changed get_precision,get_graphic_double,get_control_double
 * .05  02-28-92        jba ANSI C changes
 * .06  06-02-92        jba     changed graphic/control limits for hihi,high,low,lolo
 * .07  07-15-92        jba     changed VALID_ALARM to INVALID alarm
 * .08  07-16-92        jba     added invalid alarm fwd link test and chngd fwd lnk to macro
 * .09  07-21-92        jba     changed alarm limits for non val related fields
 * .10  08-06-92        jba     New algorithm for calculating analog alarms
 * .11  09-10-92        jba     modified fetch of VAL from STPL to call recGblGetLinkValue
 * .12  03-29-94        mcn     Converted to fast links
 * .13  05-30-99        mlr     Changed from delta to absolute form, added 
                                sanity checks on integral term.  Post monitors
                                even if output has not changed, since other
                                important parameters might have changed. Post
                                monitors on CVAL to enable generic operator
                                interface screens.
                                Renamed record to epid from pid, since it is
                                no longer compatible with the pid record in
                                base.
 * .14  11-10-99        mlr     Rewrote to separate record and device support.
                                This allows the traditional record links for
                                slower applications (devEpidSoft.c), while
                                permitting the epid record to be used to
                                communicate with hardware or fast software for
                                higher performance applications.
                                Changed the algorithm in devEpidSoft so that
                                KI and KD are defined as repeats per second 
                                rather than repeats per minute.
 * .15  05-19-01        mlr     Added Feedback Mode (FMOD) field.  Current choices
                                are PID and MaxMin.  These are used by device support
                                in implementing algorithms.
 * .16  06-26-03	rls	Port to 3.14; alarm() conflicts with alarm
				declaration in unistd.h (epidRecord.h->epicsTime.h->
				osdTime.h->unistd.h) when compiled with SUNPro.
 */

#ifdef vxWorks
#include <stddef.h>
#include <stdlib.h>
#include <stdarg.h>
#endif
#include <stdio.h>
#include <string.h>

#include    <alarm.h>
#include    <dbDefs.h>
#include    <dbAccess.h>
#include    <dbEvent.h>
#include    <dbFldTypes.h>
#include    <errMdef.h>
#include    <recSup.h>
#include    <recGbl.h>
#include    <devSup.h>
#define GEN_SIZE_OFFSET
#include    "epidRecord.h"
#undef  GEN_SIZE_OFFSET
#include "menuOmsl.h"
#include    <epicsExport.h>

#include	<epicsVersion.h>
#ifndef EPICS_VERSION_INT
#define VERSION_INT(V,R,M,P) ( ((V)<<24) | ((R)<<16) | ((M)<<8) | (P))
#define EPICS_VERSION_INT VERSION_INT(EPICS_VERSION, EPICS_REVISION, EPICS_MODIFICATION, EPICS_PATCH_LEVEL)
#endif
#define LT_EPICSBASE(V,R,M,P) (EPICS_VERSION_INT < VERSION_INT((V),(R),(M),(P)))

/* Create RSET - Record Support Entry Table*/
#define report NULL
#define initialize NULL
static long init_record();
static long process();
#define special NULL
#define get_value NULL
#define cvt_dbaddr NULL
#define get_array_info NULL
#define put_array_info NULL
static long get_units();
static long get_precision();
#define get_enum_str NULL
#define get_enum_strs NULL
#define put_enum_str NULL
static long get_graphic_double();
static long get_control_double();
static long get_alarm_double();

rset epidRSET={
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
    get_alarm_double };

epicsExportAddress(rset, epidRSET);

struct epidDSET { /* epid DSET */
    long            number;
    DEVSUPFUN       dev_report;
    DEVSUPFUN       init;
    DEVSUPFUN       init_record;
    DEVSUPFUN       get_ioint_info;
    DEVSUPFUN       do_pid;
};

static void checkAlarms();
static void monitor();


static long init_record(epidRecord *pepid, int pass)
{
    struct epidDSET *pdset;
    int status;

    if (pass==0) return(0);
    /* initialize the setpoint for constant setpoint */
    if (pepid->stpl.type == CONSTANT){
       if(recGblInitConstantLink(&pepid->stpl,DBF_DOUBLE,&pepid->val))
                pepid->udf = FALSE;
    }

    /* must have dset defined */
    if (!(pdset = (struct epidDSET *)(pepid->dset))) {
        recGblRecordError(S_dev_noDSET,(void *)pepid,"epid: init_record1");
        return(S_dev_noDSET);
    }
    /* must have do_pid function defined */
    if ( (pdset->number < 5) || (pdset->do_pid == NULL) ) {
        recGblRecordError(S_dev_missingSup,(void *)pepid,"epid: init_record2");
        printf("%ld %p\n",pdset->number, pdset->do_pid);
        return(S_dev_missingSup);
    }
    if (pdset->init_record) {
        if ((status=(*pdset->init_record)(pepid))) return(status);
    }
    return(0);
}

static long process(epidRecord *pepid)
{
    struct epidDSET *pdset = (struct epidDSET *)(pepid->dset);
    long  status;
    int pact=pepid->pact;

    if (!pact) { /* If this is not a callback from device support */
        /* fetch the setpoint */
        if(pepid->smsl == menuOmslclosed_loop){
            status = dbGetLink(&(pepid->stpl),DBR_DOUBLE, &(pepid->val),0,0);
            if (RTN_SUCCESS(status)) pepid->udf=FALSE;
        }
        if (pepid->udf == TRUE ) {
#if LT_EPICSBASE(3,15,0,2)
            recGblSetSevr(pepid,UDF_ALARM,INVALID_ALARM);
#else
            recGblSetSevr(pepid,UDF_ALARM,pepid->udfs);
#endif
            return(0);
        }
    }

    status = (*pdset->do_pid)(pepid);
    /* See if device support set pact=true, meaning  it will call us back */
    if (!pact && pepid->pact) return(0);
    pepid->pact = TRUE;
    recGblGetTimeStamp(pepid);
    checkAlarms(pepid);
    monitor(pepid);
    recGblFwdLink(pepid);
    pepid->pact=FALSE;
    return(status);
}

static long get_units(struct dbAddr *paddr, char *units)
{
    struct epidRecord   *pepid=(struct epidRecord *)paddr->precord;

    strncpy(units,pepid->egu,DB_UNITS_SIZE);
    return(0);
}

static long get_precision(struct dbAddr *paddr, long *precision)
{
    struct epidRecord   *pepid=(struct epidRecord *)paddr->precord;
    int fieldIndex = dbGetFieldIndex(paddr);

    *precision = pepid->prec;
    if (fieldIndex == epidRecordVAL
    ||  fieldIndex == epidRecordCVAL) return(0);
    recGblGetPrec(paddr,precision);
    return(0);
}


static long get_graphic_double(struct dbAddr *paddr, struct dbr_grDouble *pgd)
{
    struct epidRecord   *pepid=(struct epidRecord *)paddr->precord;
    int fieldIndex = dbGetFieldIndex(paddr);

    if (
       fieldIndex == epidRecordVAL
    || fieldIndex == epidRecordHIHI
    || fieldIndex == epidRecordHIGH
    || fieldIndex == epidRecordLOW
    || fieldIndex == epidRecordLOLO
    || fieldIndex == epidRecordCVAL){
        pgd->upper_disp_limit = pepid->hopr;
        pgd->lower_disp_limit = pepid->lopr;
    } else if (
       fieldIndex == epidRecordOVAL
    || fieldIndex == epidRecordP
    || fieldIndex == epidRecordI
    || fieldIndex == epidRecordD) {
        pgd->upper_disp_limit = pepid->drvh;
        pgd->lower_disp_limit = pepid->drvl;
    } else recGblGetGraphicDouble(paddr,pgd);
    return(0);
}

static long get_control_double(struct dbAddr *paddr, 
                               struct dbr_ctrlDouble *pcd)
{
    epidRecord   *pepid=(epidRecord *)paddr->precord;
    int fieldIndex = dbGetFieldIndex(paddr);

    if (
       fieldIndex == epidRecordVAL
    || fieldIndex == epidRecordHIHI
    || fieldIndex == epidRecordHIGH
    || fieldIndex == epidRecordLOW
    || fieldIndex == epidRecordLOLO
    || fieldIndex == epidRecordCVAL){
        pcd->upper_ctrl_limit = pepid->hopr;
        pcd->lower_ctrl_limit = pepid->lopr;
    } else if (
       fieldIndex == epidRecordOVAL
    || fieldIndex == epidRecordP
    || fieldIndex == epidRecordI
    || fieldIndex == epidRecordD) {
        pcd->upper_ctrl_limit = pepid->drvh;
        pcd->lower_ctrl_limit = pepid->drvl;
    } else recGblGetControlDouble(paddr,pcd);
    return(0);
}

static long get_alarm_double(struct dbAddr *paddr, struct dbr_alDouble *pad)
{
    struct epidRecord   *pepid=(struct epidRecord *)paddr->precord;
    int fieldIndex = dbGetFieldIndex(paddr);

    if(fieldIndex == epidRecordVAL){
         pad->upper_alarm_limit = pepid->hihi;
         pad->upper_warning_limit = pepid->high;
         pad->lower_warning_limit = pepid->low;
         pad->lower_alarm_limit = pepid->lolo;
    } else recGblGetAlarmDouble(paddr,pad);
    return(0);
}

static void checkAlarms(epidRecord *pepid)
{
    double      val;
    double      hyst, lalm, hihi, high, low, lolo;
    unsigned short  hhsv, llsv, hsv, lsv;

    if(pepid->udf == TRUE ){
        recGblSetSevr(pepid,UDF_ALARM,INVALID_ALARM);
        return;
    }
    hihi = pepid->hihi; lolo = pepid->lolo; high = pepid->high; low = pepid->low;
    hhsv = pepid->hhsv; llsv = pepid->llsv; hsv = pepid->hsv; lsv = pepid->lsv;
    val = pepid->val; hyst = pepid->hyst; lalm = pepid->lalm;

    /* alarm condition hihi */
    if (hhsv && (val >= hihi || ((lalm==hihi) && (val >= hihi-hyst)))){
            if (recGblSetSevr(pepid,HIHI_ALARM,pepid->hhsv)) pepid->lalm = hihi;
        return;
    }

    /* alarm condition lolo */
    if (llsv && (val <= lolo || ((lalm==lolo) && (val <= lolo+hyst)))){
            if (recGblSetSevr(pepid,LOLO_ALARM,pepid->llsv)) pepid->lalm = lolo;
        return;
    }

    /* alarm condition high */
    if (hsv && (val >= high || ((lalm==high) && (val >= high-hyst)))){
            if (recGblSetSevr(pepid,HIGH_ALARM,pepid->hsv)) pepid->lalm = high;
        return;
    }

    /* alarm condition low */
    if (lsv && (val <= low || ((lalm==low) && (val <= low+hyst)))){
            if (recGblSetSevr(pepid,LOW_ALARM,pepid->lsv)) pepid->lalm = low;
        return;
    }

    /* we get here only if val is out of alarm by at least hyst */
    pepid->lalm = val;
    return;
}

static void monitor(epidRecord *pepid)
{
    unsigned short  monitor_mask;
    double          delta;

    monitor_mask = recGblResetAlarms(pepid);
    /* check for value change */
    delta = pepid->mlst - pepid->val;
    if(delta<0.0) delta = -delta;
    if (delta > pepid->mdel) {
        /* post events for value change */
        monitor_mask |= DBE_VALUE;
        /* update last value monitored */
        pepid->mlst = pepid->val;
    }
    /* check for archive change */
    delta = pepid->alst - pepid->val;
    if(delta<0.0) delta = -delta;
    if (delta > pepid->adel) {
        /* post events on value field for archive change */
        monitor_mask |= DBE_LOG;
        /* update last archive value monitored */
        pepid->alst = pepid->val;
    }

    /* send out all monitors  for value changes*/
    if (monitor_mask){
        db_post_events(pepid,&pepid->val,monitor_mask);
    }
    /* Send monitors on following fields if they have changed */
    monitor_mask = DBE_LOG|DBE_VALUE;
    if (pepid->ovlp != pepid->oval) {
       db_post_events(pepid,&pepid->oval,monitor_mask);
       pepid->ovlp = pepid->oval;
    }
    if (pepid->pp != pepid->p) {
       db_post_events(pepid,&pepid->p,monitor_mask);
       pepid->pp = pepid->p;
    }
    if (pepid->ip != pepid->i) {
       db_post_events(pepid,&pepid->i,monitor_mask);
       pepid->ip = pepid->i;
    }
    if (pepid->dp != pepid->d) {
       db_post_events(pepid,&pepid->d,monitor_mask);
       pepid->dp = pepid->d;
    }
    if (epicsTimeNotEqual(&pepid->ctp, &pepid->ct)) {
       db_post_events(pepid,&pepid->ct,monitor_mask);
       pepid->ctp = pepid->ct;
    }
    if (pepid->dtp != pepid->dt) {
       db_post_events(pepid,&pepid->dt,monitor_mask);
       pepid->dtp = pepid->dt;
    }
    if (pepid->errp != pepid->err) {
       db_post_events(pepid,&pepid->err,monitor_mask);
       pepid->errp = pepid->err;
    }
    if (pepid->cvlp != pepid->cval) {
       db_post_events(pepid,&pepid->cval,monitor_mask);
       pepid->cvlp = pepid->cval;
    }
    return;
}
