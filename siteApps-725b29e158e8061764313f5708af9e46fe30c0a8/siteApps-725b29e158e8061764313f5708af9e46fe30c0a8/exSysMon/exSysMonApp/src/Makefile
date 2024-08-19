TOP=../..

include $(TOP)/configure/CONFIG

USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

sysMon_DIR += $(RAON_SITELIBS)/lib/$(T_A)

#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = exSysMon
# exSysMon.dbd will be created and installed
DBD += exSysMon.dbd

# exSysMon.dbd will be made up from these files:
exSysMon_DBD += base.dbd

# Include dbd files from all support applications:
#exSysMon_DBD += xxx.dbd
exSysMon_DBD += sysMon.dbd

# Add all the support libraries needed by this IOC
#exSysMon_LIBS += xxx

# exSysMon_registerRecordDeviceDriver.cpp derives from exSysMon.dbd
exSysMon_SRCS += exSysMon_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
exSysMon_SRCS_DEFAULT += exSysMonMain.cpp
exSysMon_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#exSysMon_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary
exSysMon_LIBS += sysMon

# Finally link to the EPICS Base libraries
exSysMon_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

