TOP=../..


include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# build a support library

LIBRARY = niCtrl

# xxxRecord.h will be created from xxxRecord.dbd
DBD += niCtrlSupport.dbd

# specify all source files to be compiled and added to the library
niCtrl_SRCS += devNiCtrl.c

SHRLIB_SEARCH_DIRS += /usr/local/natinst/nidaqmx/lib
niCtrl_LIBS += nidaqmx
#===========================

INC += NIDAQmx.h

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
