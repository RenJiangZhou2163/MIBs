#!../../bin/linux-x86_64/rdbmysql

## You may have to change rdbmysql to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/rdbmysql.dbd"
rdbmysql_registerRecordDeviceDriver pdbbase

#drvMySQLConnInit("epics_db","root","qwer1234","127.0.0.1","3306");
drvMySQLConnInit("rad_inst","root","qwer1234","127.0.0.1","3306");

## Load record instances
#dbLoadRecords("db/xxx.db","user=ctrluserHost")
#dbLoadRecords("db/MYSQL_EPICS.vdb","SYS=MYSQL")
dbLoadRecords("db/RMS_EPICS.vdb","SYS=MYSQL")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=ctrluserHost"
