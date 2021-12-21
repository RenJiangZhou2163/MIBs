E--  ************************************************
--  $Id: zxr10switch.mib 8 2005-04-05 12:17:08Z taowq $
--
--  zxr10switch.mib: ZXR10 Switch MIB file
--
--  Mar. 2005, Tao wenqiang
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   '"A simple status value for the object."               "Value of TPID."                                                                 ("The MIB module to describe SwitchVlan." f"Yan Zhihong
             Tel:15805158932
             E-Mail: yan.zhihong@zte.com.cn
            " "201603181000Z" "201602291000Z" "201502061000Z" "201405231000Z" "201312131000Z" "201303061000Z" "200810210000Z""   add:
            zxr10SwitchVlanInstanceTable,
            zxr10SwitchVlanInstanceEntry,
            zxr10SwitchVlanInstanceId,
            zxr10SwitchVlanTagPrioirty,   
            format:
            zxr10SwitchVlanGlobal,
            zxr10SwitchVlanPortTable
        " K"   add:
            zxr10SwitchportTrunkAllowAllVlan          
        ""modify:add descriptions for zxr10CpuVlanPvidEntry,
                zxr10QinQEntry,zxr10MemberShipEntry and
                zxr10SwitchVlanPortEntry;
                zxr10DefaultVlanEnable,zxr10QinQInterTpid 
                and zxr10QinQExtTpid DEFVAL
        " 7"modify:zxr10SwportTagTrunkNativeVlan DEFVAL
        " |"modify:the descriptions of some leafs of zxr10MemberShipTable 
                    and zxr10CpuVlanPvidTable are changed." a"add:zxr10SwitchVlanMIB
                 EnabledStatus
                 TPIDType
            " "ZXROS SWITCH MIB"       -- 2016-03-18 10:00
           "The VLAN information table."                       #"The VLAN information table entry."                       "The VLAN id (1-4094)"                       !"The VLAN entry -> L3 interface "                       "The VLAN MTU size"                       /"The VLAN l2/l3 switch flag:enable or disnable"                       '"Security Association Identifier(SAID)"                       "The VLAN entry -> Vpnid"                       $"The flag of create or delete VLAN "                       "The VLAN name"                        "The PVID port members of VLAN "                       !"The untag port members of VLAN "                       "The tag port members of VLAN "                           8"Switchport QinQ(802.1q in 802.1q) configuration table."                       ,"Switchport QinQ configuration table entry."                       "The name of this port"                       "The qinq mode of switchport "                       "The qinq TPID of switchport "                       #"The native vlan id of switchport "                       �"The extensive qinq TPID of switchport,valid value is 1-5,they separately
            mean 8100 88a8 9100 9200 9300,it can be set by different project."                       �"The global internal qinq TPID,valid value is 1-5,they separately
            mean 8100 88a8 9100 9200 9300,it can be set by different project."                           ("The VLAN membership information table."                       ."The VLAN membership information table entry."                       "The name of this port"                       &"The native VLAN id of this interface"                       ""The VLAN mode of this interface."                       "The VLAN tag bitMap (1-1024) "                       0"The VLAN untag bitMap(1-1024) of hybrid ports "                       "The VLAN bitMap (1025-2048) "                       3"The VLAN untag bitMap(1025-2048) of hybrid ports "                       ""The VLAN tag bitMap (2049-3072) "                       3"The VLAN untag bitMap(2049-3072) of hybrid ports "                        "The VLAN tag bitMap(3073-4094)"                       3"The VLAN untag bitMap(3073-4094) of hybrid ports "                       "The VLAN tag of hybrid ports."                       !"The VLAN untag of hybrid ports."                               /"If this object is true, then it default-vlan."                       "The switch VLAN enable table."                       %"The switch VLAN enable table entry."                       "the name of switchport."                       O"If this object is true, then it enables the switchport tag trunk native vlan."                       �"The interface is in trunk mode,  
            enabled, allow all VLAN packets pass the interface.
            disabled, only matched VLAN packets can pass the interface. "                       "The switch VLAN config table."                       %"The switch VLAN config table entry."                       "The switch VLAN ID."                       ;"The VLAN tag priority, the value 0xFF means unconfigured."                              