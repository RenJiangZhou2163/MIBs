                                                               "VRF configuration information" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201605270000Z" "201507200000Z" "201407020000Z" "201404220000Z" "201402180000Z" "201402110000Z" "201311270000Z" "201308280000Z" "201308190000Z" "201306080000Z" "201305170000Z" "201305070000Z" "201102090000Z" r"add one node in zxr10addressFamilyModeEntry:
                 zxr10addressFamilyModeEvpnGwIp.
                  " m"add one node in zxr10vrfEnabledObjectsTable:
                 zxr10vrfEnabledObjectsELC.
                  " L"Modify the zxr10vrfDescription range from 80 up to 104.
                  "s"add one table in zxr10addressFamilyModeV6MIB:
                 zxr10vrfTunnelPolicyV6Table,
                   zxr10vrfTunnelPolicyV6Entry,
                     zxr10vrfTunnelPolicyV6VrfName,
                     zxr10vrfTunnelPolicyV6AfiMode,
                     zxr10vrfTunnelPolicyV6PeerAddr,
                     zxr10vrfTunnelPolicyV6PolicyName
                  " |"add one node in Zxr10addressFamilyModeEntry: 
                    zxr10addressFamilyModeNextHopHostOnly
                  "�"modify the following nodes value range: 
                  zxr10vrfVrfName
                  zxr10vrfDescription
                  zxr10rdEnabledVrfName
                  zxr10rdRd
                  zxr10vrfEnabledObjectsEnabledVrfName
                  zxr10vrfRateLimitVrfName
                  zxr10globalRtEnabledVrfName
                  zxr10globalRtRtVrf
                  zxr10addressFamilyModeAddrFamilyEnabledVrfName
                  zxr10addressFamilyModeExportMap
                  zxr10addressFamilyModeImportMap
                  zxr10addressFamilyModeImportMulticastRoute
                  zxr10rtAddrFamilyEnabledVrfName
                  zxr10rtRtIpv4
                  zxr10staticOutlabelAddrFamilyEnabledVrfName
                  zxr10vrfTunnelPolicyVrfName
                  zxr10vrfTunnelPolicyPolicyName
                  zxr10addressFamilyModeV6AddrFamilyEnabledVrfName
                  zxr10addressFamilyModeV6ExportMap
                  zxr10addressFamilyModeV6ImportMap
                  zxr10addressFamilyV6MulticastRT
                  zxr10rtV6AddrFamilyEnabledVrfName
                  zxr10rtV6RtIpv6
                  zxr10vrfMplsLabelModeEnabledVrfName
                  " y"add one node in Zxr10addressFamilyModeV6Entry: 
                    zxr10addressFamilyV6MulticastRT,
                  " �"add three nodes in Zxr10addressFamilyModeV6Entry: 
                    zxr10addressFamilyV6MaxPrefix,
                    zxr10addressFamilyV6MaxWarning,
                    zxr10addressFamilyModeV6LocalPre
                  " p"add one node in zxr10vrfEnabledObjectsTable:
                 zxr10vrfEnabledObjectsNatType
                  "�"add one table in zxr10rdMIB: 
                 zxr10vrfRateLimitTable,
                   zxr10vrfRateLimitEntry,
                     zxr10vrfRateLimitVrfName,
                     zxr10vrfRateLimitPeer,
                     zxr10vrfRateLimitMode,
                     zxr10vrfRateLimitCirValue,
                     zxr10vrfRateLimitCbsValue,
                     zxr10vrfRateLimitPirValue,
                     zxr10vrfRateLimitPbsValue
                  " �"add two nodes in zxr10vrfEnabledObjectsTable: 
                 zxr10vrfEnabledObjectsDsModeSer,
                 zxr10vrfEnabledObjectsDsModeCol
                  ""add an invalid-value in description: 
                            zxr10vrfEnabledObjectsStaticInlabel,
                            zxr10addressFamilyModeMaxPrefix,
                             zxr10addressFamilyModeMaxPrefixWarning
                              " "VRF configuration information"                   "An table to VRF"                       "An entry to VRF"                       
"VRF name"                       "VRF description"                       "VPN ID"                           "An table to RD"                       "An entry to RD"                       
"VRF name"                       "RD"                       "VPN ID"                       "An table to VRF"                       "An entry to VRF"                       
"VRF name"                       
"ttl-mode"                       	"ds-mode"                       %"static In-label,0 is invalid-value."                       5"Ds-mode service class,invalid(100) is invalid-value"                       ."Ds-mode color,invalid(100) is invalid-value."                       "Nat-type of VRF"                       %"The entroy label capability of VRF."                       %"An table to VRF rate limit strategy"                       %"An entry to VRF rate limit strategy"                       
"VRF name"                       
"VRF peer"                       "VRF rate limit mode"                       v"Committed information rate(kbps),
               this value must be equal or smaller than zxr10vrfRateLimitPirValue."                       "Committed burst size(bytes)"                       "Peak information rate(kbps)"                       "Peak Burst Size(bytes)"                       "An table to RT"                       "An entry to RT"                       
"VRF name"                       "route-target"                       "route-target"                           %"An table to VRF IPv4 address family"                       %"An entry to VRF IPv4 address family"                       
"VRF name"                       "VRF IPv4 address family"                       "export map"                       "import map"                       #"maxinum route,0 is invalid-value."                       �"maxinum route prefix warning,0 is warning-only,
             1~100 is Threshold value (%) at which to give a warning,
             101 is invalid-value."                       #"special purpose for multicast vpn"                       
"priority"                       "loacl prefix"                       "next-hop host-only"                       8"Gateway IP address for EVPN. 0.0.0.0 is invalid-value."                       "An table to VRF RT"                       "An entry to VRF RT"                       
"VRF name"                       "mode flag"                       "route-target"                       "route-target action"                       "An table to VRF out label"                       "An entry to VRF out label"                       
"VRF name"                       "mode flag"                       
"next-hop"                       "static out label"                       "An table to VRF tunnel policy"                       "An entry to VRF tunnel policy"                       
"VRF name"                       "mode flag"                       "PE address"                       "tunnel policy name"                           %"An table to VRF IPv6 address family"                       %"An entry to VRF IPv6 address family"                       
"VRF name"                       "mode flag"                       "export map"                       "import map"                       ("ipv6 maxinum route,0 is invalid-value."                       �"ipv6 maxinum route prefix warning,0 is warning-only,
             1~100 is Threshold value (%) at which to give a warning,
             101 is invalid-value."                       "ipv6 loacl prefix"                       #"special purpose for multicast vpn"                       "An table to VRF IPv6 RT"                       "An entry to VRF IPv6 RT"                       
"VRF name"                       "mode flag"                       "route-target"                       "route-target"                       $"An table to VRF ipv6 tunnel policy"                       $"An entry to VRF IPv6 tunnel policy"                       
"VRF name"                       "Address family mode flag"                       "PE ipv6 address"                       "tunnel policy name"                       !"An table to VRF mpls label mode"                       !"An entry to VRF mpls label mode"                       
"VRF name"                       "ipv6"                       "label mode"                       "An table to VRF label mode"                       "An entry to VRF label mode"                       "ipv6"                       "mpls label mode"                          