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

raspDHT22_DIR += $(RAON_SITELIBS)/lib/$(T_A)

PROD_IOC = dht22
# dht22.dbd will be created and installed
DBD += dht22.dbd

# dht22.dbd will be made up from these files:
dht22_DBD += base.dbd

# Include dbd files from all support applications:
#dht22_DBD += xxx.dbd
dht22_DBD += dhtRecord.dbd
dht22_DBD += devDHT22.dbd

# Add all the support libraries needed by this IOC
#dht22_LIBS += xxx
dht22_LIBS += raspDHT22
dht22_LIBS += wiringPi

# dht22_registerRecordDeviceDriver.cpp derives from dht22.dbd
dht22_SRCS += dht22_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
dht22_SRCS_DEFAULT += dht22Main.cpp
dht22_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#dht22_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
dht22_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

