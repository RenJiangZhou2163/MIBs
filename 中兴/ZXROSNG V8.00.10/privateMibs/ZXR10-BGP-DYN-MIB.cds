-- *****************************************************************
-- ZTE-BGP4-MIB.my
--   
-- June 2001, Ravindra Rathi
--   
-- Copyright (c) 2001, 2010 by ZTE Systems, Inc.
-- All rights reserved.
--   
-- *****************************************************************
                         "ZXROSNG BGP-DYN MIB" s"Wang xuan (He jian)
             Tel: +86-25-52871138
             E-Mail: wang.xuan6@zte.com.cn
             " "201711100900Z" "201604080900Z" "201603030900Z" "201602240900Z" "201511250900Z" "201503040900Z" "201412090900Z" "201403040900Z" "201307040900Z" "201304120900Z" "201303210900Z" m"
            Add an index node for zxr10BgpV4PeerTable and zxr10BgpV6PeerTable respectively.
            " F"
            Add enums for zxr10BPPrefixAddrModeType.
            " F"
            Add enums for zxr10BPPrefixAddrModeType.
            " F"
            Add enums for zxr10BPPrefixAddrModeType.
            " V"
            Modify textual label of enum value for zxr10BPPrevState.
            " I"
            Modify description of zxr10BRMultiExitDisc.
            " k"
            Add zxr10BgpV4PeerTable and zxr10BgpV6PeerTable
            to zxr10BgpPeer.
            " �"
            Modify type of
              zxr10BRAddrModeType,
              zxr10BRAddrModeTypeNew,
              zxr10BPPrefixAddrModeType,
              zxr10BPPrefixAddrModeTypeNew
            to enumeration.
            " 4"Modify zxr10BPPrefixLimit read-only.
            " @"Add zxr10BRLocalAS,zxr10BRRD,zxr10BRLabelOutTag.
            " 3"Initial version of this MIB module.
            "       -- 11 10, 2017
          �"This table contains information about routes to
        destination networks from all BGP4 peers.  Since 
        BGP4 can carry routes for multiple Network Layer 
        protocols, this table has the Address Family 
        Identifier(AFI) of the Network Layer protocol as the 
        first index. Further for a given AFI, routes carried
        by BGP4 are distinguished based on Subsequent Address 
        Family Identifiers(SAFI).  Hence that is used as the
        second index.  Conceptually there is a separate Loc-RIB
        maintained by the BGP speaker for each combination of 
        AFI and SAFI supported by it." �"RFC-1771: A Border Gateway Protocol 4 (BGP-4),
         RFC-2858: Multiprotocol Extensions for BGP-4,
         RFC-2547: BGP/MPLS VPNs"                     F"Information about a path to a network received from
        a peer."                       "The AS number of local BGP."                       "The remote address of peer."                       "The type of address mode."                       "The name of vrf."                      A"A Network Address prefix in the Network Layer
        Reachability Information field of BGP UPDATE message.
        This object is a Network Address containing the prefix
        with length specified by zxr10BRAddrPrefixLen. Any
        bits beyond the length specified by
        zxr10BRAddrPrefixLen are zeroed."                       l"Length in bits of the Network Address prefix in the
        Network Layer Reachability Information field."                       /"The ultimate origin of the route information."                      $"The sequence of AS path segments.  Each AS
        path segment is represented by a triple
        <type, length, value>.

        The type is a 1-octet field which has two
        possible values:
        1  AS_SET: unordered set of ASs a route in the 
                  UPDATE message has traversed
        2  AS_SEQUENCE: ordered set of ASs a route in the
                       UPDATE message has traversed.

        The length is a 1-octet field containing the
        number of ASs in the value field.

        The value field contains one or more AS
        numbers, each AS is represented in the octet
        string as a pair of octets according to the
        following algorithm:

        first-byte-of-pair = ASNumber / 256;
        second-byte-of-pair = ASNumber & 255;"                       j"The Network Layer address of the border router
        that should be used for the destination network."                       U"Indicates the presence/absence of MULTI_EXIT_DISC
        attribute for the route."                       �"This metric is used to discriminate between multiple
        exit points to an adjacent autonomous system.  The
        value of this object is irrelevant if the value of
        zxr10BRMedPresent is false(2)."                       P"Indicates the presence/absence of LOCAL_PREF
        attribute for the route."                       �"The degree of preference calculated by the local BGP4
        speaker for the route. The value of this object is 
        irrelevant if the value of zxr10BRLocalPrefPresent 
        is false(2)."                       "Whether or not the local system has selected a less
        specific route without selecting a more specific
        route."                       �"The AS number of the last BGP4 speaker that performed
        route aggregation.  A value of zero (0) indicates the 
        absence of this attribute."                       X"Represents the type of Network Layer address stored
        in zxr10BRAggregatorAddr."                       �"The Network Layer address of the last BGP4 speaker
        that performed route aggregation.  A value of all zeros
        indicates the absence of this attribute."                       X"An indication of whether or not this route was chosen
        as the best BGP4 route."                      ="One or more path attributes not understood by this
        BGP4 speaker.  Size zero (0) indicates the absence of
        such attribute(s).  Octets beyond the maximum size, if
        any, are not recorded by this object.  

        Each path attribute is a triple <attribute type,
        attribute length, attribute value> of variable length.
        Attribute Type is a two-octet field that consists of
        the Attribute Flags octet followed by the Attribute
        Type Code octet.  If the Extended Length bit of the 
        Attribute Flags octet is set to 0, the third octet of 
        the Path Attribute contains the length of the
        attribute data in octets.  If the Extended Length bit 
        of the Attribute Flags octet is set to 1, then the
        third and the fourth octets of the path attribute 
        contain the length of the attribute data in octets.
        The remaining octets of the Path Attribute represent 
        the attribute value and are interpreted according to 
        the Attribute Flags and the Attribute Type Code." F"RFC-1771: A Border Gateway Protocol 4 (BGP-4), 
        section 4.3"                     "The route's RD infomation."                       "The route's RT infomation."                       ""The route's in label infomation."                       #"The route's out label infomation."                       "The route's status."                           �"BGP peer table.  This table contains,
        one entry per BGP peer, information about
        the connections with BGP peers."                       M"Entry containing information about the
        connection with a BGP peer."                       "The AS number of local BGP."                       "The remote address of peer."                       ""The type of address family mode."                       "The name of vrf."                       �"Number of Route prefixes received on this connnection,
        which are accepted after applying filters. Possible
        filters are route maps, prefix lists, distributed
        lists, etc."                      K"Counter which gets incremented when a route prefix
        received on this connection is denied  or when a route
        prefix is denied during soft reset of this connection
        if 'soft-reconfiguration' is on . This object is 
        initialized to zero when the peer is  configured or
        the router is rebooted"                       C"Max number of route prefixes accepted on this
        connection"                       �"Counter which gets incremented when a route prefix
        is advertised on this connection. This object is
        initialized to zero when the peer is configured or 
        the router is rebooted"                       �"Counter which gets incremented when a route prefix
        is suppressed from being sent on this connection. This 
        object is initialized to zero when the peer is 
        configured or the router is rebooted"                       �"Counter which gets incremented when a route prefix
        is withdrawn on this connection. This object is
        initialized to zero when the peer is configured or
        the router is rebooted"                       �"BGP peer table.  This table contains,
        one entry per BGP peer, information about
        the connections with BGP peers."                       M"Entry containing information about the
        connection with a BGP peer."                       "The AS number of local BGP."                       "The remote address of peer."                       "The name of vrf."                        "The BGP peer connection state." "RFC 4271, Section 8.2.2."                    �"The desired state of the BGP connection.
        A transition from 'stop' to 'start' will cause
        the BGP Manual Start Event to be generated.
        A transition from 'start' to 'stop' will cause
        the BGP Manual Stop Event to be generated.
        This parameter can be used to restart BGP peer
        connections.  Care should be used in providing
        write access to this object without adequate
        authentication." "RFC 4271, Section 8.1.2."                    "The negotiated version of BGP running between
        the two peers.

        This entry MUST be zero (0) unless the
        zxr10BPState is in the openconfirm or the
        established state.

        Note that legal values for this object are
        between 0 and 255." 7"RFC 4271, Section 4.2.
         RFC 4271, Section 7."                     ?"The local IP address of this entry's BGP
        connection."                       G"The local port for the TCP connection between
        the BGP peers."                       ."The BGP Identifier of this entry's BGP peer."                      %"The remote port for the TCP connection
        between the BGP peers.  Note that the
        objects zxr10BPLocalAddr,
        zxr10BPLocalPort, zxr10BPRemoteAddr, and
        zxr10BPRemotePort provide the appropriate
        reference to the standard MIB TCP
        connection table."                       P"The remote autonomous system number received in
        the BGP OPEN message." "RFC 4271, Section 4.2."                     �"The BGP Identifier of this entry's BGP peer.
        This entry MUST be 0.0.0.0 unless the
        zxr10BPState is in the openconfirm or the
        established state." *"RFC 4271, Section 4.2, 'BGP Identifier'."                     I"The number of BGP UPDATE messages
        received on this connection." "RFC 4271, Section 4.3."                     L"The number of BGP UPDATE messages
        transmitted on this connection." "RFC 4271, Section 4.3."                     Y"The total number of messages received
        from the remote peer on this connection." "RFC 4271, Section 4."                     Z"The total number of messages transmitted to
        the remote peer on this connection." "RFC 4271, Section 4."                    "The last error code and subcode seen by this
        peer on this connection.  If no error has
        occurred, this field is zero.  Otherwise, the
        first byte of this two byte OCTET STRING
        contains the error code, and the second byte
        contains the subcode." "RFC 4271, Section 4.5."                     p"The total number of times the BGP FSM
        transitioned into the established state
        for this peer." "RFC 4271, Section 8."                    "This timer indicates how long (in
        seconds) this peer has been in the
        established state or how long
        since this peer was last in the
        established state.  It is set to zero when
        a new peer is configured or when the router is
        booted." "RFC 4271, Section 8."                     ~"Time interval (in seconds) for the
        ConnectRetry timer.  The suggested value
        for this timer is 120 seconds." c"RFC 4271, Section 8.2.2.  This is the value used
         to initialize the 'ConnectRetryTimer'."                    {"Time interval (in seconds) for the Hold
        Timer established with the peer.  The
        value of this object is calculated by this
        BGP speaker, using the smaller of the
        values in zxr10BPHoldTimeConfigured and the
        Hold Time received in the OPEN message.

        This value must be at least three seconds
        if it is not zero (0).

        If the Hold Timer has not been established
        with the peer this object MUST have a value
        of zero (0).

        If the zxr10BPHoldTimeConfigured object has
        a value of (0), then this object MUST have a
        value of (0)." "RFC 4271, Section 4.2."                    h"Time interval (in seconds) for the KeepAlive
        timer established with the peer.  The value
        of this object is calculated by this BGP
        speaker such that, when compared with
        zxr10BPHoldTime, it has the same proportion
        that zxr10BPKeepAliveConfigured has,
        compared with zxr10BPHoldTimeConfigured.

        If the KeepAlive timer has not been established
        with the peer, this object MUST have a value
        of zero (0).

        If the of zxr10BPKeepAliveConfigured object
        has a value of (0), then this object MUST have
        a value of (0)." "RFC 4271, Section 4.4."                    p"Time interval (in seconds) for the Hold Time
        configured for this BGP speaker with this
        peer.  This value is placed in an OPEN
        message sent to this peer by this BGP
        speaker, and is compared with the Hold
        Time field in an OPEN message received
        from the peer when determining the Hold
        Time (zxr10BPHoldTime) with the peer.
        This value must not be less than three
        seconds if it is not zero (0).  If it is
        zero (0), the Hold Time is NOT to be
        established with the peer.  The suggested
        value for this timer is 90 seconds." 8"RFC 4271, Section 4.2.
         RFC 4271, Section 10."                    �"Time interval (in seconds) for the
        KeepAlive timer configured for this BGP
        speaker with this peer.  The value of this
        object will only determine the
        KEEPALIVE messages' frequency relative to
        the value specified in
        zxr10BPHoldTimeConfigured; the actual
        time interval for the KEEPALIVE messages is
        indicated by zxr10BPKeepAlive.  A
        reasonable maximum value for this timer
        would be one third of that of
        zxr10BPHoldTimeConfigured.
        If the value of this object is zero (0),
        no periodical KEEPALIVE messages are sent
        to the peer after the BGP connection has
        been established.  The suggested value for
        this timer is 30 seconds." 8"RFC 4271, Section 4.4.
         RFC 4271, Section 10."                     �"Time interval (in seconds) for the
        MinASOriginationInterval timer.
        The suggested value for this timer is 15
        seconds." <"RFC 4271, Section 9.2.1.2.
         RFC 4271, Section 10."                     �"Time interval (in seconds) for the
        MinRouteAdvertisementInterval timer.
        The suggested value for this timer is 30
        seconds for EBGP connections and 5
        seconds for IBGP connections." <"RFC 4271, Section 9.2.1.1.
         RFC 4271, Section 10."                     �"Elapsed time (in seconds) since the last BGP
        UPDATE message was received from the peer.
        Each time zxr10BPInUpdates is incremented,
        the value of this object is set to zero (0)." N"RFC 4271, Section 4.3.
         RFC 4271, Section 8.2.2, Established state."                     R"Implementation specific error description for
        bgpPeerLastErrorReceived."                       )"The BGP peer connection previous state." E"RFC 1771, Section 8, A Border Gateway Protocol 4
         (BGP-4)."                     "BGP IPv4 peer table."                       ["Entry containing information about the connection
                 with a BGP IPv4 peer."                       3"The remote IPv4 address of this entry's BGP peer."                       4"The number of routes learned from the remote peer."                       "The AS number of local BGP."                       "BGP IPv6 peer table."                       ["Entry containing information about the connection
                 with a BGP IPv6 peer."                       3"The remote IPv6 address of this entry's BGP peer."                       4"The number of routes learned from the remote peer."                       "The AS number of local BGP."                                                  