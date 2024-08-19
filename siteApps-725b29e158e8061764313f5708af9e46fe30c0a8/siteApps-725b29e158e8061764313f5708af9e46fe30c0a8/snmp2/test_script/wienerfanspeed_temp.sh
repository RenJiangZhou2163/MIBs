#!/bin/bash

x=1

while [ $x ]; do  
#++

for i in {1200..2200..100};do

echo ""
echo "COUNT : $x"
echo ""
x=$(( $x + 1 ))

echo "***************************************************************"
caget SNMPIOC:TIMESTAMP
echo "---------------------------------------------------------------"
echo "caget ---------------------------------------------------------"
caget WIENER:CRATE3_MainPower_R WIENER:CRATE3_PS_Status WIENER:CRATE3_FanairTemp WIENER:CRATE3_FanNominalSpeed_R WIENER:CRATE3_FanNominalSpeed_W
echo "snmpget -------------------------------------------------------"
snmpget -v 1 -c public 10.1.5.123 WIENER-CRATE-MIB::sysMainSwitch.0  WIENER-CRATE-MIB::sysStatus.0  WIENER-CRATE-MIB::fanAirTemperature.0 WIENER-CRATE-MIB::fanNominalSpeed.0
echo "caput ---------------------------------------------------------"
caput WIENER:CRATE3_FanNominalSpeed_W $i
# echo "snmpset -------------------------------------------------------"
# snmpset -v 3 -u admin -l authPriv -a MD5 -A MySecret -x DES -X MySecret 10.1.5.123 WIENER-CRATE-MIB::fanNominalSpeed.0 i $i
# echo $i
sleep 10
done

#--

for i in {2100..1300..100};do

echo ""
echo "COUNT : $x"
echo ""
x=$(( $x + 1 ))

echo "***************************************************************"
caget SNMPIOC:TIMESTAMP
echo "---------------------------------------------------------------"
echo "caget ---------------------------------------------------------"
caget WIENER:CRATE3_MainPower_R WIENER:CRATE3_PS_Status WIENER:CRATE3_FanairTemp WIENER:CRATE3_FanNominalSpeed_R WIENER:CRATE3_FanNominalSpeed_W
echo "snmpget -------------------------------------------------------"
snmpget -v 1 -c public 10.1.5.123 WIENER-CRATE-MIB::sysMainSwitch.0  WIENER-CRATE-MIB::sysStatus.0  WIENER-CRATE-MIB::fanAirTemperature.0 WIENER-CRATE-MIB::fanNominalSpeed.0
echo "caput ---------------------------------------------------------"
caput WIENER:CRATE3_FanNominalSpeed_W $i
# echo "snmpset -------------------------------------------------------"
# snmpset -v 3 -u admin -l authPriv -a MD5 -A MySecret -x DES -X MySecret 10.1.5.123 WIENER-CRATE-MIB::fanNominalSpeed.0 i $i
# echo $i
sleep 10
done
done