O--  ************************************************
--  $Id: zxr10-VXLAN-MIB.mib 8 2013-11-05 12:17:08Z xiaguibin $
--
--  ZXR10-VXLAN-MIB.mib: ZXR10 VXLAN MIB file
--
--  Mar. 2014, Yan Zhihong
--   
--  Copyright(c) 2014 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                         5"The MIB module to describe VXLAN table information." ~"
            Name:  Yan zhihong
            Tel:   +86-25-52870000
            Email: yan.zhihong@zte.com.cn
           " "201608161500Z" "201601141314Z" "201409161314Z" �"   add : 
            zxr10MapL2InterfaceIngressTagAsPayload
            obsolete:
            zxr10MapL2InterfaceVlanId
        ""   add : 
            zxr10VtepMulticastV4Table,
            zxr10VtepMulticastV6Table,
            zxr10VxlanDescription,
            zxr10VxlanUnknowUnicast,
            zxr10VxlanFilterVrrp
            obsolete:
            zxr10VxlanMulticastTable
        " $"Initial version of this MIB module"       -- 2016-08-16 15:00 
            "Configuration of global VXLAN."                           "The VXLAN information table."                       "The VXLAN table entry."                       "The VXLAN ID."                       "The map type of VXLAN."                       "The description of VXLAN."                       %"The unknow unicast policy of VXLAN."                       ""The VRRP filter policy of VXLAN."                       +"The VXLAN mapping VLAN information table."                       "The VXLAN mapping VLAN entry."                       %"The VXLAN ID of mapping VLAN table."                       $"The VLAN ID of mapping VLAN table."                       8"The VXLAN mapping layer 2 interface information table."                       ,"The VXLAN mapping layer 2 interface entry."                       2"The VXLAN ID of mapping layer 2 interface table."                       1"The VLAN ID of mapping layer 2 interface table."       --obsolete
               @"The layer 2 interface name of mapping layer 2 interface table."                       E"The ingress tag as payload flag of mapping layer 2 interface table."                       8"The VXLAN mapping layer 3 interface information table."                       ,"The VXLAN mapping layer 3 interface entry."                       2"The VXLAN ID of mapping layer 3 interface table."                       @"The layer 3 interface name of mapping layer 3 interface table."                       *"The VXLAN mapping MAC information table."                       "The VXLAN mapping MAC entry."                       $"The VXLAN ID of mapping MAC table."                       "The MAC of mapping MAC table."                       ("The VXLAN multicast information table."                       "The VXLAN multicast entry."                       ""The VXLAN ID of multicast table."                       "The IP of multicast table."                       "The VTEP information table."                       "The VTEP entry."                       "The VTEP name of VTEP table."                       "The mode of VTEP table."                       ."The VTEP source Interface information table."                       ""The VTEP source Interface entry."                       /"The VTEP name of VTEP source interface table."                       ;"The source interface name of VTEP source interface table."                       ("The VTEP bind VXLAN information table."                       "The VTEP bind VXLAN entry."                       )"The VTEP name of VTEP bind VXLAN table."                       ("The VXLAN ID of VTEP bind VXLAN table."                       *"The vtep multicast v4 information table."                       "The VTEP multicast v4 entry."                       &"The VTEP name of multicast v4 table."                       "The IP of multicast v4 table."                       *"The VTEP multicast v6 information table."                       "The VTEP multicast v6 entry."                       &"The VTEP name of multicast v6 table."                       "The IP of multicast v6 table."                                                          