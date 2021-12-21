     +"A block to contain the header from a PDU."             "{See section 4 of RFC 3784}" \"Full metric for IP Routes. Traffic Engineering extensions
        provide 32-bit metrics."             "{See section 3 of RFC 3784}" �"Wide metric for IS Neighbors. ISO 10589 provides a
            6-bit metric. Traffic Engineering extensions provide
            24-bit metrics."               )"Integer sub-range for maximum LSP size."             ""{See section 7.2.2 of ISO 10589}" �"Integer sub-range for default metric for single hop.
             ISO 10589 provides for 4 types of metric.  Only the
            'default' metric is used in practice."               ,"Type used in enabling and disabling a row."               V"OSI Network Service Address, e.g., NSAP, SNPA, or Network
             Entity Title"               �"An Unsigned32 further restricted to 16 bits. Note that
            the ASN.1 BER encoding may still require 24 bits for
             some values."             "{ISIS.aoi systemId (119)}"U"The ID for an Intermediate System. This should
            be unique within a network, and is included
            in all PDUs originated by an Intermediate System.
            The protocol does not place any meanings upon
            the bits, other than using ordering to break
            ties in electing a Designated IS on a LAN."             ""{See section 7.2.2 of ISO 10589}" )"Is this an Internal or External Metric?"             1"{See definitions 3.6.1 and 3.6.11 of ISO 10589}"  "Identifies one or more levels."              "{See section 9.8 of ISO 10589}"�"The 8-byte Link State PDU (LSP) ID,
            consisting of the 6-byte SystemID of the
            originating IS; a one-byte PseudoNode ID,
            which is 0 unless the LSP represents the
            topology of a LAN; and a one-byte LSP
            fragment number that is issued in sequence,
            starting with 0. Non-zero PseudoNode IDs
            need to be unique to the IS but need not
            match the IfIndex."             ""{See section 7.2.7 of ISO 10589}" "ID for a circuit."               �"An Unsigned32 further restricted to 8 bits. Note that
            the ASN.1 BER encoding may still require 16 bits for
             some values."              "{See section 9.5 of ISO 10589}" '"Integer sub-range for IS-IS priority."             "{See section 5 of RFC 3787}" 3"Do we use RFC 1195 style metrics or wide metrics?"             !"{See section 5.3.1 of RFC 1195}" �"Types of network protocol supported by Integrated IS-IS.
             The values for ISO8473 and IP are those registered for
             these protocols in ISO TR9577."               "States of the IS-IS protocol."             1"{See definitions 3.6.1 and 3.6.11 of ISO 10589}" "Identifies a level."                                                                                        "This document describes a management information base for
                  the IS-IS Routing protocol, as described in ISO 10589,
                  when it is used to construct routing tables for IP
                  networks, as described in RFC 1195.

                  This document is based on a 1994 IETF document by Chris
                  Gunner. This version has been modified to include
                  current syntax, to exclude portions of the protocol that
                  are not relevant to IP, and to add management support for
                  current practice.
                  Copyright (C) The Internet Society (2006). This version
                  of this MIB module is part of RFC 4444; see the RFC
                  itself for full legal notices.":"IS-IS for IP Internets working Group
            http://www.ietf.org/html.charters/isis-charter.html
            isis-wg@ietf.org
            Jeff Parker
            Department of Computer Science
            Middlebury College,
            Middlebury, Vermont 05753
            jeffp at middlbury dot edu" "200604040000Z" )"Initial version, published as RFC 4444."       -- April 4, 2006, midnight
                   L"The version number of the IS-IS protocol that
            is implemented." "{ISIS.aoi version (1)}"                    "At which levels is the Intermediate System
            running? This object may not be modified when
            the isisSysAdminState variable is in state 'on'
            for this Intermediate System.
            Configured values MUST survive an agent reboot." "{ISIS.aoi iSType (2)}"                    �"The ID for this Intermediate System.
            This value is appended to each of the
             area addresses to form the Network Entity Titles.
             The derivation of a value for this object is
            implementation specific. Some implementations may
             automatically assign values and not permit an
             SNMP write, while others may require the value
            to be set manually.
            Configured values MUST survive an agent reboot." "{ISIS.aoi systemId (119)}"                    9"Maximum number of paths with equal routing metric value
             which it is permitted to split between. This object
            may not be modified when the isisSysAdminState variable
            is in state 'on' for this Intermediate System.
            Configured values MUST survive an agent reboot." ""{ISIS.aoi maximumPathSplits (3)}"                    �"Maximum interval, in seconds, between generated LSPs
            by this Intermediate System. This object follows
            the ResettingTimer behavior. The value must be
            greater than any value configured for
            isisSysLevelMinLSPGenInt, and should be at least 300
            seconds less than isisSysMaxAge.
            Configured values MUST survive an agent reboot." -"{ISIS.aoi maximumLSPGenerationInterval (6)}"                     �"The value, in seconds, to be used for the suggested ES
             configuration timer in ISH PDUs when soliciting the ES
            configuration.
            Configured values MUST survive an agent reboot." !"{ISIS.aoi pollESHelloRate (13)}"                     �"Number of seconds to delay in state 'waiting' before
            entering the state 'on'. This object follows the
            ResettingTimer behavior.
            Configured values MUST survive an agent reboot." "{ISIS.aoi waitingTime (15)}"                    "The administrative state of this Intermediate
            System. Setting this object to the value 'on'
            when its current value is 'off' enables
            the Intermediate System.
            Configured values MUST survive an agent reboot."                       s"If true, allow the router to leak L2 routes into L1.
            Configured values MUST survive an agent reboot."                       �"Value to place in RemainingLifeTime field of
             the LSPs we generate.
            This should be at least 300 seconds greater than
            isisSysMaxLSPGenInt.
            Configured values MUST survive an agent reboot."                      "Size of the largest buffer we are designed or
             configured to store.  This should be at least
            as big as the maximum isisSysLevelOrigLSPBuffSize
             supported by the system.
             If resources allow, we will store and flood LSPs
             larger than isisSysReceiveLSPBufferSize, as this
             can help avoid problems in networks with different
            values for isisSysLevelOrigLSPBuffSize.
            Configured values MUST survive an agent reboot."                       b"This attribute contains the set of protocols
            supported by this Intermediate System."                       �"If this object is set to true(1), then it enables
            the emission of IS-IS Notifications. If it is
            set to false(2), these notifications are not sent.
            Configured values MUST survive an agent reboot."                      4"The set of manual area addresses configured on this
            Intermediate System.
            At least one row in which the value of
            isisManAreaAddrExistState is active must be present.
            The maximum number of rows in this table for
            which the object isisManAreaAddrExistState has the
            value active is 3.
            An attempt to create more than 3 rows of
            isisManAreaAddrEntry with state 'active' in one
            instance of the IS-IS protocol should
            return inconsistentValue." %"{ISIS.aoi manualAreaAddresses (10)}"                     �"Each entry contains one area address manually configured
        on this system.
        Dynamically created rows MUST survive an agent reboot."                      "A manually configured area address for this system.
            Note: An index for the entry {1, {49.0001} active} in
             this table would be the ordered pair
            (1, (0x03 0x49 0x00 0x01)), as the length of an octet
             string is part of the OID."                      �"The state of the isisManAreaAddrEntry. If the
            isisSysAdminState for this Intermediate System is 'on' and
            an attempt is made to set this object to the value
            'destroy' or 'notInService' when this is the only
            isisManAreaAddrEntry in state 'active' for this
            Intermediate System should return inconsistentValue.
            A row entry cannot be modified when the value of this
            object is 'active'."                      "The union of the sets of area addresses reported in all
            Level 1 LSPs with fragment number zero generated by this
            Intermediate System, or received from other Intermediate
            Systems that are reachable via Level 1 routing." "{ISIS.aoi areaAddresses (18)}"                     �"Each entry contains one area address reported in a
            Level 1 LSP generated or received by this Intermediate
            System.
            Dynamically learned rows do not survive an agent reboot."                       ,"An area address reported in a Level 1 LSP."                      �"The set of IP summary addresses to use in forming
             summary TLVs originated by this Intermediate System.
             An administrator may use a summary address to combine
             and modify IP Reachability announcements.  If the
             Intermediate system can reach any subset of the summary
            address, the summary address MUST be announced instead,
             at the configured metric."                      �"Each entry contains one IP summary address.
            Dynamically created rows MUST survive an agent reboot.
            Implementers need to be aware that if the total number
            of elements (octets or sub-identifiers) in
            isisSummAddress and isisSummAddrPrefixLen is too great,
            then OIDs of column instances in this table will have
            more than 128 subidentifiers and cannot be accessed
            using SNMPv1, SNMPv2c, or SNMPv3."                       2"The Type of IP address for this summary address."                      @"The IP Address value for this summary address.
            The address must not contain any set host bits
            (bits set after the address prefix determined by
            isisSummAddrPrefixLen).
            The type of this address is determined by the value of
            the isisSummAddressType object."                      m"The Length of the IP NetMask for this summary address.
            The values for the index objects isisSummAddress and
            isisSummAddrPrefixLen must be consistent. When the value
            of isisSummAddress (excluding the zone index, if one
            is present) is x, then the bitwise logical-AND
            of x with the value of the mask formed from the
            corresponding index object isisSummAddrPrefixLen MUST be
            equal to x. If not, then the index pair is not
            consistent, and an inconsistentName error must be
            returned on SET or CREATE requests."                       �"The existence state of this summary address. Support
            for 'createAndWait' and 'notInService' is not required.
            A row entry cannot be modified when the value of this
            object is 'active'."                       h"The metric value to announce this summary
             address with in LSPs generated by this system."                       m"The wide metric value to announce this summary
             address with in LSPs generated by this system."                      �"This table provides criteria to decide if a route should
             be leaked from L2 to L1 when Domain Wide Prefix leaking is
             enabled.
            Addresses that match the summary mask in the table MUST
             be announced at L1 by routers when isisSysL2toL1Leaking
             is enabled.  Routes that fall into the ranges specified
             are announced as is, without being summarized.  Routes
             that do not match a summary mask are not announced."                      E"Each entry contains one configured IP summary
            address to manage leaking L2 addresses into L1.
            Dynamically created rows MUST survive an agent reboot.
            Implementers need to be aware that if the total number
            of elements (octets or sub-identifiers) in
            isisRedistributeAddrAddress and
            isisRedistributeAddrPrefixLen is too great, then OIDs
            of column instances in this table will have more than
            128 subidentifiers and cannot be accessed using SNMPv1,
            SNMPv2c, or SNMPv3."                       2"The Type of IP address for this summary address."                      M"The IP Address value for this summary address.
            The type of this address is determined by the
            value of the isisRedistributeAddrType object.
            The address must not contain any set host bits -
            bits set after the address prefix determined by
            isisRedistributeAddrPrefixLen."                      �"The Length of the IP NetMask for this summary address.
            The values for the index objects
            isisRedistributeAddrAddress and
            isisRedistributeAddrPrefixLen must be consistent.
            When the value of isisRedistributeAddrAddress
            (excluding the zone index, if one is present) is x,
            then the bitwise logical-AND of x with the value of
            the mask formed from the corresponding index object
            isisRedistributeAddrPrefixLen MUST be equal to x.
            If not, then the index pair is not consistent, and an
            inconsistentName error must be returned on SET or
            CREATE requests."                       �"The existence state of this summary address. Support
        for createAndWait and notInService is not required.
        A row entry cannot be modified when the value of this
        object is 'active'."                       %"The set of hostnames and router ID."                       �"Each entry tracks information about one Intermediate
            System at one level.
            Dynamically learned rows do not survive an agent reboot."                       +"The System ID of the Intermediate System."                       ^"The level at which the information about this
            Intermediate System was received."                       O"The hostname listed in the LSP, or a zero-length
            string if none."                       2"The Router ID found in the LSP, or zero if none."                           ."Level specific information about the System."                       z"Each row describes variables configured for Area or Domain.
            Configured values MUST survive an agent reboot."                       &"The level that this entry describes."                       �"The maximum size of LSPs and SNPs originated by
            this Intermediate System at this level. This
            object may not be modified when the isisSysAdminState
            variable is in state 'on' for this Intermediate System." +"{ISIS.aoi originatingL1LSPBufferSize (9)}"                     �"Minimum interval, in seconds, between successive
            generation of LSPs with the same LSPID at this level
            by this Intermediate System." ."{ISIS.aoi minimumLSPGenerationInterval (11)}"                    ]"The state of the database at this level.
            The value 'off' indicates that IS-IS is not active at
            this level.
            The value 'on' indicates that IS-IS is active at this
            level and is not overloaded.
            The value 'waiting' indicates a database that is low on
            an essential resource, such as memory.
            The administrator may force the state to 'overloaded'
            by setting the object isisSysLevelSetOverload.
            If the state is 'waiting' or 'overloaded', we
            originate LSPs with the overload bit set." "{ISIS.aoi l1State (17)}"                    R"Administratively set the overload bit for the level.
            The overload bit MUST continue to be set if the
             implementation runs out of memory, independent of
            this variable. It may also be set manually independent
            of this variable, using the isisSysLevelSetOverloadUntil
            object."                      �"If this object is non-zero, the overload bit is set at
            this level when the isisSysAdminState variable goes to
            state 'on' for this Intermediate System. The overload bit
            remains set for isisSysLevelSetOverloadUntil seconds.
            When isisSysLevelSetOverloadUntil seconds have elapsed,
            the overload flag remains set if the implementation has
            run out of memory, or if it is set manually using the
            isisSysLevelSetOverload object.
            If isisSysLevelSetOverload is false, the system clears
            the overload bit when isisSysLevelSetOverloadUntil seconds
            have elapsed, if the system has not run out of memory."                       J"Which style of metric do we generate in our LSPs
        at this level?"                       Z"Which style of metric do we consider in our
             SPF computation at this level?"                       -"Do we do Traffic Engineering at this level?"                          R"This object is used to assist a management
            application in creating new rows in the
            isisCircTable. If it is possible to create
            a new instance of isisCircEntry, then this
            object will contain a non-zero value that
            is not in use as the index of any row in the
            isisCircTable. The network manager reads the
            value of this object and then (if the
            value read is non-zero) attempts to create
            the corresponding instance of isisCircEntry.
            If the set request fails with the code
            'inconsistentValue', then the process must be
            repeated; if the set request succeeds, then
            the agent will change the value of this object
            according to an implementation-specific
            algorithm."                       B"The table of circuits used by this
        Intermediate System."                       �"An isisCircEntry exists for each circuit configured
            for Integrated IS-IS on this system.
            Dynamically created rows MUST survive an agent reboot."                      z"An index used to uniquely identify this circuit.
            When creating a row in this table, the
            isisNextCircIndex object should be retrieved,
            and its value should be specified as the value
            of this index using a SET operation. A retrieved
            value of zero(0) indicates that no rows can be
            created at this time."                       �"The value of ifIndex for the interface to which this
             circuit corresponds.   This object cannot be modified
            after creation."                       *"The administrative state of the circuit."                      �"The existence state of this circuit. Setting the state
            to 'notInService' halts the generation and processing of
            IS-IS protocol PDUs on this circuit. Setting the state
            to destroy will also erase any configuration associated
            with the circuit. Support for 'createAndWait' and
            'notInService' is not required.
            A row entry cannot be modified when the value of this
            object is 'active'."                       �"The type of the circuit. This object follows the
            ReplaceOnlyWhileDisabled behavior. The type specified
             must be compatible with the type of the interface defined
             by the value of isisCircIfIndex." "{ISIS.aoi type (33)}"                     �"If true, suppress normal transmission of and
             interpretation of Intra-domain IS-IS PDUs on this
             circuit."  "{ISIS.aoi externalDomain (46)}"                    �"Indicates which type of packets will be sent and
            accepted on this circuit. The values set will be
            saved, but the values used will be modified by
            the settings of isisSysLevelType. Thus, if the
            isisSysTpe is level2 and the isisCircLevelType
            for a circuit is level1, the circuit will not send
            or receive IS-IS packets. This object follows the
            ReplaceOnlyWhileDisabled behavior."                       g"Should we include this interface in LSPs, even if
             it is not running the IS-IS Protocol?"                      "Is this port a member of a mesh group, or is it
            blocked? Circuits in the same mesh group act as a
            virtual multiaccess network. LSPs seen on one circuit
            in a mesh group will not be flooded to another circuit
             in the same mesh group." "{ RFC 2973 }"                    4"Circuits in the same mesh group act as a virtual
             multiaccess network.  LSPs seen on one circuit in
             a mesh group will not be flooded to another circuit
             in the same mesh group.  If isisCircMeshGroupEnabled
             is inactive or blocked, this value is ignored." "{ RFC 2973 }"                    %"Can we send unpadded hellos on LAN circuits?  False
            means the LAN Hellos must be padded.
             Implementations should allow the administrator to read
             this value.  An implementation need not be able to
             support unpadded hellos to be conformant."                       �"How long the circuit has been enabled, measured in
        hundredths of seconds since the last re-initialization
        of the network management subsystem; 0 if the
        circuit has never been 'on'."                       0"Is this circuit enabled to run 3Way handshake?"                       �"The value to be used as the extended circuit ID in
            3Way handshake. This value is only used if
            isisCirc3WayEnabled is true, and it must be unique
            across all circuits on this IS."                           9"Level specific information about circuits used by IS-IS"                       �"An isisCircLevelEntry exists for each level on
            each circuit configured for Integrated IS-IS on
            this system.
            Configured values MUST survive an agent reboot."                       &"The level that this entry describes."                       2"The metric value of this circuit for this level." !"{ISIS.aoi l1DefaultMetric (35)}"                     7"The wide metric value of this circuit for this level."                       _"The priority for becoming the LAN-Designated
             Intermediate System at this level." ."{ISIS.aoi l2IntermediateSystemPriority (73)}"                    �"A one-byte identifier for the circuit selected by the
            Intermediate System.
            On point-to-point circuits, the value is used as the Local
            Circuit ID in point-to-point IIH PDUs transmitted on this
            circuit. In this case, values of isisCircLevelIDOctet do
            not need to be unique.
            For broadcast circuits, the value is used to generate the
            LAN ID that will be used if this Intermediate System is
            elected as the Designated IS on this circuit. The value
            is required to differ on LANs where the Intermediate System
            is the Designated Intermediate System."                      8"On a point-to-point circuit with a fully initialized
            adjacency to a peer IS, the value of this object is
            the circuit ID negotiated during adjacency initialization.
            On a point to point circuit without such an adjacency,
            the value is the concatenation of the local system ID
            and the one-byte isisCircLevelIDOctet for this circuit,
            i.e., the value that would be proposed for the circuit ID.
            On other circuit types, the value returned is the zerolength
            OCTET STRING." "{ISIS.aoi ptPtCircuitID (51)}"                    3"The ID of the LAN-Designated Intermediate System
             on this circuit at this level. If, for any reason,
             this system is not partaking in the relevant
             Designated Intermediate System election process,
            then the value returned is the zero-length OCTET STRING." 0"{ISIS.aoi l2DesignatedIntermediateSystem (75)}"                     �"This value is multiplied by the corresponding HelloTimer,
             and the result in seconds (rounded up) is used as the
            holding time in transmitted hellos, to be used by
            receivers of hello packets from this IS."  "{ISIS.aoi iSISHelloTimer (45)}"                    �"Maximum period, in milliseconds, between IIH PDUs
             on multiaccess networks at this level for LANs.
            The value at L1 is used as the period between
            Hellos on L1L2 point-to-point circuits. Setting
            this value at level 2 on an L1L2 point-to-point
             circuit will result in an error of InconsistentValue.
            This object follows the ResettingTimer behavior."  "{ISIS.aoi iSISHelloTimer (45)}"                     �"Period, in milliseconds, between Hello PDUs on
             multiaccess networks when this IS is the Designated
             Intermediate System.  This object follows the
            ResettingTimer behavior."  "{ISIS.aoi iSISHelloTimer (45)}"                     w"Minimal interval of time, in milliseconds, between
             transmissions of LSPs on an interface at this level." 8"{ISIS.aoi minimumBroadcastLSPTransmissionInterval (5)}"                    M"Minimum interval, in seconds, between re-transmission of
            an LSP at this level. This object follows the
            ResettingTimer behavior.
             Note that isisCircLevelLSPThrottle controls
            how fast we send back-to-back LSPs. This variable
             controls how fast we re-send the same LSP." /"{ISIS.aoi minimumLSPTransmissionInterval (5)}"                    "Interval of time, in seconds, between periodic
             transmission of a complete set of CSNPs on
             multiaccess networks if this router is the
            designated router at this level.
            This object follows the ResettingTimer behavior." $"{ISIS.aoi completeSNPInterval (8)}"                     �"Minimum interval, in seconds, between sending Partial
            Sequence Number PDUs at this level. This object
            follows the ResettingTimer behavior." $"{ISIS.aoi partialSNPInterval (14)}"                         4"System-wide counters for this Intermediate System."                       "System-wide IS-IS counters."                       &"The level that this entry describes."                      "Number of corrupted in-memory LSPs detected.
             LSPs received from the wire with a bad checksum
            are silently dropped and are not counted.
            LSPs received from the wire with parse errors
            are counted by isisSysStatLSPErrors." '"{ISIS.aoi corruptedLSPsDetected (19)}"                     c"The number of authentication type mismatches recognized
            by this Intermediate System."                       `"The number of authentication key failures recognized
            by this Intermediate System."                       G"Number of times the LSP database has become
             overloaded." ("{ISIS.aoi lSPL1DatabaseOverloads (20)}"                     P"Number of times a manual address has been dropped from
             the area." 0"{ISIS.aoi manualAddressesDroppedFromArea (21)}"                     ["Number of times the IS has attempted to exceed the
             maximum sequence number." 7"{ISIS.aoi attemptsToExceedmaximumSequenceNumber (22)}"                     6"Number of times a sequence number skip has occurred." %"{ISIS.aoi sequenceNumberSkips (23)}"                     j"Number of times a zero-aged copy of the system's own LSP
             is received from some other node." "{ISIS.aoi ownLSPPurges (24)}"                     ~"Number of times a PDU is received with a different value
            for ID field length from that of the receiving system." )"{ISIS.aoi iDFieldLengthMismatches (25)}"                     "Partition changes."                       +"Number of times we ran SPF at this level."                       ."Number of LSPs with errors we have received."                       F"Circuit specific counters for this
            Intermediate System."                       k"An isisCircuitCounterEntry exists for each circuit
             used by Integrated IS-IS on this system."                      "What type of circuit saw these counts?
            The point-to-point Hello PDU includes
             both L1 and L2, and ISs form a single
            adjacency on point-to-point links.
            Thus, we combine counts on
            point-to-point links into one group."                       ["The number of times an adjacency state change has
             occurred on this circuit." )"{ISIS.aoi changesInAdjacencyState (40)}"                     ,"The number of adjacencies on this circuit." )"{ISIS.aoi changesInAdjacencyState (40)}"                     �"The number of times initialization of this circuit has
            failed. This counts events such as PPP NCP failures.
            Failures to form an adjacency are counted by
            isisCircRejAdjs."                       S"The number of times an adjacency has been rejected on
             this circuit." %"{ISIS.aoi rejectedAdjacencies (42)}"                     �"The number of times an IS-IS control PDU with an ID
            field length different from that for this system has been
             received." )"{ISIS.aoi iDFieldLengthMismatches (25)}"                     �"The number of times an IS-IS control PDU with a
            max area address field different from that for this
             system has been received." )"{ISIS.aoi iDFieldLengthMismatches (25)}"                     �"The number of times an IS-IS control PDU with
            an auth type field different from that for this
             system has been received."                       �"The number of times an IS-IS control PDU with
             the correct auth type has failed to pass authentication
             validation."                       �"The number of times the Designated IS has changed
             on this circuit at this level.  If the circuit is
             point to point, this count is zero."                       e"Information about IS-IS protocol traffic at one level
             on one circuit in one direction"                       g"Information about IS-IS protocol traffic at one level,
            on one circuit, in one direction."                       :"The level at which these PDU counts have been collected."                       *"Were we sending or receiving these PDUs?"                       �"The number of IS-IS Hello PDUs seen in this
             direction at this level.
             Point-to-Point IIH PDUs are counted at
            the lowest enabled level: at L1 on L1 or L1L2 circuits,
            and at L2 otherwise." %"{ISIS.aoi iSISControlPDUsSent (43)}"                     �"The number of ES-IS Hello PDUs seen in this
             direction.  ISH PDUs are counted at the
             lowest enabled level: at L1 on L1 or L1L2
             circuits, and at L2 otherwise."                       �"The number of ES Hello PDUs seen in this
             direction.  ESH PDUs are counted at the
             lowest enabled level: at L1 on L1 or L1L2
             circuits, and at L2 otherwise."                       N"The number of IS-IS LSPs seen in this
             direction at this level." %"{ISIS.aoi iSISControlPDUsSent (43)}"                     O"The number of IS-IS CSNPs seen in this
             direction at this level." %"{ISIS.aoi iSISControlPDUsSent (43)}"                     O"The number of IS-IS PSNPs seen in this
             direction at this level." %"{ISIS.aoi iSISControlPDUsSent (43)}"                     D"The number of unknown IS-IS PDUs seen
             at this level." %"{ISIS.aoi iSISControlPDUsSent (43)}"                         3"The table of adjacencies to Intermediate Systems."                       �"Each entry corresponds to one adjacency to an
        Intermediate System on this system.
        Dynamically learned rows do not survive an agent reboot."                       �"A unique value identifying the IS adjacency from all
             other such adjacencies on this circuit. This value is
            automatically assigned by the system when the adjacency
            is created."                       "The state of the adjacency."  "{ISIS.aoi adjacencyState (78)}"                     �"The 3Way state of the adjacency.  These are picked
             to match the historical on-the-wire representation
            of the 3Way state and are not intended to match
             isisISAdjState." "{ RFC 3373 }"                     -"The SNPA address of the neighboring system." &"{ISIS.aoi neighbourSNPAAddress (79)}"                     %"The type of the neighboring system." %"{ISIS.aoi neighbourSystemType (80)}"                     E"The system ID of the neighboring Intermediate
             System." $"{ISIS.aoi neighbourSystemIds (83)}"                     f"The 4-byte Extended Circuit ID learned from the
             Neighbor during 3-way handshake, or 0."                       �"How is the adjacency used?  On a point-to-point link,
             this might be level1and2, but on a LAN, the usage will
            be level1 on the adjacency between peers at L1,
            and level2 for the adjacency between peers at L2."  "{ISIS.aoi adjacencyUsage (82)}"                     �"The holding time, in seconds, for this adjacency.
             This value is based on received IIH PDUs and
             the elapsed time since receipt." "{ISIS.aoi holdingTimer (85)}"                     p"Priority of the neighboring Intermediate System for
             becoming the Designated Intermediate System." "{ISIS.aoi lANPriority (86)}"                    "When the adjacency most recently entered the state 'up',
            measured in hundredths of a second since the last
            re-initialization of the network management subsystem.
            Holds 0 if the adjacency has never been in state 'up'."                       �"This table contains the set of Area Addresses of
             neighboring Intermediate Systems as reported in received
             IIH PDUs." *"{ISIS.aoi areaAddressesOfNeighbour (84)}"                     �"Each entry contains one Area Address reported by a
            neighboring Intermediate System in its IIH PDUs.
            Dynamically learned rows do not survive an agent reboot."                       u"An index for the areas associated with one neighbor.
                This provides a simple way to walk the table."                       T"One Area Address as reported in IIH PDUs received from
             the neighbor."                       �"This table contains the set of IP Addresses of
             neighboring Intermediate Systems as reported in received
             IIH PDUs."                       �"Each entry contains one IP Address reported by a
            neighboring Intermediate System in its IIH PDUs.
            Dynamically learned rows do not survive an agent reboot."                       d"An index to this table that identifies the IP addresses
             to which this entry belongs."                       ^"The type of one IP Address as reported in IIH PDUs
             received from the neighbor."                       �"One IP Address as reported in IIH PDUs received from the
            neighbor.
            The type of this address is determined by the value of
            the isisISAdjIPAddrType object."                       �"This table contains the set of protocols supported by
             neighboring Intermediate Systems as reported in received
             IIH PDUs."                       �"Each entry contains one protocol supported by a
             neighboring Intermediate System as reported in its IIH
        PDUs.
        Dynamically learned rows do not survive an agent reboot."                       Z"One supported protocol as reported in IIH PDUs received
             from the neighbor."                           N"The table of Reachable Addresses to NSAPs or Address
             Prefixes."                       �"Each entry defines a configured Reachable Address
            to an NSAP or Address Prefix.
            Dynamically created rows MUST survive an agent reboot."                       �"The identifier for this isisRAEntry. This value must be
             unique amongst all Reachable Addresses on the same parent
            Circuit."                      #"The existence state of this Reachable Address. This
            object follows the ManualOrAutomatic behaviors. Support
            for 'createAndWait' and 'notInService' is not required.
            A row entry cannot be modified when the value of this
            object is 'active'."                       n"The administrative state of the Reachable Address. This
    object follows the ManualOrAutomatic behaviors."                       �"The destination of this Reachable Address. This is an
             Address Prefix. This object follows the
            ReplaceOnlyWhileDisabled and ManualOrAutomatic
             behaviors." "{ISIS.aoi addressPrefix (98)}"                    �"The type of mapping to be employed to ascertain the SNPA
            Address that should be used in forwarding PDUs for this
             Reachable Address prefix. This object follows the
             ManualOrAutomatic behavior. The following values of
             mapping type are defined:
                 none: The mapping is null because the neighbor SNPA is
            implicit by nature of the subnetwork (e.g., a
                       point-to-point linkage).
                 explicit: The subnetwork addresses in the object
            isisRASNPAAddress are to be used.
                 extractIDI: The SNPA is embedded in the IDI of
                       the destination NSAP Address. The mapping
                       algorithm extracts the SNPA to be used
                       according to the format and encoding rules of
                       ISO8473/Add2. This SNPA extraction algorithm can
                       be used in conjunction with Reachable Address
            prefixes from the X.121, F.69, E.163, and E.164
                       addressing subdomains.
                 extractDSP: All, or a suffix, of the SNPA is embedded
                       in the DSP of the destination address. This SNPA
                       extraction algorithm extracts the embedded
                       subnetwork addressing information by performing a
            logical AND of the isisRASNPAMask object value
            with the destination address. The part of the
            SNPA extracted from the destination NSAP is
            appended to the isisRASNPAPrefix object value to
            form the next hop subnetwork addressing
            information." '"{ISO10589-ISIS.aoi mappingType (107)}"                     �"The metric value for reaching the specified
             prefix over this circuit. This object follows the
             ManualOrAutomatic behavior." "{ISIS.aoi DefaultMetric (99)}"                     �"Indicates whether the metric is internal or
             external. This object follows the ManualOrAutomatic
             behavior." $"{ISIS.aoi DefaultMetricType (103)}"                     �"The SNPA Address to which a PDU may be forwarded in
            order to reach a destination that matches the address
             prefix of the Reachable Address. This object follows the
             ManualOrAutomatic behavior."  "{ISIS.aoi sNPAAddresses (109)}"                 P-- Note only one address may be specified per Reachable Address
