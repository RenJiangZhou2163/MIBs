 --  ******************************************************
--  $Id: ZXR10-ACL-NEW-MIB.mib  
--  
--  ZXR10-ACL-NEW-MIB
--  
--  Mar. 2013, Qian Yi 
--  
--  Copyright(c) 2010 by ZTE Corporaton
--  All rights reservered
--  ******************************************************
   "valid = 1,invalid = 2."               "permit = 1,deny = 2."               )"plus(+) = 1,minus(-) = 2,unset = 65535."                                                                     ."The MIB module to describe the ACL protocol." V"       Hu Jun
        Tel:    +86-25-52870000
        E-Mail: hu.jun11@zte.com.cn " "201707111500Z" "201707071000Z" "201706021000Z" "201608221000Z" "201608191000Z" "201607201000Z" "201601221000Z" "201512211000Z" "201512171000Z" "201504271500Z" "201501121500Z" "201409011500Z" "201405211700Z" "201404161000Z" "201402271400Z" "201401201500Z" "201312161000Z" "201308051500Z" "201305071400Z" "201304101400Z" �"add: zxr10ACLLinkRuleDsap,
              zxr10ACLLinkRuleSsap,
              zxr10ACLv4MixRuleDsap,
              zxr10ACLv4MixRuleSsap,
              zxr10ACLv6MixRuleDsap,
              zxr10ACLv6MixRuleSsap." �"add: zxr10ACLv4RulePrecRange,
              zxr10ACLv4RuleDscpRange,
              zxr10ACLLinkRuleInCosRange,
              zxr10ACLLinkRuleOutCosRange." ("add: zxr10ACLLinkRuleLinkProtocolMask." u"add: zxr10ACLv4RuleDescription
              zxr10ACLv6RuleDescription
              zxr10ACLLinkRuleDescription." �"modify syntax of which, such as zxr10ACLv4RuleIpProtocol, 
         zxr10ACLv6RuleIpProtocol,
         zxr10ACLv4MixRuleIpProtocol,
         zxr10ACLv6MixRuleIpProtocol to add INTEGER{sctp(132)}"o"add: zxr10ACLv6RuleSrcAddrMaskFlag
              zxr10ACLv6RuleSrcWildcardBits
              zxr10ACLv6RuleDestAddrMaskFlag
              zxr10ACLv6RuleDestWildcardBits.
         add: zxr10ACLv6MixRuleSrcAddrMaskFlag
              zxr10ACLv6MixRuleSrcWildcardBits
              zxr10ACLv6MixRuleDstAddrMaskFlag
              zxr10ACLv6MixRuleDstWildcardBits." "add: zxr10ACLv4VxlanObjects." "add: zxr10ACLUsrDefObjects." e"add: zxr10ACLUsrProtocolRuleDestMACWildcard and
              zxr10ACLUsrProtocolRuleAnyEtherType." �"modify: syntax of zxr10ACLLinkRuleLinkProtocol.
        modify: syntax and status of zxr10ACLv4MixRuleLinkProtocolEx.
        modify: syntax and status of zxr10ACLv6MixRuleLinkProtocolEx." ""add: zxr10ACLUsrProtocolObjects." V"add: zxr10ACLv4MixRuleLinkProtocolEx.
         add: zxr10ACLv6MixRuleLinkProtocolEx" "modify: MAX-ACCESS of URL." ""add: source and destination URL." ]"obsolete: zxr10ACLv4MixRuleLinkProtocol.
         obsolete: zxr10ACLv6MixRuleLinkProtocol." *"modify: index with DisplayString syntax." +"add: definitions about MAC address range." "modify: syntax of portValue." 9"modify: default and invalid valut about AclTcpFlagType." A"add:   zxr10ACLMIB
        Initial version of this MIB module."                           "IPv4 ACL Table"                       
"IPv4 ACL"                       /"Name of an IPv4 access-list (1-31 characters)"                       "IPv4 ACL Rule Table"                      !�"IPv4 ACL 
        effective leaf nodes: 
        A leaf node which is effective or not depends on the type of rule.
        Rule types include standard type,ip type,tcp type,udp type,icmp type,
        represented by zxr10ACLv4RuleIpProtocol in this table. 
        According to the rule type (zxr10ACLv4RuleIpProtocol), the following
        leaf nodes are effective. 
        1. rule type : std type
           effective leaf nodes: zxr10ACLv4RuleAclName ,
                                 zxr10ACLv4RuleRuleID, 
                                 zxr10ACLv4RulePermitDeny,
                                 zxr10ACLv4RuleSrcAddr,
                                 zxr10ACLv4RuleSrcWildcard,
                                 zxr10ACLv4RuleTimerangeName,
                                 zxr10ACLv4RuleSrcUrl,
                                 zxr10ACLv4RuleDescription
        2. rule type : ip type
           effective leaf nodes: zxr10ACLv4RuleAclName ,
                                 zxr10ACLv4RuleRuleID, 
                                 zxr10ACLv4RulePermitDeny,
                                 zxr10ACLv4RuleSrcAddr,
                                 zxr10ACLv4RuleSrcWildcard,
                                 zxr10ACLv4RuleDestAddr,
                                 zxr10ACLv4RuleDestWildcard,
                                 zxr10ACLv4RuleIpProtocol,
                                 zxr10ACLv4RulePrecedence,
                                 zxr10ACLv4RuleTOS,
                                 zxr10ACLv4RuleDSCP, 
                                 zxr10ACLv4RuleFragment,
                                 zxr10ACLv4RuleTtlOpr,
                                 zxr10ACLv4RuleTtlValue,
                                 zxr10ACLv4RuleTtlRange,
                                 zxr10ACLv4RuleTimerangeName,
                                 zxr10ACLv4RuleSrcUrl,
                                 zxr10ACLv4RuleDestUrl,
                                 zxr10ACLv4RuleDescription,
                                 zxr10ACLv4RulePrecRange,
                                 zxr10ACLv4RuleDscpRange
         3. rule type : tcp type
           effective leaf nodes: zxr10ACLv4RuleAclName,
                                 zxr10ACLv4RuleRuleID,
                                 zxr10ACLv4RulePermitDeny,
                                 zxr10ACLv4RuleSrcAddr,
                                 zxr10ACLv4RuleSrcWildcard,
                                 zxr10ACLv4RuleDestAddr,
                                 zxr10ACLv4RuleDestWildcard,
                                 zxr10ACLv4RuleIpProtocol,
                                 zxr10ACLv4RuleSrcPortOpr,
                                 zxr10ACLv4RuleSrcPortValue,
                                 zxr10ACLv4RuleSrcPortRange,
                                 zxr10ACLv4RuleDestPortOpr,
                                 zxr10ACLv4RuleDestPortValue,
                                 zxr10ACLv4RuleDestPortRange,
                                 zxr10ACLv4RuleTCPEstablish,
                                 zxr10ACLv4RulePrecedence,
                                 zxr10ACLv4RuleTOS,
                                 zxr10ACLv4RuleDSCP,
                                 zxr10ACLv4RuleFragment,
                                 zxr10ACLv4RuleRstFlag,
                                 zxr10ACLv4RuleAckFlag,
                                 zxr10ACLv4RuleFinFlag,
                                 zxr10ACLv4RuleSynFlag,
                                 zxr10ACLv4RulePshFlag,
                                 zxr10ACLv4RuleUrgFlag,
                                 zxr10ACLv4RuleTtlOpr,
                                 zxr10ACLv4RuleTtlValue,
                                 zxr10ACLv4RuleTtlRange,
                                 zxr10ACLv4RuleTimerangeName,
                                 zxr10ACLv4RuleSrcUrl,
                                 zxr10ACLv4RuleDestUrl,
                                 zxr10ACLv4RuleDescription,
                                 zxr10ACLv4RulePrecRange,
                                 zxr10ACLv4RuleDscpRange
          4. rule type : udp type
           effective leaf nodes: zxr10ACLv4RuleAclName,
                                 zxr10ACLv4RuleRuleID,
                                 zxr10ACLv4RulePermitDeny,
                                 zxr10ACLv4RuleSrcAddr,
                                 zxr10ACLv4RuleSrcWildcard,
                                 zxr10ACLv4RuleDestAddr,
                                 zxr10ACLv4RuleDestWildcard,
                                 zxr10ACLv4RuleIpProtocol,
                                 zxr10ACLv4RuleSrcPortOpr,
                                 zxr10ACLv4RuleSrcPortValue,
                                 zxr10ACLv4RuleSrcPortRange,
                                 zxr10ACLv4RuleDestPortOpr,
                                 zxr10ACLv4RuleDestPortValue,
                                 zxr10ACLv4RuleDestPortRange,
                                 zxr10ACLv4RulePrecedence,
                                 zxr10ACLv4RuleTOS,
                                 zxr10ACLv4RuleDSCP, 
                                 zxr10ACLv4RuleFragment,
                                 zxr10ACLv4RuleTtlOpr,
                                 zxr10ACLv4RuleTtlValue,
                                 zxr10ACLv4RuleTtlRange,
                                 zxr10ACLv4RuleTimerangeName,
                                 zxr10ACLv4RuleSrcUrl,
                                 zxr10ACLv4RuleDestUrl,
                                 zxr10ACLv4RuleDescription,
                                 zxr10ACLv4RulePrecRange,
                                 zxr10ACLv4RuleDscpRange
         5. rule type : icmp type
           effective leaf nodes: zxr10ACLv4RuleAclName,
                                 zxr10ACLv4RuleRuleID,
                                 zxr10ACLv4RulePermitDeny,
                                 zxr10ACLv4RuleSrcAddr,
                                 zxr10ACLv4RuleSrcWildcard,
                                 zxr10ACLv4RuleDestAddr,
                                 zxr10ACLv4RuleDestWildcard,
                                 zxr10ACLv4RuleIpProtocol,
                                 zxr10ACLv4RuleICMPType,
                                 zxr10ACLv4RuleICMPCode,
                                 zxr10ACLv4RulePrecedence,
                                 zxr10ACLv4RuleTOS,
                                 zxr10ACLv4RuleDSCP,
                                 zxr10ACLv4RuleFragment,
                                 zxr10ACLv4RuleTtlOpr,
                                 zxr10ACLv4RuleTtlValue,
                                 zxr10ACLv4RuleTtlRange,
                                 zxr10ACLv4RuleTimerangeName, 
                                 zxr10ACLv4RuleSrcUrl,
                                 zxr10ACLv4RuleDestUrl,
                                 zxr10ACLv4RuleDescription,
                                 zxr10ACLv4RulePrecRange,
                                 zxr10ACLv4RuleDscpRange
        
        conflict leaf nodes:
        1. zxr10ACLv4RuleFragment conflicts with 
                                 zxr10ACLv4RuleSrcPortOpr,
                                 zxr10ACLv4RuleSrcPortValue,
                                 zxr10ACLv4RuleSrcPortRange,
                                 zxr10ACLv4RuleDestPortOpr,
                                 zxr10ACLv4RuleDestPortValue,
                                 zxr10ACLv4RuleDestPortRange,
                                 zxr10ACLv4RuleTCPEstablish,
                                 zxr10ACLv4RuleICMPType,
                                 zxr10ACLv4RuleICMPCode,
                                 zxr10ACLv4RuleRstFlag,
                                 zxr10ACLv4RuleAckFlag,
                                 zxr10ACLv4RuleFinFlag,
                                 zxr10ACLv4RuleSynFlag,
                                 zxr10ACLv4RulePshFlag,
                                 zxr10ACLv4RuleUrgFlag,
        
        2.These leaf nodes conflict with each other: 
                                 zxr10ACLv4RulePrecedence,
                                 zxr10ACLv4RuleTOS,
                                 zxr10ACLv4RuleDSCP,
                                 zxr10ACLv4RulePrecRange,
                                 zxr10ACLv4RuleDscpRange
        
        3.zxr10ACLv4RuleTCPEstablish conflicts with 
                                 zxr10ACLv4RuleRstFlag,
                                 zxr10ACLv4RuleAckFlag,
        "                       /"Name of an IPv4 access-list (1-31 characters)"                       "ID of this rule"                       R"deny  :  Specify packets to reject
         permit:  Specify packets to forward"                       "A.B.C.D  Source address"                       "A.B.C.D  Wildcard bits"                       "A.B.C.D  Destination address"                       $"A.B.C.D  Destination wildcard bits"                      �" <0-255>   An IP protocol number  
          std      standard rule type (65534)
          gre      Generic Routing Encapsulation (47)
          icmp     Internet Control Message Protocol (1)
          igmp     Internet Group Management Protocol (2)
          ip       Any internet protocol (65535)
          ospf     Open Shortest Path First Protocol (89)
          pim      Protocol Independent Multicast (103)
          tcp      Transmission Control Protocol (6)
          udp      User Datagram Protocol (17)
          sctp     Stream Control Transmission Protocol (132)
          vrrp     Virtual Router Redundancy Protocol (112)"                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
         
        Needn't care for zxr10ACLv4RuleSrcPortValue and 
        zxr10ACLv4RuleSrcPortRange When the value of 
        zxr10ACLv4RuleSrcPortOpr is invalid(65535).
        Check zxr10ACLv4RuleSrcPortValue when the value 
        zxr10ACLv4RuleSrcPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv4RuleSrcPortRange only when the value of 
        zxr10ACLv4RuleSrcPortOpr is range(7)."                      v"<0-65535>   Port number
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv4RuleSrcPortOpr is 
        eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv4RuleSrcPortRange only when the value of 
        zxr10ACLv4RuleSrcPortOpr is range(7)."                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
         
        Needn't care for zxr10ACLv4RuleDestPortValue and 
        zxr10ACLv4RuleDestPortRange When the value of 
        zxr10ACLv4RuleDestPortOpr is invalid(65535).
        Check zxr10ACLv4RuleDestPortValue when the value 
        zxr10ACLv4RuleDestPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv4RuleDestPortRange only when the value of 
        zxr10ACLv4RuleDestPortOpr is range(7)."                      w"<0-65535>   Port number
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv4RuleDestPortOpr is 
        eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv4RuleDestPortRange only when the value of 
        zxr10ACLv4RuleDestPortOpr is range(7)."                       �"Match established connections.
         This is an optional node. 
         This node is conflict with zxr10ACLv4RuleAckFlag and 
         zxr10ACLv4RuleRstFlag."                      y"ICMP type:
         <0-255>               valid value
         65535                 invalid value
         specific value:
         alternate-address     Alternate address (6)
         echo                  Echo (ping, 8)
         echo-reply            Echo reply (0)
         information-request   Information requests (15)
         parameter-problem     All parameter problems (12)
         redirect              All redirects (5)
         router-advertisement  Router discovery advertisements (9)
         router-solicitation   Router discovery solicitations (10)
         source-quench         Source quenches (4)
         time-exceeded         All time exceededs (11)
         timestamp-reply       Timestamp replies (14)
         timestamp-request     Timestamp requests (13)
         unreachable           All unreachables (3)

        This is an optional node."                       x"ICMP code:
         <0-255>      valid value
         65535        invalid value
         This is an optional node."                       u"Precedence level:
         <0-7>   valid value
         255     invalid value
         This is an optional node."                       y"Type of service(ToS):
         <0-15>  valid value
         255     invalid value
         This is an optional node."                       o"DSCP value:
         <0-63>  valid value
         255     invalid value
         This is an optional node."                       F"Fragment enable or disable flag.
         This is an optional node."                       n"Match when the RST flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the ACK flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the FIN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the SYN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the PSH flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the URG flag set or not.
         This is an optional node.
         invalid value:     (65535)"                      �"This is an optional node.
         eq       Match only packets on a given ttl value
         ge       Match only packets with a no lower ttl value
         le       Match only packets with a no greater ttl value
         neq      Match only packets with a no equeal ttl value
         range    Match only packet on a given ttl value range 
         65535    invalid value
 
        Needn't care for zxr10ACLv4RuleTtlValue and zxr10ACLv4RuleTtlRange 
        When the value of zxr10ACLv4RuleTtlOpr is invalid(65535).
        Check zxr10ACLv4RuleTtlValue when the value zxr10ACLv4RuleTtlOpr is 
        eq(1),ge(2),le(3) or neq(6).
        Check zxr10ACLv4RuleTtlRange only when the value of 
        zxr10ACLv4RuleTtlOpr is range(7). "                       �"The TTL value:  
         <1-255>  valid value
         0        invalid value
        Check this node when the value of zxr10ACLv4RuleTtlOpr is eq(1),
        ge(2),le(3) or neq(6)."                       �"The TTL value Range: 
         <1-255>-<1-255>    valid value
         0                  invalid value
        Check this node when the value of zxr10ACLv4RuleTtlOpr is range(7)."                       H"Time range name (1-31 characters).
         This is an optional node."                       �"Source URL (1-95 characters)
        If source Url is configured, zxr10ACLv4RuleSrcAddr and 
        zxr10ACLv4RuleSrcWildcard are invalid."                       �"Destination URL (1-95 characters)
        If Destination Url is configured, zxr10ACLv4RuleDestAddr and 
        zxr10ACLv4RuleDestWildcard are invalid."                       ("Description for use (1-70 characters)."                       H"Precedence range:    <0-7>-<0-7>
        Invalid value:        65535."                       >"DSCP range:    <0-63>-<0-63>
        Invalid value:  65535."                           "IPv6 ACL Table"                       
