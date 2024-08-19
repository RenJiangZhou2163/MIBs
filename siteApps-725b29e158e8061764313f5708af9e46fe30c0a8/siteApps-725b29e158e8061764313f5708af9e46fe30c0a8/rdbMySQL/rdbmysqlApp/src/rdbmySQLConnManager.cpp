#include <iostream>
#include <sstream>
#include <cstring>
#include "rdbmySQLConnManager.h"
#include "longinRecord.h"

typedef struct devMySQLPvt {
	ELLNODE		devRDBNode;
	IOSCANPVT	ioScanPvt;
	dbCommon	*prec;
	epicsMutexId mutexId;
} devMySQLPvt;

//drvMySQLConnInit IOC Shell command registration
static const iocshArg drvMySQLConnInitArg0 = {"dbname", iocshArgString};
static const iocshArg drvMySQLConnInitArg1 = {"user", iocshArgString};
static const iocshArg drvMySQLConnInitArg2 = {"password", iocshArgString};
static const iocshArg drvMySQLConnInitArg3 = {"hostaddr", iocshArgString};
static const iocshArg drvMySQLConnInitArg4 = {"port", iocshArgString};
static const iocshArg *drvMySQLConnInitArgs[] = {
			&drvMySQLConnInitArg0, &drvMySQLConnInitArg1, &drvMySQLConnInitArg2, &drvMySQLConnInitArg3,
			&drvMySQLConnInitArg4 };
static const iocshFuncDef drvMySQLConnInitFuncDef = 
	{ "drvMySQLConnInit", 5, drvMySQLConnInitArgs };

static void drvMySQLConnInitCallFunc(const iocshArgBuf *args)
{
	drvMySQLConnInit(args[0].sval,args[1].sval,args[2].sval,args[3].sval,args[4].sval);
};

static void drvMySQLConnInitRegisterCommands(void)
{
	static int firstTime = 1;
	if(firstTime)
	{
		iocshRegister(&drvMySQLConnInitFuncDef, drvMySQLConnInitCallFunc);
		firstTime = 0;
	};
}
epicsExportRegistrar(drvMySQLConnInitRegisterCommands);

static MySQLConnManager mRdbManager;
static ELLLIST    devRDBList;

//drvMySQLConnInit
epicsShareFunc int drvMySQLConnInit(const char *dbname, const char *user, const char *password, 
		const char *hostaddr, const char *port )
{
	mRdbManager.Connect(dbname, user, password, hostaddr, port);
	ellInit(&devRDBList);

    epicsThreadCreate("drvMySQLConnInit", epicsThreadPriorityHigh, epicsThreadGetStackSize(epicsThreadStackSmall),
                     (EPICSTHREADFUNC)devMySQLScanThread,NULL);
	return 0;
};

static void devMySQLScanThread(void)
{
	ELLLIST *pdevRDBList = &devRDBList;
	devMySQLPvt *pRDBPvt;

	while(!pdevRDBList->count) {
		epicsThreadSleep(0.5);
	}

    while(TRUE) 
	{
        pRDBPvt = (devMySQLPvt*) ellFirst(pdevRDBList);
        do {
            epicsMutexLock(pRDBPvt->mutexId);
			//critical section
            epicsMutexUnlock(pRDBPvt->mutexId);
			scanIoRequest(pRDBPvt->ioScanPvt);
        } while( (pRDBPvt = (devMySQLPvt*) ellNext(&pRDBPvt->devRDBNode)) );
        epicsThreadSleep(0.1);
    }
	
}

int RdbmySQLDebug = 0;
epicsExportAddress(int, RdbmySQLDebug);

devRdbmySQLSoft rdbReadmySQL={ 5, NULL, NULL, read_init_record, getIoIntInfo, read_rdb };
devRdbmySQLSoft rdbWritemySQL={ 5, NULL, NULL, write_init_record, getIoIntInfo, write_rdb };

epicsExportAddress(dset,rdbReadmySQL);
epicsExportAddress(dset,rdbWritemySQL);


long write_init_record(void *precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;
	devRdbmySQLSoft *pdset = (devRdbmySQLSoft*)prdbmySQL->dset;

    if(recGblInitConstantLink(&prdbmySQL->inp,DBF_DOUBLE,&prdbmySQL->val))
         prdbmySQL->udf = FALSE;

	devMySQLPvt *pdev = (devMySQLPvt *)malloc(sizeof (devMySQLPvt));
	if(pdev == NULL) return -1;

	pdev->mutexId = epicsMutexCreate();
	scanIoInit(&pdev->ioScanPvt);
	prdbmySQL->dpvt = pdev;

	ellAdd(&devRDBList, &(((devMySQLPvt*)prdbmySQL->dpvt)->devRDBNode) );

	return(0);
}
long getIoIntInfo(int cmd, dbCommon *pr, IOSCANPVT *iopvt)
{
	devMySQLPvt *pdev = (devMySQLPvt*)pr ->dpvt; 
	*iopvt = pdev->ioScanPvt;
    return 0;
}

