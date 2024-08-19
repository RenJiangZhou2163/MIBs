#!../../bin/linux-x86_64/snmp2

## You may have to change snmp2 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

#epicsEnvSet("MIBDIRS", "${EPICS_PATH}/siteLibs/snmpLib/mibs")

## Register all support components
dbLoadDatabase "dbd/snmp2.dbd"
snmp2_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=mijoy0909Host")
dbLoadRecords("db/pdu.vdb", "A=APC, P=PDU2, HOST=10.1.5.142, COM=public, USER=mijoy, V2C=SNMP_VERSION_2c, V3=SNMP_VERSION_3, PO=PowerNet-MIB::, AUTH_P=qwertyuiop12345, PRIV_P=qwertyuiop12345")
#dbLoadRecords("db/wiener.vdb", "W=WIENER, C=CRATE3, HOST=10.1.5.123, COM=public, USER=admin, V2C=SNMP_VERSION_2c, V3=SNMP_VERSION_3, WI=WIENER-CRATE-MIB::, AUTH_P=MySecret, PRIV_P=MySecret")
#dbLoadRecords("db/timestamp.vdb", "S=SNMPIOC")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=mijoy0909Host"
