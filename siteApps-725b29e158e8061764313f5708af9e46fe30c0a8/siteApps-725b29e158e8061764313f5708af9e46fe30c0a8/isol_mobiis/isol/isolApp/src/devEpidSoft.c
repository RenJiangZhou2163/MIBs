/* devEpidSoft.c */

/* devEpidSoft.c - "Soft" Device Support Routines for epid records */
/*
 *      Original Author: Bob Dalesio
 *      Current Author:  Mark Rivers
 *
 * Modification Log:
 * -----------------
 * 11-10-99 MLR    Split this code into a seperate device support
                   module, so that the epid record can be used to
                   communicate with hardware or fast software for
                   higher performance applications.
    05/03/00  MLR  Added more sanity checks to integral term:
                   If KI is 0. then set I to DRVL if KP is greater than 0,
                   set I to DRVH is KP is less than 0.
                   If feedback is off don't change integral term.
    06/13/00  MLR  Added another refinement to integral term.  When feedback
                   is changed from OFF to ON set the integral term to the
                   current value of the output PV.
    05/19/01  MLR  Added new algorithm, MaxMin, selected by the new record field
                   FMOD.  MaxMin tries to maximize or minimize the control variable
                   using, at present an extremely simple algorithm.  It simply does
                   M(n) = M(n-1) - KP * (E(n) - E(n-1))/dT(n), where E(n) is defined
                   as the readback value itself.  This algorithm will seek a maximum
                   if KP is positive and a minimum if KP is negative.
    06/11/03  MLR  Converted to R3.14.2, OSI.
    06/11/03  MLR  Converted to R3.14.2, OSI.
 */


/* A discrete form of the PID algorithm is as follows
 * M(n) = KP*(E(n) + KI*SUMi(E(i)*dT(i))
 *         + KD*(E(n) -E(n-1)))/dT(n)
 * where
 *  M(n)    Value of manipulated variable at nth sampling instant
 *  KP,KI,KD Proportional, Integral, and Differential Gains
 *      NOTE: KI is inverse of normal definition of KI
 *  E(n)    Error at nth sampling instant
 *  SUMi    Sum from i=0 to i=n
 *  dT(n)   Time difference between n-1 and n
 */

#include    <alarm.h>
#include    <dbDefs.h>
#include    <dbAccess.h>
#include    <dbEvent.h>
#include    <dbFldTypes.h>
#include    <errMdef.h>
#include    <errlog.h>
#include    <recSup.h>
#include    <devSup.h>
#include    <epicsTime.h>
#include    <recGbl.h>
#include    "epidRecord.h"
#include    <epicsExport.h>

/* Create DSET */
static long init_record();
static long do_pid();
typedef struct { /* epid DSET */
    long            number;
    DEVSUPFUN       dev_report;
    DEVSUPFUN       init;
    DEVSUPFUN       init_record;
    DEVSUPFUN       get_ioint_info;
    DEVSUPFUN       do_pid;
} EPID_SOFT_DSET;

EPID_SOFT_DSET devEpidSoft = {
    5,
    NULL,
    NULL,
    init_record,
    NULL,
    do_pid
};
epicsExportAddress(dset, devEpidSoft);

static long init_record(epidRecord *pepid)
{
    /* For now we do nothing in this function */
    return(0);
}

