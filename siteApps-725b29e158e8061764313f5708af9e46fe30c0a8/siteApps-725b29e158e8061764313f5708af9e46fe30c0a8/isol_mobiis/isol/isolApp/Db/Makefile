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
DB += devNiCtrl_Steerers.db devNiCtrl_Steerers_CTRL.db devNiCtrl_EQT.db devNiCtrl_EQT_CTRL.db PLC_Vacuum.db pid_control.db pid_control_Steerers_ctrl.db pid_control_EQT_ctrl.db
#DB += PLC_Vacuum.db


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

