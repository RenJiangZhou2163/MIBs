#!../../bin/linux-x86_64/tr3

## You may have to change tr3 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/tr3.dbd"
tr3_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/userHost.substitutions"
dbLoadRecords "db/dbSubExample.db", "user=sileeHost"
dbLoadRecords "db/db_SEQ_Wave_ex.vdb", "M=TR3"

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
seq seqWave, "M=TR3"
seq seqControl, "M=TR3"
