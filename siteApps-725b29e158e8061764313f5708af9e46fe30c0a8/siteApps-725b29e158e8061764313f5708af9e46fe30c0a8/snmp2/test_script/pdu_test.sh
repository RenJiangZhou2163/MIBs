#!/bin/bash

x=1

while [ $x ]; do  
echo ""
echo "COUNT : $x"
echo ""
x=$(( $x + 1 ))

#on
echo "***************************************************************"
caget SNMPIOC:TIMESTAMP
echo "---------------------------------------------------------------"
echo "caget ---------------------------------------------------------"
caget APC:PDU2_Outlet8_R
caget APC:PDU2_Outlet8_W
echo "snmpget -------------------------------------------------------"
snmpget -v 1 -c public 10.1.5.142 PowerNet-MIB::sPDUOutletCtl.8
echo "caput ---------------------------------------------------------"
caput APC:PDU2_Outlet8_W 1
sleep 5

echo ""
echo "COUNT : $x"
echo ""
x=$(( $x + 1 ))

#off
echo "***************************************************************"
caget SNMPIOC:TIMESTAMP
echo "---------------------------------------------------------------"
echo "caget ---------------------------------------------------------"
caget APC:PDU2_Outlet8_R
caget APC:PDU2_Outlet8_W
echo "snmpget -------------------------------------------------------"
snmpget -v 1 -c public 10.1.5.142 sPDUOutletCtl.8
echo "caput ---------------------------------------------------------"
caput APC:PDU2_Outlet8_W 2
sleep 5
done

