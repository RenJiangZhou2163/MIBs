TOP=../..

include $(TOP)/configure/CONFIG


USR_INCLUDES += -I${RAON_SITELIBS}/include/
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd/
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

snmpMon_DIR += ${RAON_SITELIBS}/lib/$(T_A)
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)


#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = snmp2
# snmp2.dbd will be created and installed
DBD += snmp2.dbd

# snmp2.dbd will be made up from these files:
snmp2_DBD += base.dbd
snmp2_DBD += snmpRecord.dbd
snmp2_DBD += timestampRecord.dbd


# Include dbd files from all support applications:
#snmp2_DBD += xxx.dbd
snmp2_DBD += snmpDevSoft.dbd
snmp2_DBD += timestampDevSoft.dbd

# Add all the support libraries needed by this IOC
#snmp2_LIBS += xxx
snmp2_LIBS += snmpMon timeStamp


# snmp2_registerRecordDeviceDriver.cpp derives from snmp2.dbd
snmp2_SRCS += snmp2_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
snmp2_SRCS_DEFAULT += snmp2Main.cpp
snmp2_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#snmp2_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
snmp2_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

