TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = sorensonPS
# sorensonPS.dbd will be created and installed
DBD += sorensonPS.dbd

# sorensonPS.dbd will be made up from these files:
sorensonPS_DBD += base.dbd

# Include dbd files from all support applications:
#sorensonPS_DBD += xxx.dbd
sorensonPS_DBD += stream.dbd
sorensonPS_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#sorensonPS_LIBS += xxx
sorensonPS_DBD += asyn
sorensonPS_DBD += stream

# sorensonPS_registerRecordDeviceDriver.cpp derives from sorensonPS.dbd
sorensonPS_SRCS += sorensonPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
sorensonPS_SRCS_DEFAULT += sorensonPSMain.cpp
sorensonPS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#sorensonPS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
sorensonPS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================
ifneq ($(SNCSEQ),)
    sorensonPS_DBD += seqRamp.dbd
    sorensonPS_SRCS += seqRamp.stt
    sorensonPS_LIBS += seq pv
endif


include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

