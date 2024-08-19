TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += alive.db
#DB += access.db 
#DB += iocAdminSoft.db
#DB += iocEnvVar.db
#DB += iocScanMon.db
#DB += iocGeneralTime.db
#DB += iocScanMonSum.db
#DB += iocCluster.db
#DB += iocAdminScanMon.db
#DB += ioc.db
#DB += iocRTOS.db
DB_INSTALLS +=${EPICS_SYNAPPS}/alive-1-0/db/alive.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/access.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocAdminSoft.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocEnvVar.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocScanMon.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocGeneralTime.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocScanMonSum.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocCluster.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocAdminScanMon.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/ioc.db
DB_INSTALLS +=${EPICS_SYNAPPS}/devIocStats-3-1-13/db/iocRTOS.db
#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

