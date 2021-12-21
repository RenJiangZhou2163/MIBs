--  $Id: zxr10switch.mib 8 2005-04-05 12:17:08Z taowq $
--
--  zxr10switch.mib: ZXR10 Switch MIB file
--  
--  Mar. 2005, Tao wenqiang
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                                         "VLAN translation" �"ZTE Corporation

                Nanjing Institute of ZTE Corporation

                No.68 ZiJinghua Rd. YuHuatai District, Nanjing, China

                Tel: +86-25-52870000" "201607111000Z" "201502061000Z" "201312131000Z" "200811100000Z" `"modify: the descriptions of some leafs of
                zxr10CpuVlanTransTable are changed." f"modify: add descriptions for zxr10CpuVlanTransPortEntry and
                zxr10CpuVlanTransEntry." `"modify: the descriptions of some leafs of
                zxr10CpuVlanTransTable are changed." %"Initial version of this MIB module."               �"The VLAN trans port table,in which you can find which ports can be
             configed and also know the relation with the port's name and 
             ifindex."                       ""The VLAN trans port table entry."                       u"The name of this port which can be configed by vlan trans ,it
            include physics port and smartgroup port"                       #"The VLAN trans information table."                       )"The VLAN trans information table entry."                       Z"The VLAN trans session id (It's toplimit depends on ability of the
            device)."                      P"The index of ingress-port of VLAN trans. Every port have a unique
            index, for example the index of gei-0/1/0/1 is 5,so you can input 5
            represent the port gei-0/1/0/1 and you can find the relationship
            between them in zxr10CpuvlantransPortTable in which there is only
            one ingress-port."                      J"The index of egress-port of VLAN trans. Every port have a unique
           index, for example the index of gei-0/1/0/2 is 6,so you can input 6
           represent the port gei-0/1/0/2 and you can find the relationship
           between them in zxr10CpuvlantransPortTable in which there is only
           one egress-port."                       �"The advance flag of VLAN trans session, the valid vlaue is 0 or 1.
            If the VLAN trans session have uplink port the value is 1,otherwise
            is 0."                      o"The indexs of uplink port in VLAN transvlan table. Every port have
            a unique index, for example the index of gei-0/1/0/2 is 6,so you
            can input 6 represent the port gei-0/1/0/2 and you can find the
            relationship between them in zxr10CpuvlantransPortTable. The max
            number of uplink port in a VLAN trans table is four."                       2"The flag of create or delete VLAN trans session."                       a"The VLAN trans's ex-inner vlan ,the value is vlan id such as 100,
            only one number."                       b"The VLAN trans's ex-outner vlan ,the value is vlan id such as 100,
            only one number."                      "The VLAN trans inner of invlan ,which input vlan id's range id 1-
            4094,such as '3-4,6,1000-1024',the value of inner vlan is a range
            and also can be one value such as 500.if the input is NO Data
            you must get vlan bitmap."                      "The VLAN trans outner of invlan ,which input vlan id's range id 1-
            4094,such as '1-10,34,40,1025-1200,2044,2048',the value of outner
            invlan is a range and also can be one value such as 2000.if the
            input is NO Data you must get vlan bitmap."                       �"The VLAN trans inner of invlan bitMap (1-1023),which input vlan
            id's range id 1-1023,such as '3-4,6,1000-1023',the value of inner
            invlan is a range and also can be one value such as 500."                       �"The VLAN trans inner of invlan bitMap (1024-2047),which input vlan
            id's range id 1024-2047,such as '1024-1200,2044,2048',the value of
            inner invlan is a range and also can be one value such as 2000."                       �"The VLAN trans inner of invlan bitMap (2048-3071),which input vlan
            id's range id 2048-3071,such as '2500-2570,3000,3071',the value of
            inner invlan is a range and also can be one value such as 2485."                       �"The VLAN trans inner of invlan bitMap (3072-4094),which input vlan
            id's range id 3072-4094,such as '3080-3811,3900,4094',the value of
            inner invlan is a range and also can be one value such as 3900."                       �"The VLAN trans outner of invlan bitMap (1-1023),which input vlan
            id's range id 1-1023,such as '3-4,6,1000-1023',the value of outner
            invlan is a range and also can be one value such as 500."                       �"The VLAN trans outner ofinvlan bitMap (1024-2047),which input vlan
            id's range id 1024-2047,such as '1025-1200,2044,2047',the value of
            outner invlan is a range and also can be one value such as 2000."                       �"The VLAN trans outner of invlan bitMap (2048-3071),which input
            vlan id's range id 2048-3071,such as '2500-2570,3000,3071',the
            value of outner invlan is a range and also can be one value such
            as 2485."                       �"The VLAN trans outner of invlan bitMap (3072-4094),which input
            vlan id's range id 3072-4094,such as '3080-3811,3900,4094',the
            value of outner inner invlan is a range and also can be one
            value such as 3900."                              