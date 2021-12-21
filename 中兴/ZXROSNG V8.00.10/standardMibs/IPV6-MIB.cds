 �-- file: IPV6-MIB.my
-- Extracted from RFC2465 by MG-SOFT Corp.
-- Changes:
--      No changes needed.
-- http://www.mg-soft.com/
                                                                                                                             N"The MIB module for entities implementing the IPv6
                protocol."n"           Dimitry Haskin

                   Postal: Bay Networks, Inc.
                           660 Techology Park Drive.
                           Billerica, MA  01821
                           US

                      Tel: +1-978-916-8124
                   E-mail: dhaskin@baynetworks.com

                           Steve Onishi

                   Postal: Bay Networks, Inc.
                           3 Federal Street
                           Billerica, MA 01821
                           US

                      Tel: +1-978-916-3816
                   E-mail: sonishi@baynetworks.com"                  �"The indication of whether this entity is acting
                as an IPv6 router in respect to the forwarding of
                datagrams received by, but not addressed to, this
                entity.  IPv6 routers forward datagrams.  IPv6
                hosts do not (except those source-routed via the
                host).

                Note that for some managed nodes, this object may
                take on only a subset of the values possible.
                Accordingly, it is appropriate for an agent to
                return a `wrongValue' response if a management
                station attempts to change this object to an
                inappropriate value."                       �"The default value inserted into the Hop Limit
                field of the IPv6 header of datagrams originated
                at this entity, whenever a Hop Limit value is not
                supplied by the transport layer protocol."                       l"The number of IPv6 interfaces (regardless of
                their current state) present on this system."                      U"The value of sysUpTime at the time of the last
               insertion or removal of an entry in the
               ipv6IfTable. If the number of entries has been
               unchanged since the last re-initialization of
               the local network management subsystem, then this
               object contains a zero value."                      b"The IPv6 Interfaces table contains information
               on the entity's internetwork-layer interfaces.
               An IPv6 interface constitutes a logical network
               layer attachment to the layer immediately below
               IPv6 including internet layer 'tunnels', such as
               tunnels over IPv4 or IPv6 itself."                       ["An interface entry containing objects
                about a particular IPv6 interface."                       U"A unique non-zero value identifying
                the particular IPv6 interface."                       �"A textual string containing information about the
               interface.  This string may be set by the network
               management system."                      3"This object identifies the protocol layer over
               which this network interface operates.  If this
               network interface operates over the data-link
               layer, then the value of this object refers to an
               instance of ifIndex [6]. If this network interface
               operates over an IPv4 interface, the value of this
               object refers to an instance of ipAdEntAddr [3].

               If this network interface operates over another
               IPv6 interface, the value of this object refers to
               an instance of ipv6IfIndex.  If this network
               interface is not currently operating over an active
               protocol layer, then the value of this object
               should be set to the OBJECT ID { 0 0 }."                       �"The size of the largest IPv6 packet which can be
              sent/received on the interface, specified in
              octets."                       �"The size of the largest IPv6 datagram which this
              entity can re-assemble from incoming IPv6 fragmented
              datagrams received on this interface."                      �"The Interface Identifier for this interface that
                is (at least) unique on the link this interface is
                attached to. The Interface Identifier is combined
                with an address prefix to form an interface address.

                By default, the Interface Identifier is autoconfigured
                according to the rules of the link type this
                interface is attached to."                       1"The length of the Interface Identifier in bits."                      "The interface's physical address. For example, for
               an IPv6 interface attached to an 802.x link, this
               object normally contains a MAC address. Note that
               in some cases this address may differ from the
               address of the interface's protocol sub-layer.  The
               interface's media-specific MIB must define the bit
               and byte ordering and the format of the value of
               this object. For interfaces which do not have such
               an address (e.g., a serial line), this object should
               contain an octet string of zero length."                      �"The desired state of the interface.  When a managed
              system initializes,  all IPv6 interfaces start with
              ipv6IfAdminStatus in the down(2) state.  As a result
              of either explicit management action or per
              configuration information retained by the managed
              system,  ipv6IfAdminStatus is then changed to
              the up(1) state (or remains in the down(2) state)."                      �"The current operational state of the interface.
              The noIfIdentifier(3) state indicates that no valid
              Interface Identifier is assigned to the interface.
              This state usually indicates that the link-local
              interface address failed Duplicate Address Detection.
              If ipv6IfAdminStatus is down(2) then ipv6IfOperStatus
              should be down(2).  If ipv6IfAdminStatus is changed
              to up(1) then ipv6IfOperStatus should change to up(1)
              if the interface is ready to transmit and receive
              network traffic; it should remain in the down(2) or
              noIfIdentifier(3) state if and only if there is a
              fault that prevents it from going to the up(1) state;
              it should remain in the notPresent(5) state if
              the interface has missing (typically, lower layer)
              components."                      G"The value of sysUpTime at the time the interface
                entered its current operational state.  If the
                current state was entered prior to the last
                re-initialization of the local network management
                subsystem, then this object contains a zero
                value."                       $"IPv6 interface traffic statistics."                       d"An interface statistics entry containing objects
                 at a particular IPv6 interface."                       t"The total number of input datagrams received by
                the interface, including those received in error."                      "The number of input datagrams discarded due to
                errors in their IPv6 headers, including version
                number mismatch, other format errors, hop count
                exceeded, errors discovered in processing their
                IPv6 options, etc."                       �"The number of input datagrams that could not be
               forwarded because their size exceeded the link MTU
               of outgoing interface."                       �"The number of input datagrams discarded because no
                 route could be found to transmit them to their
                 destination."                      i"The number of input datagrams discarded because
                the IPv6 address in their IPv6 header's destination
                field was not a valid address to be received at
                this entity.  This count includes invalid
                addresses (e.g., ::0) and unsupported addresses
                (e.g., addresses with unallocated prefixes).  For
                entities which are not IPv6 routers and therefore
                do not forward datagrams, this counter includes
                datagrams discarded because the destination address
                was not a local address."                      �"The number of locally-addressed datagrams
                received successfully but discarded because of an
                unknown or unsupported protocol. This counter is
                incremented at the interface to which these
                datagrams were addressed which might not be
                necessarily the input interface for some of
                the datagrams."                       l"The number of input datagrams discarded because
                 datagram frame didn't carry enough data."                      _"The number of input IPv6 datagrams for which no
                problems were encountered to prevent their
                continued processing, but which were discarded
                (e.g., for lack of buffer space).  Note that this
                counter does not include any datagrams discarded
                while awaiting re-assembly."                      M"The total number of datagrams successfully
              delivered to IPv6 user-protocols (including ICMP).
              This counter is incremented at the interface to
              which these datagrams were addressed which might
              not be necessarily the input interface for some of
              the datagrams."                      "The number of output datagrams which this
                entity received and forwarded to their final
                destinations.  In entities which do not act
                as IPv6 routers, this counter will include
                only those packets which were Source-Routed
                via this entity, and the Source-Route
                processing was successful.  Note that for
                a successfully forwarded datagram the counter
                of the outgoing interface is incremented."                      "The total number of IPv6 datagrams which local IPv6
              user-protocols (including ICMP) supplied to IPv6 in
              requests for transmission.  Note that this counter
              does not include any datagrams counted in
              ipv6IfStatsOutForwDatagrams."                      �"The number of output IPv6 datagrams for which no
                 problem was encountered to prevent their
                 transmission to their destination, but which were
                 discarded (e.g., for lack of buffer space).  Note
                 that this counter would include datagrams counted
                 in ipv6IfStatsOutForwDatagrams if any such packets
                 met this (discretionary) discard criterion."                       q"The number of IPv6 datagrams that have been
                 successfully fragmented at this output interface."                       �"The number of IPv6 datagrams that have been
                 discarded because they needed to be fragmented
                 at this output interface but could not be."                       �"The number of output datagram fragments that have
                 been generated as a result of fragmentation at
                 this output interface."                      a"The number of IPv6 fragments received which needed
                 to be reassembled at this interface.  Note that this
                 counter is incremented at the interface to which
                 these fragments were addressed which might not
                 be necessarily the input interface for some of
                 the fragments."                      &"The number of IPv6 datagrams successfully
               reassembled.  Note that this counter is incremented
               at the interface to which these datagrams were
               addressed which might not be necessarily the input
               interface for some of the fragments."                      �"The number of failures detected by the IPv6 re-
                assembly algorithm (for whatever reason: timed
                out, errors, etc.).  Note that this is not
                necessarily a count of discarded IPv6 fragments
                since some algorithms (notably the algorithm in
                RFC 815) can lose track of the number of fragments
                by combining them as they are received.
                This counter is incremented at the interface to which
                these fragments were addressed which might not be
                necessarily the input interface for some of the
                fragments."                       M"The number of multicast packets received
                 by the interface"                       P"The number of multicast packets transmitted
                 by the interface"                       I"The list of IPv6 address prefixes of
                 IPv6 interfaces."                       ^"An interface entry containing objects of
                 a particular IPv6 address prefix."                       0"The prefix associated with the this interface."                       %"The length of the prefix (in bits)."                       �"This object has the value 'true(1)', if this
               prefix can be used  for on-link determination
               and the value 'false(2)' otherwise."                      P"Autonomous address configuration flag. When
               true(1), indicates that this prefix can be used
               for autonomous address configuration (i.e. can
               be used to form a local interface address).
               If false(2), it is not used to autoconfigure
               a local interface address."                      �"It is the length of time in seconds that this
                prefix will remain preferred, i.e. time until
                deprecation.  A value of 4,294,967,295 represents
                infinity.

                The address generated from a deprecated prefix
                should no longer be used as a source address in
                new communications, but packets received on such
                an interface are processed as expected."                      m"It is the length of time in seconds that this
               prefix will remain valid, i.e. time until
               invalidation.  A value of 4,294,967,295 represents
               infinity.

               The address generated from an invalidated prefix
               should not appear as the destination or source
               address of a packet."                       a"The table of addressing information relevant to
              this node's interface addresses."                       Y"The addressing information for one of this
                node's interface addresses."                       X"The IPv6 address to which this entry's addressing
              information pertains."                       c"The length of the prefix (in bits) associated with
              the IPv6 address of this entry."                      "The type of address. Note that 'stateless(1)'
               refers to an address that was statelessly
               autoconfigured; 'stateful(2)' refers to a address
               which was acquired by via a stateful protocol
               (e.g. DHCPv6, manual configuration)."                       �"This object has the value 'true(1)', if this
               address is an anycast address and the value
               'false(2)' otherwise."                      <"Address status.  The preferred(1) state indicates
              that this is a valid address that can appear as
              the destination or source address of a packet.
              The deprecated(2) state indicates that this is
              a valid but deprecated address that should no longer
              be used as a source address in new communications,
              but packets addressed to such an address are
              processed as expected. The invalid(3) state indicates
              that this is not valid address which should not
              appear as the destination or source address of
              a packet. The inaccessible(4) state indicates that
              the address is not accessible because the interface
              to which this address is assigned is not operational."                       �"The number of current ipv6RouteTable entries.
               This is primarily to avoid having to read
               the table in order to determine this number."                      "The number of routing entries which were chosen
                to be discarded even though they are valid.  One
                possible reason for discarding such an entry could
                be to free-up buffer space for other routing
                entries."                       �"IPv6 Routing table. This table contains
               an entry for each valid IPv6 unicast route
               that can be used for packet forwarding
               determination."                       "A routing entry."                       �"The destination IPv6 address of this route.
               This object may not take a Multicast address
               value."                       I"Indicates the prefix length of the destination
               address."                      _"The value which uniquely identifies the route
               among the routes to the same network layer
               destination.  The way this value is chosen is
               implementation specific but it must be unique for
               ipv6RouteDest/ipv6RoutePfxLength pair and remain
               constant for the life of the route."                      �"The index value which uniquely identifies the local
               interface through which the next hop of this
               route should be reached.  The interface identified
               by a particular value of this index is the same
               interface as identified by the same value of
               ipv6IfIndex.  For routes of the discard type this
               value can be zero."                       �"On remote routes, the address of the next
               system en route;  otherwise, ::0
               ('00000000000000000000000000000000'H in ASN.1
               string representation)."                      �"The type of route. Note that 'local(3)' refers
                to a route for which the next hop is the final
                destination; 'remote(4)' refers to a route for
                which  the  next  hop is not the final
                destination; 'discard(2)' refers to a route
                indicating that packets to destinations matching
                this route are to be discarded (sometimes called
                black-hole route)."                       I"The routing mechanism via which this route was
               learned."                      �"The general set of conditions that would cause the
              selection of one multipath route (set of next hops
              for a given destination) is referred to as 'policy'.
              Unless the mechanism indicated by ipv6RouteProtocol
              specified otherwise, the policy specifier is the
              8-bit Traffic Class field of the IPv6 packet header
              that is zero extended at the left to a 32-bit value.

              Protocols defining 'policy' otherwise must either
              define a set of values which are valid for
              this object or must implement an integer-
              instanced  policy table for which this object's
              value acts as an index."                      ("The number of seconds since this route was last
                updated or otherwise determined to be correct.
                Note that no semantics of `too old' can be implied
                except through knowledge of the routing protocol
                by which the route was learned."                      F"The Routing Domain ID of the Next Hop.
                The  semantics of this object are determined by
                the routing-protocol specified in  the  route's
                ipv6RouteProtocol value.   When  this object is
                unknown or not relevant its value should be set
                to zero."                      �"The routing metric for this route. The
                semantics of this metric are determined by the
                routing protocol specified in the route's
                ipv6RouteProtocol value.  When this is unknown
                or not relevant to the protocol indicated by
                ipv6RouteProtocol, the object value should be
                set to its maximum value (4,294,967,295)."                      R"The system internal weight value for this route.
                The semantics of this value are determined by
                the implementation specific rules. Generally,
                within routes with the same ipv6RoutePolicy value,
                the lower the weight value the more preferred is
                the route."                      _"A reference to MIB definitions specific to the
                particular routing protocol which is responsible
                for this route, as determined by the  value
                specified  in the route's ipv6RouteProto value.
                If this information is not present,  its  value
                should be set to the OBJECT ID { 0 0 },
                which is a syntactically valid object  identifier,
                and any implementation conforming to ASN.1
                and the Basic Encoding Rules must  be  able  to
                generate and recognize this value."                      ;"Setting this object to the value 'false(2)' has
                the effect of invalidating the corresponding entry
                in the ipv6RouteTable object.  That is, it
                effectively disassociates the destination
                identified with said entry from the route
                identified with said entry.  It is an
                implementation-specific matter as to whether the
                agent removes an invalidated entry from the table.
                Accordingly, management stations must be prepared
                to receive tabular information from agents that
                corresponds to entries not currently in use.
                Proper interpretation of such entries requires
                examination of the relevant ipv6RouteValid
                object."                       "The IPv6 Address Translation table used for
               mapping from IPv6 addresses to physical addresses.

               The IPv6 address translation table contain the
               Ipv6Address to `physical' address equivalencies.
               Some interfaces do not use translation tables
               for determining address equivalencies; if all
               interfaces are of this type, then the Address
               Translation table is empty, i.e., has zero
               entries."                       Y"Each entry contains one IPv6 address to `physical'
               address equivalence."                       \"The IPv6 Address corresponding to
                the media-dependent `physical' address."                       )"The media-dependent `physical' address."                      �"The type of the mapping. The 'dynamic(2)' type
                     indicates that the IPv6 address to physical
                     addresses mapping has been dynamically
                     resolved using the IPv6 Neighbor Discovery
                     protocol. The static(3)' types indicates that
                     the mapping has been statically configured.
                     The local(4) indicates that the mapping is
                     provided for an entity's own interface address."                       �"The Neighbor Unreachability Detection [8] state
                for the interface when the address mapping in
                this entry is used."                      "The value of sysUpTime at the time this entry
                was last updated.  If this entry was updated prior
                to the last re-initialization of the local network
                management subsystem, then this object contains
                a zero value."                      "Setting this object to the value 'false(2)' has
              the effect of invalidating the corresponding entry
              in the ipv6NetToMediaTable.  That is, it effectively
              disassociates the interface identified with said
              entry from the mapping identified with said entry.
              It is an implementation-specific matter as to
              whether the agent removes an invalidated entry
              from the table.  Accordingly, management stations
              must be prepared to receive tabular information
              from agents that corresponds to entries not
              currently in use.  Proper interpretation of such
              entries requires examination of the relevant
              ipv6NetToMediaValid object."                              ("An ipv6IfStateChange notification signifies
                that there has been a change in the state of
                an ipv6 interface.  This notification should
                be generated when the interface's operational
                status transitions to or from the up(1) state."                         W"The compliance statement for SNMPv2 entities which
              implement ipv6 MIB."   Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object" Z"An agent is not required to provide write
                        access to this object"                 _"The IPv6 group of objects providing for basic
                  management of IPv6 entities."                 S"The notification that an IPv6 entity is required
                  to implement."                        