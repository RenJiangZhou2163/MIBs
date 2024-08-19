#!../../bin/linux-arm/md5dh14

## You may have to change RaspberryPi to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

epicsEnvSet "STREAM_PROTOCOL_PATH" "../../proto"

## Register all support components
dbLoadDatabase "dbd/RaspberryPi.dbd"
RaspberryPi_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=piHost")
dbLoadRecords("db/md5dh14.db")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
seq seqStep
