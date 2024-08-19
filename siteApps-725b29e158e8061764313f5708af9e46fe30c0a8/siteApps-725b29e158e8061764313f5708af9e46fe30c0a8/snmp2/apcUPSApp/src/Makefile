TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

USR_INCLUDES += -I${RAON_SITELIBS}/include/
USR_DBDFLAGS += -I${RAON_SITELIBS}/dbd/
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

snmpMon_DIR += ${RAON_SITELIBS}/lib/$(T_A)
timeStamp_DIR += $(RAON_SITELIBS)/lib/$(T_A)

#=============================
# Build the IOC application

PROD_IOC = apcUPS
# apcUPS.dbd will be created and installed
DBD += apcUPS.dbd

# apcUPS.dbd will be made up from these files:
apcUPS_DBD += base.dbd
apcUPS_DBD += snmpRecord.dbd
apcUPS_DBD += snmpDevSoft.dbd
apcUPS_DBD += timestampRecord.dbd
apcUPS_DBD += timestampDevSoft.dbd


# Include dbd files from all support applications:
#apcUPS_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#apcUPS_LIBS += xxx
apcUPS_LIBS += snmpMon timeStamp

# apcUPS_registerRecordDeviceDriver.cpp derives from apcUPS.dbd
apcUPS_SRCS += apcUPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
apcUPS_SRCS_DEFAULT += apcUPSMain.cpp
apcUPS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#apcUPS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
apcUPS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

