D--  ************************************************
--  $Id: zxr10ping.mib 8 2005-07-28 12:17:08Z zhanglh $
--
--  zxr10lspping.mib: ZXR10 LSP Ping MIB file
--
--  JUL. 2005, Zhang lihui
--
--  Copyright(c) 2005 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
                                     "ZTE LSP-PING MIB
        " h"       Zhao yanhua
        Tel:    +86-25-52870000
        E-Mail: zhao.yanhua3@zte.com.cn
        " "201309041830Z" "201305310930Z" "201303191130Z" "200901070000Z" �"add:       zxr10LspPingReplyMode
                    zxr10lspPingPwPeerAddr
                    zxr10lspPingPwPeerVcId
        
         update:    zxr10LspPingTtl delete default            
         "$"update:    lspPingType add v6ldp(3)
                    lspPingDataLen default value from 100 to 120
                    zxr10LspPingLspType add tunnel(3)                    
         modify compiling warnings for some nodes
         update desciptions for nodes with problem.
        "�"add:       zxr10LspPingPwMultiSegment
                    zxr10LspPingLspType
                    zxr10LspPingV6LdpPrefix
                    zxr10LspPingV6LdpPrefixlen
                    zxr10LspPingSrcIpAddr
                    zxr10LspPingV6SrcIpAddr
                    zxr10LspPingOutInterface
                    zxr10LspPingTtl                    
         modify compiling warnings for some nodes
         update desciptions for nodes with problem.
        " /"Initial version of this MIB module.
        "               "lsp ping information table."                       "lsp ping entry."                       "lsp ping serial number"                       /"lsp ping type (0:ldp,1:rsvpTe,2:vccv,3:v6ldp)"                       "ldp prefix"                       "ldp prefix length"                       "tunnel name"                       "vccv target address"                       "target vc id  "                        "if select option, default:none"                       "send packets count, default:5"                       "timeout, default:2"                       "data length, default:120"                       	"if trap"                       "Controls to start lsp ping"                       "lsp ping entry owner"                       ,"pw type:ehter-vlan(0),ether(1),default (0)"                       	"pw name"                       -"Indicate if the pw is multi-segment or not."                       "te-tunnel lsp type"                       "ldp IPv6 prefix"                       "ldp IPv6 prefix length"                       "source IP address"                       "IPv6 source IP address"                       #"out interface for tracing packets"                       "ttl"                       "ReplyMode"                       "vccv target address"                       "target vc id  "                       "lsp ping result table."                       "lsp ping result entry."                       "lsp ping result serial number"                       "send packet"                       "receive packet"                       	"min RTT"                       	"max RTT"                       "average RTT"                       "entry owner"                       	"max RWT"                       	"max RWT"                       "average RWT"                           c"The newMaster trap indicates that the sending agent
         has transitioned to 'Master' state."                            