long read_init_record(void	*precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;
	devRdbmySQLSoft *pdset = (devRdbmySQLSoft*)prdbmySQL->dset;

    if(recGblInitConstantLink(&prdbmySQL->inp,DBF_DOUBLE,&prdbmySQL->val))
         prdbmySQL->udf = FALSE;

	devMySQLPvt *pdev = (devMySQLPvt *)malloc(sizeof (devMySQLPvt));
	if(pdev == NULL) return -1;

	pdev->mutexId = epicsMutexCreate();
	scanIoInit(&pdev->ioScanPvt);
	prdbmySQL->dpvt = pdev;
	pdev -> prec = (dbCommon*)precord;

	ellAdd(&devRDBList, &(((devMySQLPvt*)prdbmySQL->dpvt)->devRDBNode) );

    return(0);
}

long read_rdb(void	*precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;
    long status;
	//epicsTimeStamp currTime;
	//epicsTimeGetCurrent (&currTime);
	//if(RdbmySQLDebug)
	//	printf("Scan(%d)\n",prdbmySQL->scan);

    status = dbGetLink(&(prdbmySQL->inp),DBF_DOUBLE, &(prdbmySQL->val),0,0);
    /*If return was succesful then set undefined false*/
    if(!status) prdbmySQL->udf = FALSE;

	//prdbmySQL->val = mRdbManager.ReadValue(prdbmySQL->tabl,prdbmySQL->fild);
	prdbmySQL->val = mRdbManager.ReadValue(prdbmySQL);
	prdbmySQL->oval = prdbmySQL->val;

    return(0);
}

long write_rdb(void	*precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;
    long status;

	if(RdbmySQLDebug)
		printf("Scan(%d)\n",prdbmySQL->scan);

    status = dbGetLink(&(prdbmySQL->inp),DBF_DOUBLE, &(prdbmySQL->val),0,0);

    /*If return was succesful then set undefined false*/
    if(!status) prdbmySQL->udf = FALSE;

	if(prdbmySQL->oval!=prdbmySQL->val)
		mRdbManager.WriteValue(prdbmySQL);
#if 0
	switch(rdbpostgreSQL->qry)
	{
		case queryUpdate:
			mRdbManager.WriteValue(prdbmySQL->tabl,prdbmySQL->fild);
			break;
		case queryInsert:
			break;
	}
#endif

    return(0);
}

template <typename T> string valtostr(const T& t) { 
	ostringstream os; 
	os<<t; 
	return os.str(); 
} 

int MySQLConnManager::Version()
{
	printf("MySQL client version: %s\n", mysql_get_client_info());
	return 0;
}

MySQLConnManager::MySQLConnManager()
{
	initialize();
}

MySQLConnManager::~MySQLConnManager()
{
	if(conn != 0)
		mysql_close(conn);

	if (mutex) {
		epicsMutexDestroy(mutex);
		mutex = 0;
	}
}

int MySQLConnManager::initialize()
{
	conn = mysql_init(NULL);
	if (conn == 0)
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		return (-1);
	}

	mutex    = epicsMutexCreate();

#if 0
	if (mysql_query(conn, "CREATE DATABASE testdb")) 
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		mysql_close(conn);
		return (-1);
	}
	mysql_close(conn);
#endif
	return (-1);
}

int MySQLConnManager::Connect(const char *dbname, const char *user, const char *password,
			const char *hostaddr, const char* port)
{
	//connection *mpConn = 0;
	//if (mysql_real_connect(conn, "localhost", "root", "qwer1234", NULL, 0, NULL, 0) == NULL) 
	if (mysql_real_connect(conn, hostaddr, user, password, dbname, atoi(port), NULL, 0) == NULL) 
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		mysql_close(conn);
		return (-1);
	}  

	my_bool reconnect = 0;
	mysql_options(conn, MYSQL_OPT_RECONNECT, &reconnect);

	return (0);
}

