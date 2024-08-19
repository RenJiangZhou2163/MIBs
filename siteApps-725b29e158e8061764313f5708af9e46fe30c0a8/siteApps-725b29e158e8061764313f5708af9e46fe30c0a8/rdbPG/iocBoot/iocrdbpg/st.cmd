#!../../bin/linux-x86_64/rdbpg

## You may have to change rdbpg to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/rdbpg.dbd"
rdbpg_registerRecordDeviceDriver pdbbase

drvRDBConnInit("epics_db","postgres","qwer1234","127.0.0.1","5432");


## Load record instances
#dbLoadRecords("db/xxx.db","user=sileeHost")
dbLoadRecords("db/PGRDB.vdb","SYS=RDB")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=sileeHost"
