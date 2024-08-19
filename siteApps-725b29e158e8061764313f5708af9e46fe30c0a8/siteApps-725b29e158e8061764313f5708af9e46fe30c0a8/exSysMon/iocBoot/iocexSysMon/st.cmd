#!../../bin/linux-x86_64/exSysMon

## You may have to change exSysMon to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/exSysMon.dbd"
exSysMon_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=sileeHost")
dbLoadRecords("db/dbSysMon.db","SYS=ctrlHost")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=sileeHost"
