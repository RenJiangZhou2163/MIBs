#!../../bin/linux-x86_64/tr6

## You may have to change tr6 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/tr6.dbd"
tr6_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/dbExtr6.vdb","SYS=EXTR6")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=sileeHost"
