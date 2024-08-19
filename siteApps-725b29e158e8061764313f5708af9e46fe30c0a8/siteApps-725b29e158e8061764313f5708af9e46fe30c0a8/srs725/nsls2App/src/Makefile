TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

# Defaults for all IOCs
PROD_LIBS += autosave devIocStats
PROD_LIBS += $(EPICS_BASE_IOC_LIBS)

# Must be included for all IOCs
## yourApp_DBD += $(COMM_DBD)
COMM_DBD := base.dbd asSupport.dbd devIocStats.dbd system.dbd

ifneq ($(CAPUTLOG),)
PROD_LIBS += caPutLog
COMM_DBD += caPutLog.dbd
endif

#### Stream IOC
PROD_IOC = streamApp
# nsls2.dbd will be created and installed
DBD += streamApp.dbd

streamApp_SRCS += streamApp_registerRecordDeviceDriver.cpp
streamApp_SRCS += nsls2Main.cpp
streamApp_SRCS += wfcalc.c
streamApp_SRCS += devtimediff.c
streamApp_SRCS += TimeStamp.c
streamApp_SRCS += versionid.c
streamApp_SRCS += timedbuffer.c

streamApp_DBD += $(COMM_DBD)
streamApp_DBD += wfcalc.dbd
streamApp_DBD += devtimediff.dbd
#streamApp_DBD += calcSupport.dbd
streamApp_DBD += stream.dbd
streamApp_DBD += asyn.dbd drvAsynIPPort.dbd drvAsynSerialPort.dbd
#streamApp_LIBS += calc sscan stream asyn
streamApp_LIBS += sscan stream asyn
#### End Stream IOC

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

ifneq ($(wildcard $(TOP)/.git),)

REV := $(shell git log --pretty=format:'%h %ci' -n 1 HEAD)

else ifneq ($(wildcard $(TOP)/.hg),)

REV := $(shell hg tip --template '{node|short}')

else
# No VCS

REV := Unknown

endif

#.PHONY: versionID.h

#versionID.h:
#	#echo "#define VERSIONID \"$(REV)\"" > $@

#versionid.c: versionID.h
