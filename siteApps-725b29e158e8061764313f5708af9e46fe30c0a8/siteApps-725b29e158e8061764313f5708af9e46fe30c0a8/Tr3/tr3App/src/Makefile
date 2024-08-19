TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += tr3Support

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
tr3Support_SRCS += xxxRecord.c
tr3Support_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
tr3Support_SRCS += dbSubExample.c
tr3Support_SRCS += tr3Hello.c
tr3Support_SRCS += initTrace.c

tr3Support_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = tr3
# tr3.dbd will be created and installed
DBD += tr3.dbd

# tr3.dbd will be made up from these files:
tr3_DBD += base.dbd
tr3_DBD += xxxSupport.dbd
tr3_DBD += dbSubExample.dbd
tr3_DBD += tr3Hello.dbd
tr3_DBD += initTrace.dbd

# tr3_registerRecordDeviceDriver.cpp derives from tr3.dbd
tr3_SRCS += tr3_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tr3_SRCS_DEFAULT += tr3Main.cpp
tr3_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tr3_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
tr3_LIBS += tr3Support

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into tr3Support
    sncExample_SNCFLAGS += +r
    tr3_DBD += sncExample.dbd
	tr3_DBD += seqWave.dbd
    tr3Support_SRCS += sncExample.stt
	tr3Support_SRCS += seqWave.stt

#ex-1
#tr3Support_SRCS += seqWave_c_block.stt

#ex-2
#tr3_DBD += debug_var.dbd
#    tr3Support_SRCS += debug_var.c
#	tr3Support_SRCS += seqWave_print.stt


	tr3_DBD += seqControl.dbd
	tr3Support_SRCS += seqControl.stt
	tr3Support_LIBS += seq pv
	tr3_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link to the EPICS Base libraries
tr3_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