"IPv6 ACL"                       /"Name of an IPv6 access-list (1-31 characters)"                       "IPv6 ACL Rule Table"                       �"IPv6 ACL  
        effective leaf nodes: 
        A leaf node which is effective or not depends on the type of rule. 
        Rule types include ip type,tcp type,udp type,icmp type, represented 
        by zxr10ACLv6RuleIpProtocol in this table. 
        According to the rule type (zxr10ACLv6RuleIpProtocol), the following 
        leaf nodes are effective. 
 
        1.rule type :  ip type
        effective leaf nodes: zxr10ACLv6RuleAclName,
                              zxr10ACLv6RuleRuleID,
                              zxr10ACLv6RulePermitDeny, 
                              zxr10ACLv6Ruleflowlabel,
                              zxr10ACLv6RuleSrcAddr,
                              zxr10ACLv6RuleSrcWildcard,
                              zxr10ACLv6RuleDestAddr,
                              zxr10ACLv6RuleDestWildcard,
                              zxr10ACLv6RuleIpProtocol,
                              zxr10ACLv6RuleRouting,
                              zxr10ACLv6RuleAuthen,
                              zxr10ACLv6RuleDestops,
                              zxr10ACLv6RuleFragments,
                              zxr10ACLv6RuleHopByHop,
                              zxr10ACLv6RuleEsp,
                              zxr10ACLv6RuleDSCP,   
                              zxr10ACLv6RuleTc,
                              zxr10ACLv6RuleTimerangeName,
                              zxr10ACLv6RuleSrcAddrMaskFlag,
                              zxr10ACLv6RuleSrcWildcardBits,
                              zxr10ACLv6RuleDestAddrMaskFlag,
                              zxr10ACLv6RuleDestWildcardBits,
                              zxr10ACLv6RuleDescription
       2. rule type :  tcp type
        effective leaf nodes: zxr10ACLv6RuleAclName,
                              zxr10ACLv6RuleRuleID,
                              zxr10ACLv6RulePermitDeny, 
                              zxr10ACLv6Ruleflowlabel,
                              zxr10ACLv6RuleSrcAddr,
                              zxr10ACLv6RuleSrcWildcard,
                              zxr10ACLv6RuleDestAddr,
                              zxr10ACLv6RuleDestWildcard,
                              zxr10ACLv6RuleIpProtocol,
                              zxr10ACLv6RuleSrcPortOpr,
                              zxr10ACLv6RuleSrcPortValue,
                              zxr10ACLv6RuleSrcPortRange,
                              zxr10ACLv6RuleDestPortOpr,
                              zxr10ACLv6RuleDestPortValue,
                              zxr10ACLv6RuleDestPortRange,  
                              zxr10ACLv6RuleTCPEstablish, 
                              zxr10ACLv6RuleRstFlag, 
                              zxr10ACLv6RuleAckFlag,
                              zxr10ACLv6RuleFinFlag,
                              zxr10ACLv6RuleSynFlag,
                              zxr10ACLv6RulePshFlag,
                              zxr10ACLv6RuleUrgFlag,
                              zxr10ACLv6RuleRouting,
                              zxr10ACLv6RuleAuthen,
                              zxr10ACLv6RuleDestops,
                              zxr10ACLv6RuleFragments,
                              zxr10ACLv6RuleHopByHop,
                              zxr10ACLv6RuleEsp,
                              zxr10ACLv6RuleDSCP,
                              zxr10ACLv6RuleTc,
                              zxr10ACLv6RuleTimerangeName,
                              zxr10ACLv6RuleSrcUrl,
                              zxr10ACLv6RuleDestUrl,
                              zxr10ACLv6RuleSrcAddrMaskFlag,
                              zxr10ACLv6RuleSrcWildcardBits,
                              zxr10ACLv6RuleDestAddrMaskFlag,
                              zxr10ACLv6RuleDestWildcardBits,
                              zxr10ACLv6RuleDescription
        3.rule type :   udp type
        effective leaf nodes: zxr10ACLv6RuleAclName,
                              zxr10ACLv6RuleRuleID,
                              zxr10ACLv6RulePermitDeny, 
                              zxr10ACLv6Ruleflowlabel,
                              zxr10ACLv6RuleSrcAddr,
                              zxr10ACLv6RuleSrcWildcard,
                              zxr10ACLv6RuleDestAddr,
                              zxr10ACLv6RuleDestWildcard,
                              zxr10ACLv6RuleIpProtocol,
                              zxr10ACLv6RuleSrcPortOpr,
                              zxr10ACLv6RuleSrcPortValue,
                              zxr10ACLv6RuleSrcPortRange,
                              zxr10ACLv6RuleDestPortOpr,
                              zxr10ACLv6RuleDestPortValue,
                              zxr10ACLv6RuleDestPortRange,
                              zxr10ACLv6RuleRouting,
                              zxr10ACLv6RuleAuthen,
                              zxr10ACLv6RuleDestops,
                              zxr10ACLv6RuleFragments,
                              zxr10ACLv6RuleHopByHop,
                              zxr10ACLv6RuleEsp,
                              zxr10ACLv6RuleDSCP,
                              zxr10ACLv6RuleTc,
                              zxr10ACLv6RuleTimerangeName,
                              zxr10ACLv6RuleSrcUrl,
                              zxr10ACLv6RuleDestUrl,
                              zxr10ACLv6RuleSrcAddrMaskFlag,
                              zxr10ACLv6RuleSrcWildcardBits,
                              zxr10ACLv6RuleDestAddrMaskFlag,
                              zxr10ACLv6RuleDestWildcardBits,
                              zxr10ACLv6RuleDescription
        4.rule type :   icmp type
        effective leaf nodes: zxr10ACLv6RuleAclName,
                              zxr10ACLv6RuleRuleID,
                              zxr10ACLv6RulePermitDeny, 
                              zxr10ACLv6Ruleflowlabel,
                              zxr10ACLv6RuleSrcAddr,
                              zxr10ACLv6RuleSrcWildcard,
                              zxr10ACLv6RuleDestAddr,
                              zxr10ACLv6RuleDestWildcard,
                              zxr10ACLv6RuleIpProtocol,
                              zxr10ACLv6RuleICMPType,
                              zxr10ACLv6RuleICMPCode,
                              zxr10ACLv6RuleRouting,
                              zxr10ACLv6RuleAuthen,
                              zxr10ACLv6RuleDestops,
                              zxr10ACLv6RuleFragments,
                              zxr10ACLv6RuleHopByHop,
                              zxr10ACLv6RuleEsp,
                              zxr10ACLv6RuleDSCP,
                              zxr10ACLv6RuleTc,
                              zxr10ACLv6RuleTimerangeName,
                              zxr10ACLv6RuleSrcUrl,
                              zxr10ACLv6RuleDestUrl,
                              zxr10ACLv6RuleSrcAddrMaskFlag,
                              zxr10ACLv6RuleSrcWildcardBits,
                              zxr10ACLv6RuleDestAddrMaskFlag,
                              zxr10ACLv6RuleDestWildcardBits,
                              zxr10ACLv6RuleDescription
        conflict leaf nodes:
        1. zxr10ACLv6RuleFragments conflicts with
                              zxr10ACLv6RuleSrcPortOpr,
                              zxr10ACLv6RuleSrcPortValue,
                              zxr10ACLv6RuleSrcPortRange,
                              zxr10ACLv6RuleDestPortOpr,
                              zxr10ACLv6RuleDestPortValue,
                              zxr10ACLv6RuleDestPortRange,
                              zxr10ACLv6RuleICMPType,
                              zxr10ACLv6RuleICMPCode,
                              zxr10ACLv6RuleTCPEstablish, 
                              zxr10ACLv6RuleRstFlag, 
                              zxr10ACLv6RuleAckFlag,
                              zxr10ACLv6RuleFinFlag,
                              zxr10ACLv6RuleSynFlag,
                              zxr10ACLv6RulePshFlag,
                              zxr10ACLv6RuleUrgFlag,
         2. zxr10ACLv6RuleDSCP conflicts with
                              zxr10ACLv6RuleTC

         3. zxr10ACLv6RuleTCPEstablish conflicts with
                              zxr10ACLv6RuleRstFlag, 
                              zxr10ACLv6RuleAckFlag
