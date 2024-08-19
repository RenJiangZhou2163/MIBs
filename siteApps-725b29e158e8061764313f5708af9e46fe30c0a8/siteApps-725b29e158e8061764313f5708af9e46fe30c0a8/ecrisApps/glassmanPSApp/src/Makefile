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

PROD_IOC = glassmanPS
# glassmanPS.dbd will be created and installed
DBD += glassmanPS.dbd

# glassmanPS.dbd will be made up from these files:
glassmanPS_DBD += base.dbd

# Include dbd files from all support applications:
#glassmanPS_DBD += xxx.dbd
glassmanPS_DBD += stream.dbd
glassmanPS_DBD += drvAsynIPPort.dbd
glassmanPS_DBD += gmpsRecord.dbd
glassmanPS_DBD += devFj01n120.dbd
glassmanPS_DBD += devFj10n12.dbd
glassmanPS_DBD += devFj50n02.4.dbd
glassmanPS_DBD += devFj50p02.4.dbd
glassmanPS_DBD += devEt50p40.dbd

# Add all the support libraries needed by this IOC
#glassmanPS_LIBS += xxx
glassmanPS_LIBS += glassManPS
glassmanPS_LIBS += asyn
glassmanPS_LIBS += stream

# glassmanPS_registerRecordDeviceDriver.cpp derives from glassmanPS.dbd
glassmanPS_SRCS += glassmanPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
glassmanPS_SRCS_DEFAULT += glassmanPSMain.cpp
glassmanPS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#glassmanPS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
glassmanPS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

