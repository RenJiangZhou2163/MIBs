TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

USR_INCLUDES += -I/home/pi/wiringPi/wiringPi
wiringPi_DIR += /home/pi/wiringPi/wiringPi /home/pi/wiringPi/devLib

raspGPIO_DIR += $(RAON_SITELIBS)/lib/$(T_A)

PROD_IOC = md5dh14
# md5dh14.dbd will be created and installed
DBD += md5dh14.dbd

# md5dh14.dbd will be made up from these files:
md5dh14_DBD += base.dbd

# Include dbd files from all support applications:
#md5dh14_DBD += xxx.dbd
md5dh14_DBD += devGPIO.dbd

# Add all the support libraries needed by this IOC
#md5dh14_LIBS += xxx
md5dh14_LIBS += raspGPIO
md5dh14_LIBS += wiringPi

# md5dh14_registerRecordDeviceDriver.cpp derives from md5dh14.dbd
md5dh14_SRCS += md5dh14_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
md5dh14_SRCS_DEFAULT += md5dh14Main.cpp
md5dh14_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#md5dh14_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
md5dh14_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

ifneq ($(SNCSEQ),)
    md5dh14_DBD += seqStep.dbd
    md5dh14_SRCS += seqStep.stt
    md5dh14_LIBS += seq pv
endif

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

