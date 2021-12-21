�-- *****************************************************************
-- $Id: Zxr10ProtocolRoutes.mib  2013-04-09 15:47:59Z mengmeihua $
--
-- Zxr10ProtocolRoutes.mib: ZTE Corporation Enterprise Structure of Management Information
--
-- APRIL 2013, mengmeihua
--
-- Copyright (c) 2013 by ZTE Corporation
-- All rights reserved.
-- 
-- *****************************************************************
--
                         "ZXROSNG PROTOCOL ROUTES MIB" w"Meng meihua (He yunbo)
             Tel: +86-25-52871138
             E-Mail: meng.meihua@zte.com.cn
             " "201705091010Z" "201508131010Z" "201412010000Z" "201304270000Z" "201304090000Z" O"Modify MAX-ACCESS of zxr10prIPv4gmrRouteNum and zxr10prIPv4gmrWarningPercent." ;"Add zxr10prIPv4GlobalTableCapacity node to this mib file." ("Add IPv6 route table to this mib file." ="modify the invalid value of the zxr10prIPv4GlobalMaxRoutes." g"It is protocol routes private mib.
            It includes the command in the Protocol Routes model."       -- May 9, 2017
                          @"the max-route num which means the maximum of 
            the global route table.If this attribute is not set,
            its value should be set to 0.This attibute 
            must set with zxr10VrfRouteWarningPercent together.
            If you just set this attibute only,there will
            be an error!"                      m"when the routes in the global route table exceeded 
            the warningpercent there will be a alarm displayed 
            in the interface.If this attribute is not set,
            its value should be set to 0.This attibute must 
            set with zxr10VrfRouteMaxNum together.If you just 
            set this attibute only, there will be an error!"                       2"the max capability of IPv4 protocol route table."                       ("Show the vrf route detail information."                       ("Show the vrf route detail information."                       "VRF Name."                      �"The destination IP address of this route.  An
            entry with a value of 0.0.0.0 is considered a
            default route.  Multiple routes to a single
            destination can appear in the table, but MAX-ACCESS to
            such multiple entries is dependent on the table-
            MAX-ACCESS mechanisms defined by the network
            management protocol in use."                       �"The IfIndex which uniquely identifies the
            local interface through which the next hop of this
            route should be reached.If there is no inteface, this
            value will be set 0."                       �"The IfName which uniquely identifies the
            local interface through which the next hop of this
            route should be reached.If there is no inteface, this
            value will be set NULL."                      "The primary routing metric for this route.  The
            semantics of this metric are determined by the
            routing-protocol specified in the route's
            zxr10VrfRouteProto value.  If this metric is not used,
            its value should be set to -1."                      "An alternate routing Preference for this route.  The
            semantics of this metric are determined by the
            routing-protocol specified in the route's
            zxr10VrfRouteProto value.  If the Preference is not used,
            its value should be set to -1."                      "The IP address of the next hop of this route.
            (In the case of a route bound to an interface
            which is realized via a broadcast media, the value
            of this field is the agent's IP address on that
            interface.)."                      �"The type of route.  Note that the values
            direct(3) and indirect(4) refer to the notion of
            direct and indirect routing in the IP
            architecture.

            Setting this object to the value invalid(2) has
            the effect of invalidating the corresponding entry
            in the zxr10VrfRouteTable object.  That is, it
            effectively dissasociates the destination
            identified with said entry from the route
            identified with said entry.  It is an
            implementation-specific matter as to whether the
            agent removes an invalidated entry from the table.
            Accordingly, management stations must be prepared
            to receive tabular information from agents that
            corresponds to entries not currently in use.
            Proper interpretation of such entries requires
            examination of the relevant zxr10VrfRouteType object."                       �"The routing mechanism via which this route was
            learned.  Inclusion of values for gateway routing
            protocols is not intended to imply that hosts
            should support those protocols."                      "The number of seconds since this route was last
            updated or otherwise determined to be correct.
            Note that no semantics of `too old' can be implied
            except through knowledge of the routing protocol
            by which the route was learned."                      v"Indicate the mask to be logical-ANDed with the
            destination address before being compared to the
            value in the zxr10VrfRouteDest field.  For those systems
            that do not support arbitrary subnet masks, an
            agent constructs the value of the zxr10VrfRouteMask by
            determining whether the value of the correspondent
            zxr10VrfRouteDest field belong to a class-A, B, or C
            network, and then using one of:

                mask           network
                255.0.0.0      class-A
                255.255.0.0    class-B
                255.255.255.0  class-C

            If the value of the zxr10VrfRouteDest is 0.0.0.0 (a
            default route), then the mask value is also
            0.0.0.0.  It should be noted that all IP routing
            subsystems implicitly use this mechanism."                      "A reference to MIB definitions specific to the
            particular routing protocol which is responsible
            for this route, as determined by the value
            specified in the route's zxr10VrfRouteProto value.  If
            this information is not present, its value should
            be set to the OBJECT IDENTIFIER { 0 0 }, which is
            a syntatically valid object identifier, and any
            conformant implementation of ASN.1 and BER must be
            able to generate and recognize this value."                               %"Show the routes number in this vrf."                       ("Show the vrf route detail information."                       `"VRF Name. If this attribute has NULL value, it means that this 
         is the global table."                       -"The Total routes number in this ipv6 table."                       /"The connect routes number in this ipv6 table."                       ."The static routes number in this ipv6 table."                       +"The rip routes number in this ipv6 table."                       ,"The ospf routes number in this ipv6 table."                       ,"The isis routes number in this ipv6 table."                       +"The bgp routes number in this ipv6 table."                                                          