"                       /"Name of an IPv6 access-list (1-31 characters)"                       "ID of this rule"                       R"deny  :  Specify packets to reject
         permit:  Specify packets to forward"                       ~"Flowlabel value:
         <0-1048575>  valid value
         2147483647   invalid value
         This is an optional node."                       "<X:X::X:X>  Source address"                       "<0-128>  Source Wildcard"                       !"<X:X::X:X>  Destination address"                       "<0-128>  Destination Wildcard"                      V" <0-255>  An IP protocol number
          gre      Generic Routing Encapsulation (47)
          icmp     Internet Control Message Protocol (58)
          igmp     Internet Group Management Protocol (2)
          ip       Any internet protocol (65535)
          ospf     Open Shortest Path First Protocol (89)
          pim      Protocol Independent Multicast (103)
          tcp      Transmission Control Protocol (6)
          udp      User Datagram Protocol (17)
          sctp     Stream Control Transmission Protocol (132)
          vrrp     Virtual Router Redundancy Protocol (112)"                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
 
        Needn't care for zxr10ACLv6RuleSrcPortValue and 
        zxr10ACLv6RuleSrcPortRange When the value of 
        zxr10ACLv6RuleSrcPortOpr is invalid(65535).
        Check zxr10ACLv6RuleSrcPortValue when the value 
        zxr10ACLv6RuleSrcPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv6RuleSrcPortRange only when the value of 
        zxr10ACLv6RuleSrcPortOpr is range(7)."                      v"<0-65535>   Port number
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv6RuleSrcPortOpr is eq(1),
        ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv6RuleSrcPortRange only when the value of 
        zxr10ACLv6RuleSrcPortOpr is range(7)."                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
 
        Needn't care for zxr10ACLv6RuleDestPortValue and 
        zxr10ACLv6RuleDestPortRange When the value of 
        zxr10ACLv6RuleDestPortOpr is invalid(65535).
        Check zxr10ACLv6RuleDestPortValue when the value 
        zxr10ACLv6RuleDestPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv6RuleDestPortRange only when the value of 
        zxr10ACLv6RuleDestPortOpr is range(7)."                      w"<0-65535>   Port number
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv6RuleDestPortOpr is eq(1),
        ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv6RuleDestPortRange only when the value of 
        zxr10ACLv6RuleDestPortOpr is range(7)."                       D"Match established connections.
         This is an optional node."                       n"Match when the RST flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the ACK flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the FIN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the SYN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the PSH flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the URG flag set or not.
         This is an optional node.
         invalid value:     (65535)"                      �"ICMP type:
        <0-255>               valid value
        65535                 invalid value
        specific value:
        destination-unreachable  Destination unreachable (1)
        echo-reply               Echo reply (129)
        echo-request             Echo request (ping, 128)
        mld-query                Multicast Listener Discovery Query (130)
        mld-reduction            Multicast Listener Discovery Reduction (132)
        mld-report               Multicast Listener Discovery Report (131)
        nd-na                    Neighbor discovery neighbor advertisments(136)
        nd-ns                    Neighbor discovery neighbor solicitations(135)
        packet-too-big           Packet too big (2)
        parameter-problem        All parameter problems (4)
        redirect                 Neighbor redirect (137)
        router-advertisment      Neighbor discovery router advertisments(134)
        router-renumbering       All router renumbering (138)
        router-solicitation      Neighbor discovery router solicitations(133)
        time-exceeded            Time exceeded (3)

        This is an optional node."                       x"ICMP code:
         <0-255>      valid value
         65535        invalid value
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       o"DSCP value:
         <0-63>  valid value
         255     invalid value
         This is an optional node."                       z"Traffic Class value:
         <0-255>  valid value
         65535    invalid value
         This is an optional node."                       H"Time range name (1-31 characters).
         This is an optional node."                       �"Source URL (1-95 characters)
        If source Url is configured, zxr10ACLv6RuleSrcAddr and 
        zxr10ACLv6RuleSrcWildcard are invalid."                       �"Destination URL (1-95 characters)
        If Destination Url is configured, zxr10ACLv6RuleDestAddr and 
        zxr10ACLv6RuleDestWildcard are invalid."                      �"This flag indicates the way of configuring IPv6 source address mask,
        such as zxr10ACLv6RuleSrcWildcard, zxr10ACLv6RuleSrcWildcardBits.
        If this flag is valid, IPv6 source address mask is configured by 
        wildcard bits,(e.g. X:X::X:X) and zxr10ACLv6RuleSrcWildcardBits 
        is valid;
        if not, IPv6 source address mask is configured by prefix length,
        (e.g. X:X::X:X/0-128) and zxr10ACLv6RuleSrcWildcard is valid."                       +"<X:X::X:X>   Source address wildcard bits"                      �"This flag indicates the way of configuring IPv6 destination address 
        mask,such as zxr10ACLv6RuleDestWildcard,zxr10ACLv6RuleDestWildcardBits.
        If this flag is valid, IPv6 destination address mask is configured by 
        wildcard bits, (e.g. X:X::X:X) and zxr10ACLv6RuleDestWildcardBits 
        is valid; 
        if not, IPv6 destination address mask is configured by prefix length,
        (e.g. X:X::X:X/0-128) and zxr10ACLv6RuleDestWildcard is valid."                       0"<X:X::X:X>   Destination address wildcard bits"                       ("Description for use (1-70 characters)."                           
