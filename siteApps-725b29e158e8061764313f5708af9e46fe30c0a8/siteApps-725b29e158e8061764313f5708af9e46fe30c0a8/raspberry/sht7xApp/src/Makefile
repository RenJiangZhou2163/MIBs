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

raspSHT7x_DIR += $(RAON_SITELIBS)/lib/$(T_A)

PROD_IOC = sht7x
# sht7x.dbd will be created and installed
DBD += sht7x.dbd

# sht7x.dbd will be made up from these files:
sht7x_DBD += base.dbd

# Include dbd files from all support applications:
#sht7x_DBD += xxx.dbd
sht7x_DBD += shtRecord.dbd
sht7x_DBD += devSHT7x.dbd

# Add all the support libraries needed by this IOC
#sht7x_LIBS += xxx
sht7x_LIBS += raspSHT7x
sht7x_LIBS += wiringPi

# sht7x_registerRecordDeviceDriver.cpp derives from sht7x.dbd
sht7x_SRCS += sht7x_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
sht7x_SRCS_DEFAULT += sht7xMain.cpp
sht7x_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#sht7x_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
sht7x_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

