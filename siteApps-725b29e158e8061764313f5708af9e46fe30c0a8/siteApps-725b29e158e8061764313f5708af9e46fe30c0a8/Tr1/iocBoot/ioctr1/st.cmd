#!../../bin/linux-x86_64/tr1

## You may have to change tr1 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/tr1.dbd")
tr1_registerRecordDeviceDriver(pdbbase)

## Load record instances
#dbLoadRecords("db/dbExample1.db","user=rootHost")
#dbLoadRecords("db/dbExample2.db","user=rootHost,no=1,scan=1 second")
#dbLoadRecords("db/dbExample2.db","user=rootHost,no=2,scan=2 second")
#dbLoadRecords("db/dbExample2.db","user=rootHost,no=3,scan=5 second")
#dbLoadRecords("db/dbSubExample.db","user=rootHost")

dbLoadRecords("db/dbTr1.vdb","user=leesiHost")
dbLoadRecords("db/dbTr2.vdb","user=leesiHost")
dbLoadRecords("db/dbStr.vdb","user=leesiHost")
dbLoadRecords("db/dbTStr.vdb","user=leesiHost")
dbLoadRecords("db/dbTr1Final.vdb","user=leesiHost")
dbLoadRecords("db/dbSEQ.vdb", "user=leesiHost, num=0")
dbLoadRecords("db/dbSEQ.vdb", "user=leesiHost, num=1")

dbLoadRecords("db/dbSubLisaju.vdb", "user=leesiHost")
#dbLoadRecords("db/dbPing.vdb", "user=ICS")
#dbLoadRecords("db/dbCHFailover.vdb", "user=MST")
dbLoadRecords("db/gauss.db","P=leesiHost")

## Set this to see messages from mySub
## After Database Definition
var mySubDebug 0
var PingDebug 0
var CHFailOverDebug 1
var(dbSubFinalDebug, 0)

cd ${TOP}/iocBoot/${IOC}
iocInit()

## Start any sequence programs
#seq sncExample,"user=rootHost"
#epicsThreadSleep(3.)
var(mySubDebug, 0)
var(dbSubFinalDebug,0)

seq sncWave, "user=leesiHost, num=0"
seq sncWave, "user=leesiHost, num=1"
seq sncMonsvrstatus
