TOP=..
include $(TOP)/configure/CONFIG
#=======================================

# Build devMoxa as a library for an IOC:
LIBRARY_IOC += devMoxa

# Library Source files
devMoxa_SRCS += devGenesys.c devUp550.c devFug.c devDGH.c

# Link with the asyn and base libraries
#devMOBIIXA_LIBS += autosave
devMoxa_LIBS += asyn
devMoxa_LIBS += $(EPICS_BASE_IOC_LIBS)

# Install .dbd and .db files
DBD += devGenesys.dbd devUp550.dbd devFug.dbd devDGH.dbd
DB_INSTALLS += devGenesys.db devUp550.db devFug.db devDGH.db

#=======================================
include $(TOP)/configure/RULES
