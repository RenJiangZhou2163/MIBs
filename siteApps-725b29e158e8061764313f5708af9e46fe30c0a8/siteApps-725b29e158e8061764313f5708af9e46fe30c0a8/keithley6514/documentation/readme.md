# bash documentation/readme.md

caput  ECR11-Diag:FC01:Rst 1
caput  ECR11-Diag:FC01:SetZeroCheck 1
caput  ECR11-Diag:FC01:SetFunction curr
caput  ECR11-Diag:FC01:SetCurrRange "20 pA"
caput  ECR11-Diag:FC01:SetZeroCorrect 1
caput  ECR11-Diag:FC01:CurrAutoRangeEnable Auto
caput  ECR11-Diag:FC01:SetZeroCheck 0
caput  ECR11-Diag:FC01:SetLineFreq 60
caput  ECR11-Diag:FC01:SetADRate Med
caput  ECR11-Diag:FC01:MeasureCurrent 0



#caget  ECR11-Diag:FC01:GetSystemError
#caput  ECR11-Diag:FC01:SetNPLC 0.1
#caput  ECR11-Diag:FC01:SetADRate Med
