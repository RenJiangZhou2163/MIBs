#!../../bin/linux-x86_64/tr5

## You may have to change tr5 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/tr5.dbd"
tr5_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/dbIfstat.vdb","user=kaffee")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=sileeHost"
