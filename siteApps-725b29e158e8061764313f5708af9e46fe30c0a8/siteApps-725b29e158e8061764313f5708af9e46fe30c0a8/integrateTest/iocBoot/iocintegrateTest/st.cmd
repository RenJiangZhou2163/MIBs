#!../../bin/linux-x86_64/integrateTest

## You may have to change integrateTest to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/integrateTest.dbd"
integrateTest_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/userHost.substitutions"
dbLoadRecords "db/dbSubExample.db", "user=namshHost"

dbLoadRecords "db/alive.db", "P=aliveEx:,RHOST=10.1.4.61"
#dbLoadDatabase("dbd/testIocStats.dbd",0,0)
## Load all record instances (VxWorks)
#dbLoadRecords("db/iocAdminVxWorks.db","IOC=IOCTEST")
## or load only those records for RTEMS IOCs
#dbLoadRecords("db/iocAdminRTEMS.db","IOC=IOCTEST")
## or load only those records for Soft IOCs
dbLoadRecords("db/iocAdminSoft.db","IOC=IOCTEST")
## optionally load the SCAN monitoring records
#dbLoadRecords("db/iocAdminScanMon.db","IOC=IOCTEST")
#dbLoadRecords("db/testIocAdminRelease.db","IOC=IOCTEST")


## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=namshHost"
