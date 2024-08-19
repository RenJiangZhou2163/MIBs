#!../../bin/linux-x86_64/snmp	

## You may have to change snmp to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

epicsEnvSet("MIBDIRS", "+$(TOP)/mibs")
##devSnmpSetSnmpVersion("10.1.5.122","SNMP_VERSION_1")
##devSnmpSetSnmpVersion("10.1.5.142","SNMP_VERSION_2c")
devSnmpSetSnmpVersion("10.1.4.41","SNMP_VERSION_1")
devSnmpSetSnmpVersion("10.1.4.40","SNMP_VERSION_2c")
#devSnmpSetSnmpVersion("10.1.5.122","SNMP_VERSION_2c")
#devSnmpSetSnmpVersion("10.1.5.123","SNMP_VERSION_2c")
#devSnmpSetSnmpVersion("10.1.5.142","SNMP_VERSION_2c")


epicsEnvSet("W", "WIENER-CRATE-MIB::")
epicsEnvSet("PO", "PowerNet-MIB::")
epicsEnvSet("PR", "Printer-MIB::")
epicsEnvSet("JM", "Job-Monitoring-MIB::")
epicsEnvSet("SMI", "SNMPv2-SMI::")
epicsEnvSet("RFC", "RFC1213-MIB::")
epicsEnvSet("XM", "XEROX-SERVICE-MONITORING-MIB::")
epicsEnvSet("CM1", "admin")
epicsEnvSet("CM2", "public")
epicsEnvSet("WV1", "10.1.5.121")
epicsEnvSet("WV2", "10.1.5.122")
epicsEnvSet("WV3", "10.1.5.123")
epicsEnvSet("PDU1", "10.1.5.141")
epicsEnvSet("PDU2", "10.1.5.142")
epicsEnvSet("XEROX", "10.1.4.40")
epicsEnvSet("KYOCERA", "10.1.4.41")
epicsEnvSet("Load","rPDULoadPhaseConfig")


## Register all support components
dbLoadDatabase "dbd/snmp.dbd"
snmp_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/printer.vdb","USER=ctrldb4")
dbLoadRecords("db/timestamp.vdb", "S=ctrldb4")


#dbLoadRecords("db/wiener.vdb","USER=mijoy0909Host, WV2=WIENER-VME2:, WV3=WIENER-VME3:")
#dbLoadRecords("db/wiener_fan.vdb")
#dbLoadRecords("db/pdu.vdb","USER=mijoy0909Host, PS2=APC-PDU2:")


cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=mijoy0909Host"
