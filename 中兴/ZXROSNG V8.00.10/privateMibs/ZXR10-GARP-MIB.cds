I--  *****************************************************************
-- Name:  zxr10-garp-mib  
-- Brief: ZXR10 GARP config and query MIB file  
-- Time:  July. 2013, xiaguibin10102488
-- Copyright (c) 2013 by ZTE corporation. 
-- All rights reserved.
-- *****************************************************************
   c"Port GARP registration mode: 1 for normal, 
                       2 for forbidden, 3 for fixed."               ]"A simple status value for the object, 
                       1 for disable, 2 for enable."                                                                                     0"The MIB module to describe GARP/GVRP protocol." |"
            Name:  Xia guibin
            Tel:   +86-25-52870000
            Email: xia.guibin@zte.com.cn
           " "201401060911Z" "201310211000Z""1.MAX-ACCESS of leaf zxr10GarpPortCfgRegMode is changed from read-write to read-only.
             2.MAX-ACCESS of leaf zxr10GvrpGlobalStatus is changed from read-write to read-only
             3.MAX-ACCESS of leaf zxr10GvrpPortCfgStatus is changed from read-write to read-only" $"Initial version of this MIB module"       -- 2014-01-06 09:11 
               5"The GARP hold time value, ZTE corporation privated."                       >"The GARP join time value, IEEE 802.1Q/D11 Section 12.10.2.1."                       ?"The GARP leave time value, IEEE 802.1Q/D11 Section 12.10.2.2."                       C"The GARP leave all time value, IEEE 802.1Q/D11 Section 12.10.2.2."                           g"The table contain information controlling GARP configuration 
             for a port on the device."                       |"Information controlling GARP configuration for a port 
             on the device. This is indexed by Zxr10GarpPortEntry."                       "The port name."                       :"The registration mode of port: normal, forbidden, fixed."                              B"The administrative status requested by management for GVRP. 
             The value enabled(2) indicates that GVRP should be enabled 
             on this device, on all ports for which it has not been 
             specifically disabled. When disabled(1), GVRP is disabled on 
             all ports and all GVRP packets will be forwarded transparently. 
             This object affects all GVRP Applicant and Registrar 
             state machines. A transition from disabled(1) to enabled(2) 
             will cause a reset of all GVRP state machines on all ports."                           f"The table contain information controlling GVRP configuration
             for a port on the device."                       ~"Information controlling GVRP configuration for a port 
             on the device. This is indexed by zxr10GvrpPortCfgName."                       "The port name."                      �"The state of GVRP operation on this port. The value enabled(2) 
             indicates that GVRP is enabled on this port, as long as 
             zxr10GvrpGlobalStatus is also enabled for this device. 
             When disabled(1) but zxr10GvrpGlobalStatus is still enabled 
             for the device, GVRP is disabled on this port: 
             any GVRP packets received will be silently discarded and 
             no GVRP registrations will be propagated from other ports. 
             This object affects all GVRP Applicant and 
             Registrar state machines on this port.
             A transition from disabled(1) to enabled(2) will cause 
             a reset of all GVRP state machines on this port."                       a"The table contain the GVRP statistic information query for 
             a port on the device."                       y"The GVRP statistic information query for a port on the device. 
             This is indexed by zxr10GvrpPortStatName."                       "The port name."                       \"The total number of failed GVRP registrations, for any reason,
             on this port."                       W"The source MAC address of the last GVRP message received on 
             this port."                       r"The VLAN information which learned by GVRP in this port. 
             VLAN information is organized by BitMap."                                  