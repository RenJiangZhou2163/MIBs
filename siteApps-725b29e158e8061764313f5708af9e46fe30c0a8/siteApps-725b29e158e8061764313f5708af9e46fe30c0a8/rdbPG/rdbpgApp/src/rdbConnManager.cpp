#include <iostream>
#include "rdbConnManager.h"

#if 1
typedef struct devRDBPvt {
	ELLNODE		devRDBNode;
	IOSCANPVT	ioScanPvt;
	dbCommon	*prec;
	epicsMutexId mutexId;
} devRDBPvt;
#endif

//drvRDBConnInit IOC Shell command registration
static const iocshArg drvRDBConnInitArg0 = {"dbname", iocshArgString};
static const iocshArg drvRDBConnInitArg1 = {"user", iocshArgString};
static const iocshArg drvRDBConnInitArg2 = {"password", iocshArgString};
static const iocshArg drvRDBConnInitArg3 = {"hostaddr", iocshArgString};
static const iocshArg drvRDBConnInitArg4 = {"port", iocshArgString};
static const iocshArg *drvRDBConnInitArgs[] = {
			&drvRDBConnInitArg0, &drvRDBConnInitArg1, &drvRDBConnInitArg2, &drvRDBConnInitArg3,
			&drvRDBConnInitArg4 };
static const iocshFuncDef drvRDBConnInitFuncDef = 
	{ "drvRDBConnInit", 5, drvRDBConnInitArgs };

static void drvRDBConnInitCallFunc(const iocshArgBuf *args)
{
	drvRDBConnInit(args[0].sval,args[1].sval,args[2].sval,args[3].sval,args[4].sval);
};

static void drvRDBConnInitRegisterCommands(void)
{
	static int firstTime = 1;
	if(firstTime)
	{
		iocshRegister(&drvRDBConnInitFuncDef, drvRDBConnInitCallFunc);
		firstTime = 0;
	};
}
epicsExportRegistrar(drvRDBConnInitRegisterCommands);

static RDBManager mRdbManager;
static ELLLIST    devRDBList;

//drvRDBConnInit
epicsShareFunc int drvRDBConnInit(const char *dbname, const char *user, const char *password, 
		const char *hostaddr, const char *port )
{
	mRdbManager.Connect(dbname, user, password, hostaddr, port);
	ellInit(&devRDBList);

    epicsThreadCreate("drvRDBConnInit", epicsThreadPriorityHigh, epicsThreadGetStackSize(epicsThreadStackSmall),
                     (EPICSTHREADFUNC)devRDBScanThread,NULL);
	return 0;
};

static void devRDBScanThread(void)
{
	ELLLIST *pdevRDBList = &devRDBList;
	devRDBPvt *pRDBPvt;

	while(!pdevRDBList->count) {
		epicsThreadSleep(0.5);
	}

    while(TRUE) 
	{
        pRDBPvt = (devRDBPvt*) ellFirst(pdevRDBList);
        do {
            epicsMutexLock(pRDBPvt->mutexId);
			//critical section
            epicsMutexUnlock(pRDBPvt->mutexId);
			scanIoRequest(pRDBPvt->ioScanPvt);
        } while( (pRDBPvt = (devRDBPvt*) ellNext(&pRDBPvt->devRDBNode)) );
        epicsThreadSleep(0.1);
    }
	
}

int RdbpostgreSQLDebug = 0;
epicsExportAddress(int, RdbpostgreSQLDebug);

//devRdbpostgreSQLSoft rdbReadpostgreSQL={ 5, NULL, NULL, read_init_record, NULL, read_rdb };
devRdbpostgreSQLSoft rdbReadpostgreSQL={ 5, NULL, NULL, read_init_record, getIoIntInfo, read_rdb };
devRdbpostgreSQLSoft rdbWritepostgreSQL={ 5, NULL, NULL, write_init_record, getIoIntInfo, write_rdb };

