6--  ************************************************
--  $Id: rosng.mib 8 2010-04-06 16:13:00Z DingG $
--
--  rosngsqa.mib: ZXR10 SQA MIB file
--
--  Apr. 2010, DingG181824
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************ 
   "sqa test test mode"               "sqa test rate type"               "sqa reflector mode"               "sqa test result status"               "sqa test online state"               �"sqa throughputtest test result status,durationTimeout: Could not find throughtput in the specified time,lowRateConfigError: Configuration of the lowest rate can not meet the requirements of packet loss rate"               "sqa test client mode"               "sqa test enable status"               "sqa test operation"               !"sqa test trap enable or disable"               "sqa test reflector mode"               "sqa test type"               "sqa test status"                                                                                                     "ZXROS SMI MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201903251000Z" "201611280000Z" "201611140000Z" "201509140000Z" "201505080000Z" "201503200000Z" "201308080000Z" "201306140000Z" "200905200000Z"^"Modify the MAX-ACCESS of these nodes from not-accessible to read-only:
        sqaTestSenderTestNum
        sqaTestReflectorId
        sqaTestTpResultTestNum
        sqaTestTpResultPacketSize
        sqaTestLossResultTestNum
        sqaTestLossResultPacketSize
        sqaTestDelayResultTestNum
        sqaTestDelayResultPacketSize
       "m"modif       sqaOperationTestNum
        modif       sqaTestOperation
        modif       sqaUdpTestTable
        modif       sqaUdpTestEntry
        modif       sqaUdpTestNum
        modif       sqaUdpTestRepeat
        modif       sqaUdpTestSize       
        modif       sqaUdpTestTos
        modif       sqaUdpTestInterval
        modif       sqaUdpJitterTestTable
        modif       sqaUdpJitterTestEntry
        modif       sqaUdpJitterTestNum
        modif       sqaUdpJitterTestRepeat
        modif       sqaUdpJitterTestSize        
        modif       sqaUdpJitterTestTos
        modif       sqaUdpJitterTestInterval
        modif       sqaIcmpTestTable
        modif       sqaIcmpTestEntry
        modif       sqaIcmpTestNum
        modif       sqaIcmpTestRepeat
        modif       sqaIcmpTestSize       
        modif       sqaIcmpTestTos
        modif       sqaIcmpTestTtl
        modif       sqaIcmpTestInterval
        modif       sqaIcmpTestDscp
        modif       sqaIcmpJitterTestTable
        modif       sqaIcmpJitterTestEntry
        modif       sqaIcmpJitterTestNum        
        modif       sqaIcmpJitterTestRepeat
        modif       sqaIcmpJitterTestSize
        modif       sqaIcmpJitterTestTos
        modif       sqaIcmpJitterTestTtl
        modif       sqaIcmpJitterTestInterval
        modif       sqaIcmpJitterTestDscp""add       TestOperation ::TEXTUAL-CONVENTION
        add       sqaTestOperationTable
        add       sqaUdpTestTable
        add       sqaUdpJitterTestTable
        add       sqaIcmpTestTable
        add       sqaIcmpJitterTestTable
        modif     sqaUdpServerGrp"�"modif     TpResultStatus
         modif     TestOnlineState
         modif     TestClientMode
         modif     sqaTestSenderClientMode
         modif     sqaTestSenderTestMode
         modif     sqaTestSenderDisNonTest8021p
         modif     sqaTestSenderDisNonTestDscp
         modif     sqaTestSenderReflectorMode
         modif     sqaTestSenderInVlanId
         modif     sqaTestSenderExVlanId
         modif     sqaTestSenderPriority8021p
         modif     sqaTestSenderDscp
         modif     sqaTestSenderTpEnable
         modif     sqaTestSenderTpRateType
         modif     sqaTestSenderTpHighRate
         modif     sqaTestSenderTpLowRate
         modif     sqaTestSenderTpTimeOut
         modif     sqaTestSenderTpOneRateDuration
         modif     sqaTestSenderTpDuration
         modif     sqaTestSenderTpPrecision
         modif     sqaTestSenderTpLossThreshold
         modif     sqaTestSenderLossRateType
         modif     sqaTestSenderLossRate
         modif     sqaTestSenderLossTimeOut
         modif     sqaTestSenderLossDuration
         modif     sqaTestSenderLossRatioThreshold
         modif     sqaTestSenderDelayRateType
         modif     sqaTestSenderDelayRate
         modif     sqaTestSenderDelayInterval
         modif     sqaTestSenderDelayDuration
         modif     sqaTestSenderDelayThreshold
         modif     sqaTestSenderPacketSize1
         modif     sqaTestSenderPacketSize2
         modif     sqaTestSenderPacketSize3
         modif     sqaTestSenderPacketSize4
         modif     sqaTestSenderPacketSize5
         modif     sqaTestSenderPacketSize6
         modif     sqaTestSenderPacketSize7
         modif     sqaTestSenderOnlineOfflineFlag
         modif     sqaTestSenderFreeArpInterval
         modif     sqaTestReflectorRefMode
         modif     sqaTestReflectorTestMode
         modif     sqaTestReflectorDisNonTest8021p
         modif     sqaTestReflectorDisNonTestDscp
         modif     sqaTestReflectorAgeingTime
         modif     sqaTestReflectorSourcePort
         modif     sqaTestReflectorDestinationPort
         modif     sqaTestReflectorPriority8021p
         modif     sqaTestReflectorDscp
         modif     sqaTestReflectorOnOfflineFlag
         modif     sqaTestReflectorFreeArpInterval
         modif     sqaTestTpResultPacketSize
         modif     sqaTestTpResultPrecision
         modif     sqaTestTpResultTp
         modif     sqaTestTpResultInfoRate
         modif     sqaTestTpResultLossRatio
         modif     sqaTestTpResultTestDuration
         modif     sqaTestLossResultPacketSize
         modif     sqaTestLossResultTestRate
         modif     sqaTestLossResultLossPktRatio
         modif     sqaTestLossResultTestDuration
         modif     sqaTestDelayResultPacketSize
         modif     sqaTestDelayResultTestRate
         modif     sqaTestDelayResultMinDelay
         modif     sqaTestDelayResultMaxDelay
         modif     sqaTestDelayResultAvgDelay
         modif     sqaTestDelayResultMinJitter
         modif     sqaTestDelayResultMaxJitter
         modif     sqaTestDelayResultAvgJitter
         modif     sqaTestDelayResultTestDuration"�"modif     sqaTestNum
         modif     sqaTestIcmpResultTestNum
         modif     sqaTestUdpResultTestNum
         modif     sqaTestTcpResultTestNum
         modif     sqaTestFtpResultTestNum
         modif     sqaTestDnsResultTestNum
         modif     sqaTestUdpJitterResultTestNum
         modif     sqaTestSnmpResultTestNum
         modif     sqaTestHttpResultTestNum
         modif     sqaTestIcmpJitterResultTestNum
         add       sqaTestSenderTable
         add       sqaTestReflectorTable
         add       sqaTestTpResultTable
         add       sqaTestLossResultTable
         add       sqaTestDelayResultTable
         add       zxr10SqaNotifications" ""add       sqaTestDnsResultDesurl""modif     TEXTUAL-CONVENTION
         modif     sqaTestTrapenable
         modif     sqaTestTos
         modif     sqaTestFtpPassword
         delete    TestBeginOrStop
         delete    NOTIFICATION-TYPE
         add       sqaTestDscp
         add       sqaTestSnmpCommunity"#"modif     TestType
         modif     TestTrapOnOff
         modif     TestStatus
         modif     TestBeginOrStop
         modif:    sqaTestFtpResultTable
         modif:    sqaTestFtpResultEntry
         modif:    sqaTestSnmpResultTable
         modif:    sqaTestSnmpResultEntry" "sqamib"       --2019-03-25 10:00
       "sqa test entity configuration"                       %"sqa test entity configuration table"                       A"sqa test num. The range of this parameter depend on the device."                       "sqa test type"                       "sqa test vrf"                       "sqa des ip"                       "sqa des port"                       "sqa test source ip"                       "sqa test repeat"                       "sqa test size"                       '"sqa test tos,256 is the invalid value"                       "sqa test ttl"                       "sqa test timeout"                       "sqa test interval"                       "sqa test ftp name"                       Z"sqa test ftp encrypted password,
                     the length of this password is 64"                       "sqa test ftp file name"                       "sqa test ftp root"                       "sqa test trap enable"                       "sqa test trap percent"                       "sqa test status"                       "sqa test time range"                       "sqa test destination url"                       ("sqa test dscp,255 is the invalid value"                       Y"sqa test encrypted community, 
                     the length of this community is 64"                           "sqa tcp server vrf"                       "sqa tcp server ip"                       "sqa tcp server port"                           "sqa udp server vrf"                       "sqa udp server ip"                       "sqa udp server port"                       "sqa icmp result table"                       "sqa icmp result entry"                       "sqa icmp test num"                       "sqa icmp result repeat"                       "sqa icmp result response"                       "sqa icmp result status"                       "sqa icmp result des ip"                       "sqa icmp result min rtt"                       "sqa icmp result max rtt"                       "sqa icmp result avg rtt"                       "sqa icmp result sum rtt"                       "sqa icmp result probe time"                       ""sqa icmp result packet loss rate"                        "sqa icmp result min pos jitter"                        "sqa icmp result max pos jitter"                        "sqa icmp result avg pos jitter"                        "sqa icmp result sum pos jitter"                        "sqa icmp result min neg jitter"                        "sqa icmp result max neg jitter"                        "sqa icmp result avg neg jitter"                        "sqa icmp result sum neg jitter"                       "sqa icmp result min jitter"                       "sqa icmp result max jitter"                       "sqa icmp result avg jitter"                       "sqa icmp result sum jitter"                       "sqa udp result table"                       "sqa udp result entry"                       "sqa udp result test num"                       "sqa udp result repeat"                       "sqa udp result response"                       "sqa udp result status"                       "sqa udp result des ip"                       "sqa udp result min rtt"                       "sqa udp result max rtt"                       "sqa udp result avg rtt"                       "sqa udp result sum rtt"                       "sqa udp result min pos jitter"                       "sqa udp result max pos jitter"                       "sqa udp result avg pos jitter"                       "sqa udp result sum pos jitter"                       "sqa udp result min neg jitter"                       "sqa udp result max neg jitter"                       "sqa udp result avg neg jitter"                       "sqa udp result sum neg jitter"                       "sqa udp result probe time"                       !"sqa udp result packet loss rate"                       "sqa udp result min jitter"                       "sqa udp result max jitter"                       "sqa udp result avg jitter"                       "sqa udp result sum jitter"                       "sqa tcp result table"                       "sqa tcp result entry"                       "sqa tcp result test num"                       "sqa tcp result repeat"                       "sqa tcp result response"                       "sqa tcp result status"                       "sqa tcp result des ip"                       "sqa tcp result min rtt"                       "sqa tcp result max rtt"                       "sqa tcp result avg rtt"                       "sqa tcp result sum rtt"                       "sqa tcp result probe time"                       "sqa ftp result table"                       "sqa ftp result entry"                       "sqa ftp result test num"                       "sqa ftp result test status"                       "sqa ftp result last rtt"                       "sqa ftp result read bytes"                       "sqa ftp result probe time"                       "sqa dns result table"                       "sqa dns result entry"                       "sqa dns result test num"                       "sqa dns result repeat"                       "sqa dns result response"                       "sqa dns result status"                       "sqa dns result resolved ip"                       "sqa dns result min rtt"                       "sqa dns result max rtt"                       "sqa dns result avg rtt"                       "sqa dns result sum rtt"                       "sqa dns result probe time"                        "sqa dns result destination url"                       "sqa udp jitter result table"                       "sqa udp jitter result entry"                        "sqa udp jitter result test num"                       "sqa udp jitter result repeat"                        "sqa udp jitter result response"                       "sqa udp jitter result status"                       "sqa udp jitter result des ip"                       ""sqa udp jitter result min rtt sd"                       ""sqa udp jitter result max rtt sd"                       ""sqa udp jitter result avg rtt sd"                       ""sqa udp jitter result sum rtt sd"                       ""sqa udp jitter result min rtt ds"                       ""sqa udp jitter result max rtt ds"                       ""sqa udp jitter result avg rtt ds"                       ""sqa udp jitter result sum rtt ds"                       ""sqa udp jitter result min pos sd"                       ""sqa udp jitter result max pos sd"                       ""sqa udp jitter result avg pos sd"                       ""sqa udp jitter result sum pos sd"                       ""sqa udp jitter result num pos sd"                       ""sqa udp jitter result min neg sd"                       ""sqa udp jitter result max neg sd"                       ""sqa udp jitter result avg neg sd"                       ""sqa udp jitter result sum neg sd"                       ""sqa udp jitter result num neg sd"                       ""sqa udp jitter result min pos ds"                       ""sqa udp jitter result max pos ds"                       ""sqa udp jitter result avg pos ds"                       ""sqa udp jitter result sum pos ds"                       ""sqa udp jitter result num pos ds"                       ""sqa udp jitter result min neg ds"                       ""sqa udp jitter result max neg ds"                       ""sqa udp jitter result avg neg ds"                       ""sqa udp jitter result sum neg ds"                       ""sqa udp jitter result num neg ds"                       &"sqa udp jitter result dispose num sd"                       &"sqa udp jitter result dispose num ds"                       !"sqa udp jitterresult probe time"                       "sqa snmp result table"                       "sqa snmp result entry"                       "sqa snmp result test num"                       "sqa snmp result test status"                       "sqa snmp result last rtt"                       "sqa snmp result probe time"                       "sqa http result table"                       "sqa http result entry"                       "sqa http result test num"                       "sqa http result repeat"                       "sqa http result response"                       "sqa http result status"                       "sqa http result des ip"                       !"sqa http result destination url"                       "sqa http result dns min rtt"                       "sqa http result dns max rtt"                       "sqa http result dns avg rtt"                       "sqa http result dns sum rtt"                       "sqa http result dns num"                       "sqa http result tcp min rtt"                       "sqa http result tcp max rtt"                       "sqa http result tcp avg rtt"                       "sqa http result tcp sum rtt"                       "sqa http result tcp num "                       "sqa http result http min rtt"                       "sqa http result http max rtt"                       "sqa http result http avg rtt"                       "sqa http result http sum rtt"                       "sqa http result http num"                       "sqa http result min rtt"                       "sqa http result max rtt"                       "sqa http result avg rtt"                       "sqa http result sum rtt"                       "sqa http result probe time"                       "sqa icmp jitter result table"                       "sqa icmp jitter result entry"                       !"sqa icmp jitter result test num"                       "sqa icmp jitter result repeat"                       !"sqa icmp jitter result response"                       "sqa icmp jitter result status"                       "sqa icmp jitter result des ip"                       #"sqa icmp jitter result min rtt sd"                       #"sqa icmp jitter result max rtt sd"                       #"sqa icmp jitter result avg rtt sd"                       #"sqa icmp jitter result sum rtt sd"                       #"sqa icmp jitter result min rtt ds"                       ""sqa udp jitter result max rtt ds"                       #"sqa icmp jitter result avg rtt ds"                       #"sqa icmp jitter result sum rtt ds"                       #"sqa icmp jitter result min pos sd"                       #"sqa icmp jitter result max pos sd"                       #"sqa icmp jitter result avg pos sd"                       #"sqa icmp jitter result sum pos sd"                       #"sqa icmp jitter result min neg sd"                       #"sqa icmp jitter result max neg sd"                       #"sqa icmp jitter result avg neg sd"                       #"sqa icmp jitter result sum neg sd"                       #"sqa icmp jitter result min pos ds"                       #"sqa icmp jitter result max pos ds"                       #"sqa icmp jitter result avg pos ds"                       #"sqa icmp jitter result sum pos ds"                       #"sqa icmp jitter result min neg ds"                       #"sqa icmp jitter result max neg ds"                       #"sqa icmp jitter result avg neg ds"                       #"sqa icmp jitter result sum neg ds"                       ""sqa icmp jitterresult probe time"                       "sqa generalflow sender table"                       "sqa generalflow sender entry"                       H"sqa sender test num. The range of this parameter depend on the device."                       Y"sqa sender client mode, 1: l2_uni, 2: l3_uni, 3: l2_bridge_uni, 255: undefined(invalid)"                       "sqa sender inbound interface"                       A"sqa sender test mode, 1: share_mode(default), 2: exclusive_mode"                       5"sqa sender disNonTest8021p, 255: undefined(invalid)"                       4"sqa sender disNonTestDscp, 255: undefined(invalid)"                       >"sqa sender reflector mode, 1:l1, 2:l2, 3:l3, 4:l4, 5:default"                       "sqa sender source mac"                       "sqa sender destination mac"                       "sqa sender source ip"                       "sqa sender destination ip"                       "sqa sender vlan id"                       "sqa sender internal vlan id"                       "sqa sender external vlan id"                       &"sqa sender priority8021p, default: 0"                       "sqa sender dscp, default: 0"                       "sqa sender throughput enable"                       9"sqa sender throughput rate type, 1: ir(default), 2: ulr"                       ."sqa sender throughput high rate, unit : kbps"                       -"sqa sender throughput low rate, unit : kbps"                       6"sqa sender throughput timeout, default: 4s, unit : s"                       @"sqa sender throughput one rate duration, default: 4s, unit : s"                       A"sqa sender throughput duration, 0: undefined(invalid), unit : s"                       A"sqa sender throughput precision, default: 1000kbps, unit : kbps"                       B"sqa sender throughput loss threshold, default: 0, unit : 1/10000"                       "sqa sender loss enable"                       3"sqa sender loss rate type, 1: ir(default), 2: ulr"                       6"sqa sender loss rate, default: 1000kbps, unit : kbps"                       0"sqa sender loss timeout, default: 4s, unit : s"                       2"sqa sender loss duration, default: 60s, unit : s"                       ="sqa sender loss ratio threshold, default: 0, unit : 1/10000"                       "sqa sender delay enable"                       4"sqa sender delay rate type, 1: ir(default), 2: ulr"                       7"sqa sender delay rate, default: 1000kbps, unit : kbps"                       2"sqa sender delay interval, default: 4s, unit : s"                       3"sqa sender delay duration, default: 60s, unit : s"                       9"sqa sender delay threshold, default: 20000ns, unit : us"                       :"sqa sender jitter threshold, default: 25000ns, unit : us"                       &"sqa sender packet size1, unit : byte"                       &"sqa sender packet size2, unit : byte"                       &"sqa sender packet size3, unit : byte"                       &"sqa sender packet size4, unit : byte"                       &"sqa sender packet size5, unit : byte"                       &"sqa sender packet size6, unit : byte"                       &"sqa sender packet size7, unit : byte"                       7"sqa sender online offline flag, 1: online, 2: offline"                       "sqa sender free arp enable"                       6"sqa sender free arp interval, default: 30s, unit : s"                       "sqa sender timerange"                       !"sqa generalflow reflector table"                       !"sqa generalflow reflector entry"                       "sqa reflector ID"                       ""sqa reflector mode, 1: l2, 2: l3"                       !"sqa reflector inbound interface"                       D"sqa reflector test mode, 1: share_mode(default), 2: exclusive_mode"                       8"sqa reflector disNonTest8021p, 255: undefined(invalid)"                       7"sqa reflector disNonTestDscp, 255: undefined(invalid)"                       +"sqa reflector ageing time, 0 : continuous"                       "sqa reflector source mac"                       "sqa reflector destination mac"                       "sqa reflector source ip"                       "sqa reflector destination ip"                       +"sqa reflector source port, default: 49184"                       ,"sqa reflector destination port, default: 7"                       "sqa reflector vlan id"                        "sqa reflector internal vlan id"                        "sqa reflector external vlan id"                       6"sqa reflector priority8021p, 255: undefined(invalid)"                       -"sqa reflector DSCP, 255: undefined(invalid)"                       2"sqa reflector online flag, 1: online, 2: offline"                       %"sqa reflector free arp enable state"                       )"sqa reflector free arp local ip address"                        "sqa reflector free arp vlan id"                       )"sqa reflector free arp internal vlan id"                       )"sqa reflector free arp external vlan id"                       0"sqa reflector free arp send interval, unit : s"                       ."sqa generalflow throughput test result table"                       ."sqa generalflow throughput test result entry"                       ("sqa generalflow throughput test number"                       :"sqa generalflow throughput test packet size, unit : byte"                       /"sqa generalflow throughput test UNI interface"                       <"sqa generalflow throughput test result test priority 8021p"                       2"sqa generalflow throughput test result test dscp"                       ?"sqa generalflow throughput test result precision, unit : kbps"                       9"sqa generalflow throughput test Throughput, unit : kbps"                       ?"sqa generalflow throughput test result info rate, unit : kbps"                       C"sqa generalflow throughput test result loss ratio, unit : 1/10000"                       4"sqa generalflow throughput test duration, unit : s"                       ("sqa generalflow throughput test status"                       ("sqa generalflow loss test result table"                       ("sqa generalflow loss test result entry"                       ""sqa generalflow loss test number"                       4"sqa generalflow loss test packet size, unit : byte"                       )"sqa generalflow loss test UNI interface"                       6"sqa generalflow loss test result test priority 8021p"                       ,"sqa generalflow loss test result test dscp"                       9"sqa generalflow loss test result test rate, unit : kbps"                       ."sqa generalflow loss test loss packet number"                       D"sqa generalflow loss test result loss packet ratio, unit : 1/10000"                       5"sqa generalflow loss test result duration, unit : s"                       ""sqa generalflow loss test status"                       )"sqa generalflow delay test result table"                       )"sqa generalflow delay test result entry"                       #"sqa generalflow delay test number"                       5"sqa generalflow delay test packet size, unit : byte"                       *"sqa generalflow delay test UNI interface"                       7"sqa generalflow delay test result test priority 8021p"                       -"sqa generalflow delay test result test dscp"                       :"sqa generalflow delay test result test rate, unit : kbps"                       8"sqa generalflow delay test result min delay, unit : us"                       8"sqa generalflow delay test result max delay, unit : us"                       8"sqa generalflow delay test result avg delay, unit : us"                       9"sqa generalflow delay test result min jitter, unit : us"                       9"sqa generalflow delay test result max jitter, unit : us"                       9"sqa generalflow delay test result avg jitter, unit : us"                       6"sqa generalflow delay test result duration, unit : s"                       #"sqa generalflow delay test status"                           ""                 ""                 ""SQA test operation configuration"                       /"SQA test operation entity configuration table"                       C"SQA test number.The range of this parameter depend on the device."                       5"SQA test operation type,1 means begin,2 means stop."                       #"SQA UDP test entity configuration"                       )"SQA UDP test entity configuration table"                       C"SQA test number.The range of this parameter depend on the device."                       9"The name of VRF,this string length ranges from 1 to 32."                       "The destination IP address."                       8"The destination port number,ranges from 1025 to 65535."                       >"The number of repeat times,ranges from 1 to 1000(default:1)."                       F"The size of UDP packet,ranges from 50 to 1500(default:50),unit:byte."                       0"The TOS value,ranges from 0 to 255(default:0)."                       P"The sending period of UDP packets,ranges from 50 to 2000(default:100),unit:ms."                       "Row status"                       #"SQA UDP test entity configuration"                       0"SQA UDP jitter test entity configuration table"                       C"SQA test number.The range of this parameter depend on the device."                       9"The name of VRF,this string length ranges from 1 to 32."                       "The destination IP address."                       8"The destination port number,ranges from 1025 to 65535."                       >"The number of repeat times,ranges from 1 to 1000(default:1)."                       F"The size of UDP packet,ranges from 50 to 1500(default:50),unit:byte."                       0"The TOS value,ranges from 0 to 255(default:0)."                       P"The sending period of UDP packets,ranges from 50 to 2000(default:100),unit:ms."                       "Row status"                       $"SQA ICMP test entity configuration"                       *"SQA ICMP test entity configuration table"                       C"SQA test number.The range of this parameter depend on the device."                       9"The name of VRF,this string length ranges from 1 to 32."                       "The destination IP address."                       "The Source IP address."                       ?"The number of repeat times,ranges from 1 to 65535(default:1)."                       G"The size of ICMP packet,ranges from 36 to 8192(default:36),unit:byte."                       I"The TOS value,ranges from 0 to 255(default:0),256 is the invalid value."                       2"The TTL value,ranges from 1 to 255(default:255)."                       R"The sending period of ICMP packets,ranges from 50 to 65535(default:100),unit:ms."                       >"The DSCP value,ranges from 0 to 63,255 is the invalid value."                       "Row status"                       +"SQA ICMP jitter test entity configuration"                       1"SQA ICMP jitter test entity configuration table"                       C"SQA test number.The range of this parameter depend on the device."                       9"The name of VRF,this string length ranges from 1 to 32."                       "The destination IP address."                       "The Source IP address."                       ?"The number of repeat times,ranges from 1 to 65535(default:1)."                       G"The size of ICMP packet,ranges from 40 to 8192(default:40),unit:byte."                       I"The TOS value,ranges from 0 to 255(default:0),256 is the invalid value."                       2"The TTL value,ranges from 1 to 255(default:255)."                       R"The sending period of ICMP packets,ranges from 50 to 65535(default:100),unit:ms."                       >"The DSCP value,ranges from 0 to 63,255 is the invalid value."                       "Row status"                          