"Link ACL"                       
"Link ACL"                       ."Name of a link access-list (1-31 characters)"                       "Link ACL Rule Table"                      	"Link ACL
        effective leaf nodes: 
          All of the leaf nodes are effective:
                              zxr10ACLLinkRuleAclName,
                              zxr10ACLLinkRuleRuleID,
                              zxr10ACLLinkRulePermitDeny,
                              zxr10ACLLinkRuleLinkProtocol,
                              zxr10ACLLinkRuleSrcMAC, 
                              zxr10ACLLinkRuleSrcMACWildcard,
                              zxr10ACLLinkRuleDestMAC,
                              zxr10ACLLinkRuleDestMACWildcard,
                              zxr10ACLLinkRuleIncos,
                              zxr10ACLLinkRuleOutCos,
                              zxr10ACLLinkRuleInVlanID,
                              zxr10ACLLinkRuleOutVlanID,
                              zxr10ACLLinkRuleInVlanRange,
                              zxr10ACLLinkRuleOutVlanRange,
                              zxr10ACLLinkRuleTimerangeName,  
                              zxr10ACLLinkRuleBSrcMACRange1,
                              zxr10ACLLinkRuleSrcMACRg1Min,
                              zxr10ACLLinkRuleSrcMACRg1Max,  
                              zxr10ACLLinkRuleBSrcMACRange2,
                              zxr10ACLLinkRuleSrcMACRg2Min,
                              zxr10ACLLinkRuleSrcMACRg2Max,  
                              zxr10ACLLinkRuleBDestMACRange1,
                              zxr10ACLLinkRuleDestMACRg1Min,
                              zxr10ACLLinkRuleDestMACRg1Max,  
                              zxr10ACLLinkRuleBDestMACRange2,
                              zxr10ACLLinkRuleDestMACRg2Min,
                              zxr10ACLLinkRuleDestMACRg2Max,
                              zxr10ACLLinkRuleDescription,
                              zxr10ACLLinkRuleLinkProtocolMask,
                              zxr10ACLLinkRuleInCosRange,
                              zxr10ACLLinkRuleOutCosRange,
                              zxr10ACLLinkRuleDsap,
                              zxr10ACLLinkRuleSsap
                               
        conflict leaf nodes:  
        1. zxr10ACLLinkRuleLinkProtocol conflicts with
                              zxr10ACLLinkRuleDsap,
                              zxr10ACLLinkRuleSsap
                              "                       ."Name of a link access-list (1-31 characters)"                       "ID of this rule"                       R"deny  :  Specify packets to reject
         permit:  Specify packets to forward"                       ~"Link protocal:
         <1536-65535>  valid value
         65536         invalid value
         This is an optional node."                       &"<xxxx.xxxx.xxxx>  Source MAC address"                       '"<xxxx.xxxx.xxxx>  Source MAC wildcard"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       ,"<xxxx.xxxx.xxxx>  Destination MAC wildcard"                       u"Value of inner cos:
         <0-7>  valid value
         255    invalid value
         This is an optional node."                       u"Value of outer cos:
         <0-7>  valid value
         255    invalid value
         This is an optional node."                       }"Value of inner vlan
         <1-4094>   valid value
         65535      invalid value
         This is an optional node."                       }"Value of outer vlan
         <1-4094>   valid value
         65535      invalid value
         This is an optional node."                       �"Range of inner vlan
         <1-4094>-<1-4094>    valid value
         0                    invalid value
         This is an optional node."                       �"Range of outer vlan
         <1-4094>-<1-4094>    valid value
         0                    invalid value
         This is an optional node."                       H"Time range name (1-31 characters).
         This is an optional node."                       �"Match if source MAC address range is configured.
        When this is valid, zxr10ACLLinkRuleSrcMAC and 
        zxr10ACLLinkRuleSrcMACWildcard are invalid,
        zxr10ACLLinkRuleSrcMACRg1Min and 
        zxr10ACLLinkRuleSrcMACRg1Max are valid."                       K"<xxxx.xxxx.xxxx>  
        Lower limit of first source MAC address range"                       K"<xxxx.xxxx.xxxx>  
        Upper limit of first source MAC address range"                      "Match if second source MAC address range is configured.
        When this is valid, zxr10ACLLinkRuleSrcMAC and 
        zxr10ACLLinkRuleSrcMACWildcard are invalid,
        zxr10ACLLinkRuleSrcMACRg2Min and 
        zxr10ACLLinkRuleSrcMACRg2Max are valid."                       J"<xxxx.xxxx.xxxx>
        Lower limit of second source MAC address range"                       L"<xxxx.xxxx.xxxx>  
        Upper limit of second source MAC address range"                      "Match if destination MAC address range is configured.
        When this is valid, zxr10ACLLinkRuleDestMAC and 
        zxr10ACLLinkRuleDestMACWildcard are invalid,
        zxr10ACLLinkRuleDestMACRg1Min and 
        zxr10ACLLinkRuleDestMACRg1Max are valid."                       P"<xxxx.xxxx.xxxx>  
        Lower limit of first destination MAC address range"                       P"<xxxx.xxxx.xxxx>  
        Upper limit of first destination MAC address range"                      "Match if second destination MAC address range is configured.
        When this is valid, zxr10ACLLinkRuleDestMAC and 
        zxr10ACLLinkRuleDestMACWildcard are invalid,
        zxr10ACLLinkRuleDestMACRg2Min and 
        zxr10ACLLinkRuleDestMACRg2Max are valid."                       O"<xxxx.xxxx.xxxx>
        Lower limit of second destination MAC address range"                       Q"<xxxx.xxxx.xxxx>  
        Upper limit of second destination MAC address range"                       ("Description for use (1-70 characters)."                       �"Link protocal mask:
         <0-65535>     valid value
         65536         invalid value
         This is an optional node."                       �"Range of inner CoS:
         <0-7>-<0-7>    valid value
         65535          invalid value
         This is an optional node."                       �"Range of outer CoS:
         <0-7>-<0-7>    valid value
         65535          invalid value
         This is an optional node."                       �"Destination service access point:
         <0-255>       valid value
         65535         invalid value
         This is an optional node."                       �"Source service access point:
         <0-255>       valid value
         65535         invalid value
         This is an optional node."                           "IPv4 Mixed ACL Table"                       "IPv4Mix ACL"                       5"Name of an IPv4 mixed access-list (1-31 characters)"                       "IPv4 Mixed ACL Rule Table"                      <�"IPv4Mix ACL
        effective leaf nodes: 
        A leaf node which is effective or not depends on the type of rule. 
        Rule types include standard type, ip type, tcp type, udp type ,icmp 
        type , represented by  zxr10ACLv4RuleIpProtocol in this table. 
        According to the rule type (zxr10ACLv4MixRuleIpProtocol) , 
        the following leaf nodes are effective. 

        1. rule type : std type
           effective leaf nodes: zxr10ACLv4MixRuleAclName,
                                 zxr10ACLv4MixRuleRuleID,
                                 zxr10ACLv4MixRulePermitDeny,
                                 zxr10ACLv4MixRuleLinkProtocol,
                                 zxr10ACLv4MixRuleSrcMAC, 
                                 zxr10ACLv4MixRuleSrcMACWildcard,
                                 zxr10ACLv4MixRuleDestMAC,
                                 zxr10ACLv4MixRuleDestMACWildcard,
                                 zxr10ACLv4MixRuleIncos, 
                                 zxr10ACLv4MixRuleOutCos,
                                 zxr10ACLv4MixRuleInVlanID,
                                 zxr10ACLv4MixRuleOutVlanID,
                                 zxr10ACLv4MixRuleInVlanRange,
                                 zxr10ACLv4MixRuleOutVlanRange,
                                 zxr10ACLv4MixRuleSrcAddr,
                                 zxr10ACLv4MixRuleSrcWildcard,
                                 zxr10ACLv4MixRuleTimerangeName,
                                 zxr10ACLv4MixRuleBSrcMACRange1,
                                 zxr10ACLv4MixRuleSrcMACRg1Min,
                                 zxr10ACLv4MixRuleSrcMACRg1Max,  
                                 zxr10ACLv4MixRuleBSrcMACRange2,
                                 zxr10ACLv4MixRuleSrcMACRg2Min,
                                 zxr10ACLv4MixRuleSrcMACRg2Max,  
                                 zxr10ACLv4MixRuleBDestMACRange1,
                                 zxr10ACLv4MixRuleDestMACRg1Min,
                                 zxr10ACLv4MixRuleDestMACRg1Max,  
                                 zxr10ACLv4MixRuleBDestMACRange2,
                                 zxr10ACLv4MixRuleDestMACRg2Min,
                                 zxr10ACLv4MixRuleDestMACRg2Max,
                                 zxr10ACLv4MixRuleLinkProtocolEx
                                 zxr10ACLv4MixRuleDsap,
                                 zxr10ACLv4MixRuleSsap
        2. rule type : ip type
           effective leaf nodes: zxr10ACLv4MixRuleAclName, 
                                 zxr10ACLv4MixRuleRuleID,
                                 zxr10ACLv4MixRulePermitDeny,
                                 zxr10ACLv4MixRuleLinkProtocol,
                                 zxr10ACLv4MixRuleSrcMAC, 
                                 zxr10ACLv4MixRuleSrcMACWildcard,
                                 zxr10ACLv4MixRuleDestMAC,
                                 zxr10ACLv4MixRuleDestMACWildcard,
                                 zxr10ACLv4MixRuleIncos, 
                                 zxr10ACLv4MixRuleOutCos,
                                 zxr10ACLv4MixRuleInVlanID,
                                 zxr10ACLv4MixRuleOutVlanID,
                                 zxr10ACLv4MixRuleInVlanRange,
                                 zxr10ACLv4MixRuleOutVlanRange,
                                 zxr10ACLv4MixRuleSrcAddr,
                                 zxr10ACLv4MixRuleSrcWildcard,
                                 zxr10ACLv4MixRuleDestAddr,
                                 zxr10ACLv4MixRuleDestWildcard,
                                 zxr10ACLv4MixRuleIpProtocol, 
                                 zxr10ACLv4MixRulePrecedence,
                                 zxr10ACLv4MixRuleTOS,
                                 zxr10ACLv4MixRuleDSCP,
                                 zxr10ACLv4MixRuleFragment,
                                 zxr10ACLv4MixRuleTimerangeName,
                                 zxr10ACLv4MixRuleBSrcMACRange1,
                                 zxr10ACLv4MixRuleSrcMACRg1Min,
                                 zxr10ACLv4MixRuleSrcMACRg1Max,  
                                 zxr10ACLv4MixRuleBSrcMACRange2,
                                 zxr10ACLv4MixRuleSrcMACRg2Min,
                                 zxr10ACLv4MixRuleSrcMACRg2Max,  
                                 zxr10ACLv4MixRuleBDestMACRange1,
                                 zxr10ACLv4MixRuleDestMACRg1Min,
                                 zxr10ACLv4MixRuleDestMACRg1Max,  
                                 zxr10ACLv4MixRuleBDestMACRange2,
                                 zxr10ACLv4MixRuleDestMACRg2Min,
                                 zxr10ACLv4MixRuleDestMACRg2Max,
                                 zxr10ACLv4MixRuleLinkProtocolEx                                
                                 zxr10ACLv4MixRuleDsap,
                                 zxr10ACLv4MixRuleSsap
        3. rule type : tcp type
           effective leaf nodes: zxr10ACLv4MixRuleAclName,
                                 zxr10ACLv4MixRuleRuleID,
                                 zxr10ACLv4MixRulePermitDeny,
                                 zxr10ACLv4MixRuleLinkProtocol,
                                 zxr10ACLv4MixRuleSrcMAC, 
                                 zxr10ACLv4MixRuleSrcMACWildcard,
                                 zxr10ACLv4MixRuleDestMAC,
                                 zxr10ACLv4MixRuleDestMACWildcard,
                                 zxr10ACLv4MixRuleIncos, 
                                 zxr10ACLv4MixRuleOutCos,
                                 zxr10ACLv4MixRuleInVlanID,
                                 zxr10ACLv4MixRuleOutVlanID, 
                                 zxr10ACLv4MixRuleInVlanRange,
                                 zxr10ACLv4MixRuleOutVlanRange, 
                                 zxr10ACLv4MixRuleSrcAddr,
                                 zxr10ACLv4MixRuleSrcWildcard,
                                 zxr10ACLv4MixRuleDestAddr,
                                 zxr10ACLv4MixRuleDestWildcard,
                                 zxr10ACLv4MixRuleIpProtocol,
                                 zxr10ACLv4MixRuleSrcPortOpr,
                                 zxr10ACLv4MixRuleSrcPortValue,
                                 zxr10ACLv4MixRuleSrcPortRange,
                                 zxr10ACLv4MixRuleDestPortOpr,
                                 zxr10ACLv4MixRuleDestPortValue,
                                 zxr10ACLv4MixRuleDestPortRange,
                                 zxr10ACLv4MixRuleTCPEstablish,
                                 zxr10ACLv4MixRulePrecedence,
                                 zxr10ACLv4MixRuleTOS,
                                 zxr10ACLv4MixRuleDSCP,
                                 zxr10ACLv4MixRuleFragment,
                                 zxr10ACLv4MixRuleRstFlag,
                                 zxr10ACLv4MixRuleAckFlag,
                                 zxr10ACLv4MixRuleFinFlag,
                                 zxr10ACLv4MixRuleSynFlag,
                                 zxr10ACLv4MixRulePshFlag,
                                 zxr10ACLv4MixRuleUrgFlag,
                                 zxr10ACLv4MixRuleTimerangeName,
                                 zxr10ACLv4MixRuleBSrcMACRange1,
                                 zxr10ACLv4MixRuleSrcMACRg1Min,
                                 zxr10ACLv4MixRuleSrcMACRg1Max,  
                                 zxr10ACLv4MixRuleBSrcMACRange2,
                                 zxr10ACLv4MixRuleSrcMACRg2Min,
                                 zxr10ACLv4MixRuleSrcMACRg2Max,  
                                 zxr10ACLv4MixRuleBDestMACRange1,
                                 zxr10ACLv4MixRuleDestMACRg1Min,
                                 zxr10ACLv4MixRuleDestMACRg1Max,  
                                 zxr10ACLv4MixRuleBDestMACRange2,
                                 zxr10ACLv4MixRuleDestMACRg2Min,
                                 zxr10ACLv4MixRuleDestMACRg2Max,
                                 zxr10ACLv4MixRuleLinkProtocolEx                               
                                 zxr10ACLv4MixRuleDsap,
                                 zxr10ACLv4MixRuleSsap
        4. rule type : ucp type
           effective leaf nodes: zxr10ACLv4MixRuleAclName,
                                 zxr10ACLv4MixRuleRuleID,
                                 zxr10ACLv4MixRulePermitDeny,
                                 zxr10ACLv4MixRuleLinkProtocol,
                                 zxr10ACLv4MixRuleSrcMAC, 
                                 zxr10ACLv4MixRuleSrcMACWildcard,
                                 zxr10ACLv4MixRuleDestMAC,
                                 zxr10ACLv4MixRuleDestMACWildcard,
                                 zxr10ACLv4MixRuleIncos, 
                                 zxr10ACLv4MixRuleOutCos,
                                 zxr10ACLv4MixRuleInVlanID,
                                 zxr10ACLv4MixRuleOutVlanID,
                                 zxr10ACLv4MixRuleInVlanRange,
                                 zxr10ACLv4MixRuleOutVlanRange,
                                 zxr10ACLv4MixRuleSrcAddr,
                                 zxr10ACLv4MixRuleSrcWildcard,
                                 zxr10ACLv4MixRuleDestAddr,
                                 zxr10ACLv4MixRuleDestWildcard,
                                 zxr10ACLv4MixRuleIpProtocol,
                                 zxr10ACLv4MixRuleSrcPortOpr,
                                 zxr10ACLv4MixRuleSrcPortValue,
                                 zxr10ACLv4MixRuleSrcPortRange,
                                 zxr10ACLv4MixRuleDestPortOpr,
                                 zxr10ACLv4MixRuleDestPortValue,
                                 zxr10ACLv4MixRuleDestPortRange,
                                 zxr10ACLv4MixRulePrecedence,
                                 zxr10ACLv4MixRuleTOS,
                                 zxr10ACLv4MixRuleDSCP,
                                 zxr10ACLv4MixRuleFragment,
                                 zxr10ACLv4MixRuleTimerangeName,
                                 zxr10ACLv4MixRuleBSrcMACRange1,
                                 zxr10ACLv4MixRuleSrcMACRg1Min,
                                 zxr10ACLv4MixRuleSrcMACRg1Max,  
                                 zxr10ACLv4MixRuleBSrcMACRange2,
                                 zxr10ACLv4MixRuleSrcMACRg2Min,
                                 zxr10ACLv4MixRuleSrcMACRg2Max,  
                                 zxr10ACLv4MixRuleBDestMACRange1,
                                 zxr10ACLv4MixRuleDestMACRg1Min,
                                 zxr10ACLv4MixRuleDestMACRg1Max,  
                                 zxr10ACLv4MixRuleBDestMACRange2,
                                 zxr10ACLv4MixRuleDestMACRg2Min,
                                 zxr10ACLv4MixRuleDestMACRg2Max,
                                 zxr10ACLv4MixRuleLinkProtocolEx                              
                                 zxr10ACLv4MixRuleDsap,
                                 zxr10ACLv4MixRuleSsap
        5. rule type : icmp type
           effective leaf nodes: zxr10ACLv4MixRuleAclName,
                                 zxr10ACLv4MixRuleRuleID,
                                 zxr10ACLv4MixRulePermitDeny,
                                 zxr10ACLv4MixRuleLinkProtocol,
                                 zxr10ACLv4MixRuleSrcMAC, 
                                 zxr10ACLv4MixRuleSrcMACWildcard,
                                 zxr10ACLv4MixRuleDestMAC,
                                 zxr10ACLv4MixRuleDestMACWildcard,
                                 zxr10ACLv4MixRuleIncos, 
                                 zxr10ACLv4MixRuleOutCos,
                                 zxr10ACLv4MixRuleInVlanID,
                                 zxr10ACLv4MixRuleOutVlanID,
                                 zxr10ACLv4MixRuleInVlanRange,
                                 zxr10ACLv4MixRuleOutVlanRange,
                                 zxr10ACLv4MixRuleSrcAddr,
                                 zxr10ACLv4MixRuleSrcWildcard,
                                 zxr10ACLv4MixRuleDestAddr,
                                 zxr10ACLv4MixRuleDestWildcard,
                                 zxr10ACLv4MixRuleIpProtocol,
                                 zxr10ACLv4MixRuleICMPType,
                                 zxr10ACLv4MixRuleICMPCode,
                                 zxr10ACLv4MixRulePrecedence,
                                 zxr10ACLv4MixRuleTOS,
                                 zxr10ACLv4MixRuleDSCP,
                                 zxr10ACLv4MixRuleFragment,
                                 zxr10ACLv4MixRuleTimerangeName,
                                 zxr10ACLv4MixRuleBSrcMACRange1,
                                 zxr10ACLv4MixRuleSrcMACRg1Min,
                                 zxr10ACLv4MixRuleSrcMACRg1Max,  
                                 zxr10ACLv4MixRuleBSrcMACRange2,
                                 zxr10ACLv4MixRuleSrcMACRg2Min,
                                 zxr10ACLv4MixRuleSrcMACRg2Max,  
                                 zxr10ACLv4MixRuleBDestMACRange1,
                                 zxr10ACLv4MixRuleDestMACRg1Min,
                                 zxr10ACLv4MixRuleDestMACRg1Max,  
                                 zxr10ACLv4MixRuleBDestMACRange2,
                                 zxr10ACLv4MixRuleDestMACRg2Min,
                                 zxr10ACLv4MixRuleDestMACRg2Max,
                                 zxr10ACLv4MixRuleLinkProtocolEx,
                                 zxr10ACLv4MixRuleDsap,
                                 zxr10ACLv4MixRuleSsap                              
        conflict leaf nodes:
        1. zxr10ACLv4MixRuleFragment conflicts with 
                                 zxr10ACLv4MixRuleSrcPortOpr,
                                 zxr10ACLv4MixRuleSrcPortValue,
                                 zxr10ACLv4MixRuleSrcPortRange,
                                 zxr10ACLv4MixRuleDestPortOpr,
                                 zxr10ACLv4MixRuleDestPortValue,
                                 zxr10ACLv4MixRuleDestPortRange,
                                 zxr10ACLv4MixRuleTCPEstablish,
                                 zxr10ACLv4MixRuleICMPType,
                                 zxr10ACLv4MixRuleICMPCode,
                                 zxr10ACLv4MixRuleRstFlag,
                                 zxr10ACLv4MixRuleAckFlag,
                                 zxr10ACLv4MixRuleFinFlag,
                                 zxr10ACLv4MixRuleSynFlag,
                                 zxr10ACLv4MixRulePshFlag,
                                 zxr10ACLv4MixRuleUrgFlag 
        2. These leaf nodes conflict with each other:
                                 zxr10ACLv4MixRulePrecedence,
                                 zxr10ACLv4MixRuleTOS,
                                 zxr10ACLv4MixRuleDSCP
        3. zxr10ACLv4MixRuleTCPEstablish conflicts with 
                                 zxr10ACLv4MixRuleRstFlag,
                                 zxr10ACLv4MixRuleAckFlag 
        4. zxr10ACLv4MixRuleLinkProtocolEx conflicts with
                                 zxr10ACLv4MixRuleDsap,
                                 zxr10ACLv4MixRuleSsap
                                 "                       5"Name of an IPv4 mixed access-list (1-31 characters)"                       "ID of this rule"                       R"deny  :  Specify packets to reject
         permit:  Specify packets to forward"                       x"Link protocal:
         <0-65535>  valid value
         65536      invalid value
         This is an optional node."                       &"<xxxx.xxxx.xxxx>  Source MAC address"                       '"<xxxx.xxxx.xxxx>  Source MAC wildcard"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       ,"<xxxx.xxxx.xxxx>  Destination MAC wildcard"                       u"Value of inner cos:
         <0-7>  valid value
         255    invalid value
         This is an optional node."                       u"Value of outer cos:
         <0-7>  valid value
         255    invalid value
         This is an optional node."                       }"Value of inner vlan
         <1-4094>   valid value
         65535      invalid value
         This is an optional node."                       }"Value of outer vlan
         <1-4094>   valid value
         65535      invalid value
         This is an optional node."                       �"Range of inner vlan
         <1-4094>-<1-4094>    valid value
         0                    invalid value
         This is an optional node."                       �"Range of outer vlan
         <1-4094>-<1-4094>    valid value
         0                    invalid value
         This is an optional node."                       "A.B.C.D  Source address"                       "A.B.C.D  Wildcard bits"                       "A.B.C.D  Destination address"                       $"A.B.C.D  Destination wildcard bits"                      �"<0-255>  An IP protocol number   
          std      Standard rule type (65534)
          gre      Generic Routing Encapsulation (47)
          icmp     Internet Control Message Protocol (1)
          igmp     Internet Group Management Protocol (2)
          ip       Any internet protocol (65535)
          ospf     Open Shortest Path First Protocol (89)
          pim      Protocol Independent Multicast (103)
          tcp      Transmission Control Protocol (6)
          udp      User Datagram Protocol (17)
          sctp     Stream Control Transmission Protocol (132)
          vrrp     Virtual Router Redundancy Protocol (112)"                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
 
        Needn't care for zxr10ACLv4MixRuleSrcPortValue and 
        zxr10ACLv4MixRuleSrcPortRange When the value of 
        zxr10ACLv4MixRuleSrcPortOpr is invalid(65535).
        Check zxr10ACLv4MixRuleSrcPortValue when the value 
        zxr10ACLv4MixRuleSrcPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv4MixRuleSrcPortRange only when the value of 
        zxr10ACLv4MixRuleSrcPortOpr is range(7)."                      z"<0-65535>   Port number
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv4MixRuleSrcPortOpr is 
        eq(1), ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv4MixRuleSrcPortRange only when the value of 
        zxr10ACLv4MixRuleSrcPortOpr is range(7)."                      �"This is an optional node.
         eq       Match only packets on a given port number 
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number 
         range    Match only packet on a given port range
         65535    invalid value
 
        Needn't care for zxr10ACLv4MixRuleDestPortValue and 
        zxr10ACLv4MixRuleDestPortRange When the value of 
        zxr10ACLv4MixRuleDestPortOpr is invalid(65535).
        Check zxr10ACLv4MixRuleDestPortValue when the value 
        zxr10ACLv4MixRuleDestPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv4MixRuleDestPortRange only when the value of 
        zxr10ACLv4MixRuleDestPortOpr is range(7)."                      |"<0-65535>   Port number 
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67) 
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv4MixRuleDestPortOpr is 
        eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv4MixRuleDestPortRange only when the value of 
        zxr10ACLv4MixRuleDestPortOpr is range(7)."                       D"Match established connections.
         This is an optional node."                      y"ICMP type:
         <0-255>               valid value
         65535                 invalid value
         specific value:
         alternate-address     Alternate address (6)
         echo                  Echo (ping, 8)
         echo-reply            Echo reply (0)
         information-request   Information requests (15)
         parameter-problem     All parameter problems (12)
         redirect              All redirects (5)
         router-advertisement  Router discovery advertisements (9)
         router-solicitation   Router discovery solicitations (10)
         source-quench         Source quenches (4)
         time-exceeded         All time exceededs (11)
         timestamp-reply       Timestamp replies (14)
         timestamp-request     Timestamp requests (13)
         unreachable           All unreachables (3)

        This is an optional node."                       x"ICMP code:
         <0-255>      valid value
         65535        invalid value
         This is an optional node."                       u"Precedence level:
         <0-7>   valid value
         255     invalid value
         This is an optional node."                       y"Type of service(ToS):
         <0-15>  valid value
         255     invalid value
         This is an optional node."                       o"DSCP value:
         <0-63>  valid value
         255     invalid value
         This is an optional node."                       F"Fragment enable or disable flag.
         This is an optional node."                       n"Match when the RST flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the ACK flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the FIN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the SYN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the PSH flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the URG flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       H"Time range name (1-31 characters).
         This is an optional node."                       "Match if source MAC address range is configured.
        When this is valid, zxr10ACLv4MixRuleSrcMAC and 
        zxr10ACLv4MixRuleSrcMACWildcard are invalid,
        zxr10ACLv4MixRuleSrcMACRg1Min and 
        zxr10ACLv4MixRuleSrcMACRg1Max are valid."                       K"<xxxx.xxxx.xxxx>  
        Lower limit of first source MAC address range"                       K"<xxxx.xxxx.xxxx>  
        Upper limit of first source MAC address range"                      "Match if second source MAC address range is configured.
        When this is valid, zxr10ACLv4MixRuleSrcMAC and 
        zxr10ACLv4MixRuleSrcMACWildcard are invalid,
        zxr10ACLv4MixRuleSrcMACRg2Min and 
        zxr10ACLv4MixRuleSrcMACRg2Max are valid."                       J"<xxxx.xxxx.xxxx>
        Lower limit of second source MAC address range"                       L"<xxxx.xxxx.xxxx>  
        Upper limit of second source MAC address range"                      
