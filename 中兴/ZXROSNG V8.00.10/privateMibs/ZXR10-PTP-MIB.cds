6--  ************************************************
--  $Id: ptp.mib 10 2012-09-6 12:17:08Z songlingling $
--
--  ptp.mib: ZXR10 PTP MIB file
--
--  Sep. 2012, songlingling
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                                                         -"The MIB module to describe the PTP protocol" e"        song lingling
            Tel:
            E-Mail: song.lingling@zte.com.cn
            " "201501281500Z" "201401171500Z" "201310241500Z" "201306031500Z" "201305271500Z" "201304071500Z" �"modify:    zxr10PTPShowPortState
                        zxr10ptpPortShowPortState
                        zxr10ptpPortState"�"del:       zxr10ptpPortCfgTable
                        zxr10ptpDstIpConfTable
             add:       zxr10ptpPortTable
                        zxr10ptpDstIpTable
             modify:    zxr10ptpConfig
                        zxr10ptpDomain
                        zxr10ptpIntfConfEntry
                        zxr10ptpIpListConfEntry
                        zxr10ptpTimeSrcCfgEntry" Q"modify:    zxr10ptpPortCfgTable
                        zxr10ptpDstIpConfTable" W"add:       zxr10PTPDestIpPortMode
                        zxr10ptpPortCfgUniNegoDura" Y"modify:    zxr10PTPConfigSourceName
                        zxr10PTPConfigVlanPriority"�"modify:    zxr10ptpConfig
             del:       zxr10ptpIntfConfTable
             add:       zxr10ptpPortCfgTable
                        zxr10ptpPortShowTable
                        zxr10PTPInitConfig
                        zxr10ptpTimeSrcCfgTable
                        zxr10ptpIpListConfTable
                        zxr10ptpDstIpConfTable
                        zxr10ptpEthPortTable"                   "The PTP port state mode."                       "The ptp clock type."                       c"The two-step attribution is true or not,
                       t8000\M6k only support one-step."                       ,"The slave_only attribution is true or not."                       "The ptp priority1."                       "The ptp priority2."                       "The ptp time source."                       "The ptp clock class."                       "The ptp clock accuracy."                       !"Initialize all ptp information."                       #"PTP global enable is true or not."                       Q"The global net protocol,
                       some projects may not support."                       "The transmit mode."                       "The clock class rule."                       "Vlan priority."                        "The PTP source interface name."                       +"The ip list property,use for acl control."                           !"The ptp domain delay mechanism."                       "The ptp domain number."                       u"The ptp announce interval,the range is -1..4 for t8000\M6k
                      and 89;-4..4 for upp3081 and 15k."                       "The ptp announce timeout."                       �"The ptp sync interval.for t8000\M6k the range is -7..1,
                      for 89 is -6..1,for 15k is -7..1,upp3081 does not support."                       �"The ptp delay req interval,for t8000\M6k and 15k the range is
                      -7..1,for 89 the range is -5..5,upp3081 does not support."                       �"The ptp pdelay req interval,
                      for t8000\M6k and 89 the range is 0..5,
                      for 15k the range is -4..5,upp3081 does not support."                           Y"The ptp offset of the slave port,
                      only valid for 89 and upp3081."                       ""The ptp delay of the slave port."                       %"The steps removed from grandmaster."                       "Native clock id."                       "The parent port id."                       "The grandmaster clock id."                       '"The interface name of the slave port."                           "Initial all attribution."                       K"A table containing PTP port configure
                      information."                       "Information of PTP port."                       Z"Object which specifies a unique entry in the
                    Zxr10PtpIntfConfEntry."                       "The PTP port name."                       "Enable or disable a ptp port."                       i"The ptp port state configured by manual,
                    masterslave state only t8000\M6k support."                       -"The ptp sync interval,only upp3081 support."                       2"The ptp delay req interval,only upp3081 support."                       U"The ptp port is multi domain port or not,
                   only upp3081 support."                       ;"The delay mechanism of the ptp port,only upp3081 support."                       -"The port net protocol,only upp3081 support."                       "The port packet mechanism."                       "The port state."                       1"Enable or disable the trans mode of a ptp port."                       {"The unsymmetrical offset(ns),consider the effect of
                  the zxr10PTPPortUnSign node.t8000\M6k not support."                       �"The unsymmetrical offset sign,consider the effect of
                  the zxr10PTPPortUnSymmetry node.t8000\M6k not support."                       Y"Vlan id, only valid for t8000\M6k,
                  other projects maybe not support."                        "The PTP source interface name."                       3"The ptp pdelay req interval,only upp3081 support."                       W"The ptp port number,the value must be configured
                when create a port."                       "Create or delete ptp port."                       K"A table containing PTP port configure
                      information."                       "Information of PTP port."                       "The PTP port name."                       U"The PTP port type,1 means combined-oc,
                      2 means general port."                       q"The ptp port number,the value must be configured
                      when create a port,1 means combined-oc."                       "Enable or disable a ptp port."                       e"The ptp port state configured by manual,
                    masterslave state only t8000 support."                       h"The ptp sync interval,for upp3081 the range is -8..1,
                    for 15k,the range is -4..1."                       l"The ptp delay req interval,for upp3081 the range is -5..5,
                   for 15k,the range is -4..5."                       U"The ptp port is multi domain port or not,
                   only upp3081 support."                       ;"The delay mechanism of the ptp port,only upp3081 support."                       5"The port net protocol,only upp3081 and 15k support."                       1"The port packet transmit mode,only 15k support."                       w"The unsymmetrical offset(ns),consider the effect of
                  the zxr10PTPPortUnSign node.t8000 not support."                       |"The unsymmetrical offset sign,consider the effect of
                  the zxr10PTPPortUnSymmetry node.t8000 not support."                       >"Vlan id, only valid for 15k,other projects maybe not support"                        "The PTP source interface name."                       ;"The ptp pdelay req interval,only upp3081 and 15k support."                       "packet statistic switch."                       "The ptp port work mode."                       "Vlan priority"                       +"Unicast negotiation duration of the port."                       4"Create or delete ptp port,must config port number."                       G"A table containing PTP port configure
                  information."                       *"Information about the PTP ethernet port."                       "The PTP ethernet port name."                       ("Enable or disable a ptp ethernet port."                       "The unsymmetrical offset."                        "The unsymmetrical offset sign."                       '"Create or delete a ptp ethernet port."                       S"A table containing PTP port dest ip configure
                      information."                       5"Information about the PTP interface destination IP."                       "The PTP port name."                       9"The PTP port type,1 means combined-oc,2 means oc,bc,tc."                       ""The port destination IP address."                       *"The PTP port number,1 means combined-oc."                       $"Set priority1 of accept master IP."                       "Set the port mode of PTP."                       ("Create or delete ptp accept master IP."                       ,"A table containing PTP ACL IP information."                       )"Information about PTP ACL IP configure."                       "The Acl IP address."                       "Create or delete acl IP."                       1"A table containing PTP time source information."                       5"Information about PTP time source configure of PTP."                       *"The time source ifname, eg: gps or bits."                       "The time source priority1."                       "The time source priority2."                       "Create or delete time source."                       G"A table containing PTP port state
                      information."                       "Information of PTP port."                       "The PTP port name."                       4"The PTP port type,1 means combined-oc,0 means not."                       m"The ptp port number,the value must be configured
                  when create a port,1 means combined-oc."                       "The port state."                       K"A table containing PTP port configure
                      information."                       "Information of PTP port."                       "The PTP port name."                       Q"The PTP port type,1 means combined-oc,
                  2 means general port."                       "The ptp port vlan ID."                       m"The ptp port number,the value must be configured
                  when create a port,1 means combined-oc."                       "Enable or disable a ptp port."                       i"The ptp port state configured by manual,
                    masterslave state only t8000\M6k support."                       h"The ptp sync interval,for upp3081 the range is -8..1,
                    for 15k,the range is -4..1."                       l"The ptp delay req interval,for upp3081 the range is -5..5,
                   for 15k,the range is -4..5."                       U"The ptp port is multi domain port or not,
                   only upp3081 support."                       ;"The delay mechanism of the ptp port,only upp3081 support."                       5"The port net protocol,only upp3081 and 15k support."                       1"The port packet transmit mode,only 15k support."                       {"The unsymmetrical offset(ns),consider the effect of
                  the zxr10PTPPortUnSign node.t8000\M6k not support."                       �"The unsymmetrical offset sign,consider the effect of
                  the zxr10PTPPortUnSymmetry node.t8000\M6k not support."                       >"Vlan id, only valid for 15k,other projects maybe not support"                        "The PTP source interface name."                       ;"The ptp pdelay req interval,only upp3081 and 15k support."                       "packet statistic switch."                       "The ptp port work mode."                       "Vlan priority"                       +"Unicast negotiation duration of the port."                       S"A table containing PTP port dest ip configure
                      information."                       5"Information about the PTP interface destination IP."                       "The PTP port name."                       9"The PTP port type,1 means combined-oc,2 means oc,bc,tc."                       ""The port destination IP address."                       "The ptp port vlan ID."                       *"The PTP port number,1 means combined-oc."                       $"Set priority1 of accept master IP."                       "Set the port mode of PTP."                          