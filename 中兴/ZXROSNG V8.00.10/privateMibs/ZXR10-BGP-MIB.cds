 �--*****************************************************************
--ZXR10-BGP-MIB
--OAM
--2011-8-5 9:35
--
--
--Copyright (c) 1985-2011 by ZTE Corp.
--All rights reserved.
--*****************************************************************
                                                                         !"ZXR10 T8000 ZXR10FILESYSTEM-MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201703300900Z" "201605300900Z" "201605270900Z" "201605100900Z" "201604080900Z" "201603290900Z" "201603030900Z" "201602250900Z" "201602010900Z" "201601271100Z" "201601190900Z" "201512211100Z" "201511180900Z" "201505180900Z" "201504270900Z" "201504040900Z" "201503040900Z" "201403040900Z" "201307201100Z" "201307041100Z" "201306241100Z" "201305221100Z" "200908120000Z" �" add a new value in the value list for these nodes as follows:
               ip_route_bras_pool(24),
               ip_route_ipsec(25)
    " �"Add some nodes:
                zBgpAddrModeLabel,
                zBgpPeerIpv4UniShutDownTrack,
                zBgpPeerShutDownTrack,
    " ."Add a new table :zBgpVpnAddrFamilyHovpnTable" q"Add some nodes:
                zBgpAddrModeIpv4UniDistanceLoc,
                zBgpAddrModeDistanceLoc
    "�"Add some nodes:
                zBgpPeerValidationDisableDest,
                zBgpPeerValidationDisableNh,
        add two new values in the value list for these nodes as follows:
                zBgpAddrModeAddrModeType
                zBgpV4VrfAggregateAddrModeType
                zBgpV6UniAggregateAddrModeType
                zBgpDampAddrModeType
                zBgpRedisAddrModeType
                zBgpV4NetworkAddrModeType
                zBgpV6NetworkAddrModeType
                zBgpAddrModeIpv4VrfmulAddrModeType
                zBgpRedisIpv4VrfmulAddrModeType
                zBgpV4NetworkIpv4VrfmulAddrModeType
                zBgpPeerIpv4UniAddrModeType
                zBgpPeerIpv4UniExtendAddrModeType
                zBgpPeerAddrModeType
                zBgpPeerExtendAddrModeType
                zBgpPeerIpv4VrfmulAddrModeType
                zBgpPeerIpv4VrfmulExtendAddrModeType
                zBgpV4UniAddrModeTypeNew
                zBgpVrfV4AddrModeTypeNew
    " �"Add some nodes:
                zBgpPeerIpv4UniExtendIdleTime,
                zBgpPeerIpv4UniExtendIdleIncr,
                zBgpPeerExtendIdleTime,
                zBgpPeerExtendIdleIncr
    "�"Add some nodes:
                zBgpPeerIpv4UniExtendWaitArp,
                zBgpPeerIpv4UniExtendWaitArpRmp
            add a new value in the value list for these nodes as follows:
                zBgpAddrModeAddrModeType
                zBgpV4VrfAggregateAddrModeType
                zBgpV6UniAggregateAddrModeType
                zBgpDampAddrModeType
                zBgpRedisAddrModeType
                zBgpV4NetworkAddrModeType
                zBgpV6NetworkAddrModeType
                zBgpAddrModeIpv4VrfmulAddrModeType
                zBgpRedisIpv4VrfmulAddrModeType
                zBgpV4NetworkIpv4VrfmulAddrModeType
                zBgpPeerAddrModeType
                zBgpPeerIpv4UniAddrModeType
                zBgpPeerIpv4UniExtendAddrModeType
                zBgpPeerExtendAddrModeType
                zBgpPeerIpv4VrfmulAddrModeType
                zBgpPeerIpv4VrfmulExtendAddrModeType
                zBgpV4UniAddrModeTypeNew
                zBgpVrfV4AddrModeTypeNew
    "�"modify some nodes name:
                zBgpPeerIpv4UniExtendTrackName,
                zBgpPeerIpv4UniExtendTrackRmp,
                zBgpPeerExtendTrackName,
                zBgpPeerExtendTrackRmp
                change to
                zBgpPeerIpv4UniExtendWdTrack,
                zBgpPeerIpv4UniExtendWdRmp,
                zBgpPeerExtendWdTrack,
                zBgpPeerExtendWdRmp
    " �"Add some nodes:
                zBgpPeerIpv4UniExtendTrackName,
                zBgpPeerIpv4UniExtendTrackRmp,
                zBgpPeerExtendTrackName,
                zBgpPeerExtendTrackRmp
    " 5"Add zBgpInstanceSelectGlobalNH in ZBgpInstanceEntry"�"add a new value in the value list for these nodes as follows:
        zBgpAddrModeAddrModeType
        zBgpV4VrfAggregateAddrModeType
        zBgpV6UniAggregateAddrModeType
        zBgpDampAddrModeType
        zBgpRedisAddrModeType
        zBgpV4NetworkAddrModeType
        zBgpV6NetworkAddrModeType
        zBgpAddrModeIpv4VrfmulAddrModeType
        zBgpRedisIpv4VrfmulAddrModeType
        zBgpV4NetworkIpv4VrfmulAddrModeType
        zBgpPeerAddrModeType
        zBgpPeerIpv4UniAddrModeType
        zBgpPeerIpv4UniExtendAddrModeType
        zBgpPeerExtendAddrModeType
        zBgpPeerIpv4VrfmulAddrModeType
        zBgpPeerIpv4VrfmulExtendAddrModeType
        zBgpV4UniAddrModeTypeNew
        zBgpVrfV4AddrModeTypeNew
    " p"Add some nodes:
                zBgpPeerIpv4UniExtendKeyChain,
                zBgpPeerExtendKeyChain,
    "�"Add some nodes:
                zBgpAddrModeIpv4UniRSInterval,
                zBgpAddrModeIpv4UniRSInitial,
                zBgpAddrModeIpv4UniRSMaxWait,
                zBgpAddrModeIpv4UniRSCmdType,
                zBgpAddrModeRSInterval,
                zBgpAddrModeRSInitial,
                zBgpAddrModeRSMaxWait,
                zBgpAddrModeRSCmdType,
                Modify description of zBgpPeerIpv4UniTtlSecurityHops.
    ""Add some nodes:
                zBgpAddrModeIpv4UniTablePolicy,
                zBgpAddrModeTablePolicy,
                zBgpPeerIpv4UniExtendRplIn,
                zBgpPeerIpv4UniExtendRplOut,
                zBgpPeerExtendRplIn,
                zBgpPeerExtendRplOut,
    " 6"modify SYNTAX of zBgpPeerSoo to DisplayString.
    " V"modify description of zBgpVrfV4TrackAdjValueNew and zBgpV4UniTrackAdjValueNew.
    "�"modify type of
                  1.zbgpinstanceTable,
                  2.zBgpAddrModeIpv4UniTable,
                  3.zBgpAddrModeTable,
                  4.zBgpAddrModeIpv4VrfmulTable,
                  5.zBgpPeerIpv4UniTable,
                  6.zBgpPeerIpv4UniExtendTable,
                  7.zBgpPeerTable,
                  8.zBgpPeerExtendTable,
                  9.zBgpPeerIpv4VrfmulTable,
                  10.zBgpPeerIpv4VrfmulExtendTable
    "�"modify type of
                  1.zBgpAddrModeAddrModeType
                  2.zBgpV4VrfAggregateAddrModeType,
                  3.zBgpV6UniAggregateAddrModeType,
                  zBgpDampAddrModeType,
                  zBgpRedisAddrModeType,
                  zBgpV4NetworkAddrModeType
                  zBgpV6NetworkAddrModeType
                  zBgpAddrModeIpv4VrfmulAddrModeType
                  zBgpRedisIpv4VrfmulAddrModeType
                  zBgpV4NetworkIpv4VrfmulAddrModeType
                  zBgpPeerIpv4UniAddrModeType
                  zBgpPeerIpv4UniExtendAddrModeType
                  zBgpPeerAddrModeType
                  zBgpPeerExtendAddrModeType
                  zBgpPeerIpv4VrfmulAddrModeType
                  zBgpPeerIpv4VrfmulExtendAddrModeType
                  zBgpV4UniAddrModeType
                  zBgpVrfV4AddrModeType
                to enumeration.
    " b"Add
                  zBgpV4UniTrackRowStatus,
                  zBgpVrfV4TrackRowStatus
    " ^"Add
                  1.zBgpV4UniTrackTable,
                  2.zBgpVrfV4TrackTable
    ";"modify
                  1.zBgpAddrModeIpv4UniTable
                  2.zBgpAddrModeTable,
                  3.zBgpAddrModeIpv4VrfmulTable,
                  add
                  zBgpAddrModeIpv4UniMedUnsign,
                  zBgpAddrModeMedUnsign,
                  zBgpAddrModeIpv4VrfmulMedUnsign
    "�"modify
                  1.zbgpinstanceTable,
                  2.zBgpAddrModeIpv4UniTable,
                  3.zBgpAddrModeTable,
                  4.zBgpAddrModeIpv4VrfmulTable,
                  5.zBgpPeerIpv4UniTable,
                  6.zBgpPeerIpv4UniExtendTable,
                  7.zBgpPeerTable,
                  8.zBgpPeerExtendTable,
                  9.zBgpPeerIpv4VrfmulTable,
                  10.zBgpPeerIpv4VrfmulExtendTable
    " " "               "BGP_INSTANCE"                       "BGP_INSTANCE"                       
