#!../../bin/linux-x86_64/ab

## You may have to change ab to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/ab.dbd"
ab_registerRecordDeviceDriver pdbbase

EIP_buffer_limit(800)

drvEtherIP_init()

drvEtherIP_define_PLC("AB","10.1.5.204",0)

## Load record instances
## dbLoadRecords("db/plc.db","PLC=AB, IOC=ab")
dbLoadRecords("db/abplcDIDO.db","PLC=AB, IOC=ab")
dbLoadRecords("db/abplcAIAO.db","PLC=AB, IOC=ab")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=hjsonHost"
