--*****************************************************************
--ZXR10-QOS-STAT-MIB
--OAM
--2013-9-10 16:35
--
--
--Copyright (c) 1985-2013 by ZTE Corp.
--All rights reserved.
--*****************************************************************
                             0"The MIB module to describe the QOS Stats info." ^"       Hu Jun
            Tel:    +86-25-52870000
            E-Mail: hu.jun11@zte.com.cn " "201608020910Z" "201507230910Z" "201503091100Z" "201310181640Z"m"Modify the mib file by adding statistic info as follow:
                       zxr10QosStatPacketsOutRate
                       zxr10QosStatPacketsDropRate
                       zxr10QosStatTotalBytesOut
                       zxr10QosStatTotalBytesDrop
                       zxr10QosStatTotalFlowBytes
                       zxr10QosStatTotalFlowPackets" B"Modify the mib file by adding Tail drop and WRED statistic info."  "Add zxr10QosStatBytesTotalRate" ["Add zxr10QosStatMIB and 
             Initial version of this MIB module.
             "                       "QoS statistics table"                       �"Information of QoS statistics.
                   Display the statistics data from
                   leaf node to root node."                       "The name of interface."                       #"The direction based on interface."                       %"The policy-map name of first level."                       &"The policy-map name of second level."                       %"The policy-map name of third level."                       &"The policy-map name of fourth level."                        "The class name of first level."                       !"The class name of second level."                        "The class name of third level."                       !"The class name of fourth level."                        "The total transmitting packts."                       "The total dropping packts."                       "The transmitting rate(bps)."                       "The dropping rate(bps)."                       "The total rate(bps)."                       "The tail drop(bytes)."                       "The tail drop(packets)."                       "The WRED drop(bytes)."                       "The WRED drop(packets)."                       "The transmitting rate(pps)."                       "The dropping rate(pps)."                       "The total transmitting bytes."                       "The total dropping bytes."                       "The total flow bytes."                       "The total flow packets."                                                          