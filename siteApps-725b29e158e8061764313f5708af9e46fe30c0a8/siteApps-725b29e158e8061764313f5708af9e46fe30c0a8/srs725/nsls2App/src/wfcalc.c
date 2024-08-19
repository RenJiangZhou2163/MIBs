
#include <stdlib.h>
#include <string.h>

#include <errlog.h>

#include <menuFtype.h>
#include <aSubRecord.h>
#include <recGbl.h>
#include <alarm.h>

#include <registryFunction.h>
#include <postfix.h>

#include <epicsMath.h>
#include <epicsTypes.h>

#define PI 3.14159265359

#define MIN(A,B) ((A)<(B) ? (A) : (B))
#define MAX(A,B) ((A)>(B) ? (A) : (B))

/* Element wise waveform calculator
 *
 * record(stringout, "$(N):expr") {
 *  field(VAL, "C*sin(2*A+B)")
 *  field(FLNK, "$(N)")
 * }
 * record(aSub, "$(N)") {
 *  field(INAM, "WG Init")
 *  field(SNAM, "WG Gen")
 *  field(FTA , "STRING")
 *  field(FTB , "DOUBLE")
 *  field(FTC , "DOUBLE")
 *  field(FTVB, "DOUBLE")
 *  field(NOC , "128")
 *  field(NOVB, "128")
 *  field(INPA, "$(N):expr NPP")
 *  field(INPB, "someacalar")
 *  field(INPC, "somearray")
 *  field(OUTB, "outarray PP")
 * }
 *
 * Each element of the output is computed from the corresponding
 * element of each input.  For arrays of a given length the last
 * value read (or 0.0 for empty arrays) is used.
 *
 * For example, B*C
 * Gives different results depending in the length of its inputs.
 *
 * B = [1,2,3]
 * C = [1,2,3]
 * OUTB = [1,4,9]
 *
 * B = [1,2,3]
 * C = [2]
 * OUTB = [2,4,6]
 *
 * B = [1,2,3]
 * C = [2,3]
 * OUTB = [2,6,9]
 *
 * Note: To support longer expressions set FTA=CHAR and NOA<=100
 */

struct calcPriv {
    char prev[MAX_INFIX_SIZE];
    char postfix[MAX_POSTFIX_SIZE];
    double stack[CALCPERFORM_NARGS];
    epicsUInt32 usein, useout; // can be used
    unsigned long ins, outs;   // will be used
    unsigned long val; // output used for the expression result

    double *curin[CALCPERFORM_NARGS],
           *lastin[CALCPERFORM_NARGS],
           *curout[CALCPERFORM_NARGS],
           *lastout[CALCPERFORM_NARGS];
};
typedef struct calcPriv calcPriv;

// must be enough bits to represent all arguments in 'usein' and 'useout'
STATIC_ASSERT(sizeof(epicsUInt32)*8 >= CALCPERFORM_NARGS);

static
long update_expr(aSubRecord* prec, calcPriv *priv)
{
    short err;
    unsigned long val;
    size_t inlen;
    if(prec->fta==menuFtypeCHAR && prec->nea<MAX_INFIX_SIZE)
        inlen=prec->nea;
    else if(prec->fta==menuFtypeCHAR)
        inlen=MAX_INFIX_SIZE-1;
    else
        inlen=strlen((char*)prec->a);

    if(strlen(priv->prev)==inlen && strncmp(priv->prev, (char*)prec->a, inlen)==0)
        return 0; /* no change */

    memcpy(priv->prev, (char*)prec->a, inlen);
    priv->prev[inlen]='\0';

    if(strlen(priv->prev)==0)
        strcpy(priv->prev, "0");

    if(postfix(priv->prev, priv->postfix, &err)) {
        (void)recGblSetSevr(prec, CALC_ALARM, INVALID_ALARM);
        errlogPrintf("%s: Expression error: %s from '%s'\n",
                     prec->name, calcErrorStr(err), priv->prev);
        return -1;
    }
    calcArgUsage(priv->postfix, &priv->ins, &priv->outs);

    priv->val = ~priv->outs;   // consider unassigned outputs
    priv->val &= priv->useout; // exclude unuseable

    val = priv->val & (priv->val-1); // clear lowest bit which is set
    priv->val = val ^ priv->val; // pick only lowest bit which is set

    return 0;
}