"Match if destination MAC address range is configured.
        When this is valid, zxr10ACLv4MixRuleDestMAC and 
        zxr10ACLv4MixRuleDestMACWildcard are invalid,
        zxr10ACLv4MixRuleDestMACRg1Min and  
        zxr10ACLv4MixRuleDestMACRg1Max are valid."                       P"<xxxx.xxxx.xxxx>  
        Lower limit of first destination MAC address range"                       P"<xxxx.xxxx.xxxx>  
        Upper limit of first destination MAC address range"                      "Match if second destination MAC address range is configured.
        When this is valid, zxr10ACLv4MixRuleDestMAC and 
        zxr10ACLv4MixRuleDestMACWildcard are invalid,
        zxr10ACLv4MixRuleDestMACRg2Min and 
        zxr10ACLv4MixRuleDestMACRg2Max are valid."                       O"<xxxx.xxxx.xxxx>
        Lower limit of second destination MAC address range"                       Q"<xxxx.xxxx.xxxx>  
        Upper limit of second destination MAC address range"                       ~"Link protocal:
         <1536-65535>  valid value
         65536         invalid value
         This is an optional node."                       �"Destination service access point:
         <0-255>       valid value
         65535         invalid value
         This is an optional node."                       �"Source service access point:
         <0-255>       valid value
         65535         invalid value
         This is an optional node."                           "IPv6 Mixed ACL Table"                       "IPv6 Mixed ACL"                       5"Name of an IPv6 Mixed access-list (1-31 characters)"                       "IPv6 Mixed ACL Rule Table"                      ;Z"IPv6 Mixed ACL 
        effective leaf nodes: 
        A leaf node which is effective or not depends on the type of rule.
        Rule types include standard type, ip type, tcp type, udp type ,icmp 
        type , represented by  zxr10ACLv4RuleIpProtocol in this table.
        According to the rule type (zxr10ACLv6MixRuleIpProtocol), the 
        following leaf nodes are effective. 
        1. rule type : ip type
           effective leaf nodes:zxr10ACLv6MixRuleAclName,
                                zxr10ACLv6MixRuleRuleID,
                                zxr10ACLv6MixRulePermitDeny,
                                zxr10ACLv6MixRuleLinkProtocol,
                                zxr10ACLv6MixRuleSrcMAC, 
                                zxr10ACLv6MixRuleSrcMACWildcard,
                                zxr10ACLv6MixRuleDestMAC,
                                zxr10ACLv6MixRuleDestMACWildcard,
                                zxr10ACLv6MixRuleIncos,
                                zxr10ACLv6MixRuleOutCos,
                                zxr10ACLv6MixRuleInVlanID,
                                zxr10ACLv6MixRuleOutVlanID,
                                zxr10ACLv6MixRuleInVlanRange,
                                zxr10ACLv6MixRuleOutVlanRange,
                                zxr10ACLv6MixRuleFlowlabel,  
                                zxr10ACLv6MixRuleSrcAddr, 
                                zxr10ACLv6MixRuleSrcWildcard,
                                zxr10ACLv6MixRuleDestAddr,
                                zxr10ACLv6MixRuleDestWildcard,
                                zxr10ACLv6MixRuleIpProtocol,
                                zxr10ACLv6MixRuleRouting,
                                zxr10ACLv6MixRuleAuthen,
                                zxr10ACLv6MixRuleDestops,
                                zxr10ACLv6MixRuleFragments,
                                zxr10ACLv6MixRuleHopByHop,
                                zxr10ACLv6MixRuleEsp,
                                zxr10ACLv6MixRuleDSCP, 
                                zxr10ACLv6MixRuleTc,
                                zxr10ACLv6MixRuleTimerangeName,
                                zxr10ACLv6MixRuleBSrcMACRange1,
                                zxr10ACLv6MixRuleSrcMACRg1Min,
                                zxr10ACLv6MixRuleSrcMACRg1Max,  
                                zxr10ACLv6MixRuleBSrcMACRange2,
                                zxr10ACLv6MixRuleSrcMACRg2Min,
                                zxr10ACLv6MixRuleSrcMACRg2Max,  
                                zxr10ACLv6MixRuleBDestMACRange1,
                                zxr10ACLv6MixRuleDestMACRg1Min,
                                zxr10ACLv6MixRuleDestMACRg1Max,  
                                zxr10ACLv6MixRuleBDestMACRange2,
                                zxr10ACLv6MixRuleDestMACRg2Min,
                                zxr10ACLv6MixRuleDestMACRg2Max,
                                zxr10ACLv6MixRuleLinkProtocolEx,
                                zxr10ACLv6MixRuleSrcAddrMaskFlag,
                                zxr10ACLv6MixRuleSrcWildcardBits,
                                zxr10ACLv6MixRuleDstAddrMaskFlag,
                                zxr10ACLv6MixRuleDstWildcardBits,
                                zxr10ACLv6MixRuleDsap,
                                zxr10ACLv6MixRuleSsap
        2. rule type : tcp type
            effective leaf nodes:zxr10ACLv6MixRuleAclName,
                                zxr10ACLv6MixRuleRuleID,
                                zxr10ACLv6MixRulePermitDeny,
                                zxr10ACLv6MixRuleLinkProtocol,
                                zxr10ACLv6MixRuleSrcMAC, 
                                zxr10ACLv6MixRuleSrcMACWildcard,
                                zxr10ACLv6MixRuleDestMAC,
                                zxr10ACLv6MixRuleDestMACWildcard,
                                zxr10ACLv6MixRuleIncos,
                                zxr10ACLv6MixRuleOutCos,
                                zxr10ACLv6MixRuleInVlanID,
                                zxr10ACLv6MixRuleOutVlanID,
                                zxr10ACLv6MixRuleInVlanRange,
                                zxr10ACLv6MixRuleOutVlanRange,
                                zxr10ACLv6MixRuleFlowlabel,  
                                zxr10ACLv6MixRuleSrcAddr, 
                                zxr10ACLv6MixRuleSrcWildcard,
                                zxr10ACLv6MixRuleDestAddr,
                                zxr10ACLv6MixRuleDestWildcard,
                                zxr10ACLv6MixRuleIpProtocol,
                                zxr10ACLv6MixRuleSrcPortOpr,
                                zxr10ACLv6MixRuleSrcPortValue,
                                zxr10ACLv6MixRuleSrcPortRange,
                                zxr10ACLv6MixRuleDestPortOpr,
                                zxr10ACLv6MixRuleDestPortValue,
                                zxr10ACLv6MixRuleDestPortRange,
                                zxr10ACLv6MixRuleTCPEstablish,
                                zxr10ACLv6MixRuleRstFlag,
                                zxr10ACLv6MixRuleAckFlag,
                                zxr10ACLv6MixRuleFinFlag,
                                zxr10ACLv6MixRuleSynFlag,
                                zxr10ACLv6MixRulePshFlag,
                                zxr10ACLv6MixRuleUrgFlag,
                                zxr10ACLv6MixRuleRouting,
                                zxr10ACLv6MixRuleAuthen,
                                zxr10ACLv6MixRuleDestops,
                                zxr10ACLv6MixRuleFragments,
                                zxr10ACLv6MixRuleHopByHop,
                                zxr10ACLv6MixRuleEsp,
                                zxr10ACLv6MixRuleDSCP, 
                                zxr10ACLv6MixRuleTc,
                                zxr10ACLv6MixRuleTimerangeName,
                                zxr10ACLv6MixRuleBSrcMACRange1,
                                zxr10ACLv6MixRuleSrcMACRg1Min,
                                zxr10ACLv6MixRuleSrcMACRg1Max,  
                                zxr10ACLv6MixRuleBSrcMACRange2,
                                zxr10ACLv6MixRuleSrcMACRg2Min,
                                zxr10ACLv6MixRuleSrcMACRg2Max,  
                                zxr10ACLv6MixRuleBDestMACRange1,
                                zxr10ACLv6MixRuleDestMACRg1Min,
                                zxr10ACLv6MixRuleDestMACRg1Max,  
                                zxr10ACLv6MixRuleBDestMACRange2,
                                zxr10ACLv6MixRuleDestMACRg2Min,
                                zxr10ACLv6MixRuleDestMACRg2Max,
                                zxr10ACLv6MixRuleSrcAddrMaskFlag,
                                zxr10ACLv6MixRuleSrcWildcardBits,
                                zxr10ACLv6MixRuleDstAddrMaskFlag,
                                zxr10ACLv6MixRuleDstWildcardBits
                                zxr10ACLv6MixRuleDsap,
                                zxr10ACLv6MixRuleSsap
        3. rule type : udp type
            effective leaf nodes:zxr10ACLv6MixRuleAclName,
                                zxr10ACLv6MixRuleRuleID,
                                zxr10ACLv6MixRulePermitDeny,
                                zxr10ACLv6MixRuleLinkProtocol,
                                zxr10ACLv6MixRuleSrcMAC, 
                                zxr10ACLv6MixRuleSrcMACWildcard,
                                zxr10ACLv6MixRuleDestMAC,
                                zxr10ACLv6MixRuleDestMACWildcard,
                                zxr10ACLv6MixRuleIncos,
                                zxr10ACLv6MixRuleOutCos,
                                zxr10ACLv6MixRuleInVlanID,
                                zxr10ACLv6MixRuleOutVlanID,
                                zxr10ACLv6MixRuleInVlanRange,
                                zxr10ACLv6MixRuleOutVlanRange,
                                zxr10ACLv6MixRuleFlowlabel,  
                                zxr10ACLv6MixRuleSrcAddr, 
                                zxr10ACLv6MixRuleSrcWildcard,
                                zxr10ACLv6MixRuleDestAddr,
                                zxr10ACLv6MixRuleDestWildcard,
                                zxr10ACLv6MixRuleIpProtocol,
                                zxr10ACLv6MixRuleSrcPortOpr,
                                zxr10ACLv6MixRuleSrcPortValue,
                                zxr10ACLv6MixRuleSrcPortRange,
                                zxr10ACLv6MixRuleDestPortOpr,
                                zxr10ACLv6MixRuleDestPortValue,
                                zxr10ACLv6MixRuleDestPortRange,
                                zxr10ACLv6MixRuleRouting,
                                zxr10ACLv6MixRuleAuthen,
                                zxr10ACLv6MixRuleDestops,
                                zxr10ACLv6MixRuleFragments,
                                zxr10ACLv6MixRuleHopByHop,
                                zxr10ACLv6MixRuleEsp,
                                zxr10ACLv6MixRuleDSCP,
                                zxr10ACLv6MixRuleTc,
                                zxr10ACLv6MixRuleTimerangeName,
                                zxr10ACLv6MixRuleBSrcMACRange1,
                                zxr10ACLv6MixRuleSrcMACRg1Min,
                                zxr10ACLv6MixRuleSrcMACRg1Max,  
                                zxr10ACLv6MixRuleBSrcMACRange2,
                                zxr10ACLv6MixRuleSrcMACRg2Min,
                                zxr10ACLv6MixRuleSrcMACRg2Max,  
                                zxr10ACLv6MixRuleBDestMACRange1,
                                zxr10ACLv6MixRuleDestMACRg1Min,
                                zxr10ACLv6MixRuleDestMACRg1Max,  
                                zxr10ACLv6MixRuleBDestMACRange2,
                                zxr10ACLv6MixRuleDestMACRg2Min,
                                zxr10ACLv6MixRuleDestMACRg2Max,
                                zxr10ACLv6MixRuleLinkProtocolEx,
                                zxr10ACLv6MixRuleSrcAddrMaskFlag,
                                zxr10ACLv6MixRuleSrcWildcardBits,
                                zxr10ACLv6MixRuleDstAddrMaskFlag,
                                zxr10ACLv6MixRuleDstWildcardBits
                                zxr10ACLv6MixRuleDsap,
                                zxr10ACLv6MixRuleSsap
        4. rule type : icmp type
            effective leaf nodes:zxr10ACLv6MixRuleAclName,
                                zxr10ACLv6MixRuleRuleID,
                                zxr10ACLv6MixRulePermitDeny,
                                zxr10ACLv6MixRuleLinkProtocol,
                                zxr10ACLv6MixRuleSrcMAC, 
                                zxr10ACLv6MixRuleSrcMACWildcard,
                                zxr10ACLv6MixRuleDestMAC,
                                zxr10ACLv6MixRuleDestMACWildcard,
                                zxr10ACLv6MixRuleIncos,
                                zxr10ACLv6MixRuleOutCos,
                                zxr10ACLv6MixRuleInVlanID,
                                zxr10ACLv6MixRuleOutVlanID,
                                zxr10ACLv6MixRuleInVlanRange,
                                zxr10ACLv6MixRuleOutVlanRange,
                                zxr10ACLv6MixRuleFlowlabel,
                                zxr10ACLv6MixRuleSrcAddr,
                                zxr10ACLv6MixRuleSrcWildcard,
                                zxr10ACLv6MixRuleDestAddr,
                                zxr10ACLv6MixRuleDestWildcard,
                                zxr10ACLv6MixRuleIpProtocol,
                                zxr10ACLv6MixRuleICMPType,
                                zxr10ACLv6MixRuleICMPCode,
                                zxr10ACLv6MixRuleRouting,
                                zxr10ACLv6MixRuleAuthen,
                                zxr10ACLv6MixRuleDestops,
                                zxr10ACLv6MixRuleFragments,
                                zxr10ACLv6MixRuleHopByHop,
                                zxr10ACLv6MixRuleEsp,
                                zxr10ACLv6MixRuleDSCP, 
                                zxr10ACLv6MixRuleTc,
                                zxr10ACLv6MixRuleTimerangeName,
                                zxr10ACLv6MixRuleBSrcMACRange1,
                                zxr10ACLv6MixRuleSrcMACRg1Min,
                                zxr10ACLv6MixRuleSrcMACRg1Max,  
                                zxr10ACLv6MixRuleBSrcMACRange2,
                                zxr10ACLv6MixRuleSrcMACRg2Min,
                                zxr10ACLv6MixRuleSrcMACRg2Max,  
                                zxr10ACLv6MixRuleBDestMACRange1,
                                zxr10ACLv6MixRuleDestMACRg1Min,
                                zxr10ACLv6MixRuleDestMACRg1Max,  
                                zxr10ACLv6MixRuleBDestMACRange2,
                                zxr10ACLv6MixRuleDestMACRg2Min,
                                zxr10ACLv6MixRuleDestMACRg2Max,
                                zxr10ACLv6MixRuleLinkProtocolEx,
                                zxr10ACLv6MixRuleSrcAddrMaskFlag,
                                zxr10ACLv6MixRuleSrcWildcardBits,
                                zxr10ACLv6MixRuleDstAddrMaskFlag,
                                zxr10ACLv6MixRuleDstWildcardBits
                                zxr10ACLv6MixRuleDsap,
                                zxr10ACLv6MixRuleSsap
        conflict leaf nodes:
        1. zxr10ACLv6MixRuleFragments conflicts with 
                                zxr10ACLv6MixRuleSrcPortOpr,
                                zxr10ACLv6MixRuleSrcPortValue,
                                zxr10ACLv6MixRuleSrcPortRange,
                                zxr10ACLv6MixRuleDestPortOpr,
                                zxr10ACLv6MixRuleDestPortValue,
                                zxr10ACLv6MixRuleDestPortRange,
                                zxr10ACLv6MixRuleTCPEstablish,
                                zxr10ACLv6MixRuleICMPType,
                                zxr10ACLv6MixRuleICMPCode,
                                zxr10ACLv6MixRuleRstFlag,
                                zxr10ACLv6MixRuleAckFlag,
                                zxr10ACLv6MixRuleFinFlag,
                                zxr10ACLv6MixRuleSynFlag,
                                zxr10ACLv6MixRulePshFlag,
                                zxr10ACLv6MixRuleUrgFlag 
         2. zxr10ACLv6MixRuleDSCP conflicts with 
                                zxr10ACLv6MixRuleTc
         3. zxr10ACLv6MixRuleTCPEstablish conflicts with
                                zxr10ACLv6MixRuleRstFlag, 
                                zxr10ACLv6MixRuleAckFlag
         3. zxr10ACLv6MixRuleLinkProtocolEx conflicts with
                                zxr10ACLv6MixRuleDsap,
                                zxr10ACLv6MixRuleSsap
                                "                       5"Name of an IPv6 Mixed access-list (1-31 characters)"                       "ID of this rule"                       R"deny  :  Specify packets to reject
         permit:  Specify packets to forward"                       x"Link protocal:
         <0-65535>  valid value
         65536      invalid value
         This is an optional node."                       &"<xxxx.xxxx.xxxx>  Source MAC address"                       '"<xxxx.xxxx.xxxx>  Source MAC wildcard"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       ,"<xxxx.xxxx.xxxx>  Destination MAC wildcard"                       u"Value of inner cos:
         <0-7>  valid value
         255    invalid value
         This is an optional node."                       u"Value of outer cos:
         <0-7>  valid value
         255    invalid value
         This is an optional node."                       }"Value of inner vlan
         <1-4094>   valid value
         65535      invalid value
         This is an optional node."                       }"Value of outer vlan
         <1-4094>   valid value
         65535      invalid value
         This is an optional node."                       �"Range of inner vlan
         <1-4094>-<1-4094>    valid value
         0                    invalid value
         This is an optional node."                       �"Range of outer vlan
         <1-4094>-<1-4094>    valid value
         0                    invalid value
         This is an optional node."                       ~"Flowlabel value:
         <0-1048575>  valid value
         2147483647   invalid value
         This is an optional node."                       "X:X::X:X  Source address"                       "<0-128>  Source Wildcard"                       "X:X::X:X  Destination address"                       "<0-128>  Destination Wildcard"                      W" <0-255>  An IP protocol number
          gre      Generic Routing Encapsulation (47)
          icmp     Internet Control Message Protocol (58)
          igmp     Internet Group Management Protocol (2)
          ip       Any internet protocol (65535) 
          ospf     Open Shortest Path First Protocol (89)
          pim      Protocol Independent Multicast (103)
          tcp      Transmission Control Protocol (6)
          udp      User Datagram Protocol (17)
          sctp     Stream Control Transmission Protocol (132)
          vrrp     Virtual Router Redundancy Protocol (112)"                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
 
        Needn't care for zxr10ACLv6MixRuleSrcPortValue and 
        zxr10ACLv6MixRuleSrcPortRange When the value of 
        zxr10ACLv6MixRuleSrcPortOpr is invalid(65535).
        Check zxr10ACLv6MixRuleSrcPortValue when the value 
        zxr10ACLv6MixRuleSrcPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv6MixRuleSrcPortRange only when the value 
        of zxr10ACLv6MixRuleSrcPortOpr is range(7)."                      z"<0-65535>   Port number 
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv6MixRuleSrcPortOpr is 
        eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv6MixRuleSrcPortRange only when the value of 
        zxr10ACLv6MixRuleSrcPortOpr is range(7)."                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number 
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
 
        Needn't care for zxr10ACLv6MixRuleDestPortValue and 
        zxr10ACLv6MixRuleDestPortRange When the value of 
        zxr10ACLv6MixRuleDestPortOpr is invalid(65535).
        Check zxr10ACLv6MixRuleDestPortValue when the value 
        zxr10ACLv6MixRuleDestPortOpr is eq(1),ge(2) or le(3).
        Check zxr10ACLv6MixRuleDestPortRange only when the value of 
        zxr10ACLv6MixRuleDestPortOpr is range(7)."                      {"<0-65535>   Port number 
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)

        Check this node when the value of zxr10ACLv6MixRuleDestPortOpr is 
        eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check zxr10ACLv6MixRuleDestPortRange only when the value of 
        zxr10ACLv6MixRuleDestPortOpr is range(7)."                       D"Match established connections.
         This is an optional node."                       n"Match when the RST flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the ACK flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the FIN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the SYN flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the PSH flag set or not.
         This is an optional node.
         invalid value:     (65535)"                       n"Match when the URG flag set or not.
         This is an optional node.
         invalid value:     (65535)"                      �"ICMP type:
        <0-255>               valid value
        65535                 invalid value
        specific value:
        destination-unreachable  Destination unreachable (1)
        echo-reply               Echo reply (129)
        echo-request             Echo request (ping, 128)
        mld-query                Multicast Listener Discovery Query (130)
        mld-reduction            Multicast Listener Discovery Reduction(132)
        mld-report               Multicast Listener Discovery Report(131)
        nd-na                    Neighbor discovery neighbor advertisments(136)
        nd-ns                    Neighbor discovery neighbor solicitations(135)
        packet-too-big           Packet too big (2)
        parameter-problem        All parameter problems (4)
        redirect                 Neighbor redirect (137)
        router-advertisment      Neighbor discovery router advertisments(134)
        router-renumbering       All router renumbering (138)
        router-solicitation      Neighbor discovery router solicitations(133)
        time-exceeded            Time exceeded (3)

        This is an optional node."                       x"ICMP code:
         <0-255>      valid value
         65535        invalid value
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       R"Match if the specify IPv6 header is present.
         This is an optional node."                       o"DSCP value:
         <0-63>  valid value
         255     invalid value
         This is an optional node."                       z"Traffic Class value:
         <0-255>  valid value
         65535    invalid value
         This is an optional node."                       H"Time range name (1-31 characters).
         This is an optional node."                       "Match if source MAC address range is configured.
        When this is valid, zxr10ACLv6MixRuleSrcMAC and 
        zxr10ACLv6MixRuleSrcMACWildcard are invalid,
        zxr10ACLv6MixRuleSrcMACRg1Min and 
        zxr10ACLv6MixRuleSrcMACRg1Max are valid."                       K"<xxxx.xxxx.xxxx>  
        Lower limit of first source MAC address range"                       K"<xxxx.xxxx.xxxx>  
        Upper limit of first source MAC address range"                      "Match if second source MAC address range is configured.
        When this is valid, zxr10ACLv6MixRuleSrcMAC and 
        zxr10ACLv6MixRuleSrcMACWildcard are invalid,
        zxr10ACLv6MixRuleSrcMACRg2Min and 
        zxr10ACLv6MixRuleSrcMACRg2Max are valid."                       J"<xxxx.xxxx.xxxx>
        Lower limit of second source MAC address range"                       L"<xxxx.xxxx.xxxx>  
        Upper limit of second source MAC address range"                      "Match if destination MAC address range is configured.
        When this is valid, zxr10ACLv6MixRuleDestMAC and 
        zxr10ACLv6MixRuleDestMACWildcard are invalid,
        zxr10ACLv6MixRuleDestMACRg1Min and
        zxr10ACLv6MixRuleDestMACRg1Max are valid."                       P"<xxxx.xxxx.xxxx>  
        Lower limit of first destination MAC address range"                       P"<xxxx.xxxx.xxxx>  
        Upper limit of first destination MAC address range"                      "Match if second destination MAC address range is configured.
        When this is valid, zxr10ACLv6MixRuleDestMAC and 
        zxr10ACLv6MixRuleDestMACWildcard are invalid,
        zxr10ACLv6MixRuleDestMACRg2Min and 
        zxr10ACLv6MixRuleDestMACRg2Max are valid."                       O"<xxxx.xxxx.xxxx>
        Lower limit of second destination MAC address range"                       Q"<xxxx.xxxx.xxxx>  
        Upper limit of second destination MAC address range"                       ~"Link protocal:
         <1536-65535>  valid value
         65536         invalid value
         This is an optional node."                      �"This flag indicates the way of configuring IPv6 source address mask,
        such as zxr10ACLv6MixRuleSrcWildcard, zxr10ACLv6MixRuleSrcWildcardBits.
        If this flag is valid, IPv6 source address mask is configured by 
        wildcard bits, (e.g. X:X::X:X) and zxr10ACLv6MixRuleSrcWildcardBits 
        is valid;
        if not, IPv6 source address mask is configured by prefix length,
        (e.g. X:X::X:X/0-128) and zxr10ACLv6MixRuleSrcWildcard is valid."                       +"<X:X::X:X>   Source address wildcard bits"                      �"This flag indicates the way of configuring IPv6 destination address 
        mask, such as zxr10ACLv6MixRuleDestWildcard, 
        zxr10ACLv6MixRuleDstWildcardBits.
        If this flag is valid, IPv6 destination address mask is configured by 
        wildcard bits, (e.g. X:X::X:X) and zxr10ACLv6MixRuleDstWildcardBits 
        is valid; 
        if not, IPv6 destination address mask is configured by prefix length,
        (e.g. X:X::X:X/0-128) and zxr10ACLv6MixRuleDestWildcard is valid."                       0"<X:X::X:X>   Destination address wildcard bits"                       �"Destination service access point:
         <0-255>       valid value
         65535         invalid value
         This is an optional node."                       �"Source service access point:
         <0-255>       valid value
         65535         invalid value
         This is an optional node."                           "User Protocol ACL"                       "User Protocol ACL"                       7"Name of a User Protocol access-list (1-31 characters)"                       "User Protocol Rule Table"                      "User Protocol ACL
        effective leaf nodes: 
          All of the leaf nodes are effective:
                              zxr10ACLUsrProtocolRuleAclName,
                              zxr10ACLUsrProtocolRuleRuleID,
                              zxr10ACLUsrProtocolRuleEtherType,
                              zxr10ACLUsrProtocolRuleDestMAC,
                              zxr10ACLUsrProtocolRuleDMACMask,
                              zxr10ACLUsrProtocolRuleAnyEther,
        conflict leaf nodes:
       "                       7"Name of a User Protocol access-list (1-31 characters)"                       "ID of this rule"                       b"Ether type of User Protocol:
         <0-65535>  valid value
         65536      invalid value"                       +"<xxxx.xxxx.xxxx>  Destination MAC address"                       W"<xxxx.xxxx.xxxx>  Destination MAC address wildcard
        This is an optional node."                       0"Match any ethernet type if the value is valid."                           "User defined ACL"                       "User defined ACL"                       6"Name of a User defined access-list (1-31 characters)"                       "User defined Rule Table"                      W"User defined ACL
        effective leaf nodes: 
          All of the leaf nodes are effective:
                              zxr10ACLUsrDefRuleAclName,
                              zxr10ACLUsrDefRuleRuleID,
                              zxr10ACLUsrDefRulePermitDeny,
                              zxr10ACLUsrDefRuleFrameType,
                              zxr10ACLUsrDefRuleTagStatus,
                              zxr10ACLUsrDefRuleIpFlag,
                              zxr10ACLUsrDefRuleAnySegment,
                              zxr10ACLUsrDefRuleOffSet1,
                              zxr10ACLUsrDefRuleRuleString1,
                              zxr10ACLUsrDefRuleRuleMask1,
                              zxr10ACLUsrDefRuleOffSet2,
                              zxr10ACLUsrDefRuleRuleString2,
                              zxr10ACLUsrDefRuleRuleMask2,
                              zxr10ACLUsrDefRuleOffSet3,
                              zxr10ACLUsrDefRuleRuleString3,
                              zxr10ACLUsrDefRuleRuleMask3,
                              zxr10ACLUsrDefRuleOffSet4,
                              zxr10ACLUsrDefRuleRuleString4,
                              zxr10ACLUsrDefRuleRuleMask4,
                              zxr10ACLUsrDefRuleTimerangeName,
                              
        conflict leaf nodes:
       "                       6"Name of a User defined access-list (1-31 characters)"                       "ID of this rule"                       R"deny  :  Specify packets to reject
         permit:  Specify packets to forward"                       �" ethernet2   Ethernet version II frame  
          llc_snap    LLC/SNAP frame in IEEE802.3
          sap         SAP frame in IEEE802.3
          any         Any frame"                       �"untag         Status with no VLAN tag
         single_tag    Status with VLAN tag
         double_tag    Status with outer and inner VLAN tag
         any           Any status with VLAN tag"                      �"ip4_hdr_only             Segment of only IPv4 header
         ip6_hdr_only             Segment of only IPv6 header
         ip6_fragment             Segment of IPv6 fragment
         ip4_over_ip4             Segment of IPv4 datagram over IPv4
         ip6_over_ip4             Segment of IPv6 datagram over IPv4
         ip6_fragment_over_ip4    Segment of IPv6 fragment datagram over IPv4
         ip4_over_ip6             Segment of IPv4 datagram over IPv6
         ip6_over_ip6             Segment of IPv6 datagram over IPv6
         gre_ip4_over_ip4         Segment of IPv4 datagram over IPv4 by GRE
         gre_ip6_over_ip4         Segment of IPv6 datagram over IPv4 by GRE
         gre_ip4_over_ip6         Segment of IPv4 datagram over IPv6 by GRE
         gre_ip6_over_ip6         Segment of IPv6 datagram over IPv6 by GRE
         ip_unused                None IP format datagram
         one_mpls_label           Segment of the first label out of tunnel
         two_mpls_labels          Segment of the second label in tunnel
         any_mpls_labels          Segment of any or multiple MPLS label
         any                      Any segment"                       " Any rule segment."                       |"First offset from packet head (2+4*n, n = 0, 1, 2, ...)
         2-126     valid value
         65535     invalid value."                       >"First user defined hexadecimal string(must be 10 characters)"                       C"First user defined hexadecimal string mask(must be 10 characters)"                       }"Second offset from packet head (2+4*n, n = 0, 1, 2, ...)
         2-126     valid value
         65535     invalid value."                       ?"Second user defined hexadecimal string(must be 10 characters)"                       D"Second user defined hexadecimal string mask(must be 10 characters)"                       |"Third offset from packet head (2+4*n, n = 0, 1, 2, ...)
         2-126     valid value
         65535     invalid value."                       >"Third user defined hexadecimal string(must be 10 characters)"                       C"Third user defined hexadecimal string mask(must be 10 characters)"                       }"Fourth offset from packet head (2+4*n, n = 0, 1, 2, ...)
         2-126     valid value
         65535     invalid value."                       ?"Fourth user defined hexadecimal string(must be 10 characters)"                       D"Fourth user defined hexadecimal string mask(must be 10 characters)"                       H"Time range name (1-31 characters).
         This is an optional node."                           "IPv4 VXLAN ACL"                       "IPv4 VXLAN ACL"                       5"Name of an IPv4 VXLAN access-list (1-31 characters)"                       �"If the flag is setted with valid,
         this acl can not be configed with VNI.
         If the flag is setted with invalid,
         this acl can be configed with VNI."                       "RowStatus"                       "IPv4 VXLAN ACL Rule Table"                      �"IPv4 VXLAN ACL
        effective leaf nodes: 
          All of the leaf nodes are effective:
                              
        conflict leaf nodes:
          These 3 nodes below conflict, can only config one at most:
            zxr10ACLv4VxlanRulePrecedenceIn,
            zxr10ACLv4VxlanRuleTOSIn,
            zxr10ACLv4VxlanRuleDSCPIn
          
          These 3 nodes below conflict, can only config one at mos:
            zxr10ACLv4VxlanRulePrecedenceOut,
            zxr10ACLv4VxlanRuleTOSOut,
            zxr10ACLv4VxlanRuleDSCPOut 
          
          The inner-layer information contains these nodes below:
            zxr10ACLv4VxlanRuleInnerFlag,
            zxr10ACLv4VxlanRuleIpProtocolIn,
            zxr10ACLv4VxlanRuleSrcAddrIn,
            zxr10ACLv4VxlanRuleSrcIMaskIn,
            zxr10ACLv4VxlanRuleSrcAnyIn,
            zxr10ACLv4VxlanRuleDstAddrIn,
            zxr10ACLv4VxlanRuleDstIMaskIn,
            zxr10ACLv4VxlanRuleDstAnyIn,
            zxr10ACLv4VxlanRuleSrcPortOprIn,
            zxr10ACLv4VxlanRuleSrcPortValIn,
            zxr10ACLv4VxlanRuleSrcPortRgIn,
            zxr10ACLv4VxlanRuleDstPortOprIn,
            zxr10ACLv4VxlanRuleDstPortValIn,
            zxr10ACLv4VxlanRuleDstPortRgIn,
            zxr10ACLv4VxlanRulePrecedenceIn,
            zxr10ACLv4VxlanRuleTOSIn,
            zxr10ACLv4VxlanRuleDSCPIn
          The outer-layer information contains these nodes below:
            zxr10ACLv4VxlanRuleOuterFlag,
            zxr10ACLv4VxlanRuleIpProtocolOut,
            zxr10ACLv4VxlanRuleSrcAddrOut,
            zxr10ACLv4VxlanRuleSrcIMaskOut,
            zxr10ACLv4VxlanRuleSrcAnyOut,
            zxr10ACLv4VxlanRuleDstAddrOut,
            zxr10ACLv4VxlanRuleDstIMaskOut,
            zxr10ACLv4VxlanRuleDstAnyOut,
            zxr10ACLv4VxlanRuleSrcPortOprOut,
            zxr10ACLv4VxlanRuleSrcPortValOut,
            zxr10ACLv4VxlanRuleSrcPortRgOut,
            zxr10ACLv4VxlanRuleDstPortOprOut,
            zxr10ACLv4VxlanRuleDstPortValOut,
            zxr10ACLv4VxlanRuleDstPortRgOut,
            zxr10ACLv4VxlanRulePrecedenceOut,
            zxr10ACLv4VxlanRuleTOSOut,
            zxr10ACLv4VxlanRuleDSCPOut
          
       "                       5"Name of an IPv4 VXLAN access-list (1-31 characters)"                       "ID of this rule"                       �"The node has two values:
         1. deny means that packets can not be handled.
         2. permit means that packets can be handled."                       �"If the flag is setted with valid, 
         the inner infomation is meaningful.
         If the flag is setted with invalid,
         the inner infomation is not meaningful."                      " <0-255>  An IP protocol number  
          gre      Generic Routing Encapsulation (47)
          icmp     Internet Control Message Protocol(1)
          igmp     Internet Group Management Protocol (2)
          ip       Any internet protocol(65535)
          ospf     Open Shortest Path First Protocol (89)
          pim      Protocol Independent Multicast (103)
          tcp      Transmission Control Protocol(6)
          udp      User Datagram Protocol(17)
          vrrp     Virtual Router Redundancy Protocol (112)"                       "A.B.C.D  Source address"                       "A.B.C.D  Wildcard bits"                       Z"If the flag is setted with valid,
         the rule is effective to any source address."                       "A.B.C.D  Destination address"                       $"A.B.C.D  Destination wildcard bits"                       _"If the flag is setted with valid,
         the rule is effective to any destination address."                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
         
        Needn't care for zxr10ACLv4VxlanRuleSrcPortValIn and 
        zxr10ACLv4VxlanRuleSrcPortRgIn When the value of 
        zxr10ACLv4VxlanRuleSrcPortOprIn is invalid(65535).
        Check zxr10ACLv4VxlanRuleSrcPortValIn when the value 
        zxr10ACLv4VxlanRuleSrcPortOprIn is eq(1),ge(2) or le(3).
        Check zxr10ACLv4VxlanRuleSrcPortRgIn only when the value
        of zxr10ACLv4VxlanRuleSrcPortOprIn is range(7)."                      �"<0-65535>   Port number 
        UDP protocol contains known port as follows:
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)
        TCP protocol contains known port as follows:
        bgp          Border gateway protocol (179)
        domain       Domain name service (53)
        finger       Finger (79)
        ftp          File transfer protocol (21)
        login        Login (rlogin, 513)
        pop2         Post office protocol v2 (109)
        pop3         Post office protocol v3 (110)
        smtp         Simple mail transport protocol (25)
        telnet       Telnet (23)
        www          World wide web (HTTP, 80)
                 
        Check this node when the value of zxr10ACLv4VxlanRuleSrcPortOprIn
        is eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check this node only when the value of 
        zxr10ACLv4RuleSrcPortOprIn is range(7)."                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
         
        Needn't care for zxr10ACLv4VxlanRuleDstPortValIn and 
        zxr10ACLv4VxlanRuleDstPortRgIn When the value of 
        zxr10ACLv4VxlanRuleDestPortOprIn is invalid(65535).
        Check zxr10ACLv4VxlanRuleDstPortValIn when the value 
        zxr10ACLv4VxlanRuleDestPortOprIn is eq(1),ge(2) or le(3).
        Check zxr10ACLv4VxlanRuleDstPortRgIn only when the value
        of zxr10ACLv4VxlanRuleDestPortOprIn is range(7)."                      �"<0-65535>   Port number
        UDP protocol contains known port as follows:
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)
        TCP protocol contains known port as follows:
        bgp          Border gateway protocol (179)
        domain       Domain name service (53)
        finger       Finger (79)
        ftp          File transfer protocol (21)
        login        Login (rlogin, 513)
        pop2         Post office protocol v2 (109)
        pop3         Post office protocol v3 (110)
        smtp         Simple mail transport protocol (25)
        telnet       Telnet (23)
        www          World wide web (HTTP, 80)

        Check this node when the value of zxr10ACLv4VxlanRuleDestPortOprIn
        is eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check this node only when the value of 
        zxr10ACLv4VxlanRuleDestPortOprIn is range(7)."                       �"Precedence level:
         <0-7>   valid value
         255     invalid value
         This is an optional node.
         This node conflicts with zxr10ACLv4VxlanRuleTOSIn 
         and zxr10ACLv4VxlanRuleDSCPIn."                       �"Type of service(ToS):
         <0-15>  valid value
         255     invalid value
         This is an optional node.
         This node conflicts with zxr10ACLv4VxlanRulePrecedenceIn 
         and zxr10ACLv4VxlanRuleDSCPIn."                       �"DSCP value:
         <0-63>  valid value
         255     invalid value
         This is an optional node.
         This node conflicts with zxr10ACLv4VxlanRulePrecedenceIn 
         and zxr10ACLv4VxlanRuleTOSIn"                       L"VXLAN id. 
         Range is 1 to 16777215.
         0 is invalid value."                       �"If the flag is setted with valid,
         the outer infomatino is meaningful.
         If the flag is setted with invalid,
         the outer infomation is not meaningful."                       I" udp      User Datagram Protocol(17)
          65533    Invalid value."                       "A.B.C.D  Source address"                       "A.B.C.D  Wildcard bits"                       X"If the flag is setted with valid,
         the rule is effective to any dest address."                       "A.B.C.D  Destination address"                       $"A.B.C.D  Destination wildcard bits"                       _"If the flag is setted with valid,
         the rule is effective to any destination address."                      �"This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
         
        Needn't care for zxr10ACLv4VxlanRuleSrcPortValOut and 
        zxr10ACLv4VxlanRuleSrcPortRgOut When the value of 
        zxr10ACLv4VxlanRuleSrcPortOprOut is invalid(65535).
        Check zxr10ACLv4VxlanRuleSrcPortValOut when the value 
        zxr10ACLv4VxlanRuleSrcPortOprOut is eq(1),ge(2) or le(3).
        Check zxr10ACLv4VxlanRuleSrcPortRgOut only when the value
        of zxr10ACLv4VxlanRuleSrcPortOprOut is range(7)."                      �"<0-65535>   Port number
        UDP protocol contains known port as follows:
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)
        TCP protocol contains known port as follows:
        bgp          Border gateway protocol (179)
        domain       Domain name service (53)
        finger       Finger (79)
        ftp          File transfer protocol (21)
        login        Login (rlogin, 513)
        pop2         Post office protocol v2 (109)
        pop3         Post office protocol v3 (110)
        smtp         Simple mail transport protocol (25)
        telnet       Telnet (23)
        www          World wide web (HTTP, 80)

        Check this node when the value of zxr10ACLv4VxlanRuleSrcPortOprOut
        is eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check this node only when the value of 
        zxr10ACLv4RuleSrcPortOprIn is range(7)."                      "This is an optional node.
         eq       Match only packets on a given port number
         ge       Match only packets with a no lower port number
         le       Match only packets with a no greater port number
         range    Match only packet on a given port range
         65535    invalid value
         
        Needn't care for zxr10ACLv4VxlanRuleDstPortValOut and 
        zxr10ACLv4VxlanRuleDstPortRgOut When the value of 
        zxr10ACLv4VxlanRuleDestPortOprOut is invalid(65535).
        Check zxr10ACLv4VxlanRuleDstPortValOut when the value 
        zxr10ACLv4VxlanRuleDestPortOprOut is eq(1),ge(2) or le(3).
        Check zxr10ACLv4VxlanRuleDstPortRgOut only when the value
        of zxr10ACLv4VxlanRuleDestPortOprOut is range(7)."                      �"<0-65535>   Port number
        UDP protocol contains known port as follows:
        bootpc       Bootstrap protocol (BOOTP) client (68)
        bootps       Bootstrap protocol (BOOTP) server (67)
        domain       Domain name service (DNS, 53)
        ntp          Network time protocol (123)
        pim-auto-rp  PIM auto-RP (496)
        rip          Routing information protocol (router, in.routed, 520)
        snmp         Simple network management protocol (161)
        snmptrap     SNMP traps (162)
        tftp         Trivial file transfer protocol (69)
        TCP protocol contains known port as follows:
        bgp          Border gateway protocol (179)
        domain       Domain name service (53)
        finger       Finger (79)
        ftp          File transfer protocol (21)
        login        Login (rlogin, 513)
        pop2         Post office protocol v2 (109)
        pop3         Post office protocol v3 (110)
        smtp         Simple mail transport protocol (25)
        telnet       Telnet (23)
        www          World wide web (HTTP, 80)

        Check this node when the value of zxr10ACLv4VxlanRuleDestPortOprOut
        is eq(1),ge(2) or le(3)."                       �"Port range:  <0-65535>-<0-65535>
        Check this node only when the value of 
        zxr10ACLv4VxlanRuleDestPortOprOut is range(7)."                       �"Precedence level:
         <0-7>   valid value
         255     invalid value
         This is an optional node.
         This node conflicts with zxr10ACLv4VxlanRuleTOSOut 
         and zxr10ACLv4VxlanRuleDSCPOut."                       �"Type of service(ToS):
         <0-15>  valid value
         255     invalid value
         This is an optional node.
         This node conflicts with zxr10ACLv4VxlanRulePrecedenceOut 
         and zxr10ACLv4VxlanRuleDSCPOut."                       �"DSCP value:
         <0-63>  valid value
         255     invalid value
         This is an optional node.
         This node conflicts with zxr10ACLv4VxlanRulePrecedenceOut 
         and zxr10ACLv4VxlanRuleTOSOut."                       "RowStatus"                                   "IPv4 ACL group."                 "IPv6 ACL group."                 "Link ACL group."                 "IPv4 mixed ACL group."                 "IPv6 mixed ACL group."                 "User protocol ACL group."                 "User defined ACL group."                 "IPv4 VXLAN ACL group."                                            