#include <string.h>

#include <devSup.h>
#include <stringinRecord.h>

//#include "versionID.h"

#define VERSIONID "3.14.12.4"

static
long init_record(stringinRecord *prec)
{
    return 0;
}

static
long read_ver(stringinRecord *prec)
{
    strncpy(prec->val, VERSIONID, sizeof(prec->val));
    prec->val[sizeof(prec->val)-1] = '\0';
    return 0;
}

struct sidset {
  dset common;
  DEVSUPFUN read;
} devSIVCSRev = {
  {5, NULL, NULL,
   (DEVSUPFUN)&init_record,
   NULL
  },
  (DEVSUPFUN)&read_ver
};

#include <epicsExport.h>

epicsExportAddress(dset, devSIVCSRev);