static
long init_waveform(aSubRecord* prec)
{
    size_t i;
    calcPriv* priv;

    if(prec->fta != menuFtypeSTRING && prec->fta!=menuFtypeCHAR) {
        errlogPrintf("%s: FTA must be STRING or CHAR\n", prec->name);
        return -1;
    }

    priv = calloc(1, sizeof(calcPriv));
    if(!priv)
        return -1;
    strcpy(priv->prev, "Something highly unlikely");

    for(i=0; i<CALCPERFORM_NARGS; i++) {
        if((&prec->fta)[i]==menuFtypeDOUBLE)
            priv->usein |= (1<<i);

        if((&prec->ftva)[i]==menuFtypeDOUBLE)
            priv->useout |= (1<<i);
    }

    if(priv->usein==0) {
        errlogPrintf("%s: No input arguments???", prec->name);
    }
    if(priv->useout==0) {
        errlogPrintf("%s: No output arguments???", prec->name);
    }

    prec->dpvt = priv;
    return 0;
}

static
long gen_waveform(aSubRecord* prec)
{
    size_t i, s;
    epicsUInt32 nelem=0, nin=0;
    calcPriv* priv=prec->dpvt;
    if(!priv) {
        errlogPrintf("%s: Not initialized\n",prec->name);
        return -1;
    }

    if(update_expr(prec, priv)) {
        return -1;
    }

    // reset stack
    memset(&priv->stack, 0, sizeof(priv->stack));

    // initialize input pointers
    for(i=0; i<CALCPERFORM_NARGS; ++i) {
        priv->curin[i]  = ((double**)&prec->a)[i];
        priv->curout[i] = ((double**)&prec->vala)[i];
        priv->lastin[i] = priv->curin[i] + (&prec->nea)[i];
        priv->lastout[i]= priv->curout[i]+ (&prec->nova)[i];

        nelem= MAX(nelem,(&prec->nova)[i]);
        nin  = MAX(nin  ,(&prec->nea)[i]);
    }

    nelem = MIN(nelem, nin);

    // A is taken by the calc expression so use it to index
    priv->curin[0] = priv->lastin[0] = 0;

    for(s=0; s<nelem; s++) {
        double val;
        // for each output sample
        
        priv->stack[0] = s;

        // update stack from inputs
        for(i=1; i<CALCPERFORM_NARGS; ++i) {
            if(!(priv->usein & (1<<i)))
                continue;
            if(priv->curin[i] >= priv->lastin[i])
                continue;

            priv->stack[i] = *(priv->curin[i])++;
        }

        // calculate
	if (calcPerform(priv->stack, &val, priv->postfix)) {
	    recGblSetSevr(prec, CALC_ALARM, INVALID_ALARM);
	} else prec->udf = isnan(prec->val);

        // update outputs from stack
        for(i=0; i<CALCPERFORM_NARGS; ++i) {
            if(!(priv->useout & (1<<i)))
                continue;
            if(priv->curout[i] >= priv->lastout[i])
                continue;

            // place the expression result or the stack value
            if(priv->val == (1<<i))
                *(priv->curout[i])++ = val;

            else
                *(priv->curout[i])++ = priv->stack[i];
        }

    }

    for(i=0; i<CALCPERFORM_NARGS; ++i) {
        if(!(priv->useout & (1<<i)))
            continue;
        (&prec->neva)[i] = MIN( nelem, (&prec->nova)[i]);
    }

    return 0;
}

