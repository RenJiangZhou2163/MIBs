     �"A period of time measured in units of .001 of seconds
               when used in conjunction with the DISPLAY-HINT will
               show seconds and fractions of second with a resolution
               of .001 of a second."                                                                                             s"The MIB module that describes managed objects of
               general use by the Layer Two Transport Protocol."�"Evan Caves
              Postal: Occam Networks
                      77 Robin Hill Road
                      Santa Barbara, CA, 93117
              Tel:    +1 805692 2900
              Email:  evan@occamnetworks.com

              Pat R. Calhoun
              Postal: Black Storm Networks
                      110 Nortech Parkway
                      San Jose, CA, 95143
              Tel:    +1 408 941-0500
              Email:  pcalhoun@bstormnetworks.com

              Ross Wheeler
              Postal: DoubleWide Software, Inc.
                      2953 Bunker Hill Lane
                      Suite 101
                      Santa Clara, CA 95054
              Tel:    +1 6509260599
              Email:  ross@doublewidesoft.com

              Layer Two Tunneling Protocol Extensions WG
              Working Group Area:    Internet
              Working Group Name:    l2tpext
              General Discussion:    l2tp@l2tp.net" "200208230000Z" ("First revision, published as RFC 3371."       -- 23 August 2002
           �"A l2tpTunnelAuthFailure trap signifies that an
               attempt to establish a tunnel to a remote peer
               has failed authentication."                            g"This object defines the administrative state of
               the L2TP protocol. Setting this object to
               'disabled' causes all tunnels to be immediately
               disconnected and no further tunnels to be either
               initiated or accepted. The value of this object
               must be maintained in non-volatile memory."                      �"Setting this object to 'true' will prevent any new
               tunnels and/or sessions to be either initiated or
               accepted but does NOT disconnect any active
               tunnels/sessions. Setting this object to true(1)
               causes all domains and their respective tunnels
               to transition to the draining state. Note that
               when this occurs the 'xxxDraining' status objects
               of the domains and their tunnels should reflect
               that they are 'draining'. Setting this object has
               no affect on the domains or their tunnels
               'xxxDrainTunnels' configuration objects. To cancel
               a drain this object should be set to false(2).
               The object l2tpDrainingTunnels reflects
               the current L2TP draining state. The value of
               this object must be maintained in non-volatile
               memory."                          "Vector of supported L2TP protocol version and
                revision numbers. Supported versions are identified
                via a two octet pairing where the first octet indicates
                the version and the second octet contains the revision."                       T"This object identifies the Vendor name of the L2TP
               protocol stack."                       X"This object defines the firmware revision for the
               L2TP protocol stack."                       d"This object indicates if the local L2TP is draining
               off sessions from all tunnels."                      Y"The L2TP Domain configuration table. This table
               contains objects that can be used to configure
               the operational characteristics of a tunnel
               domain. There is a 1-1 correspondence between
               conceptual rows of this table and conceptual
               rows of the l2tpDomainStatsTable."                       �"An L2TP Domain configuration entry. An entry in this
               table may correspond to a single endpoint or a group
               of tunnel endpoints."                      o"The identifier, usually in the form of a Domain
               Name (full or partial), describing a single tunnel
               endpoint or a domain of tunnel endpoints. This is
               typically used as a 'handle' to identify the
               tunnel configuration requirements for both incoming
               and outgoing tunnel connection attempts. Both the
               LAC and  LNS could use information provided in the
               Host Name AVP attribute however the tunnel initiator
               could use other means not specified to identify
               the domain's tunnel configuration requirements.
               For example; three rows in this table have
               l2tpDomainConfigId values of 'lac1.isp.com',
               'isp.com' and 'com'. A tunnel endpoint then identifies
               itself as 'lac1.isp.com' which would match the
               'lac1.isp.com' entry in this table. A second tunnel
               endpoint then identifies itself as 'lac2.isp.com'.
               This endpoint is then associated with the 'isp.com'
               entry of this table."                      �"This object defines the administrative state of this
               tunnel domain. Setting this object to disabled(2)
               causes all tunnels to be immediately disconnected
               and no further tunnels to be either initiated or
               accepted. Note that all columnar objects corresponding
               to this conceptual row cannot be modified when
               the administrative state is enabled EXCEPT those
               objects which specifically state otherwise."                      "Setting this object to 'true' will prevent any new
               tunnels and/or sessions from being either initiated
               or accepted but does NOT disconnect any active
               tunnels/sessions for this tunnel domain. Setting
               this object to true(1) causes all tunnels within
               this domain to transition to the draining state.
               Note that when this occurs the
               l2tpTunnelStatsDrainingTunnel status objects of
               all of this domain's tunnels should reflect that
               they are 'draining'. Setting this object has no
               effect on this domain's associated tunnels
               l2tpTunnelConfigDrainTunnel configuration objects.
               To cancel a drain this object should be set to
               false(2).  Setting this object to false(2) when
               the L2TP object l2tpDrainTunnels is true(1) has
               no affect, all domains and their tunnels will
               continue to drain."                      �"This object describes how tunnel peers belonging
               to this domain are to be authenticated. The value
               simple(2) indicates that peers are authenticated
               simply by their host name as described in the Host
               Name AVP.  The value challenge(3) indicates that
               all peers are challenged to prove their identification.
               This mechanism is described in the L2TP protocol." "RFC 2661 Section 5.1"                    {"This object is used to configure the shared secret
               used during the tunnel authentication phase of
               tunnel establishment. This object MUST be accessible
               only via requests using both authentication and
               privacy. The agent MUST report an empty string in
               response to get, get-next and get-bulk requests."                      �"This object defines whether this tunnel domain
               requires that all tunnels are to be secured. The
               value of ipsec(3) indicates that all tunnel packets,
               control and session, have IP Security headers. The
               type of IP Security headers (AH, ESP etc) and how
               they are further described is outside the scope of
               this document."                      �"This object defines the interval in which Hello
               (or keep-alive) packets are to be sent by local
               peers belonging to this tunnel domain. The value
               zero effectively disables the sending of Hello
               packets. This object may be modified when the
               administrative state is enabled for this conceptual
               row."                      "This object defines the period of time that an
               established tunnel belonging to this tunnel
               domain with no active sessions will wait before
               disconnecting the tunnel. A value of zero indicates
               that the tunnel will disconnect immediately after the
               last session disconnects. A value of -1 leaves the
               tunnel up indefinitely. This object may be modified
               when the administrative state is enabled for this
               conceptual row."                      7"This object defines the control channel receive
               window size for tunnels belonging to this domain. It
               specifies the maximum number of packets the tunnel
               peer belonging to this domain can send without waiting
               for an acknowledgement from this peer."                       �"This object defines the maximum number of retransmissions
               which the L2TP stack will attempt for tunnels belonging
               to this domain before assuming that the peer is no
               longer responding."                       �"This object defines the maximum retransmission timeout
               interval which the L2TP stack will wait for tunnels
               belonging to this domain before retransmitting a
               control packet that has not been acknowledged."                      �"This object determines whether or not session payload
               packets will be requested to be sent with sequence
               numbers from tunnel peers belonging to this domain.
               The value onDemand(1) allows the L2TP implementation
               to initiate payload sequencing when necessary based
               on local information (e.g: during LCP/NCP negotiations
               or for CCP). The value never(2) indicates that L2TP
               will never initiate sequencing but will do sequencing
               if asked. The value always(3) indicates that L2TP
               will send the Sequencing Required AVP during session
               establishment."                      �"This object defines the number of milliseconds that
               local peers of this tunnel domain will wait before
               processing payload packets that were received out of
               sequence (which are waiting for the packet(s) to put
               them in sequence).  A low value increases the chance
               of delayed packets to be discarded (which MAY cause
               the PPP decompression engine to reset) while a high
               value may cause more queuing and possibly degrade
               throughput if packets are truly lost. The default
               value for this object is zero which will result in
               all delayed packets being lost."                       �"This object is used to configure the sending
               or acceptance of the PPP Proxy Authentication
               AVP's on the LAC or LNS."                      �"The storage type for this conceptual row.

               Conceptual rows having the value 'permanent' must
               allow write-access at a minimum to:

               - l2tpDomainConfigAdminState and
                 l2tpDomainConfigDrainTunnels at all times
               - l2tpDomainConfigSecret if l2tpDomainConfigAuth
                 has been configured as 'challenge'

               It is an implementation issue to decide if a SET for
               a readOnly or permanent row is accepted at all. In some
               contexts this may make sense, in others it may not. If
               a SET for a readOnly or permanent row is not accepted
               at all, then a 'wrongValue' error must be returned."                       �"The status of this Domain entry. Columnar objects
               corresponding to this conceptual row may be modified
               according to their description clauses when this
               RowStatus object is 'active'."                      c"The L2TP Domain Status and Statistics table. This
               table contains objects that can be used to describe
               the current status and statistics of a tunnel domain.
               There is a 1-1 correspondence between conceptual
               rows of this table and conceptual rows of the
               l2tpDomainConfigTable."                       �"An L2TP Domain Stats entry. An entry in this table
               may correspond to a single endpoint or a group of
               tunnel endpoints."                       �"This object returns the total number of tunnels
               that have successfully reached the established
               state for this tunnel domain."                       �"This object returns the number of tunnels that
               failed (eg: connection timeout, unsupported
               or malformed AVP's etc) to reach the established
               state for this tunnel domain."                       �"This object returns the number of failed tunnel
               connection attempts for this domain because the
               tunnel peer failed authentication."                       f"This object returns the number of tunnels that
               are currently active for this domain."                       �"This object returns the total number of sessions
               that have successfully reached the established
               state for this tunnel domain."                       �"This object returns the number of sessions that
               failed (eg: connection timeout, unsupported
               or malformed AVP's etc) to reach the established
               state for this tunnel domain."                       g"This object returns the number of sessions that
               are currently active for this domain."                       a"This object indicates if this domain is draining
               off sessions from all tunnels."                       k"This object returns the number of control channel
               octets received for this tunnel domain."                       d"This object returns the number of control packets
               received for this tunnel domain."                       �"This object returns the number of control channel
               octets that were transmitted to tunnel endpoints
               for this domain."                       �"This object returns the number of control packets
               that were transmitted to tunnel endpoints for
               this domain."                       u"This object returns the number of payload channel
               octets that were received for this tunnel domain."                       n"This object returns the number of payload packets
               that were received for this tunnel domain."                       w"This object returns the number of received payload
               packets that were discarded by this tunnel domain."                       �"This object returns the number of payload channel
               octets that were transmitted to tunnel peers
               within this tunnel domain."                       �"This object returns the number of payload packets
               that were transmitted to tunnel peers within
               this tunnel domain."                       T"This object is a 64-bit version of
               l2tpDomainStatsControlRxOctets."                       R"This object is a 64-bit version of
               l2tpDomainStatsControlRxPkts."                       T"This object is a 64-bit version of
               l2tpDomainStatsControlTxOctets."                       R"This object is a 64-bit version of
               l2tpDomainStatsControlTxPkts."                       T"This object is a 64-bit version of
               l2tpDomainStatsPayloadRxOctets."                       R"This object is a 64-bit version of
               l2tpDomainStatsPayloadRxPkts."                       S"This object is a 64-bit version of
               l2tpDomainStatsPayloadRxDiscs."                       T"This object is a 64-bit version of
               l2tpDomainStatsPayloadTxOctets."                       R"This object is a 64-bit version of
               l2tpDomainStatsPayloadTxPkts."                      �"The L2TP tunnel configuration table. This
               table contains objects that can be used to
               (re)configure the operational characteristics
               of a single L2TP tunnel. There is a 1-1
               correspondence between conceptual rows of
               this table and conceptual rows of the
               l2tpTunnelStatsTable. Entries in this table
               have the same persistency characteristics as
               that of the tunnelConfigTable." 
"RFC 2667"                    T"A L2TP tunnel interface configuration entry.
               Entries in this table come and go as a result
               of protocol interactions or on management
               operations. The latter occurs when a row is
               instantiated in the tunnelConfigTable row
               and the encapsulation method is 'l2tp'." 
"RFC 2667"                     �"This value for this object is equal to the value
               of ifIndex of the Interfaces MIB for tunnel
               interfaces of type L2TP."                      �"The tunnel domain that this tunnel belongs
               to. A LNS tunnel endpoint will typically inherit
               this value from the endpoint domain table. A
               LAC may be provided with this information during
               tunnel setup. When a zero length string is returned
               this tunnel does not belong belong to any particular
               domain."                      ""This object describes how L2TP tunnel peers are
               to be authenticated. The value 'simple' indicates
               that peers are authenticated simply by their host
               name as described in the Host Name AVP. The value
               'challenge' indicates that all peers are challenged
               to prove their identification. This mechanism is
               described in the L2TP protocol. This object cannot
               be modified when the tunnel is in a connecting or
               connected state."                      �"This object is used to configure the shared secret
               used during the tunnel authentication phase of
               tunnel establishment. This object cannot be modified
               when the tunnel is in a connecting or connected
               state. This object MUST be accessible only via
               requests using both authentication and privacy.
               The agent MUST report an empty string in response
               to get, get-next and get-bulk requests."                      �"This object defines whether this tunnel is to be
               secured. The value of 'ipSec' indicates that all
               tunnel packets, control and session, have IP
               Security headers. The type of IP Security headers
               (AH, ESP etc) and how they are further described
               is outside the scope of this document. This object
               cannot be modified when the tunnel is in a connecting
               or connected state."                      #"This object defines the interval in which Hello
               (or keep-alive) packets are to be sent to the
               tunnel peer.  The value zero effectively disables
               the sending of Hello packets. Modifications to this
               object have immediate effect."                      �"This object defines the period of time that an
               established tunnel with no sessions will wait
               before disconnecting the tunnel. A value of
               zero indicates that the tunnel will disconnect
               immediately after the last session disconnects.
               A value of -1 leaves the tunnel up indefinitely.
               Modifications to this object have immediate
               effect."                      a"This object defines the control channel receive
               window size. It specifies the maximum number of
               packets the tunnel peer can send without waiting
               for an acknowledgement from this peer. This object
               cannot be modified when the tunnel is in a con-
               necting or connected state."                      �"This object defines the number of retransmissions
               which the tunnel will attempt before assuming that
               the peer is no longer responding. A value of zero
               indicates that this peer will not attempt to
               retransmit an unacknowledged control packet.
               Modifications to this object have immediate
               effect."                      	"This object defines the maximum retransmission timeout
               interval which the tunnel will wait before retrans-
               mitting a control packet that has not been acknowledged.
               Modifications to this object have immediate effect."                      "This object determines whether or not session payload
               packets will be requested to be sent with sequence
               numbers from tunnel peers belonging to this domain.
               The value onDemand(1) allows the L2TP implementation
               to initiate payload sequencing when necessary based
               on local information (e.g: during LCP/NCP negotiations
               or for CCP). The value never(2) indicates that L2TP
               will never initiate sequencing but will do sequencing
               if asked. The value always(3) indicates that L2TP
               will send the Sequencing Required AVP during session
               establishment. Modifications to this object have
               immediate effect."                      �"This object defines the number of milliseconds that
               this tunnel will wait before processing payload packets
               that were received out of sequence (which are waiting
               for the packet(s) to put them in sequence).  A low value
               increases the chance of delayed packets to be discarded
               (which MAY cause the PPP decompression engine to
               reset) while a high value may cause more queuing and
               possibly degrade throughput if packets are truly lost.
               The default value for this object is zero which will
               result in all delayed packets being lost. Modifications
               to this object have immediate effect."                      &"This object defines the underlying transport media
               that is in use for this tunnel entry. Different tunnel
               transports may define MIB extensions to the L2TP tunnel
               table to realize the transport layer. For example if the
               value of this object is 'udpIp' then the value of ifIndex
               for this table may be used to determine state from the
               l2tpUdpStatsTable. This object cannot be modified when
               the tunnel is in a connecting or connected state."                      �"Setting this object to 'true' will prevent any new
               session from being either initiated or accepted but
               does NOT disconnect any active sessions for this
               tunnel. Note that when this occurs the
               l2tpTunnelStatsDrainingTunnel status object of
               this tunnel should reflect that it is 'draining'.
               To cancel a drain this object should be set to
               false(2).  Setting this object to false(2) when
               the L2TP objects l2tpDrainTunnels or
               l2tpDomainConfigDrainTunnels is true(1) has
               no affect, this tunnels will continue to drain."                       �"This object is used to configure the sending
               or acceptance of the session PPP Proxy
               Authentication AVP's on the LAC or LNS."                      h"The L2TP tunnel status and statistics table. This
               table contains objects that can be used to describe
               the current status and statistics of a single L2TP
               tunnel. There is a 1-1 correspondence between
               conceptual rows of this table and conceptual rows of
               the l2tpTunnelConfigTable."                       '"An L2TP tunnel interface stats entry."                       3"This object contains the local tunnel Identifier." "RFC 2661, Section 3.1"                     4"This object contains the remote tunnel Identifier." "RFC 2661, Section 3.1"                     N"This field contains the current state of the
               control tunnel."                       n"This object indicates whether the tunnel was
               initiated locally or by the remote tunnel peer."                      #"This object contains the host name as discovered
               during the tunnel establishment phase (via the Host
               Name AVP) of the L2TP peer. If the tunnel is idle
               this object should maintain its value from the last
               time it was connected."                       �"This object identifies the vendor name of the peer's
               L2TP implementation. If the tunnel is idle this
               object should maintain its value from the last time
               it was connected."                       �"This object contains the tunnel peer's firmware
               revision number. If the tunnel is idle this object
               should maintain its value from the last time it
               was connected."                       �"This object describes the protocol version and
               revision of the tunnel peers implementation. The
               first octet contains the protocol version. The
               second octet contains the protocol revision."                      M"This object contains the initial remote peer's
               receive window size as indicated by the tunnel peer
               (in the RWS AVP) during the tunnel establishment
               phase. If the tunnel is idle this object should
               maintain its value from the last time it was
               connected."                       �"This object describes the Bearer Capabilities of
               the tunnel peer. If the tunnel is idle this object
               should maintain its value from the last time it was
               connected."                       �"This object describes the Framing Capabilities of
               the tunnel peer. If the tunnel is idle this object
               should maintain its value from the last time it was
               connected."                       \"This object contains the number of control packets
               received on the tunnel."                       �"This object returns a count of the number of Zero
               Length Body control packet acknowledgement packets
               that were received."                       �"This object returns a count of the number of
               control packets that were not received in the
               correct order (as per the sequence number)
               on this tunnel including out of window
               packets."                      "This object contains the number of control
               packets that were received outside of the
               offered receive window. It is implementation
               specific as to whether these packets are queued
               or discarded."                       ~"This object contains the number of control
               packets that were transmitted to the tunnel
               peer."                       �"This object contains the number of Zero Length
               Body control packets transmitted to the tunnel
               peer."                       �"This object returns a count of the number of
               control packet timeouts due to the lack of a
               timely acknowledgement from the tunnel peer."                       �"This object contains the current remote receive
               window size as determined by the local flow
               control mechanism employed."                       ]"This object contains the next send sequence number
               for the control channel."                      �"This object contains the send sequence number that
               the tunnel peer has acknowledged for the control
               channel. The flow control state can be determined
               by subtracting the l2tpTunnelStatsTxSeq from
               l2tpTunnelStatsTxSeqAck and comparing this value
               to l2tpTunnelStatsCurrentRemoteRWS (taking into
               consideration sequence number wraps)."                       �"This object contains the next receive sequence
               number expected to be received on this control
               channel."                       �"This object contains the last receive sequence
               number that was acknowledged back to the tunnel
               peer for the control channel."                       �"This object contains the total number of sessions
               that this tunnel has successfully connected through
               to its tunnel peer since this tunnel was created."                       �"This object contains the total number of sessions
               that were initiated but failed to reach the
               established phase."                       m"This object contains the total number of sessions
               in the established state for this tunnel."                       �"This object contains the last value of the result
               code as described in the Result Code AVP which
               caused the tunnel to disconnect."                       �"This object contains the last value of the error
               code as described in the Result Code AVP which
               caused the tunnel to disconnect."                       �"This object contains the last value of the optional
               message as described in the Result Code AVP which
               caused the tunnel to disconnect."                      "This object indicates if this tunnel is draining
               off sessions. This object will return false(2) when
               the tunnel is not draining sessions or after the
               last session has disconnected when the tunnel is in
               the draining state."                       �"The L2TP session status and statistics table. This
               table contains the objects that can be used to
               describe the current status and statistics of a
               single L2TP tunneled session."                       ("An L2TP session interface stats entry."                       \"This object identifies the session's associated
               L2TP tunnel ifIndex value."                       �"This object identifies the ifIndex value of the
               interface from which PPP packets are being tunneled.
               For example this could be a DS0 ifIndex on a
               LAC or it would be the PPP ifIndex on the LNS."                       ^"This object contains the local assigned session
               identifier for this session." "RFC 2661, Section 3.1"                     �"This object contains the remote assigned session
               identifier for this session. When a session is
               starting this value may be zero until the remote
               tunnel endpoint has responded." "RFC 2661, Section 3.1"                    "This object identifies the peer session name on
               this interface. This is typically the login name
               of the remote user. If the user name is unknown to
               the local tunnel peer then this object will contain
               a null string."                       H"This object contains the current state of the
               session."                      �"This object indicates the type of call and the
               role this tunnel peer is providing for this
               session. For example, lacIncoming(1) indicates
               that this tunnel peer is acting as a LAC and
               generated a Incoming-Call-Request to the tunnel
               peer (the LNS). Note that tunnel peers can be
               both LAC and LNS simultaneously."                       a"This object contains the serial number that has
               been assigned to this  session."                       Y"This object returns the last known transmit
               baud rate for this session."                       d"This object returns the last known receive
               baud rate for this session established."                       H"This object describes the bearer type of this
               session."                       I"This object describes the framing type of this
               session."                       W"This object contains the physical channel
               identifier for the session."                       �"This object identifies the Dialed Number
               Information String that the LAC obtained from
               the network for the session. If no DNIS was
               provided then a null string will be returned."                       �"This object identifies the Calling Line ID
               that the LAC obtained from the network for
               the session. If no CLID was provided then a
               null string will be returned."                       �"This object identifies the Sub Address that
               the LAC obtained from the network for the
               session. If no Sub Address was provided then
               a null string will be returned."                       �"This object identifies the Private Group
               Identifier used for this tunneled session.
               If no Private Group Identifier was provided
               then a null string will be returned."                       Q"Indicates whether the LAC performed proxy LCP
               for this session."                       �"This object contains the proxy authentication
               method employed by the LAC for the session. If
               l2tpSessionProxyLcp is false(2) this object
               should not be interpreted."                       �"This object defines which tunnel peers have
               requested payload sequencing. The value of
               both(4) indicates that both peers have requested
               payload sequencing."                       �"This object returns the total number of packets
               received for this session which were received out
               of sequence."                       l"This object returns the number of reassembly
               timeouts that have occurred for this session."                       Z"This object contains the next send sequence number
               for for this session."                       p"This object contains the next receive sequence
               number expected to be received on this session."                       �"The L2TP Tunnel index mapping table. This table
               is intended to assist management applications
               to quickly determine what the ifIndex value is
               for a given local tunnel identifier."                       !"An L2TP tunnel index map entry."                       3"This object contains the local tunnel Identifier." "RFC 2661, Section 3.1"                     �"This value for this object is equal to the value
               of ifIndex of the Interfaces MIB for tunnel
               interfaces of type L2TP."                       �"The L2TP Session index mapping table. This table
               is intended to assist management applications
               to map interfaces to a tunnel and session
               identifier."                       ""An L2TP Session index map entry."                       �"This object identifies the ifIndex value of the
               interface which is receiving or sending its packets
               over an L2TP tunnel. For example this could be a DS0
               ifIndex on a LAC or a PPP ifIndex on the LNS."                      "This object identifies the sessions associated
               L2TP tunnel ifIndex value. When this object is
               set it provides a binding between a particular
               interface identified by l2tpSessionMapIfIndex
               to a particular tunnel."                       ^"This object contains the local assigned session
               identifier for this session." "RFC 2661, Section 3.1"                     '"The status of this session map entry."                                   �"The L2TP UDP/IP transport stats table. This table
               contains objects that can be used to describe the
               current status and statistics of the UDP/IP L2TP
               tunnel transport."                       '"An L2TP UDP/IP transport stats entry."                       �"This value for this object is equal to the
               value of ifIndex of the Interfaces MIB for
               tunnel interfaces of type L2TP and which have
               a L2TP transport of UDP/IP."                       �"This object reflects the peer's UDP port number
               used for this tunnel. When not known a value of
               zero should be returned."                       ^"This object reflects the local UDP port number
               that this tunnel is bound to."                                   �"A collection of objects providing configuration
               information of the L2TP protocol, tunnels and
               sessions."                 �"A collection of objects providing status and
               statistics of the L2TP protocol, tunnels and
               sessions."                 m"A collection of objects providing status and
               statistics of the L2TP UDP/IP transport layer."                 p"A collection of objects providing configuration,
               status and statistics of L2TP tunnel domains."                 2"A collection of objects providing index mapping."                 P"A collection of objects providing L2TP security
               configuration."                 `"A collection of L2TP trap events as specified
               in NOTIFICATION-TYPE constructs."                     Y"A collection of objects providing High Capacity
               64-bit counter objects."                    "When this MIB is implemented with support for
               read-create and read-write, then such an
               implementation can claim full compliance. Such
               an implementation can then be both monitored
               and configured with this MIB."   \"This group is mandatory for implementations that
               support L2TP over UDP/IP." j"This group is optional for L2TP devices that
               group tunnel endpoints into tunnel domains." U"This group is optional for L2TP devices that
               provide index mapping." �"This group is optional for SNMP agents which support
               both authentication and privacy of SNMP messages for
               the management of L2TP keys." �"This group is mandatory for implementations that
               support the l2tpDomainGroup AND could potentially
               overflow the L2TP Domain 32-bit counters is less
               than one hour."            9"When this MIB is implemented without support for
               read-create and read-write (i.e. in read-only mode),
               then such an implementation can claim read-only
               compliance. Such an implementation can then be
               monitored but can not be configured with this MIB."   "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." \"This group is mandatory for implementations that
               support L2TP over UDP/IP." j"This group is optional for L2TP devices that
               group tunnel endpoints into tunnel domains." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." U"This group is optional for L2TP devices that
               provide index mapping." "Write access is not required." "Write access is not required." �"This group is optional for SNMP agents which support
               both authentication and privacy of SNMP messages for
               the management of L2TP keys." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." �"This group is mandatory for implementations that
               support the l2tpDomainGroup AND could potentially
               overflow the L2TP Domain 32-bit counters is less
               than one hour."                