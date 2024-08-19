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

raspDHT11_DIR += $(RAON_SITELIBS)/lib/$(T_A)

PROD_IOC = dht11
# dht11.dbd will be created and installed
DBD += dht11.dbd

# dht11.dbd will be made up from these files:
dht11_DBD += base.dbd

# Include dbd files from all support applications:
#dht11_DBD += xxx.dbd
dht11_DBD += dhtRecord.dbd
dht11_DBD += devDHT11.dbd

# Add all the support libraries needed by this IOC
#dht11_LIBS += xxx
dht11_LIBS += raspDHT11
dht11_LIBS += wiringPi

# dht11_registerRecordDeviceDriver.cpp derives from dht11.dbd
dht11_SRCS += dht11_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
dht11_SRCS_DEFAULT += dht11Main.cpp
dht11_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#dht11_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
dht11_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