static long do_pid(epidRecord *pepid)
{
    epicsTimeStamp  ctp;    /*previous time */
    epicsTimeStamp  ct;     /*current time       */
    double          cval;   /*actual value      */
    double          pcval;  /*previous value of cval */
    double          setp;   /*setpoint          */
    double          dt;     /*delta time (seconds)  */
    double       kp,ki,kd;  /*gains        */
    double          di;     /*change in integral term */
    double          e=0.;   /*error         */
    double          ep;     /*previous error    */
    double          de;     /*change in error   */
    double          oval;   /*new value of manip variable */
    double          p;      /*proportional contribution*/
    double          i;      /*integral contribution*/
    double          d;      /*derivative contribution*/
    double          sign;

    pcval = pepid->cval;
    
    /* fetch the controlled value */
    if (pepid->inp.type == CONSTANT) { /* nothing to control*/
        if (recGblSetSevr(pepid,SOFT_ALARM,INVALID_ALARM)) return(0);
    }
    if (dbGetLink(&pepid->inp,DBR_DOUBLE,&pepid->cval,0,0)) {
        recGblSetSevr(pepid,LINK_ALARM,INVALID_ALARM);
        return(0);
    }
    
    setp = pepid->val;
    cval = pepid->cval;  /* New value of cval */
    
    /* compute time difference and make sure it is large enough*/
    ctp = pepid->ct;
    epicsTimeGetCurrent(&ct);
    dt = epicsTimeDiffInSeconds(&ct, &ctp);
    if (dt<pepid->mdt) return(1);
    
    /* get the rest of values needed */
    kp = pepid->kp;
    ki = pepid->ki;
    kd = pepid->kd;
    ep = pepid->err;
    oval = pepid->oval;
    p = pepid->p;
    i = pepid->i;
    d = pepid->d;

    switch (pepid->fmod) {
        case epidFeedbackMode_PID:
            e = setp - cval;
            de = e - ep;
            p = kp*e;
            /* Sanity checks on integral term:
             * 1) Don't increase I if output >= highLimit
             * 2) Don't decrease I if output <= lowLimit
             * 3) Don't change I if feedback is off
             * 4) Limit the integral term to be in the range betweem DRLV and DRVH
             * 5) If KI is zero then set the sum to DRVL (if KI is positive), or
             *    DRVH (if KP is negative) to allow easily turning off the 
             *    integral term for PID tuning.
             */
            di = kp*ki*e*dt;
            if (pepid->fbon) {
                if (!pepid->fbop) {
                    /* Feedback just made transition from off to on.  Set the integral
                       term to the current value of the controlled variable */
                    if (pepid->outl.type != CONSTANT) {
                        if (dbGetLink(&pepid->outl,DBR_DOUBLE,&i,0,0)) {
                            recGblSetSevr(pepid,LINK_ALARM,INVALID_ALARM);
                        }
                    }
                } else {
                    if (((oval > pepid->drvl) && (oval < pepid->drvh)) ||
                        ((oval >= pepid->drvh) && ( di < 0.)) ||
                        ((oval <= pepid->drvl)  && ( di > 0.))) {
                        i = i + di;
                        if (i < pepid->drvl) i = pepid->drvl;
                        if (i > pepid->drvh) i = pepid->drvh;
                    }
                }
            }
            if (ki == 0) i=0.;
            if(dt>0.0) d = kp*kd*(de/dt); else d = 0.0;
            oval = p + i + d;
            break;

        case epidFeedbackMode_MaxMin:
            /* For now we don't scale to dt, worry about that later */
            if (pepid->fbon) {
                if (!pepid->fbop) {
                    /* Feedback just made transition from off to on.  Set the output
                       to the current value of the controlled variable */
                    if (pepid->outl.type != CONSTANT) {
                        if (dbGetLink(&pepid->outl,DBR_DOUBLE,&oval,0,0)) {
                            recGblSetSevr(pepid,LINK_ALARM,INVALID_ALARM);
                        }
                    }
                } else {
                    e = cval - pcval;
                    if (d > 0.) sign=1.; else sign=-1.;
                    if ((kp > 0.) && (e < 0.)) sign = -sign;
                    if ((kp < 0.) && (e > 0.)) sign = -sign;
                    d = kp * sign;
                    oval = pepid->oval + d;
                }
            }
            break;
          
        default:
            epicsPrintf("Invalid feedback mode in EPID\n");
            break;
    }
          
          
    /* Limit output to range from DRLV to DRVH */
    if (oval > pepid->drvh) oval = pepid->drvh;
    if (oval < pepid->drvl) oval = pepid->drvl;
    /* update record*/
    pepid->ct  = ct;
    pepid->dt   = dt;
    pepid->err  = e;
    pepid->cval  = cval;
    pepid->oval  = oval;
    pepid->p  = p;
    pepid->i  = i;
    pepid->d  = d;
    pepid->fbop = pepid->fbon;
    
    /* If feedback is on, and output link is a PV_LINK then write the 
     * output link */
    if (pepid->fbon && (pepid->outl.type != CONSTANT)) {
        if (dbPutLink(&pepid->outl,DBR_DOUBLE, &pepid->oval,1)) {
            recGblSetSevr(pepid,LINK_ALARM,INVALID_ALARM);
        }
    } 
    return(0);
}
