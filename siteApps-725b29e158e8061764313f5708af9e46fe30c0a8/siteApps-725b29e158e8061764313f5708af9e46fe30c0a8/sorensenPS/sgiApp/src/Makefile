TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = sgi
# sgi.dbd will be created and installed
DBD += sgi.dbd

# sgi.dbd will be made up from these files:
sgi_DBD += base.dbd

# Include dbd files from all support applications:
#sgi_DBD += xxx.dbd
sgi_DBD += stream.dbd
sgi_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#sgi_LIBS += xxx
sgi_LIBS += asyn
sgi_LIBS += stream

# sgi_registerRecordDeviceDriver.cpp derives from sgi.dbd
sgi_SRCS += sgi_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
sgi_SRCS_DEFAULT += sgiMain.cpp
sgi_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#sgi_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
sgi_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

ifneq ($(SNCSEQ),)
    sgi_DBD += seqRamp.dbd
    sgi_SRCS += seqRamp.stt
    sgi_LIBS += seq pv
endif


include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

