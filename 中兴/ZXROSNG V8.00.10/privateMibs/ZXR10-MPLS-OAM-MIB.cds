Y--  ************************************************
--  $Id: ZXR10-MPLS-OAM.mib   2008-11-12 19:20:22Z zhitaoFu $
--
--  ZXR10-MPLS-MPLSOAM.mib: ZXR10 MPLS MPLSOAM query  MIB file
--
--  Nov. 2008, Fu zhitao
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
     ;"Rosng T8000_V1.00.11 MPLS OAM query and configuration MIB" �"ZTE Corporation
         NanJing Institute of ZTE Corporation

         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China

         Tel: +86-25-52870000" "200507260000Z" ""       -- Mar 12, 2010
               _"If this object is enable(1), then it enables the zxr10MplsOam;or it disables the zxr10MplsOam"                           /"Mpls oam local tunnel information query table"                       /"Local tunnel information of Mpls oam instance"                       �"Uniquely identifies a set of Mpls Oam Local tunnel instances
            between a pair of ingress and egress LSRs. 
            The range of this parameter depend on the device."                       y"Uniquely identifies a particular instance of a
		     Mpls Oam Local tunnel between a pair of ingress and egress LSRs."                       C"Identity of the ingress LSR associated with this tunnel instance."                       C"Identity of the egress LSR associated with this tunnel instance. "               l--Modify by inger 10117247 for MPLSOAM Key change. Change the value from current to obsolete @ 2011.11.21:
       &"A unique identifier for an MPLS LSR."                       2"This value identifies the next hop of this LSR. "                       <"This value identifies the index of the outgoing interface."                       L"This value signifies the role that this tunnel	entry/instance represents. "                       8"This value identifies the frequency of packet-sending."                       �"This value identifies the message type.
             cv(1):Connectivity Verification;
             ffd(7):Fast Failure Detection."                       /"This value identifies the message's priority."                       A"This value identifies actual operational status of this tunnel."                       ""Tunnel mpls oam enables or not. "                       *"Statistics of CV message enables or not."                       +"Statistics of FFD message enables or not."                       +"Statistics of BDI message enables or not."                       +"Statistics of FDI message enables or not."                       "The number of CV messages."                       "The number of FFD messages. "                       "The number of BDI messages. "                       "The number of  FDI messages. "                           1"Mpls oam remote tunnel information query table."                       1"Remote tunnel onformation of Mpls oam instance."                       �"Uniquely identifies a set of Mpls Oam remote tunnel instances
            between a pair of ingress and egress LSRs.
            The range of this parameter depend on the device."                       s"Uniquely identifies a particular instance of an Mpls Oam remote tunnel between a pair of ingress and egress LSRs."                       D"Identity of the ingress LSR associated with this tunnel instance. "                       D"Identity of the egress LSR associated with this tunnel instance.  "               l--Modify by inger 10117247 for MPLSOAM Key change. Change the value from current to obsolete @ 2011.11.21:
       &"A unique identifier for an MPLS LSR."                       t"This value identifies the index of backward tunnel.
            The range of this parameter depend on the device."                       P"This value identifies the index of the outgoing interface for backward tunnel."                       <"This value identifies the next hop of backward tunnel LSR."                       L"This value signifies the role that this tunnel	entry/instance represents. "                       6"This value identifies backward tunnel sharing mode. "                       8"This value identifies the frequency of packet-sending."                       �"This value identifies the message type.
             cv(1):Connectivity Verification;
             ffd(7):Fast Failure Detection. "                       0"This value identifies the message's priority. "                       B"This value identifies actual operational status of this tunnel. "                       ""Tunnel mpls oam enables or not. "                       +"Statistics of CV message enables or not. "                       -"Statistics of FFD message enables or not.  "                       ,"Statistics of BDI message enables or not. "                       ,"Statistics of FDI message enables or not. "                       "The number of CV messages."                       "The number of FFD messages."                       "The number of BDI messages."                       "The number of FDI messages."                                  