TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
#USR_INCLUDES  += -I$(RAON_SITELIBS)/include
#USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
#USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include
asyn_DIR += $(ASYN)/lib/$(T_A)

#=============================
# Build the IOC application

PROD_IOC = streamsim
# streamsim.dbd will be created and installed
DBD += streamsim.dbd

# streamsim.dbd will be made up from these files:
#streamsim_DBD += drvAsynIPPort.dbd
#streamsim_DBD += drvAsynSerialPort.dbd
streamsim_DBD += ssim.dbd

# Include dbd files from all support applications:
#streamsim_DBD += xxx.dbd
#streamsim_DBD += stream.dbd
#streamsim_DBD += asyn.dbd

# Add all the support libraries needed by this IOC
#streamsim_LIBS += xxx
#streamsim_LIBS += stream
#streamsim_LIBS += asyn
streamsim_LIBS += calc sscan stream asyn

# streamsim_registerRecordDeviceDriver.cpp derives from streamsim.dbd
streamsim_SRCS += streamsim_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
streamsim_SRCS_DEFAULT += streamsimMain.cpp
streamsim_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#streamsim_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
streamsim_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

