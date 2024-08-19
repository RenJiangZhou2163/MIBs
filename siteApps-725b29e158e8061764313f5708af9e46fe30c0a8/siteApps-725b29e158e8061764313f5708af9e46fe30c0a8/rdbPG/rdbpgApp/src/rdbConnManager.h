#ifndef __RDB_CONN_MANAGER_H
#define __RDB_CONN_MANAGER_H

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

long read_init_record(void *);
long write_init_record(void *);
long read_rdb(void*);
long write_rdb(void*);
long getIoIntInfo(int cmd, dbCommon *pr, IOSCANPVT *iopvt);
//long int (*)(int, dbCommon*, io_scan_list**);
static void devRDBScanThread(void);


epicsShareFunc int drvRDBConnInit(const char *dbname, const char *user, const char *password, 
		const char *hostaddr, const char *port );

typedef struct devRdbpostgreSQLSoft{
	long		number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	//DEVSUPFUN	get_ioint_info;
	long  (*get_ioint_info) (int, dbCommon*, IOSCANPVT*);
	DEVSUPFUN	read_rdb;
}devRdbpostgreSQLSoft;


using namespace std;
using namespace pqxx;

class RDBManager
{

public:
	RDBManager();
	~RDBManager();

	connection * Connect(const string info);
	connection * Connect(const char *dbname, const char *user, const char *password,
			const char *hostaddr, const char* port);
	float ReadValue(const char *table, const char *field);
	int WriteValue(const void *precord);
	//float ReadValue();
private:
	connection *mpConn;
	typedef vector<connection *> VecConn;
	VecConn mVecConn;

	string mtable;
	string mfield;

private:
	int updateValue (const void *precord);
};

#endif // __RDB_CONN_MANAGER_H

#ifdef __cplusplus
}
#endif

