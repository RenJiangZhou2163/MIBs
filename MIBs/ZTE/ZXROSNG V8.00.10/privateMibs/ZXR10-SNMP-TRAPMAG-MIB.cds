�-- *****************************************************************
-- $Id: zxr10SNMPTrapMagMib.mib  2009-11-23 08:47:59Z zhaoqicheng $
--
-- zxr10SNMPTrapMagMib.mib: ZTE Corporation Enterprise Structure of Management 
-- Information
--
-- Copyright (c) 2009 by ZTE Corporation
-- All rights reserved.
-- *****************************************************************
--
                                                                         ;"The MIB module to describe the information for SNMP trap." v"ZTE Corporation about snmp_private_trap_enable 
                      Structure Structure of Management Information" "201709261200Z" "201211261200Z" "200504120000Z" ]"Add all(255) for zxr10SnmpTrapEnableType.
                      Add zxr10SnmpTrapSvrTable."�"Obsolete zxr10SnmpEnableTrap,
                               zxr10SnmpEnableTrapBgp,
                               zxr10SnmpEnableTrapOspf,
                               zxr10SnmpEnableTrapRmon,
                               zxr10SnmpEnableTrapSnmp,
                               zxr10SnmpEnableTrapStalarm,
                               zxr10SnmpEnableTrapVpn.
                      Add zxr10SnmpTrapEnableTable. " %"Initial version of this MIB module."                   8"An integer description all of the zxr10SnmpEnableTrap."                       7"An integer description of the zxr10SnmpEnableTrapBgp."                       8"An integer description of the zxr10SnmpEnableTrapOspf."                       8"An integer description of the zxr10SnmpEnableTrapRmon."                       8"An integer description of the zxr10SnmpEnableTrapSnmp."                       ;"An integer description of the zxr10SnmpEnableTrapStalarm."                       7"An integer description of the zxr10SnmpEnableTrapVpn."                       -"snmp Trap Enable entity configuration table"                       -"snmp Trap Enable entity configuration entry"                       "trap type"                       "trap type RowStatus"                       -"SNMP trap server entity configuration table"                       -"SNMP trap server entity configuration entry"                       "The VRF name."                       �"The trap server IPv4 address. If the server address type is IPv6, 
             the value of zxr10TrapSvrIpv4Address is '00000000'H ."                       �"The trap server IPv6 address. If the server address type is IPv4, 
             the value of zxr10TrapSvrIpv6Address is 
             '00000000000000000000000000000000'H ."                       �"If the zxr10TrapSvrVersion is v1/v2c, this value means community.
             If the zxr10TrapSvrVersion is v3, this value means user name."                       �"Trap format.
             snmpTrap   - trap is sent to server and no confirm is needed
             snmpInform - need the confirm from a server."                       "The SNMP version."                       �"SNMPv3 security level.
             noAuthNoPriv - without authentication and without privacy,
             authNoPriv   - with authentication but without privacy,
             authPriv     - with authentication and with privacy."                       ."The received port number of the trap server."                      E"The status of this conceptual row.
            
             The supported actions of this conceptual row only include:
             'createAndGo' and 'destroy'.

             To create a row in this table, a manager must set this object to 
             createAndGo(4), and must comply with the multi-variables binding 
             rule described in zxr10SnmpTrapSvrEntry.
    
             To delete a row in this table, a manager must set this object to 
             destroy(6). 
             
             To get this object, the agent always returns active(1)."                          