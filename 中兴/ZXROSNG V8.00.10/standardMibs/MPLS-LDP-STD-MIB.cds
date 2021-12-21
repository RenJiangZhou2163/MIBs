                                                                                                  �"Copyright (C) The Internet Society (2004). The
             initial version of this MIB module was published
             in RFC 3815. For full legal notices see the RFC
             itself or see:
             http://www.ietf.org/copyrights/ianamib.html

             This MIB contains managed object definitions for the
             'Multiprotocol Label Switching, Label Distribution
             Protocol, LDP' document."�"Joan Cucchiara (jcucchiara@mindspring.com)
              Marconi Communications, Inc.

              Hans Sjostrand (hans@ipunplugged.com)
              ipUnplugged

              James V. Luciani (james_luciani@mindspring.com)
              Marconi Communications, Inc.

              Working Group Chairs:
              George Swallow,   email: swallow@cisco.com
              Loa Andersson,    email: loa@pi.se

              MPLS Working Group, email: mpls@uu.net" "200406030000Z" 0"Initial version published as part of RFC 3815."       -- June 3, 2004
          "This notification is generated when the value of
             the 'mplsLdpEntityInitSessionThreshold' object
             is not zero, and the number of Session
             Initialization messages exceeds the value
             of the 'mplsLdpEntityInitSessionThreshold' object."                 �"This notification is sent when the
             'mplsLdpEntityPathVectorLimit' does NOT match
             the value of the 'mplsLdpPeerPathVectorLimit' for
             a specific Entity." ,"RFC3036, LDP Specification, Section 3.5.3."               �"If this notification is sent when the
             value of 'mplsLdpSessionState' enters
             the 'operational(5)' state."                 �"This notification is sent when the
             value of 'mplsLdpSessionState' leaves
             the 'operational(5)' state."                         *"The Label Switching Router's Identifier."                      F"A indication of whether this
             Label Switching Router supports
             loop detection.

             none(1) -- Loop Detection is not supported
                        on this LSR.

             other(2) -- Loop Detection is supported but
                         by a method other than those
                         listed below.

             hopCount(3) -- Loop Detection is supported by
                            Hop Count only.

             pathVector(4) -- Loop Detection is supported by
                              Path Vector only.

             hopCountAndPathVector(5) -- Loop Detection is
                                  supported by both Hop Count
                                  And Path Vector.

             Since Loop Detection is determined during
             Session Initialization, an individual session
             may not be running with loop detection.  This
             object simply gives an indication of whether or not the
             LSR has the ability to support Loop Detection and
             which types."                          �"The value of sysUpTime at the time of the most
             recent addition or deletion of an entry
             to/from the mplsLdpEntityTable/mplsLdpEntityStatsTable, or
             the most recent change in value of any objects in the
             mplsLdpEntityTable.
             If no such changes have occurred since the last
             re-initialization of the local management subsystem,
             then this object contains a zero value."                       �"This object contains an appropriate value to
             be used for mplsLdpEntityIndex when creating
             entries in the mplsLdpEntityTable. The value
             0 indicates that no unassigned entries are
             available."                       �"This table contains information about the
             MPLS Label Distribution Protocol Entities which
             exist on this Label Switching Router (LSR)
             or Label Edge Router (LER)."                       �"An entry in this table represents an LDP entity.
              An entry can be created by a network administrator
              or by an SNMP agent as instructed by LDP."                       "The LDP identifier." 9"RFC3036, LDP Specification, Section on LDP Identifiers."                    d"This index is used as a secondary index to uniquely
             identify this row.  Before creating a row in this table,
             the 'mplsLdpEntityIndexNext' object should be retrieved.
             That value should be used for the value of this index
             when creating a row in this table.  NOTE:  if a value
             of zero (0) is retrieved, that indicates that no rows
             can be created in this table at this time.

             A secondary index (this object) is meaningful to some
             but not all, LDP implementations.  For example
             an LDP implementation which uses PPP would
             use this index to differentiate PPP sub-links.

             Another way to use this index is to give this the
             value of ifIndex.  However, this is dependant
             on the implementation."                      �"The version number of the LDP protocol which will be
            used in the session initialization message.

            Section 3.5.3 in the LDP Specification specifies
            that the version of the LDP protocol is negotiated during
            session establishment. The value of this object
            represents the value that is sent in the initialization
            message." P"RFC3036, LDP Specification, Section 3.5.3 Initialization
            Message."           --[ZXROSNG]read only
        �"The administrative status of this LDP Entity.
             If this object is changed from 'enable' to 'disable'
             and this entity has already attempted to establish
             contact with a Peer, then all contact with that
             Peer is lost and all information from that Peer
             needs to be removed from the MIB. (This implies
             that the network management subsystem should clean
             up any related entry in the mplsLdpPeerTable.  This
             further implies that a 'tear-down' for that session
             is issued and the session and all information related
             to that session cease to exist).

             At this point the operator is able to change values
             which are related to this entity.

             When the admin status is set back to 'enable', then
             this Entity will attempt to establish a new session
             with the Peer."             --[ZXROSNG]read only
        F"The operational status of this LDP Entity.
             
             The value of unknown(1) indicates that the
             operational status cannot be determined at
             this time.  The value of unknown should be
             a transient condition before changing
             to enabled(2) or disabled(3)."                       b"The TCP Port for
        LDP.  The default value is the well-known
        value of this port." v"RFC3036, LDP Specification, Section 3.10, Well-known
              Numbers, and Section 3.10.1.  UDP and TCP Ports."           --[ZXROSNG]read only
         w"The UDP Discovery Port for
             LDP.  The default value is the
             well-known value for this port." �"RFC3036, LDP Specification, Section 2.4.1,
             Basic Discovery Mechanism, Section 2.4.2,
             Extended Discovery Mechanism, Section
             3.10, Well-known Numbers, and Section 3.10.1.
             UDP and TCP Ports."           --[ZXROSNG]read only
        �"The maximum PDU Length that is sent in
            the Common Session Parameters of an Initialization
            Message. According to the LDP Specification [RFC3036]
            a value of 255 or less specifies the
            default maximum length of 4096 octets, this is why
            the value of this object starts at 256.  The operator
            should explicitly choose the default value (i.e., 4096),
            or some other value.

            The receiving LSR MUST calculate the maximum PDU
            length for the session by using the smaller of its and
            its peer's proposals for Max PDU Length." Q"RFC3036, LDP Specification, Section 3.5.3.
            Initialization Message."           --[ZXROSNG]read only
         i"The 16-bit integer value which is the proposed keep
             alive hold timer for this LDP Entity."             --[ZXROSNG]read only
        �"The 16-bit integer value which is the proposed Hello
             hold timer for this LDP Entity. The Hello Hold time
             in seconds.
             An LSR maintains a record of Hellos received
             from potential peers.  This object represents
             the Hold Time in the Common Hello Parameters TLV of
             the Hello Message.

             A value of 0 is a default value and should be
             interpretted in conjunction with the
             mplsLdpEntityTargetPeer object.

             If the value of this object is 0: if the value of the
             mplsLdpEntityTargetPeer object is false(2), then this
             specifies that the Hold Time's actual default value is
             15 seconds (i.e., the default Hold time for Link Hellos
             is 15 seconds).  Otherwise if the value of the
             mplsLdpEntityTargetPeer object is true(1), then this
             specifies that the Hold Time's actual default value is
             45 seconds (i.e., the default Hold time for Targeted
             Hellos is 45 seconds).

             A value of 65535 means infinite (i.e., wait forever).

             All other values represent the amount of time in
             seconds to wait for a Hello Message.  Setting the
             hold time to a value smaller than 15 is not
             recommended, although not forbidden according
             to RFC3036." J"RFC3036, LDP Specification, Section 3.5.2.,
             Hello Message."           --[ZXROSNG]read only
        �"When attempting to establish a session with
             a given Peer, the given LDP Entity should
             send out the SNMP notification,
             'mplsLdpInitSessionThresholdExceeded', when
             the number of Session Initialization messages
             sent exceeds this threshold.

             The notification is used to notify an
             operator when this Entity and its Peer are
             possibly engaged in an endless sequence
             of messages as each NAKs the other's
             Initialization messages with Error Notification
             messages.  Setting this threshold which triggers
             the notification is one way to notify the
             operator.  The notification should be generated
             each time this threshold is exceeded and
             for every subsequent Initialization message
             which is NAK'd with an Error Notification
             message after this threshold is exceeded.

             A value of 0 (zero) for this object
             indicates that the threshold is infinity, thus
             the SNMP notification will never be generated." Q"RFC3036, LDP Specification,
             Section 2.5.3 Session Initialization."           --[ZXROSNG]read only
         ^"For any given LDP session, the method of
             label distribution must be specified."             --[ZXROSNG]read only
        "The LDP Entity can be configured to use either
             conservative or liberal label retention mode.

             If the value of this object is conservative(1)
             then advertized label mappings are retained
             only if they will be used to forward packets,
             i.e., if label came from a valid next hop.

             If the value of this object is liberal(2)
             then all advertized label mappings are retained
             whether they are from a valid next hop or not."             --[ZXROSNG]read only
        ="If the value of this object is 0 (zero) then
             Loop Detection for Path Vectors is disabled.

             Otherwise, if this object has a value greater than
             zero, then Loop Dection for Path Vectors is enabled,
             and the Path Vector Limit is this value.
             Also, the value of the object,
             'mplsLdpLsrLoopDetectionCapable', must be set to
             either 'pathVector(4)' or 'hopCountAndPathVector(5)',
             if this object has a value greater than 0 (zero),
             otherwise it is ignored." c"RFC3036, LDP Specification, Section 2.8 Loop Dection,
            Section 3.4.5 Path Vector TLV."           --[ZXROSNG]read only
        �"If the value of this object is 0 (zero),
             then Loop Detection using Hop Counters is
             disabled.

             If the value of this object is greater than
             0 (zero) then Loop Detection using Hop
             Counters is enabled, and this object
             specifies this Entity's maximum allowable
             value for the Hop Count.
             Also, the value of the object
             mplsLdpLsrLoopDetectionCapable must be set
             to either 'hopCount(3)' or
             'hopCountAndPathVector(5)' if this object
             has a value greater than 0 (zero), otherwise
             it is ignored."             --[ZXROSNG]read only
        N"This specifies whether the loopback or interface
             address is to be used as the transport address
             in the transport address TLV of the
             hello message.

             If the value is interface(1), then the IP
             address of the interface from which hello
             messages are sent is used as the transport
             address in the hello message.

             Otherwise, if the value is loopback(2), then the IP
             address of the loopback interface is used as the
             transport address in the hello message."             --[ZXROSNG]read only
         L"If this LDP entity uses targeted peer then set
             this to true."             --[ZXROSNG]read only
         �"The type of the internetwork layer address used for
             the Extended Discovery.  This object indicates how
             the value of mplsLdpEntityTargetPeerAddr is to
             be interpreted."             --[ZXROSNG]read only
         �"The value of the internetwork layer address
             used for the Extended Discovery.  The value of
             mplsLdpEntityTargetPeerAddrType specifies how
             this address is to be interpreted."             --[ZXROSNG]read only
        �"Specifies the optional parameters for the LDP
             Initialization Message.

             If the value is generic(1) then no
             optional parameters will be sent in
             the LDP Initialization message associated
             with this Entity.

             If the value is atmParameters(2) then
             a row must be created in the
             mplsLdpEntityAtmTable, which
             corresponds to this entry.

             If the value is frameRelayParameters(3) then
             a row must be created in the
             mplsLdpEntityFrameRelayTable, which
             corresponds to this entry." S"RFC3036, LDP Specification, Section 3.5.3.,
             Initialization Message."           --[ZXROSNG]read only
        '"The value of sysUpTime on the most recent occasion
             at which any one or more of this entity's counters
             suffered a discontinuity.  The relevant counters
             are the specific instances associated with this
             entity of any Counter32 object contained
             in the 'mplsLdpEntityStatsTable'.  If no such
             discontinuities have occurred since the last
             re-initialization of the local management
             subsystem, then this object contains a zero
             value."                       �"The storage type for this conceptual row.
             Conceptual rows having the value 'permanent(4)'
             need not allow write-access to any columnar
             objects in the row."             --[ZXROSNG]read only
        �"The status of this conceptual row.  All writable
              objects in this row may be modified at any
              time, however, as described in detail in
              the section entitled, 'Changing Values After
              Session Establishment', and again described
              in the DESCRIPTION clause of the
              mplsLdpEntityAdminStatus object, if a session
              has been initiated with a Peer, changing objects
              in this table will wreak havoc with the session
              and interrupt traffic.  To repeat again:
              the recommended procedure is to
              set the mplsLdpEntityAdminStatus to down, thereby
              explicitly causing a session to be torn down. Then,
              change objects in this entry, then set
              the mplsLdpEntityAdminStatus to enable,
              which enables a new session to be initiated."             --[ZXROSNG]read only
         �"This table is a read-only table which augments
             the mplsLdpEntityTable.  The purpose of this
             table is to keep statistical information about
             the LDP Entities on the LSR."                      g"A row in this table contains statistical information
             about an LDP Entity.  Some counters contained in a
             row are for fatal errors received during a former
             LDP Session associated with this entry.  For example,
             an LDP PDU received on a TCP connection during an
             LDP Session contains a fatal error.  That
             error is counted here, because the
             session is terminated.

             If the error is NOT fatal (i.e., the Session
             remains), then the error is counted in the
             mplsLdpSessionStatsEntry."                      �"A count of the Session Initialization messages
             which were sent or received by this LDP Entity and
             were NAK'd.   In other words, this counter counts
             the number of session initializations that failed.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                      w"A count of the Session Rejected/No Hello Error
             Notification Messages sent or received by
             this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                      �"A count of the Session Rejected/Parameters
             Advertisement Mode Error Notification Messages sent
             or received by this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                      �"A count of the Session Rejected/Parameters
             Max Pdu Length Error Notification Messages sent
             or received by this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                      "A count of the Session Rejected/Parameters
             Label Range Notification Messages sent
             or received by this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                      �"This object counts the number of Bad LDP Identifier
             Fatal Errors detected by the session(s)
             (past and present) associated with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime." ."RFC3036, LDP Specification, Section 3.5.1.2."                    �"This object counts the number of Bad PDU Length
             Fatal Errors detected by the session(s)
             (past and present) associated with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime." ."RFC3036, LDP Specification, Section 3.5.1.2."                    �"This object counts the number of Bad Message
             Length Fatal Errors detected by the session(s)
             (past and present) associated with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime." ."RFC3036, LDP Specification, Section 3.5.1.2."                    �"This object counts the number of Bad TLV
             Length Fatal Errors detected by the session(s)
             (past and present) associated with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime." ."RFC3036, LDP Specification, Section 3.5.1.2."                    �"This object counts the number of Malformed TLV
             Value Fatal Errors detected by the session(s)
             (past and present) associated with this
             LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime." ."RFC3036, LDP Specification, Section 3.5.1.2."                    �"This object counts the number of Session Keep Alive
             Timer Expired Errors detected by the session(s)
             (past and present) associated with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime." ."RFC3036, LDP Specification, Section 3.5.1.2."                    �"This object counts the number of Shutdown Notifications
             received related to session(s) (past and present)
             associated with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                      �"This object counts the number of Shutdown Notfications
             sent related to session(s) (past and present) associated
             with this LDP Entity.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpEntityDiscontinuityTime."                           �"The value of sysUpTime at the time of the most
             recent addition or deletion to/from the
             mplsLdpPeerTable/mplsLdpSessionTable."                      �"Information about LDP peers known by Entities in
             the mplsLdpEntityTable.  The information in this table
             is based on information from the Entity-Peer interaction
             during session initialization but is not appropriate
             for the mplsLdpSessionTable, because objects in this
             table may or may not be used in session establishment."                       �"Information about a single Peer which is related
             to a Session.  This table is augmented by
             the mplsLdpSessionTable."                       &"The LDP identifier of this LDP Peer."                       ^"For any given LDP session, the method of
             label distribution must be specified."                      N"If the value of this object is 0 (zero) then
             Loop Dection for Path Vectors for this Peer
             is disabled.

             Otherwise, if this object has a value greater than
             zero, then Loop Dection for Path  Vectors for this
             Peer is enabled and the Path Vector Limit is this value." c"RFC3036, LDP Specification, Section 2.8 Loop Dection,
            Section 3.4.5 Path Vector TLV."                    Y"The type of the Internet address for the
             mplsLdpPeerTransportAddr object.  The LDP
             specification describes this as being either
             an IPv4 Transport Address or IPv6 Transport
             Address which is used in opening the LDP session's
             TCP connection, or if the optional TLV is not
             present, then this is the IPv4/IPv6 source
             address for the UPD packet carrying the Hellos.

             This object specifies how the value of the
             mplsLdpPeerTransportAddr object should be
             interpreted." �"RFC3036, LDP Specification, Section 2.5.2
            Transport Connection Establishment and
            Section 3.5.2.1 Hello Message Procedures."                     �"The Internet address advertised by the peer
             in the Hello Message or the Hello source address.

             The type of this address is specified by the
             value of the mplsLdpPeerTransportAddrType
             object." �"RFC3036, LDP Specification, Section 2.5.2
            Transport Connection Establishment and
            Section 3.5.2.1 Hello Message Procedures."                     �"A table of Sessions between the LDP Entities
             and LDP Peers.  This table AUGMENTS the
             mplsLdpPeerTable.  Each row in this table
             represents a single session."                      �"An entry in this table represents information on a
             single session between an LDP Entity and LDP Peer.
             The information contained in a row is read-only.

             Please note:  the Path Vector Limit for the
             Session is the value which is configured in
             the corresponding mplsLdpEntityEntry. The
             Peer's Path Vector Limit is in the
             mplsLdpPeerPathVectorLimit object in the
             mplsLdpPeerTable.

             Values which may differ from those configured are
             noted in the objects of this table, the
             mplsLdpAtmSessionTable and the
             mplsLdpFrameRelaySessionTable. A value will
             differ if it was negotiated between the
             Entity and the Peer.  Values may or may not
             be negotiated.  For example, if the values
             are the same then no negotiation takes place.
             If they are negotiated, then they may differ."                       �"The value of sysUpTime at the time this
             Session entered its current state as
             denoted by the mplsLdpSessionState
             object."                       �"The current state of the session, all of the
             states 1 to 5 are based on the state machine
             for session negotiation behavior." X"RFC3036, LDP Specification, Section 2.5.4,
             Initialization State Machine."                    �"During session establishment the LSR/LER takes either
             the active role or the passive role based on address
             comparisons.  This object indicates whether this LSR/LER
             was behaving in an active role or passive role during
             this session's establishment.

             The value of unknown(1), indicates that the role is not
             able to be determined at the present time." R"RFC3036, LDP Specification, Section 2.5.3.,
             Session Initialization"                     �"The version of the LDP Protocol which
             this session is using.  This is the version of
             the LDP protocol which has been negotiated
             during session initialization." Q"RFC3036, LDP Specification, Section 3.5.3,
            Initialization Message."                     D"The keep alive hold time remaining for
             this session."                      �"The negotiated KeepAlive Time which
                represents the amount of seconds between
                keep alive messages.  The
                mplsLdpEntityKeepAliveHoldTimer
                related to this Session is the
                value that was proposed as the
                KeepAlive Time for this session.

                This value is negotiated during
                session initialization between
                the entity's proposed value
                (i.e., the value configured in
                mplsLdpEntityKeepAliveHoldTimer)
                and the peer's proposed
                KeepAlive Hold Timer value.
                This value is the smaller
                of the two proposed values." T"RFC3036, LDP Specification, Section 3.5.3,
               Initialization Message."                    �"The value of maximum allowable length for LDP PDUs for
                this session.  This value may have been negotiated
                during the Session Initialization.  This object is
                related to the mplsLdpEntityMaxPduLength object.  The
                mplsLdpEntityMaxPduLength object specifies the requested
                LDP PDU length, and this object reflects the negotiated
                LDP PDU length between the Entity and
                the Peer." T"RFC3036, LDP Specification, Section 3.5.3,
               Initialization Message."                    "The value of sysUpTime on the most recent occasion
             at which any one or more of this session's counters
             suffered a discontinuity.  The relevant counters are
             the specific instances associated with this session
             of any Counter32 object contained in the
             mplsLdpSessionStatsTable.

             The initial value of this object is the value of
             sysUpTime when the entry was created in this table.

             Also, a command generator can distinguish when a session
             between a given Entity and Peer goes away and a new
             session is established.  This value would change and
             thus indicate to the command generator that this is a
             different session."                       �"A table of statistics for Sessions between
             LDP Entities and LDP Peers.  This table AUGMENTS
             the mplsLdpPeerTable."                       �"An entry in this table represents statistical
             information on a single session between an LDP
             Entity and LDP Peer."                      k"This object counts the number of Unknown Message Type
             Errors detected by this LSR/LER during this session.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpSessionDiscontinuityTime."                      b"This object counts the number of Unknown TLV Errors
             detected by this LSR/LER during this session.

             Discontinuities in the value of this counter can occur
             at re-initialization of the management system, and at
             other times as indicated by the value of
             mplsLdpSessionDiscontinuityTime."                           ,"A table of Hello Adjacencies for Sessions."                       �"Each row represents a single LDP Hello Adjacency.
             An LDP Session can have one or more Hello
             Adjacencies."                       ,"An identifier for this specific adjacency."                      �"If the value of this object is 65535,
             this means that the hold time is infinite
             (i.e., wait forever).

             Otherwise, the time remaining for
             this Hello Adjacency to receive its
             next Hello Message.

             This interval will change when the 'next'
             Hello Message which corresponds to this
             Hello Adjacency is received unless it
             is infinite."                      U"The Hello hold time which is negotiated between
             the Entity and the Peer.  The entity associated
             with this Hello Adjacency issues a proposed
             Hello Hold Time value in the
             mplsLdpEntityHelloHoldTimer object.  The peer
             also proposes a value and this object represents
             the negotiated value.

             A value of 0 means the default,
             which is 15 seconds for Link Hellos
             and 45 seconds for Targeted Hellos.
             A value of 65535 indicates an
             infinite hold time." 9"RFC3036, LDP Specification, Section 3.5.2 Hello Message"                     �"This adjacency is the result of a 'link'
             hello if the value of this object is link(1).
             Otherwise, it is a result of a 'targeted'
             hello, targeted(2)."                       v"A table of LDP LSP's which
             map to the mplsInSegmentTable in the
             MPLS-LSR-STD-MIB module."                      �"An entry in this table represents information
             on a single LDP LSP which is represented by
             a session's index triple (mplsLdpEntityLdpId,
             mplsLdpEntityIndex, mplsLdpPeerLdpId) AND the
             index for the mplsInSegmentTable
             (mplsInSegmentLdpLspLabelIndex) from the
             MPLS-LSR-STD-MIB.

             The information contained in a row is read-only."                       �"This contains the same value as the
             mplsInSegmentIndex in the
             MPLS-LSR-STD-MIB's mplsInSegmentTable."                       "The Layer 2 Label Type."                       "The type of LSP connection."                       o"A table of LDP LSP's which
             map to the mplsOutSegmentTable in the
            MPLS-LSR-STD-MIB."                      }"An entry in this table represents information
             on a single LDP LSP which is represented by
             a session's index triple (mplsLdpEntityLdpId,
             mplsLdpEntityIndex, mplsLdpPeerLdpId) AND the
             index (mplsOutSegmentLdpLspIndex)
             for the mplsOutSegmentTable.

             The information contained in a row is read-only."                       �"This contains the same value as the
             mplsOutSegmentIndex in the
             MPLS-LSR-STD-MIB's mplsOutSegmentTable."                       "The Layer 2 Label Type."                       "The type of LSP connection."                          �"The value of sysUpTime at the time of the most
             recent addition/deletion of an entry
             to/from the mplsLdpFectTable or
             the most recent change in values to any objects
             in the mplsLdpFecTable.

             If no such changes have occurred since the last
             re-initialization of the local management subsystem,
             then this object contains a zero value."                       �"This object contains an appropriate value to
             be used for mplsFecIndex when creating
             entries in the mplsFecTable. The value
             0 indicates that no unassigned entries are
             available."                       ~"This table represents the FEC
             (Forwarding Equivalence Class)
             Information associated with an LSP."                       +"Each row represents a single FEC Element."                       1"The index which uniquely identifies this entry."                      %"The type of the FEC.  If the value of this object
             is 'prefix(1)' then the FEC type described by this
             row is an address prefix.

             If the value of this object is 'hostAddress(2)' then
             the FEC type described by this row is a host address." ""RFC3036, Section 3.4.1. FEC TLV."           --[ZXROSNG]read only
         �"The value of this object is the type of the
             Internet address.  The value of this object,
             decides how the value of the mplsFecAddr object
             is interpreted." ""RFC3036, Section 3.4.1. FEC TLV."           --[ZXROSNG]read only
        "The value of this object is interpreted based
             on the value of the 'mplsFecAddrType' object.

             This address is then further interpretted as
             an being used with the address prefix,
             or as the host address.  This further interpretation
             is indicated by the 'mplsFecType' object.
             In other words, the FEC element is populated
             according to the Prefix FEC Element value encoding, or
             the Host Address FEC Element encoding." !"RFC3036, Section 3.4.1 FEC TLV."           --[ZXROSNG]read only
        8"If the value of the 'mplsFecType' is 'hostAddress(2)'
             then this object is undefined.

             If the value of 'mplsFecType' is 'prefix(1)'
             then the value of this object is the length in
             bits of the address prefix represented by
             'mplsFecAddr', or zero.  If the value of this
             object is zero, this indicates that the
             prefix matches all addresses.  In this case the
             address prefix MUST also be zero (i.e., 'mplsFecAddr'
             should have the value of zero.)" ""RFC3036, Section 3.4.1. FEC TLV."           --[ZXROSNG]read only
         �"The storage type for this conceptual row.
             Conceptual rows having the value 'permanent(4)'
             need not allow write-access to any columnar
             objects in the row."             --[ZXROSNG]read only
        �"The status of this conceptual row.  If the value of this
             object is 'active(1)', then none of the writable objects
             of this entry can be modified, except to set this object
             to 'destroy(6)'.

             NOTE: if this row is being referenced by any entry in
             the mplsLdpLspFecTable, then a request to destroy
             this row, will result in an inconsistentValue error."             --[ZXROSNG]read only
        �"The value of sysUpTime at the time of the most
             recent addition/deletion of an entry
             to/from the mplsLdpLspFecTable or
             the most recent change in values to any objects in the
             mplsLdpLspFecTable.

             If no such changes have occurred since the last
             re-initialization of the local management subsystem,
             then this object contains a zero value."                       �"A table which shows the relationship between
           LDP LSPs and FECs.  Each row represents
           a single LDP LSP to FEC association."                       ?"An entry represents a LDP LSP
           to FEC association."                      �"If the value is inSegment(1), then this
            indicates that the following index,
            mplsLdpLspFecSegmentIndex, contains the same
            value as the mplsInSegmentLdpLspIndex.

            Otherwise, if the value of this object is
            outSegment(2),  then this
            indicates that following index,
            mplsLdpLspFecSegmentIndex, contains the same
            value as the mplsOutSegmentLdpLspIndex."                      �"This index is interpretted by using the value
            of the mplsLdpLspFecSegment.

            If the mplsLdpLspFecSegment is inSegment(1),
            then this index has the same value as
            mplsInSegmentLdpLspIndex.

            If the mplsLdpLspFecSegment is outSegment(2),
            then this index has the same value as
            mplsOutSegmentLdpLspIndex."                      %"This index identifies the FEC entry in the
             mplsFecTable associated with this session.
             In other words, the value of this index
             is the same as the value of the mplsFecIndex
             that denotes the FEC associated with this
             Session."                       �"The storage type for this conceptual row.
            Conceptual rows having the value 'permanent(4)'
            need not allow write-access to any columnar
            objects in the row."                      v"The status of this conceptual row.  If the
             value of this object is 'active(1)', then
             none of the writable objects of this entry
             can be modified.

             The Agent should delete this row when
             the session ceases to exist.  If an
             operator wants to associate the session with
             a different FEC, the recommended
             procedure is (as described in detail in the section
             entitled, 'Changing Values After Session
             Establishment', and again described in the
             DESCRIPTION clause of the
             mplsLdpEntityAdminStatus object)
             is to set the mplsLdpEntityAdminStatus to
             down, thereby explicitly causing a session
             to be torn down. This will also
             cause this entry to be deleted.

             Then, set the mplsLdpEntityAdminStatus
             to enable which enables a new session to be initiated.
             Once the session is initiated, an entry may be
             added to this table to associate the new session
             with a FEC."                      8"This table 'extends' the mplsLdpSessionTable.
             This table is used to store Label Address Information
             from Label Address Messages received by this LSR from
             Peers.  This table is read-only and should be updated
             when Label Withdraw Address Messages are received, i.e.,
             Rows should be deleted as appropriate.

             NOTE:  since more than one address may be contained
             in a Label Address Message, this table 'sparse augments',
             the mplsLdpSessionTable's information."                       �"An entry in this table represents information on
             a session's single next hop address which was
             advertised in an Address Message from the LDP peer.
             The information contained in a row is read-only."                       U"An index which uniquely identifies this entry within
             a given session."                      "The internetwork layer address type of this Next Hop
             Address as specified in the Label Address Message
             associated with this Session. The value of this
             object indicates how to interpret the value of
             mplsLdpSessionPeerNextHopAddr."                       �"The next hop address.  The type of this address
             is specified by the value of the
             mplsLdpSessionPeerNextHopAddrType." L"RFC3036, Section 2.7. LDP Identifiers
             and Next Hop Addresses"                             5"Objects that apply to all MPLS LDP implementations."                "These objects are for LDP implementations
             which interface to the Label Information Base (LIB)
             in the MPLS-LSR-STD-MIB.  The LIB is
             represented in the mplsInSegmentTable,
             mplsOutSegmentTable and mplsXCTable."                 2"The notification for an MPLS LDP implementation."                         �"The Module is implemented with support
             for read-create and read-write.  In other
             words, both monitoring and configuration
             are available when using this MODULE-COMPLIANCE."   �"This group must be supported if the LSR MIB is
             implemented, specifically the mplsInSegmentTable,
             the mplsOutSegmentTable or the mplsXCTable." s"An implementation is only required to support
            'unknown(0)', IPv4 and globally unique IPv6 addresses." f"An implementation is only required to support IPv4 and
             globally unique IPv6 addresses." K"Support for createAndWait and notInService is not
             required." s"An implementation is only required to support
            'unknown(0)', IPv4 and globally unique IPv6 addresses." f"An implementation is only required to support IPv4 and
             globally unique IPv6 addresses." K"Support for createAndWait and notInService is not
             required." K"Support for createAndWait and notInService is not
             required." t"An implementation is only required to support
             'unknown(0)', IPv4 and globally unique IPv6 addresses." f"An implementation is only required to support IPv4
             and globally unique IPv6 addresses."             �"The Module is implemented with support
             for read-only.  In other words, only monitoring
             is available by implementing this MODULE-COMPLIANCE."   �"This group must be supported if the LSR MIB is
             implemented, specifically the mplsInSegmentTable,
             the mplsOutSegmentTable or the mplsXCTable." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." �"Write access is not required.
            An implementation is only required to support
            'unknown(0)', IPv4 and globally unique IPv6 addresses." �"Write access is not required.
             An implementation is only required to support IPv4 and
             globally unique IPv6 addresses." "Write access is not required." "Write access is not required." g"Write access is not required, and active is the
             only status that needs to be supported." "Write access is not required." "Write access is not required." �"Write access is not required.
            An implementation is only required to support
            'unknown(0)', IPv4 and globally unique IPv6 addresses." �"Write access is not required.
             An implementation is only required to support IPv4 and
             globally unique IPv6 addresses." "Write access is not required." g"Write access is not required, and active is the
             only status that needs to be supported." "Write access is not required." g"Write access is not required, and active is the
             only status that needs to be supported." s"An implementation is only required to support
            'unknown(0)', IPv4 and globally unique IPv6 addresses." f"An implementation is only required to support IPv4
             and globally unique IPv6 addresses."            