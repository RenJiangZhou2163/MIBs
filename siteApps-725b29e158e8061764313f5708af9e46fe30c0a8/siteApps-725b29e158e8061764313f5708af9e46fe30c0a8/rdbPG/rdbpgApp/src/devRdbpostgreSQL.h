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

#ifdef __cplusplus
extern "C" {
#endif

/*Create the dset for devRdbpostgreSQLSoft */
//long init_record();
//long read_rdb();
//long write_rdb();

long init_record(void *);
long read_rdb(void*);
long write_rdb(void*);

typedef struct devRdbpostgreSQLSoft{
	long		number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	read_rdb;
}devRdbpostgreSQLSoft;

#ifdef __cplusplus
}
#endif

