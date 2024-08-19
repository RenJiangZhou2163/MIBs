#!../../bin/linux-x86_64/tr2

## You may have to change tr2 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/tr2.dbd"
tr2_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/userHost.substitutions"
dbLoadRecords "db/dbSubExample.db", "user=sileeHost"

#dbLoadRecords "db/sincalc.db", "user=sileeHost"
dbLoadRecords "db/db_aSub_ex.vdb", "M=ASUB"
dbLoadRecords "db/db_fan_dfan_test.vdb", "M=FANOUT"
dbLoadRecords "db/db_seq_sel_test.vdb", "M=SEQSEL"
dbLoadRecords "db/db_mbbi_mbbi_dir.vdb", "M=MBBI"

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=rootHost"
