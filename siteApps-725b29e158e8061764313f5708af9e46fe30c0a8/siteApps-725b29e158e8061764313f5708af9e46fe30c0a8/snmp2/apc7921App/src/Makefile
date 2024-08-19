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

PROD_IOC = apc7921
# apc7921.dbd will be created and installed
DBD += apc7921.dbd

# apc7921.dbd will be made up from these files:
apc7921_DBD += base.dbd
apc7921_DBD += snmpRecord.dbd
apc7921_DBD += timestampRecord.dbd
apc7921_DBD += snmpDevSoft.dbd
apc7921_DBD += timestampDevSoft.dbd

# Include dbd files from all support applications:
#apc7921_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#apc7921_LIBS += xxx
apc7921_LIBS += snmpMon timeStamp


# apc7921_registerRecordDeviceDriver.cpp derives from apc7921.dbd
apc7921_SRCS += apc7921_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
apc7921_SRCS_DEFAULT += apc7921Main.cpp
apc7921_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#apc7921_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
apc7921_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

