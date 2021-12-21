                                                                          2"Copyright (C) The Internet Society (2004). The
                initial version of this MIB module was published
                in RFC 3812. For full legal notices see the RFC
                itself or see: http://www.ietf.org/copyrights/ianamib.html
                This MIB module contains managed object definitions
                for MPLS Traffic Engineering (TE) as defined in:
                1. Extensions to RSVP for LSP Tunnels, Awduche et
                al, RFC 3209, December 20012.
                 Constraint-Based LSP Setup using LDP, Jamoussi
                 (Editor), RFC 3212, January 2002
                 3. Requirements for Traffic Engineering Over MPLS,
                 Awduche, D., Malcolm, J., Agogbua, J., O'Dell, M.,
                 and J. McManus, [RFC2702], September 1999"�" Cheenu SrinivasanBloomberg L.P.
                Email: cheenu@bloomberg.net
                Arun Viswanathan
                Force10 Networks, Inc.
                Email: arunv@force10networks.com
                Thomas D. Nadeau
                Cisco Systems, Inc.
                Email: tnadeau@cisco.com
                Comments about this document should be emailed
                directly to the MPLS working group mailing list at
                mpls@uu.net." "201504201330Z" "201412231714Z" "201401281330Z" "201306201130Z" "200406030000Z" �"Add new fields zxr10MplsRemoteTunnelLspInOctets
                 in zxr10MplsRemoteTunnelTable.
                 Add new fields zxr10MplsRemoteTunnelLspInPackets
                 in zxr10MplsRemoteTunnelTable." ]"Add the syntax of zxr10MplsTunnelUpcallNetmng
                in zxr10MplsTeNotifications." Y"Modify the syntax of zxr10MplsTunnelPathInUse
                in zxr10MplsTunnelTable." j"Add new fields zxr10MplsTunnelAssociateStatus
                                 in zxr10MplsTunnelTable." -"Initial version issued as part of RFC 3812."                   �"This notification is generated when a
             zxr10MplsTunnelOperStatus object for one of the
             configured tunnels is about to leave the down state
             and transition into up state."                 �"This notification is generated when a
             zxr10MplsTunnelOperStatus object for one of the
             configured tunnels is about to leave the up state
             and transition into down state."                 �"This notification is generated when a
             zxr10MplsTunnelOperStatus object for one of the
             LSPs is about to leave the down state
             and transition into up state."                 �"This notification is generated when a
             zxr10MplsTunnelOperStatus object for one of the
             LSPs is about to leave the up state
             and transition into down state."                 D"This notification is generated when a
             tunnel is MBB."                 �"This notification is generated when tunnel state changed,
                  for example tunnel hotstandby bind or delete,tunnel creat successs,
                  tunnel config success or fail..."                     >"If this object is true, then it enables the zxr10MplsTunnel."                       �"The number of tunnels configured on this device. A
                tunnel is considered configured if the
                zxr10MplsTunnelRowStatus is active(1)."                       �"The traffic engineering distribution protocol(s)
                used by this LSR. Note that an LSR may support more
                than one distribution protocol simultaneously."                       ;"If this object is true, then it enables the ImplicitNull."                       1"If this object is true, then it enables the GR."                       *"Graceful-restart interval time 10~30000."                       $"Graceful-restart miss number 4~10."                       )"Graceful-restart RecoveryTime 0~300000."                       !"Graceful-restart time 0~300000."                       "RefreshInterval 5000~65535000"                       "SignallingRefreshMisses 2~10"                       "MPLS version number."                       "Number of active LSPs."                       1"The Min tunnelID can be used by Auto baktunnel."                       1"The Max tunnelID can be used by Auto baktunnel."                       ""TE_Routerid with interface name."                          d"The mplsTunnelTable allows new MPLS tunnels to be
                    created between an LSR and a remote endpoint, and
                    existing tunnels to be reconfigured or removed.
                    Note that only point-to-point tunnel segments are
                    supported, although multipoint-to-point and pointto-
                    multipoint connections are supported by an LSR
                    acting as a cross-connect. Each MPLS tunnel can
                    thus have one out-segment originating at this LSR
                    and/or one in-segment terminating at this LSR."                      >"An entry in this table represents an MPLS tunnel.
                  An entry can be created by a network administrator
                  or by an SNMP agent as instructed by an MPLS
                  signalling protocol. Whenever a new entry is
                  created with zxr10MplsTunnelIsIf set to true(1), then a
                  corresponding entry is created in ifTable as well
                  (see RFC 2863). The ifType of this entry is
                  zxr10MplsTunnel(150).
                  A tunnel entry needs to be uniquely identified across
                  a MPLS network. Indices zxr10MplsTunnelIndex and
                  zxr10MplsTunnelInstance uniquely identify a tunnel on
                  the LSR originating the tunnel. To uniquely
                  identify a tunnel across an MPLS network requires
                  index zxr10MplsTunnelIngressLSRId. The last index
                  zxr10MplsTunnelEgressLSRId is useful in identifying all
                  instances of a tunnel that terminate on the same
                  egress LSR." i"1. RFC 2863 - The Interfaces Group MIB, McCloghrie,
                K., and F. Kastenholtz, June 2000 "                    6"Uniquely identifies a set of tunnel instances
            between a pair of ingress and egress LSRs.
            Managers should obtain new values for row
            creation in this table by reading
            zxr10MplsTunnelIndexNext. When
            the MPLS signalling protocol is rsvp(2) this value
            SHOULD be equal to the value signaled in the
            Tunnel Id of the Session object. When the MPLS
            signalling protocol is crldp(3) this value
            SHOULD be equal to the value signaled in the
            LSP ID."                      "Uniquely identifies a particular instance of a
                tunnel between a pair of ingress and egress LSRs.
                It is useful to identify multiple instances of
                tunnels for the purposes of backup and parallel
                tunnels. When the MPLS signaling protocol is
                rsvp(2) this value SHOULD be equal to the LSP Id
                of the Sender Template object. When the signaling
                protocol is crldp(3) there is no equivalent
                signaling object."                      "Identity of the ingress LSR associated with this
                tunnel instance. When the MPLS signalling protocol
                is rsvp(2) this value SHOULD be equal to the Tunnel
                Sender Address in the Sender Template object and MAY
                be equal to the Extended Tunnel Id field in the
                SESSION object. When the MPLS signalling protocol is

                rldp(3) this value SHOULD be equal to the Ingress
                LSR Router ID field in the LSPID TLV object." �"1. RSVP-TE: Extensions to RSVP for LSP Tunnels,
                Awduche et al, RFC 3209, December 2001
                2. Constraint-Based LSP Setup using LDP, Jamoussi
                (Editor), RFC 3212, January 2002"                     S"Identity of the egress LSR associated with this
                tunnel instance."                       "Out label of local tunnel."                       7"The name of out interface that local tunnel transits."                      �"The canonical name assigned to the tunnel. This name
                can be used to refer to the tunnel on the LSR's
                console port. If zxr10MplsTunnelIsIf is set to true
                then the ifName of the interface corresponding to
                this tunnel should have a value equal to
                zxr10MplsTunnelName. Also see the description of ifName
                in RFC 2863."                      |"A textual string containing information about the
            tunnel. If there is no description this object
            contains a zero length string. This object is may
            not be signaled by MPLS signaling protocols,
            consequentally the value of this object at transit
            and egress LSRs MAY be automatically generated or
            absent."                      �"Denotes whether or not this tunnel corresponds to an
            interface represented in the interfaces group
            table. Note that if this variable is set to true
            then the ifName of the interface corresponding to
            this tunnel should have a value equal to
            zxr10MplsTunnelName. Also see the description of ifName
            in RFC 2863. This object is meaningful only at the
            ingress and egress LSRs."                      U"If zxr10MplsTunnelIsIf is set to true, then this value
            contains the LSR-assigned ifIndex which corresponds
            to an entry in the interfaces table. Otherwise
            this variable should contain the value of zero
            indicating that a valid ifIndex was not assigned to
            his tunnel interface." a"RFC 2863 - The Interfaces Group MIB, McCloghrie, K.,
            and F. Kastenholtz, June 2000"                     "Type of tunnel interface."                       2"Ip address or loopback name of tunnel interface."                       ="Subnet mask or loopback interface index of tunnel interface"                       �"Denotes the entity that created and is responsible
             for managing this tunnel. This column isau
             tomatically filled by the agent on creation of a
             ow."                      7"This value signifies the role that this tunnel
             entry/instance represents. This value MUST be set
             to head(1) at the originating point of the tunnel.
             This value MUST be set to transit(2) at transit
             points along the tunnel, if transit points are
             supported. This value MUST be set to tail(3) at the
             terminating point of the tunnel if tunnel tails are
             supported.
             The value headTail(4) is provided for tunnels that
             begin and end on the same LSR."                       K"The signalling protocol, if any, used to setup this
             tunnel."                       ."Indicates the setup priority of this tunnel." �"1. RSVP-TE: Extensions to RSVP for LSP Tunnels,
             Awduche et al, RFC 3209, December 2001
             2. Constraint-Based LSP Setup using LDP, Jamoussi
             (Editor), RFC 3212, January 2002"                     1"Indicates the holding priority for this tunnel." �"1. RSVP-TE: Extensions to RSVP for LSP Tunnels,
             Awduche et al, RFC 3209, December 2001
             2. Constraint-Based LSP Setup using LDP, Jamoussi
             (Editor), RFC 3212, January 2002"                     Q"This bit mask indicates optional session values for
             this tunnel. " g"1. RSVP-TE: Extensions to RSVP for LSP Tunnels,
             Awduche et al, RFC 3209, December 2001."                     F"If this tunnel enables FRR,this value is true,otherwise it is false."                      u"This variable represents a pointer to the traffic
             parameter specification for this tunnel. This
             value may point at an entry in the
             zxr10MplsTunnelResourceEntry to indicate which
             zxr10MplsTunnelResourceEntry is to be assigned to this
             LSP instance. This value may optionally point at
             an externally defined traffic parameter
             specification table. A value of zeroDotZero
             indicates best-effort treatment. By having the
             same value of this object, two or more LSPs can
             indicate resource sharing."                      $"Specifies the instance index of the primary instance
             of this tunnel. More details of the definition of
             tunnel instances and the primary tunnel instance
             can be found in the description of the TEXTUAL-CONVENTION
             MplsTunnelInstanceIndex."                      �"This value indicates which priority, in descending
             order, with 0 indicating the lowest priority,
             within a group of tunnel instances. A group of
             tunnel instances is defined as a set of LSPs with
             the same zxr10MplsTunnelIndex in this table, but with a
             different zxr10MplsTunnelInstance. Tunnel instance
             priorities are used to denote the priority at which
             a particular tunnel instance will supercede
             another. Instances of tunnels containing the same
             zxr10MplsTunnelInstancePriority will be used for load
             sharing."                       �"Index into the zxr10MplsTunnelHopTable entry that
             specifies the explicit route hops for this tunnel.
             This object is meaningful only at the head-end of
             the tunnel."                      "This value denotes the configured path that was
             chosen for this tunnel. This value reflects the
             secondary index into zxr10MplsTunnelHopTable. This path
             may not exactly match the one in
             zxr10MplsTunnelARHopTable due to the fact that some CSPF
             modification may have taken place. See
             zxr10MplsTunnelARHopTable for the actual path being
             taken by the tunnel. A value of zero denotes that
             no path is currently in use or available."                       �"Index into the zxr10MplsTunnelARHopTable entry that
             specifies the actual hops traversed by the tunnel.
             This is automatically updated by the agent when the
             actual hops becomes available."                      "Index into the zxr10MplsTunnelCHopTable entry that
             specifies the computed hops traversed by the
             tunnel. This is automatically updated by the agent
             when computed hops become available or when
             computed hops get modified."                       �"This value represents the aggregate up time for all
             instances of this tunnel, if available. If this
             value is unavailable, it MUST return a value of 0."                       k"This value identifies the total time that this
             tunnel instance's operStatus has been Up(1)."                       �"Specifies the total time the primary instance of
             this tunnel has been active. The primary instance
             of this tunnel is defined in
             zxr10MplsTunnelPrimaryInstance."                       c"Specifies the number of times the actual path for
             this tunnel instance has changed."                       e"Specifies the time since the last change to the
             actual path for this tunnel instance."                       �"Specifies the value of SysUpTime when the first
             instance of this tunnel came into existence.
             That is, when the value of zxr10MplsTunnelOperStatus
             was first set to up(1)."                       �"Specifies the number of times the state
             (zxr10MplsTunnelOperStatus) of this tunnel instance has
             changed."                       H"Indicates the desired operational status of this
             tunnel."                       �"Indicates the actual operational status of this
             tunnel, which is typically but not limited to, a
             function of the state of individual segments of
             this tunnel."                      S"This variable is used to create, modify, and/or
             delete a row in this table. When a row in this
             table is in active(1) state, no objects in that row
             can be modified by the agent except
             zxr10MplsTunnelAdminStatus, zxr10MplsTunnelRowStatus and
             zxr10MplsTunnelStorageType."                       �"The storage type for this tunnel entry.
             Conceptual rows having the value 'permanent'
             need not allow write-access to any columnar
             objects in the row."                       8"If this object is true, then it enables the Autoroute."                       7"Indicates the autoroute metric type over this tunnel."                       H"Indicates the value that adjust metric for autoroutes relative to IGP."                       6"Indicates the value for all autoroutes over tunnel. "                       9"If this object is true, then it enables the RecordRoute"                       "CAC switch status"                      �"The number of octets that have been forwarded
                 over current LSP active path. The number reported
                 is not realtime, may subject to several minutes
                 delay.  The delay is controllable by mpls statistics
                 gathering interval, which by default is once every
                 5 minutes.  If mpls statistics gathering is not
                 enabled, this number will not increment."                      �"The number of packets that have been forwarded
                 over current LSP active path. The number reported
                 is not realtime, may subject to several minutes
                 delay.  The delay is controllable by mpls statistics
                 gathering interval, which by default is once every
                 5 minutes.  If mpls statistics gathering is not
                 enabled, this number will not increment."                       d"The time in 10-millisecond units since the last
                 transition occurred on this LSP."                       ."The number of paths configured for this LSP."                       �"The type of path that is active, i.e., a
                 primary path, a standby path, or a generic
                 secondary path. This field is meaningless
             unless mplsPathName is not empty"                       "The explicit route used to set up this LSP.
                 This may either be the route configured by
                 the user, or a route automatically computed
                 to satisfy constraints set by the user.
             This field is a displayable string in the
             format of XXX.XXX.XXX.XXX <space> S/L <newline>
             repeated for each explicit address. The S/L character
             stands for Strict/Loose route.
             This field is meaningless unless mplsPathName
             is not empty"                      I"The route actually used for this path, as
                 recorded by the signaling protocol.
             This field is a displayable string in the
             format of XXX.XXX.XXX.XXX <space>
             repeated for each address.
             This field is meaningless unless mplsPathName is
             not empty"                      �"The configured Class Of Service on this path.  If
                 the value is between 0 and 7 inclusive, this value
                 will be inserted in the 3 bit COS field in the
                 label.  If the value is 255, the value in the COS
                 field of the label will depend on other factors.
             This field is meaningless unless mplsPathName is not empty"                      �"This is a configured set of colors (administrative
                groups) specified as a bit vector (i.e., bit n is 1
                if color n is in the set, where n = 0 is the LSB).
                For each link that this path goes through, the
                link MUST have colors associated with it, and
                the intersection of the link's colors and the
                'include' set MUST be non-null. This field is meaningless
                unless mplsPathName is not empty"                      �"This is a configured set of colors (administrative
                groups) specified as a bit vector (i.e., bit n is 1
                if color n is in the set, where n = 0 is the LSB).
                For each link that this path goes through, the
                link MUST have colors associated with it, and
                the intersection of the link's colors and the
                'exclude' set MUST be null. This field is meaningless
                unless mplsPathName is not empty"                       5"If this object is true, then it enables hotstandby."                       ,"Specifies the pathOption of protected LSP."                       -"Specifies the pathOption of hotstandby LSP."                       <"Uniquely identifies the tunnel instance of hotstandby lsp."                       /"Specifies the hotstandby state of the tunnel."                       <"If this object is true, then it enables bfd on the tunnel."                       F"The detecting multiple of receive/send CONTROL
            message."                       +"The minimal time to send CONTROL message."                       ."The minimal time to receive CONTROL message."                       "The status of bfd."                      +"Indicates which protection method is used for fast
              reroute on this device.
              unknown(0)        indicates no FRR protection exists.
              facilityBackup(1) indicates bypass protection exists.
              oneToOneBackup(2) indicates detour protection exists. "                       ("Specifies the bandwidth of the tunnel."                       1"Specifies the sub pool bandwidth of the tunnel."                       3"The value of igp metric is used for build tunnel."                       2"The value of te metric is used for build tunnel."                       "The status of slave lsp bfd."                       /"The associate bidirect status of this tunnel."                           "The Mpls Remote Tunnel Table "                       :"An entry in this table represents an MPLS remote tunnel."                       g"Uniquely identifies a set of tunnel instances
            between a pair of ingress and egress LSRs."                      "Uniquely identifies a particular instance of a
                tunnel between a pair of ingress and egress LSRs.
                It is useful to identify multiple instances of
                tunnels for the purposes of backup and parallel
                tunnels. "                       U"Identity of the ingress LSR associated with this
                tunnel instance. "                       S"Identity of the egress LSR associated with this
                tunnel instance."                       "In label of Remote tunnel."                       "Out label of Remote tunnel."                       7"The name of in interface that remote tunnel transits."                       8"The name of out interface that remote tunnel transits."                      �"The canonical name assigned to the tunnel. This name
                can be used to refer to the tunnel on the LSR's
                console port. If zxr10MplsRemoteTunnelIsIf is set to true
                then the ifName of the interface corresponding to
                this tunnel should have a value equal to
                zxr10MplsRemoteTunnelName. Also see the description of ifName
                in RFC 2863."                      �"Denotes whether or not this tunnel corresponds to an
            interface represented in the interfaces group
            table. Note that if this variable is set to true
            then the ifName of the interface corresponding to
            this tunnel should have a value equal to
            zxr10MplsRemoteTunnelName. Also see the description of ifName
            in RFC 2863. This object is meaningful only at the
            ingress and egress LSRs."                       �"Denotes the entity that created and is responsible
             for managing this tunnel. This column isau
             tomatically filled by the agent on creation of a
             ow."                      7"This value signifies the role that this tunnel
             entry/instance represents. This value MUST be set
             to head(1) at the originating point of the tunnel.
             This value MUST be set to transit(2) at transit
             points along the tunnel, if transit points are
             supported. This value MUST be set to tail(3) at the
             terminating point of the tunnel if tunnel tails are
             supported.
             The value headTail(4) is provided for tunnels that
             begin and end on the same LSR."                       K"The signalling protocol, if any, used to setup this
             tunnel."                       ."Indicates the setup priority of this tunnel."                       1"Indicates the holding priority for this tunnel."                       Q"This bit mask indicates optional session values for
             this tunnel. "                       �"Indicates that the local repair mechanism is in use
             to maintain this tunnel (usually in the face of an
             outage of the link it was previously routed over)."                      $"Specifies the instance index of the primary instance
             of this tunnel. More details of the definition of
             tunnel instances and the primary tunnel instance
             can be found in the description of the TEXTUAL-CONVENTION
             MplsTunnelInstanceIndex."                      �"This value indicates which priority, in descending
             order, with 0 indicating the lowest priority,
             within a group of tunnel instances. A group of
             tunnel instances is defined as a set of LSPs with
             the same zxr10MplsRemoteTunnelIndex in this table, but with a
             different zxr10MplsRemoteTunnelInstance. Tunnel instance
             priorities are used to denote the priority at which
             a particular tunnel instance will supercede
             another. Instances of tunnels containing the same
             zxr10MplsRemoteTunnelInstancePriority will be used for load
             sharing."                       �"This value represents the aggregate up time for all
             instances of this tunnel, if available. If this
             value is unavailable, it MUST return a value of 0."                       k"This value identifies the total time that this
             tunnel instance's operStatus has been Up(1)."                       �"Specifies the total time the primary instance of
             this tunnel has been active. The primary instance
             of this tunnel is defined in
             zxr10MplsRemoteTunnelPrimaryInstance."                       �"Specifies the value of SysUpTime when the first
             instance of this tunnel came into existence.
             That is, when the value of zxr10MplsRemoteTunnelOperStatus
             was first set to up(1)."                       H"Indicates the desired operational status of this
             tunnel."                       �"Indicates the actual operational status of this
             tunnel, which is typically but not limited to, a
             function of the state of individual segments of
             this tunnel."                      e"This variable is used to create, modify, and/or
             delete a row in this table. When a row in this
             table is in active(1) state, no objects in that row
             can be modified by the agent except
             zxr10MplsRemoteTunnelAdminStatus, zxr10MplsRemoteTunnelRowStatus and
             zxr10MplsRemoteTunnelStorageType."                       �"The storage type for this tunnel entry.
             Conceptual rows having the value 'permanen'
             need not allow write-access to any columnar
             objects in the row."                       "The explicit route used to set up this LSP.
                 This may either be the route configured by
                 the user, or a route automatically computed
                 to satisfy constraints set by the user.
             This field is a displayable string in the
             format of XXX.XXX.XXX.XXX <space> S/L <newline>
             repeated for each explicit address. The S/L character
             stands for Strict/Loose route.
             This field is meaningless unless mplsPathName
             is not empty"                      I"The route actually used for this path, as
                 recorded by the signaling protocol.
             This field is a displayable string in the
             format of XXX.XXX.XXX.XXX <space>
             repeated for each address.
             This field is meaningless unless mplsPathName is
             not empty"                      +"Indicates which protection method is used for fast
              reroute on this device.
              unknown(0)        indicates no FRR protection exists.
              facilityBackup(1) indicates bypass protection exists.
              oneToOneBackup(2) indicates detour protection exists. "                       �"Index into the zxr10MplsTunnelARHopTable entry that
             specifies the actual hops traversed by the remote tunnel.
             This is automatically updated by the agent when the
             actual hops becomes available. "                      �"The number of octets that have been forwarded
              over current LSP active path. The number reported
              is not realtime, may subject to several minutes
              delay.  The delay is controllable by mpls statistics
              gathering interval, which by default is once every
              5 minutes.  If mpls statistics gathering is not
              enabled, this number will not increment."                      �"The number of packets that have been forwarded
              over current LSP active path. The number reported
              is not realtime, may subject to several minutes
              delay.  The delay is controllable by mpls statistics
              gathering interval, which by default is once every
              5 minutes.  If mpls statistics gathering is not
              enabled, this number will not increment."                          "The zxr10MplsTunnelHopTable is used to indicate the hops,
             strict or loose, for an instance of an MPLS tunnel
             defined in zxr10MplsTunnelTable, when it is established
             via signalling, for the outgoing direction of the
             tunnel."                       �"An entry in this table represents a tunnel hop. An
             entry is created by a network administrator for
             signaled ERLSP set up by an MPLS signalling
             protocol."                       ^"Primary index into this table identifying a
              particular explicit route object."                       �"Secondary index into this table identifying a
              particular group of hops representing a particular
              configured path. This is otherwise known as a path
              option."                       M"Tertiary index into this table identifying a
              particular hop."                       *"The Hop Address Type of this tunnel hop."                       -"The Tunnel Hop Address for this tunnel hop."                      %"If zxr10MplsTunnelHopAddrType is set to ipv4(1) or
              ipv6(2), then this value will contain an
              appropriate prefix length for the IP address in
              object zxr10MplsTunnelHopIpAddr. Otherwise this value
              is irrelevant and should be ignored. "                       �"If zxr10MplsTunnelHopAddrType is set to asnumber(3), then
              this value will contain the AS number of this hop.
              Otherwise the agent should set this object to zerolength
              string and the manager should ignore this."                      �"If zxr10MplsTunnelHopAddrType is set to unnum(4), then
              this value will contain the interface identifier of
              the unnumbered interface for this hop. This object
              should be used in conjunction with
              zxr10MplsTunnelHopIpAddress which would contain the LSR
              Router ID in this case. Otherwise the agent should
              set this object to zero-length string and the
              manager should ignore this."                      u"If zxr10MplsTunnelHopAddrType is set to lspid(5), then
              this value will contain the LSPID of a tunnel of
              this hop. The present tunnel being configured is
              tunneled through this hop (using label stacking).
              This object is otherwise insignificant and should
              contain a value of 0 to indicate this fact."                       �"Denotes whether this tunnel hop is routed in a
              strict or loose fashion. The value of this object
              has no meaning if the zxr10MplsTunnelHopInclude object
              is set to 'false'."                       "If this value is set to true, then this indicates
              that this hop must be included in the tunnel's
              path. If this value is set to 'false', then this hoph
              must be avoided when calculating the path for this
              tunnel. The default value of this object is 'true',
              so that by default all indicated hops are included
              in the CSPF path computation. If this object is set
              to 'false' the value of zxr10MplsTunnelHopType should be
              ignored."                       �"The description of this series of hops as they
              relate to the specified path option. The
              value of this object SHOULD be the same for
              each hop in the series that comprises a
              path option."                      �"If this value is set to dynamic, then the user
              should only specify the source and destination of
              the path and expect that the CSPF will calculate
              the remainder of the path. If this value is set to
              explicit, the user should specify the entire path
              for the tunnel to take. This path may contain
              strict or loose hops. Each hop along a specific
              path SHOULD have this object set to the same value."                      B"This variable is used to create, modify, and/or
              delete a row in this table. When a row in this
              table is in active(1) state, no objects in that row
              can be modified by the agent except
              zxr10MplsTunnelHopRowStatus and
              zxr10MplsTunnelHopStorageType."                       �"The storage type for this Hop entry. Conceptual
              rows having the value 'permanent' need not
              allow write-access to any columnar objects
              in the row."                          /"The zxr10MplsTunnelResourceTable allows a manager to
              specify which resources are desired for an MPLS
              tunnel. This table also allows several tunnels to
              point to a single entry in this table, implying
              that these tunnels should share resources."                      �"An entry in this table represents a set of resources
              for an MPLS tunnel. An entry can be created by a
              network administrator or by an SNMP agent as
              instructed by any MPLS signalling protocol.
              An entry in this table referenced by a tunnel instance

              with zero zxr10MplsTunnelInstance value indicates a
              configured set of resource parameter. An entry
              referenced by a tunnel instance with a non-zero
              zxr10MplsTunnelInstance reflects the in-use resource
              parameters for the tunnel instance which may have
              been negotiated or modified by the MPLS signaling
              protocols."                       "Uniquely identifies this row."                       �"The maximum rate in bits/second. Note that setting
              zxr10MplsTunnelResourceMaxRate,
              zxr10MplsTunnelResourceMeanRate, and
              zxr10MplsTunnelResourceMaxBurstSize to 0 indicates besteffort
              treatment."                       �"This object is copied into an instance of
              mplsTrafficParamMeanRate in the
              mplsTrafficParamTable. The OID of this table entry
              is then copied into the corresponding
              mplsInSegmentTrafficParamPtr."                       ""The maximum burst size in bytes."                       �"The mean burst size in bytes. The implementations
              which do not implement this variable must return
              noSuchObject exception for this object and must
              not allow a user to set this object."                      L"This variable is used to create, modify, and/or
              delete a row in this table. When a row in this
              table is in active(1) state, no objects in that row
              can be modified by the agent except
              zxr10MplsTunnelResourceRowStatus and
              zxr10MplsTunnelResourceStorageType."                      ."The storage type for this Hop entry. Conceptual
              rows having the value 'permanent' need not
              allow write-access to any columnar objects
              Srinivasan, et al. Standards Track [Page 38]
              RFC 3812 MPLS-TE-STD-MIB June 2004
              in the row."                          �"The zxr10MplsTunnelCHopTable is used to indicate the
              hops, strict or loose, for an MPLS tunnel defined
              in zxr10MplsTunnelTable, as computed by a constraintbased
              routing protocol, based on the
              zxr10MplsTunnelHopTable for the outgoing direction of
              the tunnel. Thus at a transit LSR, this table (if
              the table is supported) MAY contain the path
              computed by the CSPF engine on (or on behalf of)
              this LSR. Each row in this table is indexed by
              zxr10MplsTunnelCHopListIndex. Each row also has a
              secondary index zxr10MplsTunnelCHopIndex, corresponding
              to the next hop that this row corresponds to. In
              case we want to specify a particular interface on
              the originating LSR of an outgoing tunnel by which
              we want packets to exit the LSR, we specify this as
              the first hop for this tunnel in
              zxr10MplsTunnelCHopTable.
              lease note that since the information necessary to
              build entries within this table may not be
              supported by some LSRs, implementation of this
              table is optional. Furthermore, since the
              information in this table describes the path
              computed by the CSPF engine the entries in this
              table are read-only."                      O"An entry in this table represents a tunnel hop. An
              entry in this table is created by a path
              computation engine using CSPF techniques applied to
              he information collected by routing protocols and
              the hops specified in the corresponding
              zxr10MplsTunnelHopTable."                       Z"Primary index into this table identifying a
              particular computed hop list."                       P"Secondary index into this table identifying the
              particular hop."                       �"The Hop Address Type of this tunnel hop.
              Note that lspid(5) is a valid option only
              for tunnels signaled via CRLDP."                      �"The Tunnel Hop Address for this tunnel hop.
                 The type of this address is determined by the
                value of the corresponding zxr10MplsTunnelCHopAddrType.
                If zxr10MplsTunnelCHopAddrType is set to unnum(4), then
                this value will contain the LSR Router ID of the
                unnumbered interface. Otherwise the agent should
                set this object to the zero-length string and the
                manager SHOULD ignore this object."                     -- IPv4 address 0.0.0.0
