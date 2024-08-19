#!../../bin/linux-x86_64/snmpTest

## You may have to change snmpTest to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/snmpTest.dbd"
snmpTest_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=mijoy0909Host")
dbLoadRecords("db/xerox.vdb", "HOST=10.1.6.232, COM=public, V2C=SNMP_VERSION_2c, PR=Printer-MIB::")
dbLoadRecords("db/timestamp.vdb", "S=SNMPIOC")
dbLoadRecords "db/alive.db", "P=aliveEx:,RHOST=10.1.6.104"


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




cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=mijoy0909Host"
