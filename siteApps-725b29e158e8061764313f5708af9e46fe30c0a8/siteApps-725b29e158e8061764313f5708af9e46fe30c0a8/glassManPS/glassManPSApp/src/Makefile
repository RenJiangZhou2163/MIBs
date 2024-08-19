TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

glassManPS_DIR += $(RAON_SITELIBS)/lib/$(T_A)

#=============================
# Build the IOC application

PROD_IOC = glassManPS
# glassManPS.dbd will be created and installed
DBD += glassManPS.dbd

# glassManPS.dbd will be made up from these files:
glassManPS_DBD += base.dbd

# Include dbd files from all support applications:
#glassManPS_DBD += xxx.dbd
glassManPS_DBD += stream.dbd
glassManPS_DBD += drvAsynIPPort.dbd

glassManPS_DBD += gmpsRecord.dbd
glassManPS_DBD += devFj01n120.dbd

# Add all the support libraries needed by this IOC
#glassManPS_LIBS += xxx
glassManPS_LIBS += glassManPS
glassManPS_LIBS += asyn
glassManPS_LIBS += stream

# glassManPS_registerRecordDeviceDriver.cpp derives from glassManPS.dbd
glassManPS_SRCS += glassManPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
glassManPS_SRCS_DEFAULT += glassManPSMain.cpp
glassManPS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#glassManPS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
glassManPS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