-- in the MIB
  Y"A bit mask with 1 bit indicating the positions in the
             effective destination address from which embedded SNPA
            information is to be extracted. For the extraction, the
             first octet of the isisRASNPAMask object value is aligned
             with the first octet (AFI) of the NSAP Address. If the
             isisRASNPAMask object value and NSAP Address are of
             different lengths, the shorter of the two is logically
             padded with zeros before performing the extraction. This
             object follows the ManualOrAutomatic behavior." "{ISIS.aoi sNPAMask (122)}"                    �"A fixed SNPA prefix for use when the isisRAMapType is
             extractDSP. The SNPA Address to use is formed by
             concatenating the fixed SNPA prefix with a variable SNPA
             part that is extracted from the effective destination
             address. For Reachable Address prefixes in which the
            entire SNPA is embedded in the DSP, the SNPA Prefix shall
             be null. This object follows the ManualOrAutomatic
             behavior." "{ISIS.aoi sNPAPrefix (123)}"                    "The type of Reachable address. Those of type
             manual are created by the network manager. Those
             of type automatic are created through propagation
             of routing information from another routing
            protocol (e.g., IDRP). "                           �"The table of IP Reachable Addresses to networks,
            subnetworks, or hosts either manually configured or
             learned from another protocol."                      �"Each entry defines an IP Reachable Address to a network,
            subnetwork, or host.
            Each IP Reachable Address may have multiple entries in the
            table, one for each equal cost path to the reachable
            address.
            Dynamically created rows MUST survive an agent reboot.
            Implementers need to be aware that if the total number
            of elements (octets or sub-identifiers) in
            isisIPRADestr, isisIPRADestPrefixLen, and
            isisIPRANextHopIndex is too great, then OIDs of column
            instances in this table will have more than 128
            subidentifiers and cannot be accessed using SNMPv1,
            SNMPv2c, or SNMPv3."                       ("The type of this IP Reachable Address."                       �"The destination of this IP Reachable Address. This is
            a network address, subnetwork address, or host
            address.
            The type of this address is determined by the value of
            the isisIPRADestType object."                      g"The length of the IP Netmask for Reachability Address.
            The values for the index objects isisIPRADest and
            isisIPRADestPrefixLen must be consistent. When the value
            of isisIPRADest (excluding the zone index, if one
            is present) is x, then the bitwise logical-AND
            of x with the value of the mask formed from the
            corresponding index object isisIPRADestPrefixLen MUST be
            equal to x. If not, then the index pair is not
            consistent, and an inconsistentName error must be
            returned on SET or CREATE requests."                       v"Index of next hop. Used when there are multiple Equal
        Cost Multipath alternatives for the same destination."                       &"The type of the IP next hop address."                       �"The IP next hop to this destination.
            The type of this address is determined by the value of
            the isisIPRANextHopType object."                      <"The type of this IP Reachable Address. Those of type
             manual are created by the network manager. Those of type
             automatic are created through propagation of routing
             information from another routing protocol.  This object
             follows the ManualOrAutomatic behavior."                      ="The state of this IP Reachable Address. This object
             follows the ExistenceState and ManualOrAutomatic
            behaviors. Support for 'createAndWait' and
            'notInService' is not required.
            A row entry cannot be modified when the value of this
            object is 'active'."                       �"The administrative state of the IP Reachable Address. This
            object follows the IsisAdminState and ManualOrAutomatic
             behaviors."                       �"The metric value for reaching the specified
             destination over this circuit. This object follows the
             ManualOrAutomatic behavior."                       �"Indicates whether the metric is internal or
             external. This object follows the ManualOrAutomatic
             behavior."                       �"The wide metric value for reaching the specified
             destination over this circuit. This object follows the
             ManualOrAutomatic behavior."                       �"The SNPA Address to which a PDU may be forwarded in
            order to reach a destination that matches this IP
             Reachable Address. This object follows the
             ManualOrAutomatic behavior."                       "The origin of this route."                           "The table of LSP Headers."                       �"Each entry provides a summary describing an
            LSP currently stored in the system.
            Dynamically learned rows will not survive an
            agent reboot."                       &"At which level does this LSP appear?"                       ,"The 8-byte LSP ID for this Link State PDU."                       #"The sequence number for this LSP."                       *"Is this LSP being purged by this system?"                       ,"The 16-bit Fletcher Checksum for this LSP."                       3"The remaining lifetime, in seconds, for this LSP."                       "The length of this LSP."                       "Flags carried by the LSP."                       $"The table of LSPs in the database."                       �"Each entry describes a TLV within
            an LSP currently stored in the system.
            Dynamically learned rows will not survive an
            agent reboot."                       n"The index of this TLV in the LSP. The first TLV has
            index 1, and the Nth TLV has an index of N."                       #"The sequence number for this LSP."                       ,"The 16-bit Fletcher Checksum for this LSP."                       "The type of this TLV."                       "The length of this TLV."                       "The value of this TLV."                               )"The system level for this notification."                       L"The identifier of this circuit relevant to
            this notification."                       J"An Octet String that uniquely identifies
             a Link State PDU."                       V"Holds up to 64 initial bytes of a PDU that
             triggered the notification."                       9"Holds the System ID length reported in PDU we received."                       J"Holds the Max Area Addresses reported in a PDU
            we received."                       9"Holds the Protocol version reported in PDU we received."                       M"Holds the size of LSP we received that is too
             big to forward."                       �"Holds the size of isisSysLevelOrigLSPBuffSize advertised
            by the peer in the originatingLSPBufferSize TLV.
            If the peer does not advertise this TLV, this
            value is set to 0."                       +"Holds the size of LSP received from peer."                       Z"The list of protocols supported by an
             adjacent system.  This may be empty."                       $"The current state of an adjacency."                       �"An offset to a problem in a PDU. If the problem
            is a malformed TLV, this points to the beginning
            of the TLV. If the problem is in the header, this
            points to the byte that is suspicious."                       "The type for a malformed TLV."                       "An Area Address."                           �"This notification is generated when the system
            enters or leaves the Overload state. The number
            of times this has been generated and cleared is kept
            track of by isisSysStatLSPDbaseOloads."                �"This notification is generated when one of the
            manual areaAddresses assigned to this system is
            ignored when computing routes. The object
            isisNotificationAreaAddress describes the area that
            has been dropped.
            The number of times this event has been generated
            is counted by isisSysStatManAddrDropFromAreas.
            The agent must throttle the generation of
            consecutive isisManualAddressDrops notifications
            so that there is at least a 5-second gap between
            notifications of this type. When notifications
            are throttled, they are dropped, not queued for
            sending at a future time."                �"This notification is generated when we find that
            an LSP that was stored in memory has become
            corrupted. The number of times this has been
            generated is counted by isisSysCorrLSPs.
            We forward an LSP ID. We may have independent
            knowledge of the ID, but in some implementations
            there is a chance that the ID itself will be
            corrupted."                �"When the sequence number on an LSP we generate
            wraps the 32-bit sequence counter, we purge and
            wait to re-announce this information. This
            notification describes that event. Since these
            should not be generated rapidly, we generate
            an event each time this happens.
            While the first 6 bytes of the LSPID are ours,
            the other two contain useful information."                �"A notification sent when we receive a PDU
            with a different value for the System ID Length.
            This notification includes an index to identify
            the circuit where we saw the PDU and the header of
            the PDU, which may help a network manager identify
            the source of the confusion.
            The agent must throttle the generation of
            consecutive isisIDLenMismatch notifications
            so that there is at least a 5-second gap between
            notifications of this type. When notifications
            are throttled, they are dropped, not queued for
            sending at a future time."                x"A notification sent when we receive a PDU
            with a different value for the Maximum Area
            Addresses. This notification includes the
            header of the packet, which may help a
            network manager identify the source of the
            confusion.
            The agent must throttle the generation of
            consecutive isisMaxAreaAddressesMismatch
            notifications so that there is at least a 5-second
            gap between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                *"A notification sent when we receive a PDU
            with our systemID and zero age. This
            notification includes the circuit Index
            and router ID from the LSP, if available,
            which may help a network manager
            identify the source of the confusion."                �"When we receive an LSP with our System ID
            and different contents, we may need to reissue
            the LSP with a higher sequence number.
            We send this notification if we need to increase
            the sequence number by more than one. If two
            Intermediate Systems are configured with the same
            System ID, this notification will fire."                _"A notification sent when we receive a PDU
            with the wrong authentication type field.
            This notification includes the header of the
            packet, which may help a network manager
            identify the source of the confusion.
            The agent must throttle the generation of
            consecutive isisAuthenticationTypeFailure
            notifications so that there is at least a 5-second
            gap between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                e"A notification sent when we receive a PDU
            with an incorrect authentication information
            field. This notification includes the header
            of the packet, which may help a network manager
            identify the source of the confusion.
            The agent must throttle the generation of
            consecutive isisAuthenticationFailure
            notifications so that there is at least a 5-second
            gap between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                r"A notification sent when we receive a Hello
            PDU from an IS running a different version
            of the protocol. This notification includes
            the header of the packet, which may help a
            network manager identify the source of the
            confusion.
            The agent must throttle the generation of
            consecutive isisVersionSkew notifications
            so that there is at least a 5-second gap
            between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                l"A notification sent when we receive a Hello
            PDU from an IS that does not share any
            area address. This notification includes
            the header of the packet, which may help a
            network manager identify the source of the
            confusion.
            The agent must throttle the generation of
            consecutive isisAreaMismatch notifications
            so that there is at least a 5-second gap
            between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                �"A notification sent when we receive a Hello
            PDU from an IS but do not establish an
            adjacency for some reason.
            The agent must throttle the generation of
            consecutive isisRejectedAdjacency notifications
            so that there is at least a 5-second gap
            between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                �"A notification sent when we attempt to propagate
            an LSP that is larger than the dataLinkBlockSize
            for the circuit.
            The agent must throttle the generation of
            consecutive isisLSPTooLargeToPropagate notifications
            so that there is at least a 5-second gap
            between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                Y"A notification sent when a Level 1 LSP or Level
            2 LSP is received that is larger than the local
            value for isisSysLevelOrigLSPBuffSize, or when an
            LSP is received that contains the supported Buffer Size
            option and the value in the PDU option field does
            not match the local value for isisSysLevelOrigLSPBuffSize.
            We pass up the size from the option field and the
            size of the LSP when one of them exceeds our configuration.
            The agent must throttle the generation of
            consecutive isisOrigLSPBuffSizeMismatch notifications
            so that there is at least a 5-second gap
            between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                "A notification sent when a non-pseudonode
            segment 0 LSP is received that has no matching
            protocols supported. This may be because the system
            does not generate the field, or because there are no
            common elements. The list of protocols supported
            should be included in the notification: it may be
            empty if the TLV is not supported, or if the
            TLV is empty.
            The agent must throttle the generation of
            consecutive isisProtocolsSupportedMismatch
            notifications so that there is at least a 5-second
            gap between notifications of this type. When
            notifications are throttled, they are dropped, not
            queued for sending at a future time."                "A notification sent when an adjacency changes
            state, entering or leaving state up.
            The first 6 bytes of the isisPduLspId are the
            SystemID of the adjacent IS.
            The isisAdjState is the new state of the adjacency."                �"This notification is generated when we receive
            an LSP with a parse error. The isisCircIfIndex
            holds an index of the circuit on which the PDU
            arrived. The isisPduFragment holds the start of the
            LSP, and the isisErrorOffset points to the problem.
            If the problem is a malformed TLV, isisErrorOffset
            points to the start of the TLV, and isisErrorTLVType
            holds the value of the type.
            If the problem is with the LSP header, isisErrorOffset
            points to the suspicious byte.
            The number of such LSPs is accumulated in
            isisSysStatLSPErrors."                        4"The compliance statement for agents that support
            the IS-IS MIB.
            There are a number of INDEX objects that cannot be
            represented in the form of OBJECT clauses in SMIv2,
            but for which there are compliance requirements.
            Those requirements and similar requirements for
            related objects are expressed below, in
            pseudo-OBJECT clause form, in this description:
            -- OBJECT isisSummAddressType
            -- SYNTAX InetAddressType { ipv4(1), ipv6(2) }
            --
            -- DESCRIPTION
            -- The MIB requires support for IPv4 Summary
            -- Addresses and anticipates the support of
            -- IPv6 addresses.
            --
            --
            -- OBJECT isisRedistributeAddrType
            -- SYNTAX InetAddressType { ipv4(1), ipv6(2) }
            --
            -- DESCRIPTION
            -- The MIB requires support for IPv4
            -- Redistribution Addresses and anticipates
            -- the support of IPv6 addresses."              :"The compliance statement for agents that fully
            support the IS-IS MIB.
            There are a number of INDEX objects that cannot be
            represented in the form of OBJECT clauses in SMIv2,
            but for which there are compliance requirements.
            Those requirements and similar requirements for
            related objects are expressed below, in
            pseudo-OBJECT clause form, in this description:
            -- OBJECT isisSummAddressType
            -- SYNTAX InetAddressType { ipv4(1), ipv6(2) }
            --
            -- DESCRIPTION
            -- The MIB requires support for IPv4 Summary
            -- Addresses and anticipates the support of
            -- IPv6 addresses.
            --
            --
            -- OBJECT isisRedistributeAddrType
            -- SYNTAX InetAddressType { ipv4(1), ipv6(2) }
            --
            -- DESCRIPTION
            -- The MIB requires support for IPv4
            -- Redistribution Addresses and anticipates
            -- the support of IPv6 addresses."               �"When this MIB is implemented without support for
        read-create (i.e., in read-only mode), the
        implementation can claim read-only compliance. Such
        a device can then be monitored but cannot be
        configured with this MIB."   "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required."                 C"The collections of objects used to manage an
		    IS-IS router."                 F"The collections of objects used to describe an
		    IS-IS Circuit."                 F"The collections of objects used to manage an
		    IS-IS Adjacency."                 5"The objects used to record notification parameters."                 1"The collections of notifications sent by an IS."                     9"The collections of objects used to count protocol PDUs."                 N"The collections of objects used to manage the
	    reachable NSAP prefixes."                 K"The collections of objects used to manage configured
		    IP addresses."                 E"The collections of objects used to observe the LSP
		    Database."                    