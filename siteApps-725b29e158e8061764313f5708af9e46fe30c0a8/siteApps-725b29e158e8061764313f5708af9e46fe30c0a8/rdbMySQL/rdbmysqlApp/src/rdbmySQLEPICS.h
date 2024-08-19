#ifndef __RDB_MYSQL_H
#define __RDB_MYSQL_H

#include <vector>
#include <stdlib.h>
#include <pqxx/pqxx>
#include "alarm.h"
#include "cvtTable.h"
#include "dbDefs.h"
#include "dbAccess.h"
#include "recGbl.h"
#include "recSup.h"
#include "devSup.h"
#include "link.h"
#include "menuScan.h"
#include "rdbpostgreSQLRecord.h"
#include "epicsExport.h"
#include "shareLib.h"
#include "dbCommon.h"
#include "dbScan.h"
#include "callback.h"
#include "cantProceed.h"
#include "epicsStdio.h"
#include "epicsMutex.h"
#include "epicsEvent.h"
#include "epicsThread.h"
#include "iocsh.h"


#ifdef __cplusplus
extern "C" {
#endif

static long init_record(void *precord,int pass);
static long process(void *precord);
static long get_units(DBADDR *paddr, char *units);
static long get_precision(DBADDR *paddr, long *precision);
static long get_graphic_double(DBADDR *paddr,struct dbr_grDouble *pgd);
static long get_control_double(DBADDR *paddr,struct dbr_ctrlDouble *pcd);
static long get_alarm_double(DBADDR *paddr,struct dbr_alDouble *pad);

static void checkAlarms(rdbmySQLRecord *prec);
static void monitor(rdbmySQLRecord *prec);

#ifdef __cplusplus
}
#endif

#endif // __RDB_MYSQL_H