/* I/Q to amplitude/phase converter
 *
 * record(aSub, "$(N)") {
 *  field(SNAM, "IQ2AP")
 *  field(FTA , "DOUBLE")
 *  field(FTB , "DOUBLE")
 *  field(FTVA ,"DOUBLE")
 *  field(FTVB ,"DOUBLE")
 *  field(NOA , "128")
 *  field(NOB , "128")
 *  field(NOVA, "128")
 *  field(NOVB, "128")
 *  field(INPA, "I")
 *  field(INPB, "Q")
 *  field(OUTA, "AMP PP")
 *  field(OUTB, "PHA PP")
 * }
 */
#define MAGIC ((void*)&convert_iq2ap)
#define BADMAGIC ((void*)&gen_waveform)

static
long convert_iq2ap(aSubRecord* prec)
{
    size_t i;
    epicsEnum16 *ft = &prec->fta,
                *ftv= &prec->ftva;
    // actual length of inputs, and max length of outputs
    epicsUInt32 lens[4] = { prec->nea, prec->neb, prec->nova, prec->novb };
    epicsUInt32 len = lens[0];

    if(prec->dpvt==BADMAGIC)
        return 1;
    if(prec->dpvt!=MAGIC) {
        // Only do type checks in not already passed
        for(i=0; i<2; i++) {
            if(ft[i]!=menuFtypeDOUBLE) {
                prec->dpvt=BADMAGIC;
                errlogPrintf("%s: FT%c must be DOUBLE\n",
                             prec->name, (int)('A'+i));
                return 1;

            } else if(ftv[i]!=menuFtypeDOUBLE) {
                prec->dpvt=BADMAGIC;
                errlogPrintf("%s: FTV%c must be DOUBLE\n",
                             prec->name, (int)('A'+i));
                return 1;

            }
        }
        prec->dpvt = MAGIC;
    }

    for(i=0; i<4; i++)
        len = MIN(len, lens[i]);

    double *I = (double*)prec->a,
           *Q = (double*)prec->b,
           *A = (double*)prec->vala,
           *P = (double*)prec->valb;

    for(i=0; i<len; i++) {
        A[i] = sqrt(I[i]*I[i] + Q[i]*Q[i]);
        P[i] = atan2(Q[i], I[i]) * 180 / PI;
    }

    prec->neva = prec->nevb = len;

    return 0;
}

/* Amplitude/phase to I/Q converter
 *
 * record(aSub, "$(N)") {
 *  field(SNAM, "AP2IQ")
 *  field(FTA , "DOUBLE")
 *  field(FTB , "DOUBLE")
 *  field(FTVA ,"DOUBLE")
 *  field(FTVB ,"DOUBLE")
 *  field(NOA , "128")
 *  field(NOB , "128")
 *  field(NOVA, "128")
 *  field(NOVB, "128")
 *  field(INPA, "AMP")
 *  field(INPB, "PHA")
 *  field(OUTA, "I PP")
 *  field(OUTB, "Q PP")
 * }
 */

static
long convert_ap2iq(aSubRecord* prec)
{
    size_t i;
    epicsEnum16 *ft = &prec->fta,
                *ftv= &prec->ftva;
    // actual length of inputs, and max length of outputs
    epicsUInt32 lens[4] = { prec->nea, prec->neb, prec->nova, prec->novb };
    epicsUInt32 len = lens[0];


    if(prec->dpvt==BADMAGIC)
        return 1;
    if(prec->dpvt!=MAGIC) {
        // Only do type checks in not already passed
        for(i=0; i<2; i++) {
            if(ft[i]!=menuFtypeDOUBLE) {
                prec->dpvt=BADMAGIC;
                errlogPrintf("%s: FT%c must be DOUBLE\n",
                             prec->name, (int)('A'+i));
                return 1;

            } else if(ftv[i]!=menuFtypeDOUBLE) {
                prec->dpvt=BADMAGIC;
                errlogPrintf("%s: FTV%c must be DOUBLE\n",
                             prec->name, (int)('A'+i));
                return 1;

            }
        }
        prec->dpvt = MAGIC;
    }

    for(i=0; i<4; i++)
        len = MIN(len, lens[i]);

    double *I = (double*)prec->vala,
           *Q = (double*)prec->valb,
           *A = (double*)prec->a,
           *P = (double*)prec->b;

    for(i=0; i<len; i++) {
        I[i] = A[i] * cos(P[i] * PI / 180.0);
        Q[i] = A[i] * sin(P[i] * PI / 180.0);
    }

    prec->neva = prec->nevb = len;

    return 0;
}

