#!/bin/bash
#
# Author  : Jeong Han Lee
# email   : jhlee@ibs.re.kr
# Date    : Tuesday, March  3 15:46:24 KST 2015
# version : 0.0.1
#
#  * I intend to write this script in order to initialize 
#    all settings for Keithley 6514 before the current measurement.
# 
#
#  * caput should be in
#    ${HOME}/epics/R3.14.12.4/base/bin/linux-x86_64/caput
#
#  * After start IOC, execute "bash init.sh"

#           0.0.1 created
# 
#  

caput  ECR11-Diag:FC01:Rst 1
caput  ECR11-Diag:FC01:SetZeroCheck 1
caput  ECR11-Diag:FC01:SetFunction curr
caput  ECR11-Diag:FC01:SetCurrRange "20 pA"
caput  ECR11-Diag:FC01:SetZeroCorrect 1
caput  ECR11-Diag:FC01:CurrAutoRangeEnable Auto
caput  ECR11-Diag:FC01:SetZeroCheck 0
caput  ECR11-Diag:FC01:SetLineFreq 60
caput  ECR11-Diag:FC01:SetADRate Med
#caput  ECR11-Diag:FC01:SetADRate Fast
caput  ECR11-Diag:FC01:MeasureCurrent 0