6"If zxr10MplsTunnelCHopAddrType is set to ipv4(1) or
              ipv6(2), then this value will contain an
              appropriate prefix length for the IP address in
              object zxr10MplsTunnelCHopIpAddr. Otherwise this value
              is irrelevant and should be ignored.
              "                      "If zxr10MplsTunnelCHopAddrType is set to asnumber(3),
              then this value will contain the AS number of this
              hop. Otherwise the agent should set this object to
              zero-length string and the manager should ignore
              this."                      �"If zxr10MplsTunnelCHopAddrType is set to unnum(4), then
              this value will contain the unnumbered interface
              identifier of this hop. This object should be used
              in conjunction with zxr10MplsTunnelCHopIpAddr which
              would contain the LSR Router ID in this case.
              Otherwise the agent should set this object to zerolength
              string and the manager should ignore this."                       �"If zxr10MplsTunnelCHopAddrType is set to lspid(5), then
              his value will contain the LSP ID of this hop.
              his object is otherwise insignificant and should
              contain a value of 0 to indicate this fact."                       ["Denotes whether this is tunnel hop is routed in a
              strict or loose fashion."                          �"The zxr10MplsTunnelARHopTable is used to indicate the
              hops for an MPLS tunnel defined in zxr10MplsTunnelTable,
              as reported by the MPLS signalling protocol. Thus at
              a transit LSR, this table (if the table is supported
              and if the signaling protocol is recording actual
              route information) contains the actual route of the
              whole tunnel. If the signaling protocol is not
              recording the actual route, this table MAY report
              the information from the zxr10MplsTunnelHopTable or the
              zxr10MplsTunnelCHopTable.
              Each row in this table is indexed by
              zxr10MplsTunnelARHopListIndex. Each row also has a
              secondary index zxr10MplsTunnelARHopIndex, corresponding
              to the next hop that this row corresponds to.
              Please note that since the information necessary to
              build entries within this table is not provided by
              some MPLS signalling protocols, implementation of
              this table is optional. Furthermore, since the
              information in this table is actually provided by
              the MPLS signalling protocol after the path has
              been set-up, the entries in this table are provided
              only for observation, and hence, all variables in
              this table are accessible exclusively as readonly.
              Note also that the contents of this table may change
              while it is being read because of re-routing
              activities. A network administrator may verify that
              the actual route read is consistent by reference to
              the zxr10MplsTunnelLastPathChange object."                       �"An entry in this table represents a tunnel hop. An
              entry is created by the agent for signaled ERLSP
              set up by an MPLS signalling protocol."                       Z"Primary index into this table identifying a
              particular recorded hop list."                       P"Secondary index into this table identifying the
              particular hop."                       �"The Hop Address Type of this tunnel hop.
              ote that lspid(5) is a valid option only
              for tunnels signaled via CRLDP."                      �"The Tunnel Hop Address for this tunnel hop.
              The type of this address is determined by the
              value of the corresponding zxr10MplsTunnelARHopAddrType.
              If zxr10MplsTunnelARHopAddrType is set to unnum(4),
              then this value contains the LSR Router ID of the
              unnumbered interface. Otherwise the agent SHOULD
              set this object to the zero-length string and the
              manager should ignore this object."                     -- IPv4 address 0.0.0.0
