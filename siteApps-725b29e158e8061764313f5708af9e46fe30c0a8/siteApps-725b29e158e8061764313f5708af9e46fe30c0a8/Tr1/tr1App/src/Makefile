TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# Build an IOC support library

#LIBRARY_IOC += xxxSupport

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord
# install devXxxSoft.dbd into <top>/dbd
#DBD += xxxSupport.dbd

# The following are compiled and added to the Support library
#xxxSupport_SRCS += xxxRecord.c
#xxxSupport_SRCS += devXxxSoft.c

xxxSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# build an ioc application

PROD_IOC = tr1
# tr1.dbd will be created and installed
DBD += tr1.dbd

# tr1.dbd will be made up from these files:
tr1_DBD += base.dbd
#tr1_DBD += xxxSupport.dbd
#tr1_DBD += dbSubExample.dbd
tr1_DBD += tr1Hello.dbd
tr1_DBD += tr1SubRec.dbd
tr1_DBD += tr1TSTR.dbd
tr1_DBD += tr2SubRec.dbd
tr1_DBD += ICMPSubProc.dbd
#tr1_DBD += CHFailover.dbd
tr1_DBD += dbSubTrFinal.dbd
tr1_DBD += trSubLisaju.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
tr1_SRCS += tr1_registerRecordDeviceDriver.cpp
tr1_SRCS_DEFAULT += tr1Main.cpp
tr1_SRCS_vxWorks += -nil-

# Add locally compiled object code
#tr1_SRCS += dbSubExample.c
tr1_SRCS += tr1Hello.c
tr1_SRCS += tr1SubRec.c
tr1_SRCS += tr1TSTR.cpp
tr1_SRCS += icmpsocket.cpp
tr1_SRCS += ICMPSubProc.cpp
#tr1_SRCS += failover.cpp
#tr1_SRCS += CHFailover.cpp
tr1_SRCS += tr2SubRec.c
tr1_SRCS += dbSubTrFinal.c
tr1_SRCS += trSubLisaju.c

# The following adds support from base/src/vxWorks
tr1_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

#tr1_LIBS += xxxSupport

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # This builds sncExample as a component of tr1
    tr1_SNCFLAGS += +r
    tr1_DBD += sncExample.dbd
    tr1_SRCS += sncExample.stt
    tr1_SRCS += sncWave.stt
    tr1_DBD += sncWave.dbd
    tr1_DBD += sncMonsvrstatus.dbd
    tr1_SRCS += sncMonsvrstatus.stt
    tr1_LIBS += seq pv

    # The following builds sncProgram as a standalone application
	PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

tr1_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