epicsExportAddress(dset,rdbReadpostgreSQL);
epicsExportAddress(dset,rdbWritepostgreSQL);


long write_init_record(void *precord)
{
	rdbpostgreSQLRecord	*prdbpostgreSQL = (rdbpostgreSQLRecord*)precord;
	devRdbpostgreSQLSoft *pdset = (devRdbpostgreSQLSoft*)prdbpostgreSQL->dset;

    if(recGblInitConstantLink(&prdbpostgreSQL->inp,DBF_DOUBLE,&prdbpostgreSQL->val))
         prdbpostgreSQL->udf = FALSE;

	devRDBPvt *pdev = (devRDBPvt *)malloc(sizeof (devRDBPvt));
	if(pdev == NULL) return -1;

	pdev->mutexId = epicsMutexCreate();
	scanIoInit(&pdev->ioScanPvt);
	prdbpostgreSQL->dpvt = pdev;

	ellAdd(&devRDBList, &(((devRDBPvt*)prdbpostgreSQL->dpvt)->devRDBNode) );

	return(0);
}
long getIoIntInfo(int cmd, dbCommon *pr, IOSCANPVT *iopvt)
{
	devRDBPvt *pdev = (devRDBPvt*)pr ->dpvt; 
	*iopvt = pdev->ioScanPvt;
    return 0;
}

long read_init_record(void	*precord)
{
	rdbpostgreSQLRecord	*prdbpostgreSQL = (rdbpostgreSQLRecord*)precord;
	devRdbpostgreSQLSoft *pdset = (devRdbpostgreSQLSoft*)prdbpostgreSQL->dset;

    if(recGblInitConstantLink(&prdbpostgreSQL->inp,DBF_DOUBLE,&prdbpostgreSQL->val))
         prdbpostgreSQL->udf = FALSE;

	devRDBPvt *pdev = (devRDBPvt *)malloc(sizeof (devRDBPvt));
	if(pdev == NULL) return -1;

	pdev->mutexId = epicsMutexCreate();
	scanIoInit(&pdev->ioScanPvt);
	prdbpostgreSQL->dpvt = pdev;
	pdev -> prec = (dbCommon*)precord;

	ellAdd(&devRDBList, &(((devRDBPvt*)prdbpostgreSQL->dpvt)->devRDBNode) );

    return(0);
}

long read_rdb(void	*precord)
{
	rdbpostgreSQLRecord	*prdbpostgreSQL = (rdbpostgreSQLRecord*)precord;
    long status;
	//epicsTimeStamp currTime;
	//epicsTimeGetCurrent (&currTime);
	//if(RdbpostgreSQLDebug)
	//	printf("Scan(%d)\n",prdbpostgreSQL->scan);

    status = dbGetLink(&(prdbpostgreSQL->inp),DBF_DOUBLE, &(prdbpostgreSQL->val),0,0);
    /*If return was succesful then set undefined false*/
    if(!status) prdbpostgreSQL->udf = FALSE;

	//ReadValue(const char *table, const char *field)
	prdbpostgreSQL->val = mRdbManager.ReadValue(prdbpostgreSQL->tabl,prdbpostgreSQL->fild);
	prdbpostgreSQL->oval = prdbpostgreSQL->val;

    return(0);
}

long write_rdb(void	*precord)
{
	rdbpostgreSQLRecord	*prdbpostgreSQL = (rdbpostgreSQLRecord*)precord;
    long status;

	if(RdbpostgreSQLDebug)
		printf("Scan(%d)\n",prdbpostgreSQL->scan);

    status = dbGetLink(&(prdbpostgreSQL->inp),DBF_DOUBLE, &(prdbpostgreSQL->val),0,0);

    /*If return was succesful then set undefined false*/
    if(!status) prdbpostgreSQL->udf = FALSE;

	if(prdbpostgreSQL->oval!=prdbpostgreSQL->val)
		mRdbManager.WriteValue(prdbpostgreSQL);
#if 0
	switch(rdbpostgreSQL->qry)
	{
		case queryUpdate:
			mRdbManager.WriteValue(prdbpostgreSQL->tabl,prdbpostgreSQL->fild);
			break;
		case queryInsert:
			break;
	}
#endif

    return(0);
}

