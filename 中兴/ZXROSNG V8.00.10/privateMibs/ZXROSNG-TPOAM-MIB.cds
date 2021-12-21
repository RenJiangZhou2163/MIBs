M--  ************************************************
--  $Id: ZXROSNG-TPOAM.mib   2012-08-21 14:20:22Z LuWei $
--
--  ZXROSNG-TPOAM.mib: ZXROSNG MPLS TPOAM query  MIB file
--
--  Nov. 2012, Lu Wei
--
--  Copyright(c) 2012 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                             "ZXROS SMI MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201505250000Z" "201502260000Z" "201308260000Z" "201308150000Z" "201307030000Z" "201305070000Z" "200504120000Z" V"obsolete:    zxTPOAMMegConfigAISEnable
         obsolete:    zxTPOAMMegConfigAISPhb"v"modify:    zxTPOAMChannelType
         modify:    zxTPOAMMel
         modify:    zxTPOAMGlobalEnable
         modify:    zxTPOAMTc
         modify:    zxTPOAMRdiToSF
         modify:    zxTPOAMMegConfigCVPhbName
         modify:    zxTPOAMMegConfigAISPhb
         modify:    zxTPOAMMegConfigCSFPhb
         modify:    zxTPOAMMegConfigLossPktThresholdMantissa
         modify:    zxTPOAMMegConfigPaDMType
         modify:    zxTPOAMMegConfigPaDMPhb
         modify:    zxTPOAMLbMepMode
         modify:    zxTPOAMLbTimeOut
         modify:    zxTPOAMLbPhb
         modify:    zxTPOAMLtTimeOut
         modify:    zxTPOAMLtPhb
         modify:    zxTPOAMLtMode
         modify:    zxTPOAMTestPhb
         modify:    zxTPOAMMegConfigSdEnable 
         modify:    zxTPOAMLbTlvSize 
         modify:    zxTPOAMTestOneWayMepID   
         modify:    zxTPOAMDMSendPeriod"�"add:       zxTPOAMMegConfigPaDMEnable
         add:       zxTPOAMMegConfigPaDMType
         add:       zxTPOAMMegConfigPaDMPhb
         add:       zxTPOAMMegConfigPaDMSendPeriod
         add:       zxTPOAMMegConfigPaDMSendInterval
         add:       zxTPOAMDMTlvSize
         add:       zxTPOAMDMResultType
         modify:    zxTPOAMTestType
         modify:    zxTPOAMDMType" �"add:       zxTPOAMMegConfigProactiveLmType    
         add:       zxTPOAMLMOnDemandType
         modify:    zxTPOAMMegConfigProactiveLmEnable
         modify:    zxTPOAMLbMepMode""add:       DESCRIPTION of all configuration entry    
         modify:    zxTPOAMLbSendPeriod
         modify:    zxTPOAMTestSendPeriod
         modify:    zxTPOAMLMOnDemandSendPeriod
         modify:    zxTPOAMDMSendPeriod
         modify:    zxTPOAMLtResultHopEntry""add:       zxTPOAMSectionConfigSdEnable
         modify:    zxTPOAMLtResultHopCount
         modify:    zxTPOAMLtResultHopIndex
         modify:    zxTPOAMTestResultRecvCount
         modify:    zxTPOAMTestResultBandWidth
         modify:    zxTPOAMTestResultDiscardCount" %"Initial version of this MIB module."       -- May 25, 2015
       U"Zxr10 is the root OBJECT IDENTIFIER for ZTE
         routers and switches pruducts"               ."Subtree beneath which ROSNG MIBS were built."               7"Subtree beneath which zxTPOAMModules MIBS were built."               T"The identity of Y.1731 packet in G-ACH Label
                    (default:32762)."                       4"The value of MEL field in OAM packets(default: 7)."                       ,"The global enable switch(default: enable)."                       7"The value of TC field in the label of GAL(default:7)."                       d"This switch is used to transform the RDI alarm to SF alarm
                    (default:disable)."                       5"The configuration table in the instance of SECTION."                       j"An entry containing management information applicable to a 
             particular instance of SECTION"                       1"SECTION ID used to identify the SECTION entity."                       "Local port bind the SECTION,and the port support GEI/FEI/VLAN 
            subinterface/the third layer's vlan port/sg aggregation port/sg 
            subinterface. The limits of configuration:1)the port must locate 
            in the third lay 2)one port can't bind one more ports"                       #"Peer ip address bind the SECTION."                       Y"SECTION layer sd enable flag:1 disable,2 enable,default value is
             disable."                       4"The configuration table in the instance of TUNNEL."                       j"An entry containing management information applicable to a 
             particular instance of TUNNEL."                       �"The TUNNEL ID only applies to the bidirectional static TUNNEL.
             The range of this parameter depend on the device."                        "The identity of the static LSP"                       k"MEG index corresponding to this entity.0 is invalid and it means 
            that have not created MEG."                       &"The propagating switch of the entity"                       <"The configuration table in the instance of dynamic TUNNEL."                       r"An entry containing management information applicable to a 
             particular instance of dynamic TUNNEL."                       L"TUNNEL ID.
             The range of this parameter depend on the device."                       X"The identity of dynamic LSP which including two roles: master 
            and backup"                       k"MEG index corresponding to this entity.0 is invalid and it means 
            that have not created MEG."                       0"The configuration table in the instance of PW."                       e"An entry containing management information applicable to a
             particular instance of PW."                       "The PW name "                       k"MEG index corresponding to this entity.0 is invalid and it means 
            that have not created MEG."                       5"The configuration table in the instance of SECTION."                       k"An entry containing management information applicable to a 
             particular instance of SECTION."                       "SECTION ID"                       k"MEG index corresponding to this entity.0 is invalid and it 
            means that have not created MEG."                       &"The propagating switch of the entity"                       !"The configuration table of MEG."                       ["An entry containing management information applicable to a 
             particular MEG."                       "MEG index"                       "MEG identity name"                       :"The OAM enable switch under MEG model.(default :disable)"                       |"The CC enable switch (this switch only enable in the case of 
            peer mep and local mep with full configuration)"                       "The CV enable switch"                       #"The sending period of CV packets "                       4"The PHB value in CV sending packets.(default :cs7)"                       g"The AIS enable switch(The function of AIS is enabled 
            only in the instance of lsp or pw)"                       5"The PHB value in AIS sending packets.(default :cs7)"                       ]"The switch of CSF.(The function of CSF is enabled only 
            in the instance of pw)"                       5"The PHB value in CSF sending packets.(default :cs7)"                       �"Local MEP type :source MEP/destination MEP/bidirectional  
            MEP.The configuration of MEP and MIP is mutual exclusive."                       _"Lhe identity of local MEP.0 is invalid and it means that 
            have not configed MEP."                       `"The type of peer MEP including source MEP,destination 
            MEP and bidirectional MEP."                       c"The identity of peer MEP.0 is invalid and it means that 
            have not configed peer MEP."                       Y"The identity of MIP.0 is invalid and it means that have 
            not configed MIP."                       z"The MIP attribute including UP and DOWN is available only 
            when the value of zxTPOAMMegConfigMipID is not 0"                       /"The switch of proactive LM.(default: disable)"                       �"The switch of SD alarm function.(default :disable)
            (even if the loss ratio runs over the threshold,
            there is no SD alarm without this configuration)"                       v"The configuration of loss ratio threshold(This field displays 
            the manitissa in E-notation)(default: 5)"                       u"The configuration of loss ratio threshold(This field displays 
            the exponent in E-notation)(default: 5)"                       &"The switch of LCK.(default: disable)"                       �"The node identified the TUNNEL ID if MEG binding the static 
            or dynamic tunnels.0 is invalid.
            The range of this parameter depending on the device."                       d"the node identified the static tunnel if MEG binding the 
            static tunnels.0 is invalid"                       �"The node identified the dynamic tunnel if MEG binding the 
            dynamic tunnels.The LSP acts as master or backup.0 is invalid"                       b"The node identified the PW name if MEG binding the instance 
            of PW. Null is invalid"                       e"The node identified the SECTION ID if MEG binding 
            the instace of SECTION.0 is invalid"                       �"Proactive LM adopts protocol type: 
             G.8114,counting the data packets; 
             Y.1731,counting the data packets and OAM packets."                       /"The switch of proactive DM.(default: disable)"                       ,"The type of proactive DM.(default: oneway)"                       4"the PHB value in DM sending packets.(default: cs7)"                       p"Sending intervals in the function of proactive DM.
            (sending interval :100ms-10s,default value:1s)"                       C"The length of the TLV information in the function of proactive DM"                       *"The configuration table of LB detecting."                       d"An entry containing management information applicable to a 
             particular LB detecting."                       "MEG index"                       A"Detecting instance index sending by network management by snmp."                       "The switch of LB."                       �"Destination MEP ID in the function of LB.0 stands for the type
             of MIP. 
            MEP ID and MIP ID can't be effective or invalid at the same time."                       +"Destination MIP ID in the function of LB."                       d"The LB working model:standard model and private model of ZTE
            (default: private model)"                       :"Timeout value of waiting responding packets(default: 5s)"                       �"TTL value of the destination MIP ID in the function of LB.
            The node is invalid when the zxTPOAMLbLBType is MEP type."                      I"Duration time in the function of LB.It ranges from 10s to 24h 
            without the configuration of permanence detecting.If this node 
            assigned 0,it means permanence detecting unless mannual stopping.
            If assigned 10-86400,it means detecting lasting time.
            If assigned 1-9,it is error."                       A"The length of the TLV information in the function of LB(1-400)."                       4"the PHB value in LB sending packets.(default: cs7)"                       �"The limit of sending speed in the function of LB.
            default value is 10 packets per second.It means sending 
            at full speed when the value is 0."                       a"The flag is used to judge perserving results or not.default 
             value is nopreserve."                       "Row status"                       #"The result table of LB detecting."                       C"An entry containing result information applicable to LB detecting"                       "MEG index"                       @"Detecting instance index sending by network management by snmp"                       "Local MEP ID"                       �"Destination MEP ID in the function of LB.0 stands for
            the type of MEP.MEP ID and MIP ID can't be effective or invalid
            at the same time."                       �"Destination MIP ID in the function of LB.0 stands for the type 
             of MIP.
            MEP ID and MIP ID can't be effective or invalid at the same time"                       !"The count of sending LB packets"                       #"The count of receiving LB packets"                       $"The count of discarding LB packets"                       ="The status of testing instance:not started,testing,finished"                       *"The configuration table of LT detecting."                       d"An entry containing management information applicable to a 
             particular LT detecting."                       "MEG index"                       @"Detecting instance index sending by network management by snmp"                       +"Destination MEP ID in the function of LT."                       "The switch of LT."                       ;"Timeout value of waiting responding packets.(default: 5s)"                       +"Maximum of the TTL in the function of LT."                       4"The PHB value in LT sending packets.(default: cs7)"                       :"The length of the TLV information in the function of LT."                       e"The LT working model:standard model and private model of ZTE.
            (default: private model)"                       ]"The flag used to judge perserving results or not.
            default value is nopreserve."                       "Row status"                       #"The result table of LT detecting."                       `"An entry containing result information applicable to a 
             particular LT detecting."                       "MEG index"                       @"Detecting instance index sending by network management by snmp"                       "Local MEP ID"                       ,"The process of LT testing:fail or success."                       "Success hops of LT testing"                       >"The status of testing instance :not started,testing,finished"                        "The hop table of LT detecting."                       d"An entry containing hop result information applicable to a 
             particular LT detecting."                       "MEG index"                       @"Detecting instance index sending by network management by snmp"                       "Hop index"                       "Hop type:MEP or MIP"                       a"The ID of MEP or MIP(it's invalid if the function adopt 
            the private model of ZTE)"                       ,"The configuration table of TEST detecting."                       f"An entry containing management information applicable to a 
             particular TEST detecting."                       "MEG index"                       "The switch of TEST."                       x"The type of the TEST function :source /destination /bidirectional.
            Now only supporting the one-way model."                       G"The MEP ID of destination MEP in the function of Unidirectional TEST."                      K"Duration time in the function of TEST.It ranges from 10s to 24h 
            without the configuration of permanence detecting.If this node 
            assigned 0,it means permanence detecting unless mannual stopping.
            If assigned 10-86400,it means detecting lasting time.
            If assigned 1-9,it is error."                       <"The length of the TLV information in the function of TEST."                       6"The PHB value in TEST sending packets.(default: cs7)"                       ("Sending ratio: default value 10000kbps"                       -"The TLV value: all 0, all 1 (default:all 0)"                       "Row status"                       %"The result table of TEST detecting."                       b"An entry containing result information applicable to a 
             particular TEST detecting."                       "MEG index"                       "Local MEP ID"                       $"The count of sending TEST packets."                       ("The bandwidth in the function of TEST."                       +"Discarding count in the function of TEST."                       >"The status of testing instance :not started,testing,finished"                       ."The testing table of on-demand LM detecting."                       n"An entry containing management information applicable to a 
             particular on-demand LM detecting."                       "MEG index"                       "The switch of on-demand LM."                      I"Duration time in the function of LM.It ranges from 10s to 24h 
            without the configuration of permanence detecting.If this node 
            assigned 0,it means permanence detecting unless mannual stopping.
            If assigned 10-86400,it means detecting lasting time.
            If assigned 1-9,it is error."                       &"The PHB value in LM sending packets."                       p"Sending intervals in the function of on-demand LM.
            (sending interval :100ms-10s,default value:1s)"                       "Row status"                       �"On-demand LM adopts protocol type: 
             G.8114,counting the data packets; 
             Y.1731,counting the data packets and OAM packets."                       -"The result table of on-demand LM detecting."                       j"An entry containing result information applicable to a 
             particular on-demand LM detecting."                       "MEG index"                       "Local MEP ID"                       &"The number of local sending packets."                       ("The number of local receiving packets."                       &"The number of local lossing packets."                       E"The ratio of local lossing packets in the function of on-demand LM."                       '"The number of remote sending packets."                       )"The number of remote receiving packets."                       '"The number of remote lossing packets."                       U"The ratio of remote lossing packets in the function of 
             on-demand LM."                       >"The status of testing instance :not started,testing,finished"                       $"The testing table of DM detecting."                       d"An entry containing management information applicable to a 
             particular DM detecting."                       "MEG index"                       "The switch of DM."                       "The type of the DM function."                       &"the PHB value in DM sending packets."                      I"Duration time in the function of DM.It ranges from 10s to 24h 
            without the configuration of permanence detecting.If this node 
            assigned 0,it means permanence detecting unless mannual stopping.
            If assigned 10-86400,it means detecting lasting time.
            If assigned 1-9,it is error."                       f"Sending intervals in the function of DM.
            (sending interval :100ms-10s,default value:1s)"                       "row status"                       :"The length of the TLV information in the function of DM."                       #"The result table of DM detecting."                       _"An entry containing result information applicable to a 
             particular DM detecting"                       "MEG index"                       "Local MEP ID"                       ,"The delay value in the function of DM (ns)"                       C"The delay variation ratio in the function of DM(one in a million)"                       3"The average delay value in the function of DM(ns)"                       Z"The average delay variation ratio in the function of DM
             (one in a million)"                       Y"The difference of delay value before and after in the function of 
             DM(ns)"                       a"The average difference of delay value before and after in the 
             function of DM(ns)"                       >"The status of testing instance :not started,testing,finished"                       "The type of the DM function "                          