/* Waveform statistics
 *
 * Computes mean and std of the (subset of)
 * waveform Y.  The values of waveform X
 * (aka time) are used to compute the windows
 *
 * record(aSub, "$(N)") {
 *  field(SNAM, "Wf Stats")
 *  field(FTA , "DOUBLE")
 *  field(FTB , "DOUBLE")
 *  field(FTC , "DOUBLE")
 *  field(FTD , "DOUBLE")
 *  field(FTVA ,"DOUBLE")
 *  field(FTVB ,"DOUBLE")
 *  field(NOA , "128")
 *  field(NOB , "128")
 *  field(INPA, "Waveform Y")
 *  field(INPB, "Waveform X")
 *  field(INPC, "Start X") # window start
 *  field(INPD, "Width X") # window width
 *  field(OUTA, "Mean PP")
 *  field(OUTB, "Std PP")
 */

static
long wf_stats(aSubRecord* prec)
{
    size_t i, N=0;
    epicsEnum16 *ft = &prec->fta,
                *ftv= &prec->ftva;
    // actual length of inputs
    epicsUInt32 len = MIN(prec->nea, prec->neb);

    double *data = prec->a,
           *time = prec->b,
           sum   = 0.0,
           sum2  = 0.0,
           start = *(double*)prec->c,
           width = *(double*)prec->d;


    if(prec->dpvt==BADMAGIC)
        return 1;
    if(prec->dpvt!=MAGIC) {
        // Only do type checks in not already passed
        for(i=0; i<4; i++) {
            if(ft[i]!=menuFtypeDOUBLE) {
                prec->dpvt=BADMAGIC;
                errlogPrintf("%s: FT%c must be DOUBLE\n",
                             prec->name, (int)('A'+i));
                return 1;

            }
        }
        for(i=0; i<2; i++) {
            if(ftv[i]!=menuFtypeDOUBLE) {
                prec->dpvt=BADMAGIC;
                errlogPrintf("%s: FTV%c must be DOUBLE\n",
                             prec->name, (int)('A'+i));
                return 1;

            }
        }
        prec->dpvt = MAGIC;
    }

    if(len==0) {
        recGblSetSevr(prec, CALC_ALARM, INVALID_ALARM);
        return 0;
    }

    for(i=0; i<len; i++) {
        if(time[i]<start)
            continue;
        if(time[i]>=start+width)
            break;

        sum  += data[i];
        sum2 += data[i] * data[i];
        N++;
    }

    if(N==0) {
        recGblSetSevr(prec, CALC_ALARM, INVALID_ALARM);
        return 0;
    }

    sum  /= N; // <x>
    sum2 /= N; // <x^2>

    *(double*)prec->vala = sum;
    prec->neva=1;
    *(double*)prec->valb = sqrt(sum2 - sum*sum);
    prec->nevb=1;

    return 0;
}

/* Unwrap phase
 *
 * Takes a phase signal which may be wrapped around [-180, 180].
 * Unwrap for jumps where the unwrapped phase would not change
 * by more then Max Difference degrees between samples.
 *
 * record(aSub, "$(N)") {
 *  field(SNAM, "Phase Unwrap")
 *  field(FTA , "DOUBLE")
 *  field(NOA , "128")
 *  field(NOVA, "128")
 *  field(INPA, "Wrapped phase")
 *  field(INPB, "Max Difference")
 *  field(OUTA, "Unwrapped phase PP")
 */

