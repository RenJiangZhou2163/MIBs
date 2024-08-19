TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#ASYN += ${EPICS_PATH}/modules/synApps_5_7/support/asyn-4-21

#USR_INCLUDES  += -I$(RAON_SITELIBS)/include
#USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
#USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

#asyn_DIR += $(ASYN)/lib/$(T_A)


#=============================
# Build the IOC application

PROD_IOC = exAsyn
# exAsyn.dbd will be created and installed
DBD += exAsyn.dbd

# exAsyn.dbd will be made up from these files:
exAsyn_DBD += asynTest.dbd

# Include dbd files from all support applications:
#exAsyn_DBD += xxx.dbd
#exAsyn_DBD += asyn.dbd

# Add all the support libraries needed by this IOC
exAsyn_LIBS += asyn
exAsyn_LIBS += stream

# exAsyn_registerRecordDeviceDriver.cpp derives from exAsyn.dbd
exAsyn_SRCS += exAsyn_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
exAsyn_SRCS_DEFAULT += exAsynMain.cpp
exAsyn_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#exAsyn_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
exAsyn_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

