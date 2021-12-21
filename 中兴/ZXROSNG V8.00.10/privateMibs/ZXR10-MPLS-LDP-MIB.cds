B-- *****************************************************************
-- Mpls_Ldp.mib 
-- MPLS Label Distribution Protocol MIB Definitions
-- chenransheng187417
-- 2009-11-3
--
-- Copyright (c) 1985-2008 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
                                                                         �"This MIB contains managed object definitions for the
             'Multiprotocol Label Switching, Label Distribution
             Protocol, LDP' document."�"Joan Cucchiara (jcucchiara@crescentnetworks.com)
              Crescent Networks

              Hans Sjostrand (hans@ipunplugged.com)
              ipUnplugged

              James V. Luciani (jluciani@crescentnetworks.com)
              Crescent Networks

              Working Group Chairs:
              George Swallow,   email: swallow@cisco.com
              Vijay Srinivasan, email: vijay@cosinecom.com
              MPLS Working Group, email: mpls@uu.net
         " "201511260900Z" "201401090900Z" "201406261200Z" "201403051200Z" "201402271200Z" "201401071200Z" "201312231200Z" "201311041200Z" "201310281200Z" "201307261200Z" "201307091200Z" "201305081200Z" "201302281200Z" "200108161200Z""modify: change MAX-ACCESS from read-only to not-accessible
                      of below nodes in zxr10LdpBfdTable:
                   zxr10LdpBfdAddrType
                   zxr10LdpBfdDstAddr
                   zxr10LdpBfdPrefixLength
             " ."add: zxr10LdpIgpSyncIntTable
              "�"modify: change DEFVAL from number to defined word 
                      of below tables or nodes:
                   zxr10LdpGr zxr10LdpLabelRetentionMode
                   zxr10LdpLspControlMode zxr10LdpGlblAutoCfgMode
                   zxr10LdpV6GlblAutoCfgMode zxr10LdpV4IntfLblDistributeMode
                   zxr10LdpV4IntfGtsm zxr10LdpV6IntfLblDistributeMode
             " H"modify: change zxr10LdpConnWithDod STATUS to 'obsolete'
             "^"modify: modify word spell fault of below 
                      tables or nodes decription:
                   zxr10LdpLabelAdvertise zxr10LdpInstCfgEntry
                   zxr10LdpFecAddr zxr10LdpGrSessNeighborLiveTime
                   zxr10LdpInterfaceEntry zxr10LdpLabelAdvertiseEntry
                   zxr10LdpBfdSrcAddr
             "I"add: zxr10LdpV6TrafficCntAcl in zxr10LdpInstCfgTable
                   zxr10LdpV6GlblAutoCfgMode in zxr10LdpInstCfgTable
                   zxr10LdpV6DisAutoCfgIntTable
              modify: modify zxr10LdpTrafficCntAcl node description
                      modify zxr10LdpGlblAutoCfgMode node description
              " j"add: zxr10LdpPeerBfdDelay,zxr10LdpPeerBfdTime
                   in zxr10LdpPeerBfdTable
             " X"add: zxr10LdpBfdSrcAddr,zxr10LdpBfdProtectBind
                   in zxr10LdpBfdTable"q"modify: modify word spell fault of below 
                      tables or nodes decription:
                   zxr10LdpGrTable zxr10LdpGrEntry
                   zxr10LdpGrSessMaxRecoveryTime zxr10LdpMd5PwdFlag
                   zxr10LdpSessTable zxr10LdpSessHelloNumber
                   zxr10LdpSessTcpRetry zxr10LdpDirectHelloHoldTime
                   zxr10LdpDirectHelloInterTime zxr10LdpInstanceNo
                   zxr10LdpInstNo zxr10LdpV4IntfLdpInstNo
                   zxr10LdpV6IntfLdpInstNo zxr10LdpGtsmLdpInstNo
                   zxr10LdpPeerBfdLdpInstNo zxr10LdpV4DisACIntfInstNo
             " v"add: zxr10LdpGlblAutoCfgMode in zxr10LdpInstCfgTable
                   zxr10LdpV4DisAutoCfgIntTable
             ""add: zxr10LdpLostIngressOctets in zxr10LdpFecTable
                   zxr10LdpLostIngressPackets in zxr10LdpFecTable
                   zxr10LdpLostTransitOctets in zxr10LdpFecTable
                   zxr10LdpLostTransitPackets in zxr10LdpFecTable
             "u"add: zxr10LdpTrafficCntAcl in zxr10LdpInstCfgTable
              modify: change SYNTAX from Counter32 to Counter64
                      of below nodes in zxr10LdpFecTable:
                      zxr10LdpIngressOctets
                      zxr10LdpIngressPackets
                      zxr10LdpTransitOctets
                      zxr10LdpTransitPackets
             " �"add: zxr10LdpInstCfgTable
                   zxr10LdpV4IntfCfgTable
                   zxr10LdpV6IntfCfgTable
                   zxr10LdpGtsmTable
                   zxr10LdpPeerBfdTable
             " "Initial revision."                   "The router id of the LSR."                       "The name of the VPN instance."                       "Show if the mpls ldp is up."                       x"If the value of this object is 1,
                     then the function of Ldp Trap is
                     enable."                       $"The ACL name about LDP fec filter."                       W"If the value of this object is 1,
                     then access bgp route as fec."                       ]"If the value of this object is 1,
                     then access host route as fec only."                      J"LDP discovery direct hello holdtime.
                    
                     A value of 0 means the default,
                     which is 15 seconds for Link Hellos
                     and 45 seconds for Targeted Hellos.
                     A value of 65535 indicates an
                     infinite hello hold time."                      M"LDP discovery direct hello interval.
                    
                     A value of 0 means the default,
                     which is 5 seconds for Link Hellos
                     and 15 seconds for Targeted Hellos.
                     A value of 65535 indicates an
                     infinite hello interval time."                      J"LDP discovery target hello holdtime.
                    
                     A value of 0 means the default,
                     which is 15 seconds for Link Hellos
                     and 45 seconds for Targeted Hellos.
                     A value of 65535 indicates an
                     infinite hello hold time."                      M"LDP discovery target hello interval.
                    
                     A value of 0 means the default,
                     which is 5 seconds for Link Hellos
                     and 15 seconds for Targeted Hellos.
                     A value of 65535 indicates an
                     infinite hello interval time."                      r"Initial session backoff time in seconds.
                    
                     A value of 0 means the default,
                     which is 15 seconds for Initial backoff 
                     time and 120 seconds for Maximum backoff 
                     time.
                     A value of 65535 indicates an
                     infinite backoff time."                      r"Maximum session backoff time in seconds.
                    
                     A value of 0 means the default,
                     which is 15 seconds for Initial backoff 
                     time and 120 seconds for Maximum backoff 
                     time.
                     A value of 65535 indicates an
                     infinite backoff time."                       2"Acl specifying controls on destination prefixes."                       %"Acl specifying controls on nexthop."                       j"If the value of this object is 1,
                    then the LDP connect with dod mode LSR is enable."                       v"If the value of this object is 1,
                    then advertise explicit null label in place of implicit null."                       2"Acl specifying controls on destination prefixes."                       '"Acl specifying controls on LDP peers."                      "LDP session holdtime is set.
                    
                    A value of 0 means the default,
                    which is 15 seconds for session holdtime.
                    A value of 65535 indicates an
                    infinite hold time."                       >"ACL name about specify acceptable downstream on demand dest."                       X"If the value of this object is 1,
                    then label advertise is enable."                       �"If the value of this object is 1,
                    then label advertise use old style(TDP) method for matching prefix acl."                       o"If the value of this object is 1,
                    then the new style to reset keepalive timer is enable."                       �"If the value of this object is 1,
                    then LDP debug information of label 
                    and address advertisements could be get."                       �"If the value of this object is 1,
                    then LDP debug information of  Label bindings 
                    and other label Information base (LIB) changes 
                    could be get."                       �"If the value of this object is 1,
                    then LDP debug information of LDP received messages, 
                    including periodic keep alive could be get."                       �"If the value of this object is 1,
                    then LDP debug information of LDP sent messages, 
                    including periodic keep alive could be get."                       l"If the value of this object is 1,
                    then LDP debug information of session could be get."                       z"If the value of this object is 1,
                    then LDP debug information of session state machine could be get."                       �"If the value of this object is 1,
                    then LDP debug information of transport and discovery 
                    connections could be get."                       �"If the value of this object is 1,
                    then LDP debug information of transport and discovery 
                    events could be get."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       >"The interface selected to prefer for LDP identifier address."                           #"The LSP FEC in IP address format."                       +"The length in bits of the LSP FEC prefix."                       �"The reason why the LSP went down. Can be one of the following:
            the topology changed, the neighbor withdrew the label, 
            the neighbor went down, the filter changed, the BFD session
            went down or the reason is unknown."                       &"The router id of the sending router."                      �"The reason why the session transitioned to nonexistent state. 
            Can be one of the following:
            unknown reason, hold time expired, connection time expired, 
            all adjacencies down,  received bad tlv, received bad pdu, 
            connection error, connection reset, received notification from peer, 
            received unexpected end-of-file, clear mpls ldp, 
            error during initialization, graceful restart was aborted or client
            command."                       "The name of the interface."                       ,"The Internet address type of the LSP FEC ."                       ."The Internet address type of the router id ."                       N"Fec Table. This table contains
                    one entry per fec table."                       o"The parameter of a fec entity containing statistics 
                information about a particular LDP FEC."                       1"The index which uniquely identifies this entry."                      �"The type of this LDP FEC. If the value of this object
                is 'indirect (0)' then the FEC type described by this
                row is for address prefixes and not included in local 
                address list. If the value of this object is 'direct 
                (1)' then the FEC type described by this row is for 
                address prefixes and included in local address list. 
                If the value of this object is 'me(2)' then the FEC 
                type described by this row is for a host address. If 
                the value of this object is 'invalid(3)' then the FEC 
                value is 'FFFF'."                       �"The value of this object is the type of the
             Internet address.  The value of this object,
             decides how the value of the zxr10LdpFecAddr object
             is interpreted." ""RFC3036, Section 3.4.1. FEC TLV."                     "LDP FEC address."                       "The LDP FEC length (in bits)."                      5"The state of this LDP FEC. If the FEC exists with the 
                 local popular tag and the outgoing label then the value 
                 of this object is 'ok(1)'. If the FEC exists with the 
                 local explicit or implicit null tag then the value of 
                 this object is 'egress(2)'. If the FEC exists with the 
                 local popluar tag only then the value of this object is 
                 'noOutLabel(3)'. If the FEC exists without local tag then 
                 the value of this object is 'noInLabel(4)'."                      l"The number of octets of traffic originated on 
                 this box, forwarded over the current LDP FEC. The 
                 number reported is not realtime and may be subject 
                 to several minutes delay. The delay is controllable 
                 by ldp statistics gathering interval, which by 
                 default is 5 minutes."                      m"The number of packets of traffic originated on 
                 this box, forwarded over the current LDP FEC. The 
                 number reported is not realtime and may be subject 
                 to several minutes delay. The delay is controllable 
                 by ldp statistics gathering interval, which by 
                 default is 5 minutes."                      �"The number of octets of traffic destined to this FEC, 
                 originated on a different box, forwarded over the 
                 current LDP FEC. The number reported is not realtime 
                 and may be subject to several minutes delay. The delay 
                 is controllable by ldp statistics gathering interval, 
                 which by default is 5 minutes."                      �"The number of packets of traffic destined to this FEC, 
                 originated on a different box, forwarded over the 
                 current LDP FEC. The number reported is not realtime 
                 and may be subject to several minutes delay. The delay 
                 is controllable by ldp statistics gathering interval, 
                 which by default is 5 minutes."                      ?"The value of sysUpTime at the time of the most recent 
                 change in state of LSP about FEC from down to up.
                 If no such changes have occurred since the last
                 re-initialization of the local management subsystem,
                 then this object contains a zero value."                      ?"The value of sysUpTime at the time of the most recent 
                 change in state of LSP about FEC from up to down.
                 If no such changes have occurred since the last
                 re-initialization of the local management subsystem,
                 then this object contains a zero value."                      "The reason why the LSP went down about the most recent 
                change in state of LSP from up to down. 
                Can be one of the following:
            the topology changed, the neighbor withdrew the label, 
            the neighbor went down, the filter changed, the BFD session
            went down or the reason is unknown. 
            If no such changes have occurred since the last
                re-initialization of the local management subsystem,
                then this object contains a zero value."                      f"The number of octets of traffic lost on 
                 this box, forwarded over the current LDP FEC. The 
                 number reported is not realtime and may be subject 
                 to several minutes delay. The delay is controllable 
                 by ldp statistics gathering interval, which by 
                 default is 5 minutes."                      g"The number of packets of traffic lost on 
                 this box, forwarded over the current LDP FEC. The 
                 number reported is not realtime and may be subject 
                 to several minutes delay. The delay is controllable 
                 by ldp statistics gathering interval, which by 
                 default is 5 minutes."                      �"The number of lost octets of traffic destined to this FEC, 
                 originated on a different box, forwarded over the 
                 current LDP FEC. The number reported is not realtime 
                 and may be subject to several minutes delay. The delay 
                 is controllable by ldp statistics gathering interval, 
                 which by default is 5 minutes."                      �"The number of lost packets of traffic destined to this FEC, 
                 originated on a different box, forwarded over the 
                 current LDP FEC. The number reported is not realtime 
                 and may be subject to several minutes delay. The delay 
                 is controllable by ldp statistics gathering interval, 
                 which by default is 5 minutes."                       N"Bfd Table. This table contains
                    one entry per bfd table."                        "The parameter of a bfd entity."                       �" The value of this object is the type of the
                      Internet address.  The value of this object,
                      decides how the value of the zxr10LdpBfdDstAddr
                      object is interpreted."                       (" The address about FEC related to BFD."                       ,"The mask length of the FEC related to BFD."                       1"The time span that two control package is send."                       5"The time span that two control package is received."                       �"If this parameter multiply zxr10LdpBfdMinRxInterval 
                    a control message is no received it means the lsp has 
                    some problem."                       "A fec needs bfd protection."                       "If the bfd is up."                       9" The source address specified with package of LSP PING."                       �"FRR or ECMP protect bind flag.
                     If the value is 1,then not support protect bind.
                     If the value is 2,then support protect bind."                       L"GR Table. This table contains
                    one entry per GR table."                       -"The parameter of a GR entity about session."                       E"The identifier of local lsr used to identify a session relating GR."                       D"The identifier of peer lsr used to identify a session relating GR."                       "If the session supports GR."                       k"The max time(seconds) of the lsr can wait to reconnect
                     with peer lsr in GR process."                       �"The max time(seconds) of the session mapping the label from the peer lsr 
                    after reconnect with peer lsr in GR process."                       ""If the session is in GR process."                       )"Indicates the status of the GR session."                       �"The remaining time(seconds) of waiting for session reconnection  
                     and recovering in GR process. If the value of zxr10LdpSessIsInGr
                     is false, then the value of this object is zero."                       Z"Interface Table. This table contains
                    one entry per interface table."                       4"The parameter of an interface entity relating LDP."                       �" The value of this object is the type of the
                      Internet address.  The value of this object,
                      decides how the value of the zxr10LdpInterfaceAddr
                      object is interpreted."                       "The index of the interface."                       "The name of the interface."                       '"The host ip address of the interface."                       )"The administer status of the interface."                       '"The optrater status of the interface."                       ."IP address to use for LDP transport address."                       �" The value of this object is the type of the
                      Internet address.  The value of this object,
                      decides how the value of the zxr10LdpInterfaceTransAddress
                      object is interpreted."                       N"Acl Table. This table contains
                    one entry per acl table."                       ="The parameter of an acl entry relating label advertisement."                       >" The acl number used to filtrate which labels is acceptable."                       @"The acl number used to filtrate destination of the label sent."                       R"Hello Table. This table contains
                    one entry per hello table."                       ("The parameter of a hello entity entry."                       9"The identifier of local lsr used to identify a session."                       8"The identifier of peer lsr used to identify a session."                       ,"An identifier for this specific adjacency."                       }"The index of interface about hello. If the value is 0xFFFFFFFF 
                    then the hello type is targeted-hello."                       �" The value of this object is the type of the
                      Internet address.  The value of this object,
                      decides how the value of the zxr10LdpEntityHelloNexthopAddr
                      object is interpreted."                       ""The Nexthop Address about hello."                       1"The max time between two recving hello message."                       2"The time span between two sending hello message."                       R"Ldp MD5 Table. This table contains
                    one entry per MD5 table."                       k"The parameter of a MD5 entry containing information 
                    about the session set password."                       '"The peer address as the index of MD5."                       ("If the MD5 is successfully registered."                       3"The password used for communication between lsrs."                       "The password is encrypted."                       u"Ldp Session Table. This table contains
                    one entry per session if it is successfully registered."                       b"The parameter of a session entry containing information 
                    about the session."                       9"The identifier of local lsr used to identify a session."                       8"The identifier of peer lsr used to identify a session."                       ."The hello adjacency numbers of the session. "                       ~"The time show how long the session should be keep alive 
                    if no ldp message or the session disappeared. "                       j"The time shows how long the session should wait to 
                    try to reconnect with peer lsr."                       >"The time of the lsr retry to create a session with peer lsr."                       6"The time after the session receive last ldp message."                       &"Indicates the status of the session."                       �"The name of the interface about session up or down. And the 
                    value of object is 'null' When target session sets up."                      |"The value of sysUpTime at the time of the most recent 
                    change in state of session from openrec(3) or opensent(4) 
                    to operational(5).
                    If no such changes have occurred since the last
                    re-initialization of the local management subsystem,
                    then this object contains a zero value."                      ["The value of sysUpTime at the time of the most recent 
                    change in state of session from operational(5) to nonexistent(1).
                    If no such changes have occurred since the last
                    re-initialization of the local management subsystem,
                    then this object contains a zero value."                      �"The reason why the session transitioned from operational to 
            nonexistent state. 
            Can be one of the following:
            unknown reason, hold time expired, connection time expired, 
            all adjacencies down,  received bad tlv, received bad pdu, 
            connection error, connection reset, received notification 
            from peer, received unexpected end-of-file, clear mpls ldp, 
            error during initialization, graceful restart was aborted or 
            client command.
            If no such changes have occurred since the last re-initialization 
            of the local management subsystem, then this object contains a 
            zero value."                           r"The SNMP trap that is generated when the value of 'zxr10MplsLdpSesState'
     enters the 'operational(5) state."                +"The SNMP trap that is generated when the value of 'zxr10MplsLdpSesState'
    leaves the 'operational(5) state. The value of zxr10LdpSesDownIf is 
    one of the neighbor's interface. It is the interface associated with
    the last neighbor when zxr10LdpSesDownReason is allAdjacenciesDown (3)."                 7"The SNMP trap that is generated when an LSP comes up."                 9"The SNMP trap that is generated when the LSP goes down."                 {"An mplsLspPathUp trap signifies that the specified path mplsPathName
         for the specified LSP mplsLspName came up."                 "An mplsLspPathDown trap signifies that the specified path mplsPathName
         for the specified LSP mplsLspName went down."                 �"An mplsLspChange trap signifies that the specified LSP has switched traffic 
        to the new active path 'toLspPath'. The LSP maintains up state before and 
        after the switch over."                 \"Ldp Instance Table. This table contains
                    one entry per instance table."                       9"The parameter of an instance entity about ldp instance."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       9"ACL name about specify filter packet on source address."                       3"Show if the mpls ldp graceful-restart is enabled."                       T"LDP session max recovery time is set.
                    Default is 120 seconds."                       e"LDP session keeps its stale label-FEC bindings is set.
                    Default is 120 seconds."                       )"Show the mpls ldp label retention mode."                       %"Show the mpls ldp lsp control mode."                       <"ACL name about specify IPv4 fec want to get traffic count."                       ;"Show the mpls ldp IPv4 interface global auto config mode."                       <"ACL name about specify IPv6 fec want to get traffic count."                       ;"Show the mpls ldp IPv6 interface global auto config mode."                       f"Ipv4 Ldp Interface Table. This table contains
                    one entry per v4 interface table."                       *"The parameter of a  v4 interface entity."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       "The name of the interface."                       )"The distribution mode of the interface."                       "The gtsm of the interface."                       f"Ipv6 Ldp Interface Table. This table contains
                    one entry per v6 interface table."                       *"The parameter of a  v6 interface entity."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       "The name of the interface."                       )"The distribution mode of the interface."                       P"Gtsm Table. This table contains
                    one entry per gtsm table."                       !"The parameter of a gtsm entity."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       8"The identifier of peer lsr used to identify a session."                       &"The gtsm hop count of the ldp hello."                       \"LDP Peer Bfd Table. This table contains
                    one entry per peer bfd table."                       u"The parameter of a peer bfd entity containing statistics 
                information about a particular peer bfd."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       8"The identifier of peer lsr used to identify a session."                      L"If the value of this object is 1,
                     then the Ldp Peer Bfd Creat Delay is enable,
                     the default delay time is 60 seconds.
                     IF the value of this object is 2,
                     then the Ldp Peer Bfd Delay is disable,
                     Set Ldp Peer Bfd immediately."                       z"Set delay time,
                     the prerequisite is the value of 
                     zxr10LdpPeerBfdDelay is 1."                       �"Ldp Ipv4 Dis-auto-config Interface Table. This table contains
                    one entry per v4 dis-auto-config interface table."                       9"The parameter of a v4 dis-auto-config interface entity."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       ,"The name of the dis-auto-config interface."                       �"Ldp IPv6 Dis-auto-config Interface Table. This table contains
                    one entry per V6 dis-auto-config interface table."                       9"The parameter of a V6 dis-auto-config interface entity."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       ,"The name of the dis-auto-config interface."                       �"Ldp Enable Igp Synchronization Interface Table. This table contains
                    one entry per igp sync interface table."                       :"The parameter of a igp synchronization interface entity."                       ~"The Number of the LDP instance. If the value of this object is 0,
                     then don't exist LDP public instance"                       3"The name of enable igp synchronization interface."                          