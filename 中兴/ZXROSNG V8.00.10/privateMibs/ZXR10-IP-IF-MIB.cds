Q--  ************************************************
--  $Id: ZXR10-IP-IF.mib 13 2005-07-13 01:01:26Z taowq $
--
--  zxr10-IP-IF.mib: ZXR10 IP Interface Configuration MIB file
--  
--  Jun. 2005, Tao wenqiang
--   
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   �"IP address type, the value of 1 indicates that the primary address, 
             the value of 2 indicates that the secondary address"                                                     %"ZXROS v4.6.02 Interfaces config MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201308270000Z" "201305030000Z" "201304070900Z" "201303210000Z" "200504120000Z" R"Change the SYNTAX INTEGER into Interfer32 of the leaf zxr10IfIPAddrConfigIfIndex"R"Import SNMP data type:DisplayString,TEXTUAL-CONVENTION;
              Change RFC1155-SMI into SNMPv2-SMI;
              Delete data type definition:DisplayString;
              Correct the definition of Type IpAddrAttr;
              Change SEQUENCE identifier to startwith upper case;
              Change SYNTAX INTEGER into Integer32" ."Add description for zxr10IfIPAddrConfigTable" "Be consistent with the needs" ""                       "Ip address config table."                       ""                       ("The main Ip address on this interface "                       2"The mask of primary Ip address on this interface"                       )"The Broadcast address on this interface"                      4"This object is used to manage creation and deletion of rows
         in this table.

         zxr10IpAddrRowStatus must be set to 'creatAndGo' to create 
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
         should be packed in the same PDU."                       "Interface name"                       $"Secondary Ip address config table."                       ""                       *"  Secondary Ip address on this interface"                       *"  Secondary Ip mask on this interface   "                      ="This object is used to manage creation and deletion of rows
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
         should be packed in the same PDU."                       "  Interface name   "                       4" IP address config table ,just for vbui interfaces"                       g"An entry for IP address config table,
                         which is just used for vbui interfaces"                       3"The vbui interface name ,which has IP address(es)"                       3"The vbui interface index,which has IP address(es)"                       ?"The flag used to indicate Primary or Secondary IP address(es)"                       $"The IP address of a vbui interface"                       )"The IP address mask of a vbui interface"                       ]"This object is used to manage creation and deletion of rows
                  in this table"                                  