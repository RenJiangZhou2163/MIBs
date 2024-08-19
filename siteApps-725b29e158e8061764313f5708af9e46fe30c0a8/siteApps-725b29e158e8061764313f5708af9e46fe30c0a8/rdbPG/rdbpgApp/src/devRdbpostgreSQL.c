/* devRdbpostgreSQLSoft.c */
/* Example device support module */

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "devRdbpostgreSQL.h"

#if 0
int RdbpostgreSQLDebug = 0;
epicsExportAddress(int, RdbpostgreSQLDebug);

devRdbpostgreSQLSoft rdbReadpostgreSQL={ 5, NULL, NULL, init_record, NULL, read_rdb };
devRdbpostgreSQLSoft rdbWritepostgreSQL={ 5, NULL, NULL, init_record, NULL, write_rdb };

epicsExportAddress(dset,rdbReadpostgreSQL);

long init_record(struct rdbpostgreSQLRecord	*prdbpostgreSQL)
{
	char *dopts = NULL;

    if(recGblInitConstantLink(&prdbpostgreSQL->inp,DBF_DOUBLE,&prdbpostgreSQL->val))
         prdbpostgreSQL->udf = FALSE;

    return(0);
}

long read_rdb(struct rdbpostgreSQLRecord	*prdbpostgreSQL)
{
    long status;
	epicsTimeStamp currTime;
	epicsTimeGetCurrent (&currTime);

	double scale;

	if(RdbpostgreSQLDebug)
		printf("Scan(%d)\n",prdbpostgreSQL->scan);

    status = dbGetLink(&(prdbpostgreSQL->inp),DBF_DOUBLE, &(prdbpostgreSQL->val),0,0);
    /*If return was succesful then set undefined false*/
    if(!status) prdbpostgreSQL->udf = FALSE;
    return(0);
}

long write_rdb(struct rdbpostgreSQLRecord	*prdbpostgreSQL)
{
    long status;
	epicsTimeStamp currTime;
	epicsTimeGetCurrent (&currTime);

	double scale;

	if(RdbpostgreSQLDebug)
		printf("Scan(%d)\n",prdbpostgreSQL->scan);

    status = dbGetLink(&(prdbpostgreSQL->inp),DBF_DOUBLE, &(prdbpostgreSQL->val),0,0);
    /*If return was succesful then set undefined false*/
    if(!status) prdbpostgreSQL->udf = FALSE;
    return(0);
}
#endif