int MySQLConnManager::ReadValue(const void *precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;
	//string sql = string("select ") + string(field) + string (" from ") + string(table);
	string sql = prdbmySQL->qry + string(";");

	if(RdbmySQLDebug)
	{
		//printf("Queray:%s\n", sql.c_str());
		printf("Connection to MySQL:%d, MySQL Conn:%p\n", mysql_ping(conn), conn);
	};

	epicsMutexLock(mutex);
	if(mysql_query(conn, sql.c_str()))
	{
		fprintf(stderr, "Query Error:%s\n", mysql_error(conn));
		return (-1);
	};

	MYSQL_RES *res = mysql_store_result(conn);

	if(res==0)
	{
		fprintf(stderr, "Query Result - Error:%s\n", mysql_error(conn));
		return (-1);
	};

	epicsMutexUnlock(mutex);

	int fields = mysql_num_fields(res);
	//DBADDR *pdbAddrA = dbGetPdbAddrFromLink(&prdbmySQL->inpa);

	MYSQL_ROW row;

	DBADDR *pdbAddr = 0;
	while((row=mysql_fetch_row(res)))
	{
		for(int i = 0; i < fields; i++)
		{
			switch(i)
			{
				case SQL_FILD:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inp);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDA:
					{
					//DBADDR *pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpa);
					//dbCommon *pCommon = (dbCommon*)pdbAddr->precord;
					//printf("%s\n", pCommon->rdes->name);
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpa);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDB:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpb);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDC:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpc);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDD:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpd);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDE:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpe);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDF:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpf);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDG:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpg);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDH:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inph);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDI:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpi);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDJ:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpj);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDK:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpk);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				case SQL_FILDL:
					{
						pdbAddr = dbGetPdbAddrFromLink(&prdbmySQL->inpl);
						if(!pdbAddr) break;
						linkUpdate(pdbAddr, row[i]);
					}
					break;
				default:
					break;
			};
		};
	};

	mysql_free_result(res);

	return (0);
}

int MySQLConnManager::linkUpdate(const DBADDR *pdbAddr, const char *strvalue)
{
	dbCommon *pCommon = (dbCommon*)pdbAddr->precord;

	if(RdbmySQLDebug)
		printf("%s\n", pCommon->rdes->name);

	string record = string(pCommon->rdes->name);
	if(record.compare("longin") == 0 || record.compare("longout") == 0 || record.compare("bi") == 0 || record.compare("bo") == 0)
	{
		long *pfieldLink =  (long*)pdbAddr->pfield;
		pfieldLink[0] = strtol(strvalue, 0, 10);
	} 
	else if(record.compare("ai") == 0 || record.compare("ao") == 0)
	{
		double *pfieldLink =  (double*)pdbAddr->pfield;
		pfieldLink[0] = strtod(strvalue, 0);
	}
	else if(record.compare("stringin") == 0 || record.compare("stringout") == 0)
	{
		char *pfieldLink =  (char*)pdbAddr->pfield;
		strcpy(pfieldLink, strvalue);
	}

	dbProcess(pCommon);
	return 0;
};

int MySQLConnManager::ReadValue(const char *table, const char *field)
{
	//string sql = "select data_float from epics_table where id=1";
	//string sql = string("select ") + string(field) + string (" from ") + string(table) + string(" where id = 1");
	string sql = string("select data_int, ") + string(field) + string (" from ") + string(table);

	printf("QStr:%s\n", sql.c_str());

	if(RdbmySQLDebug)
		printf("Connection to MySQL:%d, MySQL Conn:%p\n", mysql_ping(conn), conn);

	epicsMutexLock(mutex);
	if(mysql_query(conn, sql.c_str()))
	{
		fprintf(stderr, "Query Error:%s\n", mysql_error(conn));
		return (-1);
	};

	MYSQL_RES *res = mysql_store_result(conn);

	if(res==0)
	{
		fprintf(stderr, "Query Result - Error:%s\n", mysql_error(conn));
		return (-1);
	};

	epicsMutexUnlock(mutex);

	int fields = mysql_num_fields(res);

	MYSQL_ROW row;

	while((row=mysql_fetch_row(res)))
	{
		for(int i = 0; i < fields; i++)
		{
			//resquery = strtof(row[i], 0);
			printf("SData[%d]:%s\n",i, row[i]);

		};
	};

	mysql_free_result(res);

	return (0);
}

int MySQLConnManager::WriteValue(const void *precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;

#if 0
	switch(prdbmySQL->qry)
	{
		case queryUpdate:
			//updateValue(precord);
			break;
		case queryInsert:
			//insertValue(prdbpostgreSQL->tabl,prdbpostgreSQL->fild);
			break;
	};
#endif

	return(0);
}

int MySQLConnManager::updateValue(const void *precord)
{
	rdbmySQLRecord	*prdbmySQL = (rdbmySQLRecord*)precord;

	string field = string (prdbmySQL->fild);
	string table = string (prdbmySQL->tabl);
	string sval = valtostr(prdbmySQL->val);
	//string sql = string("update ") + table + string (" set ") + field + string("=")+ sval+ string(" where id = 1");
	string sql = string("update ") + table + string (" set ") + field;

	printf("UQStr:%s\n", sql.c_str());

	epicsMutexLock(mutex);
	if(mysql_query(conn, sql.c_str()))
	{
		fprintf(stderr, "%s\n", mysql_error(conn));
		return (-1);
	}
	epicsMutexUnlock(mutex);

	return (0);
};

