TOP=../..

include $(TOP)/configure/CONFIG


USR_INCLUDES += -I${RAON_SITELIBS}/include
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd

devSnmp_DIR += ${RAON_SITELIBS}/lib/$(T_A)
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)


#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = snmp
# snmp.dbd will be created and installed
DBD += snmp.dbd

# snmp.dbd will be made up from these files:
snmp_DBD += base.dbd
snmp_DBD += snmpMSURecord.dbd
snmp_DBD += timestampRecord.dbd

# Include dbd files from all support applications:
#snmp_DBD += xxx.dbd
snmp_DBD += snmpMSUDevSoft.dbd
snmp_DBD += timestampDevSoft.dbd

# Add all the support libraries needed by this IOC
#snmp_LIBS += xxx
snmp_LIBS += devSnmp timeStamp



# snmp_registerRecordDeviceDriver.cpp derives from snmp.dbd
snmp_SRCS += snmp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
snmp_SRCS_DEFAULT += snmpMain.cpp
snmp_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#snmp_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
snmp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