�"If zxr10MplsTunnelARHopAddrType is set to unnum(4), then
              this value will contain the interface identifier of
              the unnumbered interface for this hop. This object
              should be used in conjunction with
              zxr10MplsTunnelARHopIpAddr which would contain the LSR
              Router ID in this case. Otherwise the agent should
              set this object to zero-length string and the
              manager should ignore this."                       �"If zxr10MplsTunnelARHopAddrType is set to lspid(5), then
              this value will contain the LSP ID of this hop.
              This object is otherwise insignificant and should
              contain a value of 0 to indicate this fact."                           /"A list of mpls traffic-eng interface entries."                       1"An entry containing mpls traffic-eng interface."                       X"A unique value, greater than zero, for each interface whitch enables mpls traffic-eng."                       "The name of this interface."                       #"The ip address of this interface."                       $"The subnet mask of this interface."                       I"If this interface enables bfd,this value is true,otherwise it is false."                       h"If this interface enables RSVP cryptographic authentication, this value is true,otherwise it is false."                       q"If this interface as a receiver enables rsvp authentication challenge,this value is true,otherwise it is false."                       o"If this interface as a sender enables rsvp authentication challenge,this value is true,otherwise it is false."                       O"Specifies maximum lifetime of neighbor authentication state on this interface"                       >"Specifies shared secret for all neighbors on this interface."                       C"Specifies the type of authentication algorithm on this interface."                       N"Specifies received window size for authenticated messages on this interface."                       9"Specifies reservable total bandwidth on this interface."                       2"Specifies available bandwidth on this interface."                       )"The config metric of mpls te interface."                       \"If this object is true, then it prefers NODE_PROTECT to LINK_PROTECT by autobackup tunnel."                       R"If this object is true, then it only requires LINK_PROTECT by autobackup tunnel."                       $"Specifies srlgs on this interface."                       ."Specifies attribute flags on this interface."                          "Explicit-path table is user configured,the user should specify the
                entire path for the tunnel to take. This path may contain strict or
                loose hops. Each hop along a specific path SHOULD have this object
                set to the same value"                       "Explicit-path table entry."                       %"First index of Explicit-path table."                       �"Secondary index of Explicit-path table.If the explicit name type is
                explicitId then this value is a number, or it is a string."                       \"router type string list 1:strict  2:loose  3:exclude intf  4:exclude router-id eg. 1.4.3.2"                       �"Identify the next hop IP address,This field is a displayable string in the
             format of 'XXX.XXX.XXX.XXX,'repeated.Example:1.1.1.1,1.1.1.2,... ..."                       N"ip addr index,This field is a displayable string in the format of '1,2,...'."                           "Path option Table."                       "Path option Table entry. "                       9"The index of path option whitch equals to tunnel index."                       H"Secondary index whitch identifies the configure value of path option ."                      �"If this value is dynamic ,indicates that user only specify the source and destination of
              the path and the CSPF will calculate the remainder of the path. If this value is
              explicitId or explicitName, the user specify the entire path for the tunnel . This path may contain
              strict or loose hops. Each hop along a specific path SHOULD have this object set to the same value."                       �"This value identifier the name of the path-option,when the type of the path-option is explicitName,the other times the value is null."                       ;"Specifies the hotstandby protect type of the path_option."                      "The name of Backup path.If the type of hotstandby protection is dynamic,then this value is '1';
                if the type is dynamic prefer,then this value is '2';
                if the type is explicitId or explicitName,then this value is a number or a string."                           �"List of configured administrative groups.
         Administrative groups are used to label links in
         the Traffic Engineering topology in order to place
         constraints (include and exclude) on LSP paths."                       �"A mapping between a configured group number and its
         human-readable name.  The group number should be
         between 0 and 31, inclusive."                       $"Index of the administrative group."                       #"Name of the administrative group."                           ""                       ""                      6"Uniquely identifies a set of tunnel instances
            between a pair of ingress and egress LSRs.
            Managers should obtain new values for row
            creation in this table by reading
            zxr10MplsTunnelIndexNext. When
            the MPLS signalling protocol is rsvp(2) this value
            SHOULD be equal to the value signaled in the
            Tunnel Id of the Session object. When the MPLS
            signalling protocol is crldp(3) this value
            SHOULD be equal to the value signaled in the
            LSP ID."                      "Uniquely identifies a particular instance of a
                tunnel between a pair of ingress and egress LSRs.
                It is useful to identify multiple instances of
                tunnels for the purposes of backup and parallel
                tunnels. When the MPLS signaling protocol is
                rsvp(2) this value SHOULD be equal to the LSP Id
                of the Sender Template object. When the signaling
                protocol is crldp(3) there is no equivalent
                signaling object."                      �"Identity of the ingress LSR associated with this
            tunnel instance. When the MPLS signalling protocol
            is rsvp(2) this value SHOULD be equal to the Tunnel
            Sender Address in the Sender Template object and MAY
            be equal to the Extended Tunnel Id field in the
            SESSION object. When the MPLS signalling protocol is
            rldp(3) this value SHOULD be equal to the Ingress
            LSR Router ID field in the LSPID TLV object."                       S"Identity of the egress LSR associated with this
                tunnel instance."                       !"Out label of hotstandby tunnel."                       <"The name of out interface that hotstandby tunnel transits."                      7"This value signifies the role that this tunnel
             entry/instance represents. This value MUST be set
             to head(1) at the originating point of the tunnel.
             This value MUST be set to transit(2) at transit
             points along the tunnel, if transit points are
             supported. This value MUST be set to tail(3) at the
             terminating point of the tunnel if tunnel tails are
             supported.
             The value headTail(4) is provided for tunnels that
             begin and end on the same LSR."                       Q"This bit mask indicates optional session values for
             this tunnel. "                      u"This variable represents a pointer to the traffic
             parameter specification for this tunnel. This
             value may point at an entry in the
             zxr10MplsTunnelResourceEntry to indicate which
             zxr10MplsTunnelResourceEntry is to be assigned to this
             LSP instance. This value may optionally point at
             an externally defined traffic parameter
             specification table. A value of zeroDotZero
             indicates best-effort treatment. By having the
             same value of this object, two or more LSPs can
             indicate resource sharing."                      �"This value indicates which priority, in descending
             order, with 0 indicating the lowest priority,
             within a group of tunnel instances. A group of
             tunnel instances is defined as a set of LSPs with
             the same zxr10MplsTunnelIndex in this table, but with a
             different zxr10MplsTunnelInstance. Tunnel instance
             priorities are used to denote the priority at which
             a particular tunnel instance will supercede
             another. Instances of tunnels containing the same
             zxr10MplsTunnelInstancePriority will be used for load
             sharing."                       �"Index into the zxr10MplsTunnelHopTable entry that
             specifies the explicit route hops for this tunnel.
             This object is meaningful only at the head-end of
             the tunnel."                      "This value denotes the configured path that was
             chosen for this tunnel. This value reflects the
             secondary index into zxr10MplsTunnelHopTable. This path
             may not exactly match the one in
             zxr10MplsTunnelARHopTable due to the fact that some CSPF
             modification may have taken place. See
             zxr10MplsTunnelARHopTable for the actual path being
             taken by the tunnel. A value of zero denotes that
             no path is currently in use or available."                       �"Index into the zxr10MplsTunnelARHopTable entry that
             specifies the actual hops traversed by the tunnel.
             This is automatically updated by the agent when the
             actual hops becomes available."                      "Index into the zxr10MplsTunnelCHopTable entry that
             specifies the computed hops traversed by the
             tunnel. This is automatically updated by the agent
             when computed hops become available or when
             computed hops get modified."                       k"This value identifies the total time that this
             tunnel instance's operStatus has been Up(1)."                       �"Indicates the actual operational status of this
             tunnel, which is typically but not limited to, a
             function of the state of individual segments of
             this tunnel."                      S"This variable is used to create, modify, and/or
             delete a row in this table. When a row in this
             table is in active(1) state, no objects in that row
             can be modified by the agent except
             zxr10MplsTunnelAdminStatus, zxr10MplsTunnelRowStatus and
             zxr10MplsTunnelStorageType."                              