"local_as"                       
"comp_med"                       "ctoc_reflection"                       "cluster_id"                       "confed_id"                       "ipv4_unicast"                       "local_pref"                       "rt_filter"                       "ext_community_type_compatible"                       "fast_external_fallover"                       "graceful_restart"                       "gr_restart_time"                       "gr_stalepath_time"                       "gr_update_delay"                       "timers_keepalive"                       "timers_holdtime"                       "timers_cmd_type"                       "cluster_id_addr"                       "cluster_set"                       "enforce_first_as"                       "special_mode"                       %"as_path_ignore (1 enable,0 disable)"                       &"router_id_ignore(1 enable,0 disable)"                       '"deterministic_med(1 enable,0 disable)"                       )"attribute_download (1 enable,0 disable)"                       -"attribute_download_ipv6(1 enable,0 disable)"                       "bgp_update_delay_always"                       "bgp connect delay time"                       7"Download global nexthop instand of link-local nexthop"                       "BGP_ADDR_MODE_IPV4_UNI"                       "BGP_ADDR_MODE_IPV4_UNI"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "frr"                       "router_id"                       "def_info_originate"                       "distance_ibgp"                       "distance_ebgp"                       "maximum_paths_ibgp"                       "maximum_paths_ebgp"                       "synchronization"                       "table_map"                       "default_metric"                       "router_id_set"                       "vrf_const"                       +"advertise_active_only(1 enable,0 disable)"                       "maximum_paths_eibgp"                       "rib_only;(1 enable,0 disable)"                       $"rib_only_route_map(route-map name)"                       	"frr_wtr"                       &"igpmetric_ignore(1 enable,0 disable)"                       #"best_external(1 enable,0 disable)"                       "Unsigned32 default_metric"                       "route policy name"                       )"route scan timer interval wait time(ms)"                       #"route scan timer initial time(ms)"                       $"route scan timer max wait time(ms)"                       "route scan timer cmd type"                        "Distance for BGP local routes."                       "BGP_AS_WEIGHT"                       "BGP_AS_WEIGHT"                       "weight_as"                       
"local_as"                       "weight"                       "BGP_CONF_PEERS"                       "BGP_CONF_PEERS"                       "conf_peer_as"                       
"local_as"                       "BGP_V4_UNI_AGGREGATE"                       "BGP_V4_UNI_AGGREGATE"                       
"local_as"                       	"ip_addr"                       	"ip_mask"                       "subnet_ip_addr"                       "subnet_ip_mask"                       "addr_mode_type"                       
"vrf_name"                       "as_set"                       "count"                       "strict"                       "summary_only"                       "Subnet"                       "BGP_DAMP_IPV4_UNI"                       "BGP_DAMP_IPV4_UNI"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "damp_enable"                       "damp_route_map"                       "damp_half_time"                       "damp_reuse_value"                       "damp_suppress_value"                       "damp_max_suppress"                       "BGP_REDIS_IPV4_UNI"                       "BGP_REDIS_IPV4_UNI"                       
"local_as"                       
"protocol"                       "process id"                       "addr_mode_type"                       
"vrf_name"                       "metric"                       "route_map"                       "metric_flag"                       "BGP_V4_NETWORK_IPV4_UNI"                       "BGP_V4_NETWORK_IPV4_UNI"                       
"local_as"                       	"ip_addr"                       	"ip_mask"                       "addr_mode_type"                       
"vrf_name"                       "route_map"                       "BGP_ADDR_MODE"                       "BGP_ADDR_MODE"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "frr"                       "router_id"                       "def_info_originate"                       "distance_ibgp"                       "distance_ebgp"                       "maximum_paths_ibgp"                       "maximum_paths_ebgp"                       "synchronization"                       "table_map"                       "default_metric"                       "router_id_set"                       "temp"                       +"advertise_active_only(1 enable,0 disable)"                       "maximum_paths_eibgp"                       "rib_only(1 enable,0 disable)"                       $"rib_only_route_map(route-map name)"                       	"frr_wtr"                       "end_of_rib_time"                       %"force_rt_filter(1 enable,0 disable)"                       &"igpmetric_ignore(1 enable,0 disable)"                       #"best_external(1 enable,0 disable)"                       "Unsigned32 default_metric"                       "route policy name"                       )"route scan timer interval wait time(ms)"                       #"route scan timer initial time(ms)"                       $"route scan timer max wait time(ms)"                       "route scan timer cmd type"                        "Distance for BGP local routes."                       "Mpls label mode."                       "BGP_V4_VRF_AGGREGATE"                       "BGP_V4_VRF_AGGREGATE"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       	"ip_addr"                       	"ip_mask"                       "as_set"                       "summary_only"                       "strict"                       "attribute_map"                       "suppress_map"                       "BGP_V6_UNI_AGGREGATE"                       "BGP_V6_UNI_AGGREGATE"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "ipv6_addr"                       "ipv6_mask"                       "as_set"                       "summary_only"                       "strict"                       "attribute_map"                       "suppress_map"                       
"BGP_DAMP"                       
"BGP_DAMP"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "damp_enable"                       "damp_route_map"                       "damp_half_time"                       "damp_reuse_value"                       "damp_suppress_value"                       "damp_max_suppress"                       "BGP_REDIS"                       "BGP_REDIS"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       
"protocol"                       "process id"                       "metric"                       "route_map"                       "metric_flag"                       "BGP_V4_NETWORK"                       "BGP_V4_NETWORK"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       	"ip_addr"                       	"ip_mask"                       "route_map"                       "BGP_V6_NETWORK"                       "BGP_V6_NETWORK"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "ipv6_addr"                       "ipv6_mask"                       "route_map"                       "BGP_ADDR_MODE_IPV4_VRFMUL"                       "BGP_ADDR_MODE_IPV4_VRFMUL"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       "frr"                       "router_id"                       "def_info_originate"                       "distance_ibgp"                       "distance_ebgp"                       "maximum_paths_ibgp"                       "maximum_paths_ebgp"                       "synchronization"                       "table_map"                       "default_metric"                       "router_id_set"                       "temp"                       "Unsigned32 default_metric"                       "BGP_REDIS_IPV4_VRFMUL"                       "BGP_REDIS_IPV4_VRFMUL"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       
"protocol"                       "process id"                       "metric"                       "route_map"                       "metric_flag"                       "BGP_V4_NETWORK_IPV4_VRFMUL"                       "BGP_V4_NETWORK_IPV4_VRFMUL"                       
"local_as"                       "addr_mode_type"                       
"vrf_name"                       	"ip_addr"                       	"ip_mask"                       "route_map"                       "BGP_PEER_IPV4_UNI"                       "BGP_PEER_IPV4_UNI"                       
"local_as"                       "ipv4_addr"                       "ipv6_addr"                       "neighbor_group"                       "addr_mode_type"                       
"vrf_name"                       "peer_group_name"                       B"activate. 0 express disable, 1express enable, 2 express invalid."                       "advertisement_interval"                       "allowas_in"                       "default_originate"                       "description"                       "ebgp_multihop"                       "bfd"                       "next_hop_self"                       "next_hop_unchanged"                       "originate_interval"                       	"passive"                       "remote_as"                       "remove_private_as"                       "route_reflector_client"                       "send_community"                       
"send_med"                       "shut_down"                       "update_source"                       "send_label"                       "soft_reconfiguration"                       "change_unicast_multicast"                       "as_override"                       "join_peergroup_type"                       	"adv_map"                       "exist_map"                       "non_exist_map"                       "adv_map_flag"                       "ttl-security-hops"                       "peergroup_set"                       "group_config_check"                       "group_config_temp_check"                       
"maxas_in"                       "use_peergroup_config"                       ""split_updgrp(1 enable,0 disable)"                       "weight"                       '"as_path_loopcheck(1 enable,0 disable)"                       ,"orf_prefix_filter(1 recieve,2 send,3 both)"                       -"orf_prefix_filter_cisco(1 enable,0 disable)"                       "connect_retry_interval"                       ~"Track-group name applies to shutting down neighbor 
                  by track-group.It depends on zBgpPeerIpv4UniShutDown."                       "BGP_PEER_IPV4_UNI_EXTEND"                       "BGP_PEER_IPV4_UNI_EXTEND"                       
