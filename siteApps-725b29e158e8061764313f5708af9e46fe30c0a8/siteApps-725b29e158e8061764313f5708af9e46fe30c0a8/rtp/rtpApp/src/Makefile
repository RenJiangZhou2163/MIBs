TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
LIBRARY_IOC += rtpDev

DBD         += rtpDev.dbd
USR_INCLUDES  += -I$(RAON_SITELIBS)/include

rtpDev_LIBS += asyn

rtpDev_SRCS += rtpDevManager.cpp rtpSyncManager.cpp


#=============================
# Build the IOC application

PROD_IOC = rtp
# rtp.dbd will be created and installed
DBD += rtp.dbd

# rtp.dbd will be made up from these files:
rtp_DBD += base.dbd
rtp_DBD += rtpDev.dbd

# Include dbd files from all support applications:
#rtp_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
rtp_LIBS += rtpDev

# rtp_registerRecordDeviceDriver.cpp derives from rtp.dbd
rtp_SRCS += rtp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
rtp_SRCS_DEFAULT += rtpMain.cpp
rtp_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#rtp_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
rtp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