template <typename T> string valtostr(const T& t) { 
	ostringstream os; os<<t; 
	return os.str(); 
} 

//RDBManager
RDBManager::RDBManager()
{
#if 0
	try{
		mpConn = new connection("dbname=epics_db user=postgres password=qwer1234 hostaddr=127.0.0.1 port=5432");
		if (mpConn->is_open()) {
			cout << "Opened database successfully: " << mpConn->dbname() << endl;
		} else {
			cout << "Can't open database" << endl;
		}
		mpConn->disconnect ();
	}catch (const std::exception &e){
		cerr << e.what() << std::endl;
	}
#endif
}

connection * RDBManager::Connect(const string info)
{
	//connection *conn = 0;
	try{
		//conn = new connection("dbname=epics_db user=postgres password=qwer1234 hostaddr=127.0.0.1 port=5432");
		mpConn = new connection(info.c_str());
		if (mpConn->is_open()) {
			cout << "Opened database successfully: " << mpConn->dbname() << endl;
		} else {
			cout << "Can't open database" << endl;
		}
	}catch (const std::exception &e){
		cerr << e.what() << std::endl;
	};

	return (mpConn);
}

connection * RDBManager::Connect(const char *dbname, const char *user, const char *password,
			const char *hostaddr, const char* port)
{
	//connection *mpConn = 0;
	string conn_info = string("dbname=")+string(dbname)+string(" ")+string("user=")+string(user)+string(" ")+string("password=")+string(password)+string(" ")\
						+string("hostaddr=")+string(hostaddr) + string(" ")+ string("port=")+string(port);
	try{
		cout << conn_info << endl;
		mpConn = new connection(conn_info.c_str());
		if (mpConn->is_open()) {
			cout << "Opened database successfully: " << mpConn->dbname() << endl;
		} else {
			cout << "Can't open database" << endl;
		}
	}catch (const std::exception &e){
		cerr << e.what() << std::endl;
	};

	return (mpConn);
}

float RDBManager::ReadValue(const char *table, const char *field)
{
	//string sql = "select data_float from epics_table where id=1";
	string sql = string("select ") + string(field) + string (" from ") + string(table) + string(" where id = 1");

	nontransaction N(*mpConn);
	result R(N.exec(sql.c_str()));

	float data = 0.0;
	for (result::const_iterator c = R.begin(); c!=R.end(); ++c)
	{
		//cout << "DATA_FLOAT: " << c[0].as<float>() << endl;
		data = c[0].as<float>();
	}

	return data;
}

int RDBManager::WriteValue(const void *precord)
{
	rdbpostgreSQLRecord	*prdbpostgreSQL = (rdbpostgreSQLRecord*)precord;

	switch(prdbpostgreSQL->qry)
	{
		case queryUpdate:
			updateValue(precord);
			break;
		case queryInsert:
			//insertValue(prdbpostgreSQL->tabl,prdbpostgreSQL->fild);
			break;
	};

	return(0);
}


int RDBManager::updateValue(const void *precord)
{
	rdbpostgreSQLRecord	*prdbpostgreSQL = (rdbpostgreSQLRecord*)precord;
	string field = string (prdbpostgreSQL->fild);
	string table = string (prdbpostgreSQL->tabl);
	string sval = valtostr(prdbpostgreSQL->val);
	string sql = string("update ") + table + string (" set ") + field + string("=")+ sval+ string(" where id = 1");

	try {
		work w(*mpConn);
		w.exec(sql.c_str());
		w.commit();
		prdbpostgreSQL->oval = prdbpostgreSQL->val;
	}catch(const exception &e)
	{
		cerr << e.what() << endl;
		return -1;
	}
	return (0);
};

RDBManager::~RDBManager()
{

}