"local_as"                       "ipv4_addr"                       "ipv6_addr"                       "neighbor_group"                       "addr_mode_type"                       
"vrf_name"                       "peer_group_name"                       "remote_as"                       "maxinum_prefix"                       "maxinum_prefix_threshold"                       "maxinum_prefix_restartTime"                       "maxinum_prefix_over_action"                       
"password"                       "password_encrypt"                       "holdtime_conf"                       "keepalive_conf"                       "timers_cmd_type"                       "password_is_encrypt"                       "maxprefix_cmd_type"                       "route_map_in"                       "route_map_out"                       "routemap_out_flag"                       "routemap_name"                       "routemap_in_flag"                       "prefix_name"                       "prefix_in_flag"                       "prefix_in"                       "prefix_out"                       "prefix_out_flag"                       "peergroup_set"                       "group_config_check"                       "group_config_temp_check"                       "password_encrypted"                       "password_is_encrypted"                       "password_is_set"                       "use_peergroup_config"                       &"localas_cmd_type(1 enable,0 disable)"                       "localas_num"                       ("localas_no_prepend(1 enable,0 disable)"                       ("localas_replace_as(1 enable,0 disable)"                       %"lcoalas_dual_as(1 enable,0 disable)"                       &"addpaths_receive(1 enable,0 disable)"                       #"addpaths_send(1 enable,0 disable)"                       "addpaths number"                       "addpaths_prefix"                       &"adv_diverse_path(1 enable,0 disable)"                       1"route policy name applied to the inbound routes"                       2"route policy name applied to the outbound routes"                       #"Keychain name associated to peer."                       1"track-group name applied to withdraw the routes"                       >"route-map name applied to withdraw the routes by track-group"                       A"wait for controller ARP synchronized event;(1 enable,2 disable)"                       I"route-map name applied to waiting for controller ARP synchronized event"                       7"the length of time the peer is held in the idle state"                       D"increase idle hold time doubly to maximum 3000(1 enable,2 disable)"                       
"BGP_PEER"                       
"BGP_PEER"                       
"local_as"                       "ipv4_addr"                       "ipv6_addr"                       "neighbor_group"                       "addr_mode_type"                       
"vrf_name"                       "peer_group_name"                       B"activate. 0 express disable, 1express enable, 2 express invalid."                       "advertisement_interval"                       "allowas_in"                       "default_originate"                       "description"                       "ebgp_multihop"                       "bfd"                       "next_hop_self"                       "next_hop_unchanged"                       "originate_interval"                       	"passive"                       "remote_as"                       "remove_private_as"                       "route_reflector_client"                       "send_community"                       
"send_med"                       "shut_down"                       "update_source"                       "send_label"                       "soft_reconfiguration"                       "change_unicast_multicast"                       "as_override"                       "join_peergroup_type"                       	"adv_map"                       "exist_map"                       "non_exist_map"                       "adv_map_flag"                       "ttl-security-hops"                       "peergroup_set"                       "group_config_check"                       "group_config_temp_check"                       
"maxas_in"                       "use_peergroup_config"                       ""split_updgrp(1 enable,0 disable)"                       "soo"                       "weight"                       '"as_path_loopcheck(1 enable,0 disable)"                       ,"orf_prefix_filter(1 recieve,2 send,3 both)"                       "upe(1 enable,0 disable)"                       /"upe_reflect_next_hop_self(1 enable,0 disable)"                       -"orf_prefix_filter_cisco(1 enable,0 disable)"                       "connect_retry_interval"                       "nlri_type(1 enable,0 disable)"                        "Disable destination validation"                       "Disable nexthop validation"                       w"Track-group name applies to shutting down neighbor 
                  by track-group.It depends on zBgpPeerShutDown."                       "BGP_PEER_EXTEND"                       "BGP_PEER_EXTEND"                       
"local_as"                       "ipv4_addr"                       "ipv6_addr"                       "neighbor_group"                       "addr_mode_type"                       
"vrf_name"                       "peer_group_name"                       "remote_as"                       "maxinum_prefix"                       "maxinum_prefix_threshold"                       "maxinum_prefix_restartTime"                       "maxinum_prefix_over_action"                       
"password"                       "password_encrypt"                       "holdtime_conf"                       "keepalive_conf"                       "timers_cmd_type"                       "password_is_encrypt"                       "maxprefix_cmd_type"                       "route_map_in"                       "route_map_out"                       "routemap_out_flag"                       "routemap_name"                       "routemap_in_flag"                       "prefix_name"                       "prefix_in_flag"                       "prefix_in"                       "prefix_out"                       "prefix_out_flag"                       "peergroup_set"                       "group_config_check"                       "group_config_temp_check"                       "password_encrypted"                       "password_is_encrypted"                       "password_is_set"                       "use_peergroup_config"                       &"localas_cmd_type(1 enable,0 disable)"                       "localas_num"                       ("localas_no_prepend(1 enable,0 disable)"                       ("localas_replace_as(1 enable,0 disable)"                       %"lcoalas_dual_as(1 enable,0 disable)"                       &"addpaths_receive(1 enable,0 disable)"                       #"addpaths_send(1 enable,0 disable)"                       "addpathsN"                       "addpaths_prefix"                       &"adv_diverse_path(1 enable,0 disable)"                       1"route policy name applied to the inbound routes"                       2"route policy name applied to the outbound routes"                       #"Keychain name associated to peer."                       1"track-group name applied to withdraw the routes"                       >"route-map name applied to withdraw the routes by track-group"                       7"the length of time the peer is held in the idle state"                       D"increase idle hold time doubly to maximum 3000(1 enable,2 disable)"                       "BGP_PEER_IPV4_VRFMUL"                       "BGP_PEER_IPV4_VRFMUL"                       
"local_as"                       "ipv4_addr"                       "ipv6_addr"                       "neighbor_group"                       "addr_mode_type"                       
"vrf_name"                       "peer_group_name"                       B"activate. 0 express disable, 1express enable, 2 express invalid."                       "advertisement_interval"                       "allowas_in"                       "default_originate"                       "description"                       "ebgp_multihop"                       "bfd"                       "next_hop_self"                       "next_hop_unchanged"                       "originate_interval"                       	"passive"                       "remote_as"                       "remove_private_as"                       "route_reflector_client"                       "send_community"                       
"send_med"                       "shut_down"                       "update_source"                       "send_label"                       "soft_reconfiguration"                       "change_unicast_multicast"                       "as_override"                       "join_peergroup_type"                       	"adv_map"                       "exist_map"                       "non_exist_map"                       "adv_map_flag"                       "ttl-security-hops"                       "peergroup_set"                       "group_config_check"                       "group_config_temp_check"                       
"maxas_in"                       "use_peergroup_config"                       ""split_updgrp(1 enable,0 disable)"                       '"as_path_loopcheck(1 enable,0 disable)"                       "BGP_PEER_IPV4_VRFMUL_EXTEND"                       "BGP_PEER_IPV4_VRFMUL_EXTEND"                       
"local_as"                       "ipv4_addr"                       "ipv6_addr"                       "neighbor_group"                       "addr_mode_type"                       
"vrf_name"                       "peer_group_name"                       "maxinum_prefix"                       "maxinum_prefix_threshold"                       "maxinum_prefix_restartTime"                       "maxinum_prefix_over_action"                       
"password"                       "password_encrypt"                       "remote_as"                       "holdtime_conf"                       "keepalive_conf"                       "timers_cmd_type"                       "password_is_encrypt"                       "maxprefix_cmd_type"                       "route_map_in"                       "route_map_out"                       "routemap_out_flag"                       "routemap_name"                       "routemap_in_flag"                       "prefix_name"                       "prefix_in_flag"                       "prefix_in"                       "prefix_out"                       "prefix_out_flag"                       "peergroup_set"                       "group_config_check"                       "group_config_temp_check"                       "password_encrypted"                       "password_is_encrypted"                       "password_is_set"                       "use_peergroup_config"                       "bgp_releated_vrf_v4"                       "bgp_releated_vrf_v4"                       
"local_as"                       
"vrf_name"                       "bgp_releated_vrf_v6"                       "bgp_releated_vrf_v6"                       
"local_as"                       
"vrf_name"                       !"Bgp ipv4 unicast event tracking"                       !"Bgp ipv4 unicast event tracking"                       "Name of track object"                       /"Autonomous system number (normal or 4 Octets)"                        "Configure type of track object"                       "Intreface name"                       "Address mode type"                       "Value of adjust-priority"                       "Row status for this entry."                       %"bgp vrf ipv4 unicast event tracking"                       %"bgp vrf ipv4 unicast event tracking"                       "Name of track object"                       /"Autonomous system number (normal or 4 Octets)"                       "address mode type"                       
"vrf name"                       "track type"                       "intreface name"                       "Value of adjust-priority"                       "Row status for this entry."                       "BGP_AS_WEIGHT"                       "BGP_AS_WEIGHT"                       
"local_as"                       "weight_as"                       "weight"                       "BGP_CONF_PEERS"                       "BGP_CONF_PEERS"                       
"local_as"                       "conf_peer_as"                       !"Bgp ipv4 unicast event tracking"                       !"Bgp ipv4 unicast event tracking"                       /"Autonomous system number (normal or 4 Octets)"                       "Name of track object"                        "Configure type of track object"                       "Intreface name"                       "Address mode type"                       �"Value of adjust-priority.If value of zBgpVrfV4TrackTypeNew is 1, range 1-100,
                 else if value of zBgpVrfV4TrackTypeNew is 2, range 0-0."                       "Row status for this entry."                       %"bgp vrf ipv4 unicast event tracking"                       %"bgp vrf ipv4 unicast event tracking"                       /"Autonomous system number (normal or 4 Octets)"                       "Name of track object"                       "address mode type"                       
"vrf name"                       "track type"                       "intreface name"                       �"Value of adjust-priority.If value of zBgpVrfV4TrackTypeNew is 1, range 1-100,
                 else if value of zBgpVrfV4TrackTypeNew is 2, range 0-0."                       "Row status for this entry."                       9"HoVPN table for BGP-VPNv4 and BGP-VPNv6 address family."                       9"HoVPN table for BGP-VPNv4 and BGP-VPNv6 address family."                       0"Autonomous system number (normal or 4 Octets)."                       "IPv4 peer address."                       "IPv6 peer address."                       "Peer group name."                       "Address family type."                       %"The VRF name of VRF address family."                       "The specified VRF name."                       "The peer-list name."                          