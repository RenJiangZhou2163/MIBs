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
#DB += xxx.db
DB += xerox.vdb
DB += timestamp.vdb
DB += alive.db

DB += access.db 
DB += iocAdminSoft.db
DB += iocEnvVar.db
DB += iocScanMon.db
DB += iocAdminVxWorks.db
DB += iocGeneralTime.db
DB += iocScanMonSum.db
DB += iocAdminRTEMS.db
DB += iocRTEMSOnly.db
DB += iocVxWorksOnly.db
DB += iocCluster.db
DB += iocAdminScanMon.db
DB += ioc.db
DB += iocRTOS.db


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

