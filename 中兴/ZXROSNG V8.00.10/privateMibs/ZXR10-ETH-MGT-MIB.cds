e--  ************************************************
--  $Id: ZXR10-ETH-MGT.mib 12 2005-07-13 01:01:17Z taowq $
--
--  ZXR10-ETH-MGT.mib: ZXR10 ethnet query and  configuration MIB file
--  
--  Jun. 2005, Tao wenqiang
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   "Ethnet physical status"              �"A unique value, greater than zero, for each interface or
            interface sub-layer in the managed system.  It is
            recommended that values are assigned contiguously starting
            from 1.  The value for each interface sub-layer must remain
            constant at least from one re-initialization of the entity's
            network management system to the next re-initialization."               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               *"Ethnet encapsulation type such as 802.1Q"               "Ethnet loopback"                                                                                     2"ZXROS v4.6.03 ethnet query and configuration MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201510160000Z" "201501120000Z" "201407220900Z" "201305290900Z" "200504120000Z" �"Change SYNTAX of the node zxr10EthVlanNo from INTEGER(1..64) to INTEGER(1..4094).
     Change SYNTAX of the node zxr10EthSupervlanNo from INTEGER(1..64) to INTEGER(1..4096)," 7"Add zxr10EthRecvPktsOverRun in zxr10EthRecvStatsTable" �"Add new type port_type_mgmt_eth in data type IfPortType.
      Change the description of zxr10EthPhyIfTable.
      Add the description of Zxr10EthPhyIfEntry.""Add deprecated objects,including zxr10EthSubIfConfigVlanID 
      and the zxr10EthSubIfConfigEncapType.
      Del deprecated objects in favour of zxr10EthPhyPortTable,
      including zxr10EthPhyIfJumbo,zxr10EthPhyMdixOrMdi,zxr10EthPhyIpg,etc.
      Import SNMP data type:Counter32,TEXTUAL-CONVENTION,
      IpAddress,TimeStamp,DisplayString and PhysAddress.
      Delete data type definition:JumboFrame,LanWanProperty.
      Change SYNTAX INTEGER into Integer32.Correct  enumerated 
      labels containing hyphen." ""                           !"Sub interface cnfigration table"                       ""                       "Parent interface ifIndex"                       " Parent interface name"                       "Sub interface ifIndex "                       "Sub interface name"                       "Vlan ID of this sub interface"                       *"Ethnet encapsulation type such as 802.1Q"                      M"This object is used to manage creation and deletion of rows
         in this table.

         zxr10SecondaryIpAddrRowStatus must be set to 'creatAndGo' to create 
         an entry and set to 'destroy' to delete an entry.

         The value in any column may be modified any time even the
         value of this entry rowStatus object is 'active'.

         Caution has to be taken before destroying any entry. 
         Example: Need to change the IP address of an interface,
         which provides sole network connectivity.
         This has to be done by destroying the entry and creating
         a new one. The device would loose network connectivity
         after the entry is destroyed. In this case, the destroy 
         of the old entry and the creation on the new entry
         should be packed in the same PDU."                       !"Ethnet loopback interface table"                       ""                       #"Ethnet loopback interface ifIndex"                       ""Ethnet loopback interface ifName"                       &"Ethnet loopback interface LoopBackNo"                       %"Ethnet loopback interface RowStatus"                       "Ethnet vlan interface table"                       ""                       "Ethnet vlan interface ifIndex"                       "Ethnet vlan interface ifName"                       "Ethnet vlan interface VlanNo"                       !"Ethnet vlan interface RowStatus"                       ""Ethnet Supervlan interface table"                       ""                       $"Ethnet Supervlan interface ifIndex"                       #"Ethnet Supervlan interface ifName"                       ("Ethnet Supervlan interface SupervlanNo"                       &"Ethnet Supervlan interface RowStatus"                       <"Ethnet configuration table, including Management Ethernet."                       }"An entry containing physical properties applicable to 
             a particular interface(including Management Ethernet)."                       #"Physical Ethnet interface ifIndex"                       ""Physical Ethnet interface ifName"                       $"Physical Ethnet interface WorkType"                       #"Physical Ethnet interface ifSpeed"                       g"The MTU is the size of the maximum transmission unit (MTU) that TCP/IP uses for the network interface"                       %"Physical Ethnet interface PortType "                       )"Physical Ethnet interface PortProperty "                       ("Physical Ethnet interface AvailStatus "                       '"Physical Ethnet interface OperStatus "                       	"MacAddr"                       "SpeedIndeed"                       $"zxr10EthPhyIfAvailStatusTimeLength"                       %"zxr10EthPhyIfAvailStatusSwitchTimes"                           "Ethnet configuration table"                       ""                       #"Physical Ethnet interface ifIndex"                       2"Physical Ethnet interface RecvPktsUnder64Octects"                       -"Physical Ethnet interface RecvPkts64Octects"                       2"Physical Ethnet interface RecvPkts65to127Octects"                       3"Physical Ethnet interface RecvPkts128to255Octects"                       3"Physical Ethnet interface RecvPkts255to511Octects"                       4"Physical Ethnet interface RecvPkts512to1023Octects"                       5"Physical Ethnet interface RecvPkts1024to1518Octects"                       ,"Physical Ethnet interface RecvPktsOverSize"                       ,"Physical Ethnet interface RecvPktsCRCError"                       "Default notClear"                       +"Physical Ethnet interface RecvPktsOverRun"                       "Ethnet configuration table"                       ""                       #"Physical Ethnet interface ifIndex"                       1"Physical Ethnet interface SndPktsUnder64Octects"                       ,"Physical Ethnet interface SndPkts64Octects"                       1"Physical Ethnet interface SndPkts65to127Octects"                       2"Physical Ethnet interface SndPkts128to255Octects"                       2"Physical Ethnet interface SndPkts255to511Octects"                       3"Physical Ethnet interface SndPkts512to1023Octects"                       4"Physical Ethnet interface SndPkts1024to1518Octects"                       +"Physical Ethnet interface SndPktsOverSize"                       "Default notClear"                       ""                       ""                       ""                       ""                           l"The number of EthPhy interfaces (regardless of
              their current state) present on this system."                           !"Ethnet oneminutepeakvalue table"                       ""                       #"Physical Ethnet interface ifIndex"                       :"Physical Ethnet interface OneMinutePeakValueInSingleCast"                       >"Physical Ethnet interface OneMinutePeakValueInSingleCastTime"                       9"Physical Ethnet interface OneMinutePeakValueInMultiCast"                       ="Physical Ethnet interface OneMinutePeakValueInMultiCastTime"                       9"Physical Ethnet interface OneMinutePeakValueInBroadCast"                       ="Physical Ethnet interface OneMinutePeakValueInBroadCastTime"                       :"Physical Ethnet interface OneMinutePeakValueInTotalError"                       >"Physical Ethnet interface OneMinutePeakValueInTotalErrorTime"                       ;"Physical Ethnet interface OneMinutePeakValueOutSingleCast"                       ?"Physical Ethnet interface OneMinutePeakValueOutSingleCastTime"                       :"Physical Ethnet interface OneMinutePeakValueOutMultiCast"                       >"Physical Ethnet interface OneMinutePeakValueOutMultiCastTime"                       :"Physical Ethnet interface OneMinutePeakValueOutBroadCast"                       >"Physical Ethnet interface OneMinutePeakValueOutBroadCastTime"                       ;"Physical Ethnet interface OneMinutePeakValueOutTotalError"                       ?"Physical Ethnet interface OneMinutePeakValueOutTotalErrorTime"                              