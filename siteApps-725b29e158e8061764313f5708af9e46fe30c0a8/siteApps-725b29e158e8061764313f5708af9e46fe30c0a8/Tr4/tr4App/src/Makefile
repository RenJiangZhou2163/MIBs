TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += tr4Support

#USR_INCLUDES += -I/usr/include

SYS_LIB = /usr/lib

#ifstat_DIR = ${SYS_LIB}
#netsnmp_DIR = ${SYS_LIB}

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord
DBDINC += ifstatRecord
# Install devXxxSoft.dbd into <top>/dbd
#DBD += xxxSupport.dbd

# Compile and add the code to the support library
#tr4Support_SRCS += xxxRecord.c
#tr4Support_SRCS += devXxxSoft.c
tr4Support_SRCS += ifstatRecord.c
tr4Support_SRCS += devIfstatSoft.c
#tr4Support_SRCS += data.c drivers.c ifstat.c 
tr4Support_SRCS += data.c drivers.c  

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
tr4Support_SRCS += dbSubExample.c
tr4Support_SRCS += tr4Hello.c
tr4Support_SRCS += initTrace.c

tr4Support_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = tr4
# tr4.dbd will be created and installed
DBD += tr4.dbd

# tr4.dbd will be made up from these files:
tr4_DBD += base.dbd
#tr4_DBD += xxxSupport.dbd
tr4_DBD += ifstatRecord.dbd
tr4_DBD += dbSubExample.dbd
tr4_DBD += tr4Hello.dbd
tr4_DBD += initTrace.dbd
tr4_DBD += ifstatDevSoft.dbd

# tr4_registerRecordDeviceDriver.cpp derives from tr4.dbd
tr4_SRCS += tr4_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tr4_SRCS_DEFAULT += tr4Main.cpp
tr4_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tr4_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
tr4_LIBS += tr4Support

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into tr4Support
    sncExample_SNCFLAGS += +r
    tr4_DBD += sncExample.dbd
    tr4Support_SRCS += sncExample.stt
    tr4Support_LIBS += seq pv
    tr4_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
#tr4_LIBS += ifstat netsnmp $(EPICS_BASE_IOC_LIBS) 
tr4_LIBS += $(EPICS_BASE_IOC_LIBS) 

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