static
long unwrap(aSubRecord* prec)
{
    size_t i;
    double *in = (double*)prec->a,
           *out= (double*)prec->vala,
           delta, thres;
    epicsUInt32 len=MIN(prec->nea, prec->nova);

    if(prec->dpvt==BADMAGIC)
        return 1;
    if(prec->dpvt!=MAGIC) {
        // Only do type checks in not already passed
        if(prec->fta!=menuFtypeDOUBLE &&
           prec->ftb!=menuFtypeDOUBLE) {
            prec->dpvt=BADMAGIC;
            errlogPrintf("%s: FTA and FTB must be DOUBLE\n",
                         prec->name);
            return 1;

        }
        if(prec->ftva!=menuFtypeDOUBLE) {
            prec->dpvt=BADMAGIC;
            errlogPrintf("%s: FTVA must be DOUBLE\n",
                         prec->name);
            return 1;

        }
        prec->dpvt = MAGIC;
    }

    if(len==0 || prec->neb==0) {
        recGblSetSevr(prec, CALC_ALARM, INVALID_ALARM);
        return 0;
    }
    thres = *(double*)prec->b;
    thres /= 2.0; // half on either side of the fold

    out[0]=in[0]; // start at same point

    for(i=1; i<len; i++) {
        delta = in[i] - in[i-1];

        // the following will only work for wrapping
        // at shallow angles

        // wrapped from positive to negative
        if(in[i-1]>(180.0-thres) && in[i]<(-180.0+thres))
            delta += 360.0;

        // wrapped from negative to positive
        else if(in[i-1]<(-180.0+thres) && in[i]>(180.0-thres))
            delta += -360.0;

        out[i] = out[i-1] + delta;
    }

    prec->neva = len;
    return 0;
}

/* Trapezoidal integration
 * record(aSub, "$(N)") {
 *  field(SNAM, "Timebase")
 *  field(FTA , "DOUBLE")
 *  field(FTB , "DOUBLE")
 *  field(FTVA , "DOUBLE")
 *  field(NOA, "128")
 *  field(NOB, "128")
 *  field(INPA, "value X")
 *  field(INPB, "value Y")
 *  field(OUTA, "integral PP")
 */
static
long trap_int(aSubRecord* prec)
{
    double *X = (double*)prec->a;
    double *Y = (double*)prec->b;
    double *result=(double*)prec->vala;
    double sum = 0.0;
    size_t N, i;
    
    N = prec->nea;
    if(N>prec->neb)
        N = prec->neb;

    for(i=0; i<N-1; i++) {
      sum += (X[i+1] - X[i]) * (Y[i+1] + Y[i]) / 2.0;
    }

    *result = sum;
    prec->neva = 1;

    return 0;
}

/* Create a linear timebase
 * record(aSub, "$(N)") {
 *  field(SNAM, "Timebase")
 *  field(FTA , "DOUBLE")
 *  field(FTB , "DOUBLE")
 *  field(FTVA , "DOUBLE")
 *  field(NOVA, "128")
 *  field(INPA, "First time")
 *  field(INPB, "Time delta")
 *  field(OUTA, "timebase PP")
 */

static
long timebase(aSubRecord* prec)
{
  size_t i;
  double T    = *(double*)prec->a;
  double Tinc = *(double*)prec->b;
  double *O   = (double*)prec->vala;

  for(i=0; i<prec->nova; i++, T+=Tinc)
    O[i] = T;

  prec->neva = prec->nova;
  return 0;
}

static registryFunctionRef asub_seq[] = {
    {"IQ2AP", (REGISTRYFUNCTION) &convert_iq2ap},
    {"AP2IQ", (REGISTRYFUNCTION) &convert_ap2iq},
    {"WG Gen", (REGISTRYFUNCTION) &gen_waveform},
    {"WG Init", (REGISTRYFUNCTION) &init_waveform},
    {"Wf Stats", (REGISTRYFUNCTION) &wf_stats},
    {"Phase Unwrap", (REGISTRYFUNCTION) &unwrap},
    {"Trap. Integrate", (REGISTRYFUNCTION) &trap_int},
    {"Timebase", (REGISTRYFUNCTION) &timebase},
};

static
void wfcalcRegister(void) {
    registryFunctionRefAdd(asub_seq, NELEMENTS(asub_seq));
}

#include <epicsExport.h>

epicsExportRegistrar(wfcalcRegister);
