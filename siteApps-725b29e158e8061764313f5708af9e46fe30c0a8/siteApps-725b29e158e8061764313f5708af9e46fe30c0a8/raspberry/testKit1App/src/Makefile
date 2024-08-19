TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

USR_INCLUDES  += -I$(RAON_SITELIBS)/include
USR_DBDFLAGS  += -I$(RAON_SITELIBS)/dbd
USR_INCLUDES  += -I$(EPICS_EXTENSIONS)/include

USR_INCLUDES += -I/home/pi/wiringPi/wiringPi
wiringPi_DIR += /home/pi/wiringPi/wiringPi /home/pi/wiringPi/devLib

raspGPIO_DIR += $(RAON_SITELIBS)/lib/$(T_A)
raspDS1820_DIR += $(RAON_SITELIBS)/lib/$(T_A)

#=============================
# Build the IOC application

PROD_IOC = testKit1
# testKit1.dbd will be created and installed
DBD += testKit1.dbd

# testKit1.dbd will be made up from these files:
testKit1_DBD += base.dbd

# Include dbd files from all support applications:
#testKit1_DBD += xxx.dbd
testKit1_DBD += devGPIO.dbd
testKit1_DBD += devDS1820.dbd

# Add all the support libraries needed by this IOC
#testKit1_LIBS += xxx
testKit1_LIBS += wiringPi
testKit1_LIBS += raspGPIO
testKit1_LIBS += raspDS1820

# testKit1_registerRecordDeviceDriver.cpp derives from testKit1.dbd
testKit1_SRCS += testKit1_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
testKit1_SRCS_DEFAULT += testKit1Main.cpp
testKit1_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#testKit1_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
testKit1_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

ifneq ($(SNCSEQ),)
    testKit1_DBD += seqLED.dbd
    testKit1_SRCS += seqLED.stt
    testKit1_LIBS += seq pv
endif
include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

