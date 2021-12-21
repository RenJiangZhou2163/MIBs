    �"This is an octet string that can be used as a table
        index in cases where a large addressable space is
        required such as on an LSR where many applications
        may be provisioning labels.

        Note that the string containing the single octet with
        the value 0x00 is a reserved value used to represent
        special cases. When this TEXTUAL-CONVENTION is used
        as the SYNTAX of an object, the DESCRIPTION clause
        MUST specify if this special value is valid and if so
        what the special meaning is.

        In systems that provide write access to the MPLS-LSR-STD
        MIB, mplsIndexType SHOULD be used as a simple multi-digit
        integer encoded as an octet string.
        No further overloading of the meaning of an index SHOULD
        be made.

        In systems that do not offer write access to the MPLS-LSR-STD
        MIB, the mplsIndexType may contain implicit formatting that is
        specific to the implementation to convey additional
        information such as interface index, physical card or
        device, or application id. The interpretation of this
        additional formatting is implementation dependent and
        not covered in this document. Such formatting MUST



        NOT impact the basic functionality of read-only access
        to the MPLS-LSR-STD MIB by management applications that are
        not aware of the formatting rules."              �"When a MIB module is used for configuration, an object with
        this SYNTAX always contains a legal value (a non-zero-length
        string) for an index that is not currently used in the relevant
        table. The Command Generator (Network Management Application)
        reads this variable and uses the (non-zero-length string)
        value read when creating a new row with an SNMP SET.

        When the SET is performed, the Command Responder (agent) must
        determine whether the value is indeed still unused; Two Network
        Management Applications may attempt to create a row
        (configuration entry) simultaneously and use the same value. If
        it is currently unused, the SET succeeds and the Command
        Responder (agent) changes the value of this object, according
        to an implementation-specific algorithm.  If the value is in
        use, however, the SET fails.  The Network Management
        Application must then re-read this variable to obtain a new
        usable value.

        Note that the string containing the single octet with
        the value 0x00 is a reserved value used to represent
        the special case where no additional indexes can be
        provisioned, or in systems that do not offer
        write access, objects defined using this TEXTUAL-CONVENTION
        MUST return the string containing the single
        octet with the value 0x00."                                                                                                                "This MIB module contains managed object definitions for
        the Multiprotocol Label Switching (MPLS) Router as



        defined in: Rosen, E., Viswanathan, A., and R.
        Callon, Multiprotocol Label Switching Architecture,
        RFC 3031, January 2001.

        Copyright (C) The Internet Society (2004). The
        initial version of this MIB module was published
        in RFC 3812. For full legal notices see the RFC
        itself or see:
        http://www.ietf.org/copyrights/ianamib.html"�"        Cheenu Srinivasan
                Bloomberg L.P.
        Email:  cheenu@bloomberg.net

                Arun Viswanathan
                Force10 Networks, Inc.
        Email:  arunv@force10networks.com

                Thomas D. Nadeau
                Cisco Systems, Inc.
        Email:  tnadeau@cisco.com

        Comments about this document should be emailed
        directly to the MPLS working group mailing list at
        mpls@uu.net." "200406030000Z" 2"Initial revision, published as part of RFC 3813."       -- June 3, 2004
          Z"This notification is generated when the
        mplsXCOperStatus object for one or more contiguous
        entries in mplsXCTable are about to enter the up(1)
        state from some other state. The included values of
        mplsXCOperStatus MUST both be set equal to this
        new state (i.e: up(1)).  The two instances of
        mplsXCOperStatus in this notification indicate the range
        of indexes that are affected.  Note that all the indexes
        of the two ends of the range can be derived from the
        instance identifiers of these two objects.  For
        cases where a contiguous range of cross-connects
        have transitioned into the up(1) state at roughly
        the same time, the device SHOULD issue a single
        notification for each range of contiguous indexes in
        an effort to minimize the emission of a large number
        of notifications.  If a notification has to be
        issued for just a single cross-connect entry, then
        the instance identifier (and values) of the two
        mplsXCOperStatus objects MUST be the identical."                W"This notification is generated when the
        mplsXCOperStatus object for one or more contiguous
        entries in mplsXCTable are about to enter the
        down(2) state from some other state. The included values



        of mplsXCOperStatus MUST both be set equal to this
        down(2) state.  The two instances of mplsXCOperStatus
        in this notification indicate the range of indexes
        that are affected.  Note that all the indexes of the
        two ends of the range can be derived from the
        instance identifiers of these two objects.  For
        cases where a contiguous range of cross-connects
        have transitioned into the down(2) state at roughly
        the same time, the device SHOULD issue a single
        notification for each range of contiguous indexes in
        an effort to minimize the emission of a large number
        of notifications.  If a notification has to be
        issued for just a single cross-connect entry, then
        the instance identifier (and values) of the two
        mplsXCOperStatus objects MUST be identical."                     Y"This table specifies per-interface MPLS capability
        and associated information."                      �"A conceptual row in this table is created
        automatically by an LSR for every interface capable
        of supporting MPLS and which is configured to do so.
        A conceptual row in this table will exist if and only if
        a corresponding entry in ifTable exists with ifType =
        mpls(166). If this associated entry in ifTable is
        operationally disabled (thus removing MPLS
        capabilities on that interface), the corresponding
        entry in this table MUST be deleted shortly thereafter.
        An conceptual row with index 0 is created if the LSR
        supports per-platform labels. This conceptual row
        represents the per-platform label space and contains
        parameters that apply to all interfaces that participate
        in the per-platform label space. Other conceptual rows
        in this table represent MPLS interfaces that may
        participate in either the per-platform or per-
        interface label spaces, or both.  Implementations
        that either only support per-platform labels,
        or have only them configured, may choose to return
        just the mplsInterfaceEntry of 0 and not return
        the other rows. This will greatly reduce the number
        of objects returned. Further information about label
        space participation of an interface is provided in
        the DESCRIPTION clause of
        mplsInterfaceLabelParticipationType."                      U"This is a unique index for an entry in the
        MplsInterfaceTable.  A non-zero index for an
        entry indicates the ifIndex for the corresponding
        interface entry of the MPLS-layer in the ifTable.
        The entry with index 0 represents the per-platform
        label space and contains parameters that apply to all
        interfaces that participate in the per-platform label
        space. Other entries defined in this table represent
        additional MPLS interfaces that may participate in either
        the per-platform or per-interface label spaces, or both." ]"RFC 2863 - The Interfaces Group MIB, McCloghrie, K.,
        and F. Kastenholtz, June 2000"                     l"This is the minimum value of an MPLS label that this
        LSR is willing to receive on this interface."                       l"This is the maximum value of an MPLS label that this
        LSR is willing to receive on this interface."                       o"This is the minimum value of an MPLS label that this



        LSR is willing to send on this interface."                       i"This is the maximum value of an MPLS label that this
        LSR is willing to send on this interface."                      L"This value indicates the total amount of usable
        bandwidth on this interface and is specified in
        kilobits per second (Kbps).  This variable is not
        applicable when applied to the interface with index
        0. When this value cannot be measured, this value
        should contain the nominal bandwidth."                      "This value indicates the total amount of available
        bandwidth available on this interface and is
        specified in kilobits per second (Kbps).  This value
        is calculated as the difference between the amount
        of bandwidth currently in use and that specified in
        mplsInterfaceTotalBandwidth.  This variable is not
        applicable when applied to the interface with index
        0. When this value cannot be measured, this value
        should contain the nominal bandwidth."                      �"If the value of the mplsInterfaceIndex for this
        entry is zero, then this entry corresponds to the
        per-platform label space for all interfaces configured
        to use that label space. In this case the perPlatform(0)
        bit MUST be set; the perInterface(1) bit is meaningless
        and MUST be ignored.

        The remainder of this description applies to entries
        with a non-zero value of mplsInterfaceIndex.

        If the perInterface(1) bit is set then the value of
        mplsInterfaceLabelMinIn, mplsInterfaceLabelMaxIn,
        mplsInterfaceLabelMinOut, and
        mplsInterfaceLabelMaxOut for this entry reflect the
        label ranges for this interface.

        If only the perPlatform(0) bit is set, then the value of
        mplsInterfaceLabelMinIn, mplsInterfaceLabelMaxIn,
        mplsInterfaceLabelMinOut, and
        mplsInterfaceLabelMaxOut for this entry MUST be
        identical to the instance of these objects with
        index 0.  These objects may only vary from the entry
        with index 0 if both the perPlatform(0) and perInterface(1)
        bits are set.

        In all cases, at a minimum one of the perPlatform(0) or
        perInterface(1) bits MUST be set to indicate that
        at least one label space is in use by this interface. In
        all cases, agents MUST ensure that label ranges are
        specified consistently and MUST return an
        inconsistentValue error when they do not." �"Rosen, E., Viswanathan, A., and R. Callon,
        Multiprotocol Label Switching Architecture, RFC
        3031, January 2001."                     U"This table provides MPLS performance information on
        a per-interface basis."                      A"An entry in this table is created by the LSR for
        every interface capable of supporting MPLS.  Its is
        an extension to the mplsInterfaceEntry table.
        Note that the discontinuity behavior of entries in
        this table MUST be based on the corresponding
        ifEntry's ifDiscontinuityTime."                      2"This object counts the number of labels that are in
        use at this point in time on this interface in the
        incoming direction. If the interface participates in
        only the per-platform label space, then the value of
        the instance of this object MUST be identical to
        the value of the instance with index 0. If the
        interface participates in the per-interface label
        space, then the instance of this object MUST
        represent the number of per-interface labels that
        are in use on this interface."                      F"This object counts the number of labeled packets
        that have been received on this interface and which
        were discarded because there was no matching cross-
        connect entry. This object MUST count on a per-
        interface basis regardless of which label space the
        interface participates in."                      "This object counts the number of top-most labels in
        the outgoing label stacks that are in use at this
        point in time on this interface. This object MUST
        count on a per-interface basis regardless of which
        label space the interface participates in."                      "This object counts the number of outgoing MPLS
        packets that required fragmentation before
        transmission on this interface. This object MUST
        count on a per-interface basis regardless of which
        label space the interface participates in."                      �"This object contains the next available value to
        be used for mplsInSegmentIndex when creating entries
        in the mplsInSegmentTable. The special value of a
        string containing the single octet 0x00 indicates
        that no new entries can be created in this table.
        Agents not allowing managers to create entries



        in this table MUST set this object to this special
        value."                      R"This table contains a description of the incoming MPLS
        segments (labels) to an LSR and their associated parameters.
        The index for this table is mplsInSegmentIndex.
        The index structure of this table is specifically designed
        to handle many different MPLS implementations that manage
        their labels both in a distributed and centralized manner.
        The table is also designed to handle existing MPLS labels
        as defined in RFC3031 as well as longer ones that may
        be necessary in the future.

        In cases where the label cannot fit into the
        mplsInSegmentLabel object, the mplsInSegmentLabelPtr
        will indicate this by being set to the first accessible
        column in the appropriate extension table's row.
        In this case an additional table MUST
        be provided and MUST be indexed by at least the indexes
        used by this table. In all other cases when the label is
        represented within the mplsInSegmentLabel object, the
        mplsInSegmentLabelPtr MUST be set to 0.0. Due to the
        fact that MPLS labels may not exceed 24 bits, the
        mplsInSegmentLabelPtr object is only a provision for
        future-proofing the MIB module. Thus, the definition
        of any extension tables is beyond the scope of this
        MIB module."                      �"An entry in this table represents one incoming
        segment as is represented in an LSR's LFIB.
        An entry can be created by a network
        administrator or an SNMP agent, or an MPLS signaling
        protocol.  The creator of the entry is denoted by
        mplsInSegmentOwner.




        The value of mplsInSegmentRowStatus cannot be active(1)
        unless the ifTable entry corresponding to
        mplsInSegmentInterface exists.  An entry in this table
        must match any incoming packets, and indicates an
        instance of mplsXCEntry based on which forwarding
        and/or switching actions are taken."                       |"The index for this in-segment. The
        string containing the single octet 0x00
        MUST not be used as an index."                      {"This object represents the
        interface index for the incoming MPLS interface.  A
        value of zero represents all interfaces participating in
        the per-platform label space.  This may only be used
        in cases where the incoming interface and label
        are associated with the same mplsXCEntry. Specifically,
        given a label and any incoming interface pair from the
        per-platform label space, the outgoing label/interface
        mapping remains the same. If this is not the case,
        then individual entries MUST exist that



        can then be mapped to unique mplsXCEntries."                       �"If the corresponding instance of mplsInSegmentLabelPtr is
      zeroDotZero then this object MUST contain the incoming label
      associated with this in-segment. If not this object SHOULD
      be zero and MUST be ignored."                      �"If the label for this segment cannot be represented
        fully within the mplsInSegmentLabel object,
        this object MUST point to the first accessible
        column of a conceptual row in an external table containing
        the label.  In this case, the mplsInSegmentTopLabel
        object SHOULD be set to 0 and ignored. This object MUST
        be set to zeroDotZero otherwise."                      �"The number of labels to pop from the incoming
        packet.  Normally only the top label is popped from
        the packet and used for all switching decisions for
        that packet.  This is indicated by setting this
        object to the default value of 1. If an LSR supports
        popping of more than one label, this object MUST
        be set to that number. This object cannot be modified
        if mplsInSegmentRowStatus is active(1)."                      �"The IANA address family [IANAFamily] of packets
        received on this segment, which is used at an egress
        LSR to deliver them to the appropriate layer 3 entity.
        A value of other(0) indicates that the family type is
        either unknown or undefined; this SHOULD NOT be used
        at an egress LSR. This object cannot be
        modified if mplsInSegmentRowStatus is active(1)." �"Internet Assigned Numbers Authority (IANA), ADDRESS
        FAMILY NUMBERS, (http://www.iana.org/assignments/
        address-family-numbers), for MIB see:
        http://www.iana.org/assignments/
        ianaaddressfamilynumbers-mib
"                    �"Index into mplsXCTable which identifies which cross-
        connect entry this segment is part of.  The string
        containing the single octet 0x00 indicates that this
        entry is not referred to by any cross-connect entry.
        When a cross-connect entry is created which this
        in-segment is a part of, this object is automatically
        updated to reflect the value of mplsXCIndex of that
        cross-connect entry."                       X"Denotes the entity that created and is responsible
        for managing this segment."                      �"This variable represents a pointer to the traffic
      parameter specification for this in-segment.  This
      value may point at an entry in the
      mplsTunnelResourceTable in the MPLS-TE-STD-MIB (RFC3812)
      to indicate which traffic parameter settings for this
      segment if it represents an LSP used for a TE tunnel.

      This value may optionally point at an
      externally defined traffic parameter specification
      table.  A value of zeroDotZero indicates best-effort
      treatment.  By having the same value of this object,
      two or more segments can indicate resource sharing
      of such things as LSP queue space, etc.

      This object cannot be modified if mplsInSegmentRowStatus
      is active(1).  For entries in this table that
      are preserved after a re-boot, the agent MUST ensure
      that their integrity be preserved, or this object should
      be set to 0.0 if it cannot."                      "This variable is used to create, modify, and/or
        delete a row in this table. When a row in this
        table has a row in the active(1) state, no
        objects in this row can be modified except the
        mplsInSegmentRowStatus and mplsInSegmentStorageType."                      8"This variable indicates the storage type for this
        object. The agent MUST ensure that this object's
        value remains consistent with the associated
        mplsXCEntry. Conceptual rows having the value
        'permanent' need not allow write-access to any
        columnar objects in the row." "See RFC2579."                     \"This table contains statistical information for
        incoming MPLS segments to an LSR."                      �"An entry in this table contains statistical
        information about one incoming segment which is
        configured in the mplsInSegmentTable. The counters
        in this entry should behave in a manner similar to
        that of the interface.
        mplsInSegmentPerfDiscontinuityTime indicates the
        time of the last discontinuity in all of these
        objects."                      !"This value represents the total number of octets
        received by this segment. It MUST be equal to the
        least significant 32 bits of
        mplsInSegmentPerfHCOctets
        if mplsInSegmentPerfHCOctets is supported according to
        the rules spelled out in RFC2863."                       3"Total number of packets received by this segment."                       B"The number of errored packets received on this
        segment."                      4"The number of labeled packets received on this in-
        segment, which were chosen to be discarded even
        though no errors had been detected to prevent their
        being transmitted.  One possible reason for
        discarding such a labeled packet could be to free up
        buffer space."                       �"The total number of octets received.  This is the 64
        bit version of mplsInSegmentPerfOctets,
        if mplsInSegmentPerfHCOctets is supported according to
        the rules spelled out in RFC2863."                      S"The value of sysUpTime on the most recent occasion
        at which any one or more of this segment's Counter32
        or Counter64 suffered a discontinuity. If no such
        discontinuities have occurred since the last re-
        initialization of the local management subsystem,
        then this object contains a zero value."                      �"This object contains the next available value to
        be used for mplsOutSegmentIndex when creating entries
        in the mplsOutSegmentTable. The special value of a
        string containing the single octet 0x00
        indicates that no new entries can be created in this
        table. Agents not allowing managers to create entries
        in this table MUST set this object to this special
        value."                       U"This table contains a representation of the outgoing
        segments from an LSR."                      c"An entry in this table represents one outgoing



        segment.  An entry can be created by a network
        administrator, an SNMP agent, or an MPLS signaling
        protocol.  The object mplsOutSegmentOwner indicates
        the creator of this entry. The value of
        mplsOutSegmentRowStatus cannot be active(1) unless
        the ifTable entry corresponding to
        mplsOutSegmentInterface exists.

        Note that the indexing of this table uses a single,
        arbitrary index (mplsOutSegmentIndex) to indicate
        which out-segment (i.e.: label) is being switched to
        from which in-segment (i.e: label) or in-segments.
        This is necessary because it is possible to have an
        equal-cost multi-path situation where two identical
        out-going labels are assigned to the same
        cross-connect (i.e.: they go to two different neighboring
        LSRs); thus, requiring two out-segments. In order to
        preserve the uniqueness of the references
        by the mplsXCEntry, an arbitrary integer must be used as
        the index for this table."                      g"This value contains a unique index for this row.
        While a value of a string containing the single
        octet 0x00 is not valid as an index for entries
        in this table, it can be supplied as a valid value
        to index the mplsXCTable to represent entries for



        which no out-segment has been configured or
        exists."                      :"This value must contain the interface index of the
        outgoing interface. This object cannot be modified
        if mplsOutSegmentRowStatus is active(1). The
        mplsOutSegmentRowStatus cannot be set to active(1)
        until this object is set to a value corresponding to
        a valid ifEntry."                      �"This value indicates whether or not a top label
        should be pushed onto the outgoing packet's label
        stack.  The value of this variable MUST be set to
        true(1) if the outgoing interface does not support
        pop-and-go (and no label stack remains). For example,
        on ATM interface, or if the segment represents a
        tunnel origination.  Note that it is considered
        an error in the case that mplsOutSegmentPushTopLabel
        is set to false, but the cross-connect entry which
        refers to this out-segment has a non-zero
        mplsLabelStackIndex.  The LSR MUST ensure that this
        situation does not happen. This object cannot be
        modified if mplsOutSegmentRowStatus is active(1)."                      w"If mplsOutSegmentPushTopLabel is true then this
        represents the label that should be pushed onto the
        top of the outgoing packet's label stack. Otherwise
        this value SHOULD be set to 0 by the management
        station and MUST be ignored by the agent. This



        object cannot be modified if mplsOutSegmentRowStatus
        is active(1)."                      �"If the label for this segment cannot be represented
        fully within the mplsOutSegmentLabel object,
        this object MUST point to the first accessible
        column of a conceptual row in an external table containing
        the label.  In this case, the mplsOutSegmentTopLabel
        object SHOULD be set to 0 and ignored. This object
        MUST be set to zeroDotZero otherwise."                      �"Indicates the next hop Internet address type.
        Only values unknown(0), ipv4(1) or ipv6(2)
        have to be supported.

        A value of unknown(0) is allowed only when
        the outgoing interface is of type point-to-point.
        If any other unsupported values are attempted in a set
        operation, the agent MUST return an inconsistentValue
        error." "See RFC3291."                     �"The internet address of the next hop. The type of
        this address is determined by the value of the
        mplslOutSegmentNextHopAddrType object.

        This object cannot be modified if



        mplsOutSegmentRowStatus is active(1)."                      �"Index into mplsXCTable which identifies which cross-
        connect entry this segment is part of.  A value of
        the string containing the single octet 0x00
        indicates that this entry is not referred
        to by any cross-connect entry.  When a cross-connect
        entry is created which this out-segment is a part of,
        this object MUST be updated by the agent to reflect
        the value of mplsXCIndex of that cross-connect
        entry."                       Y"Denotes the entity which created and is responsible
        for managing this segment."                      �"This variable represents a pointer to the traffic
      parameter specification for this out-segment.  This
      value may point at an entry in the
      MplsTunnelResourceEntry in the MPLS-TE-STD-MIB (RFC3812)

      RFC Editor: Please fill in RFC number.

      to indicate which traffic parameter settings for this
      segment if it represents an LSP used for a TE tunnel.

      This value may optionally point at an
      externally defined traffic parameter specification
      table.  A value of zeroDotZero indicates best-effort
      treatment.  By having the same value of this object,
      two or more segments can indicate resource sharing



      of such things as LSP queue space, etc.

      This object cannot be modified if
      mplsOutSegmentRowStatus is active(1).
      For entries in this table that
      are preserved after a re-boot, the agent MUST ensure
      that their integrity be preserved, or this object should
      be set to 0.0 if it cannot."                       �"For creating, modifying, and deleting this row.
        When a row in this table has a row in the active(1)
        state, no objects in this row can be modified
        except the mplsOutSegmentRowStatus or
        mplsOutSegmentStorageType."                      8"This variable indicates the storage type for this
        object. The agent MUST ensure that this object's value
        remains consistent with the associated mplsXCEntry.
        Conceptual rows having the value 'permanent'
        need not allow write-access to any columnar
        objects in the row."                       �"This table contains statistical information about



        outgoing segments from an LSR. The counters in this
        entry should behave in a manner similar to that of
        the interface."                      
"An entry in this table contains statistical
        information about one outgoing segment configured in
        mplsOutSegmentTable. The object
        mplsOutSegmentPerfDiscontinuityTime indicates the
        time of the last discontinuity in these objects. "                      "This value contains the total number of octets sent
        on this segment. It MUST be equal to the least
        significant 32 bits of mplsOutSegmentPerfHCOctets
        if mplsOutSegmentPerfHCOctets is supported according to
        the rules spelled out in RFC2863."                       V"This value contains the total number of packets sent



        on this segment."                       R"Number of packets that could not be sent due to
        errors on this segment."                      F"The number of labeled packets attempted to be transmitted
        on this out-segment, which were chosen to be discarded
        even though no errors had been detected to prevent their
        being transmitted. One possible reason for
        discarding such a labeled packet could be to free up
        buffer space."                       �"Total number of octets sent.  This is the 64 bit
        version of mplsOutSegmentPerfOctets,
        if mplsOutSegmentPerfHCOctets is supported according to
        the rules spelled out in RFC2863."                      S"The value of sysUpTime on the most recent occasion
        at which any one or more of this segment's Counter32
        or Counter64 suffered a discontinuity. If no such
        discontinuities have occurred since the last re-
        initialization of the local management subsystem,
        then this object contains a zero value."                      �"This object contains the next available value to
        be used for mplsXCIndex when creating entries in
        the mplsXCTable. A special value of the zero length
        string indicates that no more new entries can be created
        in the relevant table.  Agents not allowing managers
        to create entries in this table MUST set this value
        to the zero length string."                      A"This table specifies information for switching
        between LSP segments.  It supports point-to-point,
        point-to-multipoint and multipoint-to-point
        connections.  mplsLabelStackTable specifies the
        label stack information for a cross-connect LSR and
        is referred to from mplsXCTable."                      �"A row in this table represents one cross-connect
        entry.  It is indexed by the following objects:

        - cross-connect index mplsXCIndex that uniquely
          identifies a group of cross-connect entries

        - in-segment index, mplsXCInSegmentIndex

        - out-segment index, mplsXCOutSegmentIndex




       LSPs originating at this LSR:
        These are represented by using the special
        of value of mplsXCInSegmentIndex set to the
        string containing a single octet 0x00. In
        this case the mplsXCOutSegmentIndex
        MUST not be the string containing a single
        octet 0x00.

       LSPs terminating at this LSR:
        These are represented by using the special value
        mplsXCOutSegmentIndex set to the string containing
        a single octet 0x00.

       Special labels:
        Entries indexed by the strings containing the
        reserved MPLS label values as a single octet 0x00
        through 0x0f (inclusive) imply LSPs terminating at
        this LSR.  Note that situations where LSPs are
        terminated with incoming label equal to the string
        containing a single octet 0x00 can be distinguished
        from LSPs originating at this LSR because the
        mplsXCOutSegmentIndex equals the string containing the
        single octet 0x00.

        An entry can be created by a network administrator
        or by an SNMP agent as instructed by an MPLS
        signaling protocol."                       �"Primary index for the conceptual row identifying a
        group of cross-connect segments. The string
        containing a single octet 0x00 is an invalid index."                      "Incoming label index.
        If this object is set to the string containing
        a single octet 0x00, this indicates a special
        case outlined in the table's description above.
        In this case no corresponding mplsInSegmentEntry
        shall exist."                      q"Index of out-segment for LSPs not terminating on
        this LSR if not set to the string containing the
        single octet 0x00. If the segment identified by this
        entry is terminating, then this object MUST be set to
        the string containing a single octet 0x00 to indicate
        that no corresponding mplsOutSegmentEntry shall
        exist."                       �"This value identifies the label switched path that
        this cross-connect entry belongs to. This object
        cannot be modified if mplsXCRowStatus is active(1)
        except for this object."                      "Primary index into mplsLabelStackTable identifying a
        stack of labels to be pushed beneath the top label.
        Note that the top label identified by the out-
        segment ensures that all the components of a
        multipoint-to-point connection have the same
        outgoing label. A value of the string containing the
        single octet 0x00 indicates that no labels are to
        be stacked beneath the top label.
        This object cannot be modified if mplsXCRowStatus is
        active(1)."                       ^"Denotes the entity that created and is responsible
        for managing this cross-connect."                       �"For creating, modifying, and deleting this row.
        When a row in this table has a row in the active(1)
        state, no objects in this row except this object
        and the mplsXCStorageType can be modified. "                      �"This variable indicates the storage type for this
        object. The agent MUST ensure that the associated in
        and out segments also have the same StorageType value
        and are restored consistently upon system restart.
        This value SHOULD be set to permanent(4) if created
        as a result of a static LSP configuration.

        Conceptual rows having the value 'permanent'
        need not allow write-access to any columnar
        objects in the row."                       1"The desired operational status of this segment."                       @"The actual operational status of this cross-
        connect."                       0"The maximum stack depth supported by this LSR."                      �"This object contains the next available value to
        be used for mplsLabelStackIndex when creating entries
        in the mplsLabelStackTable. The special string
        containing the single octet 0x00
        indicates that no more new entries can be created
        in the relevant table.  Agents not allowing managers
        to create entries in this table MUST set this value
        to the string containing the single octet 0x00."                       �"This table specifies the label stack to be pushed
        onto a packet, beneath the top label.  Entries into
        this table are referred to from mplsXCTable."                      "An entry in this table represents one label which is
        to be pushed onto an outgoing packet, beneath the
        top label.  An entry can be created by a network
        administrator or by an SNMP agent as instructed by
        an MPLS signaling protocol."                       �"Primary index for this row identifying a stack of
        labels to be pushed on an outgoing packet, beneath
        the top label. An index containing the string with
        a single octet 0x00 MUST not be used."                      b"Secondary index for this row identifying one label
        of the stack.  Note that an entry with a smaller
        mplsLabelStackLabelIndex would refer to a label
        higher up the label stack and would be popped at a
        downstream LSR before a label represented by a
        higher mplsLabelStackLabelIndex at a downstream
        LSR."                       "The label to pushed."                      �"If the label for this segment cannot be represented
        fully within the mplsLabelStackLabel object,
        this object MUST point to the first accessible
        column of a conceptual row in an external table containing
        the label.  In this case, the mplsLabelStackLabel
        object SHOULD be set to 0 and ignored. This object
        MUST be set to zeroDotZero otherwise."                       �"For creating, modifying, and deleting this row.
        When a row in this table has a row in the active(1)
        state, no objects in this row except this object
        and the mplsLabelStackStorageType can be modified."                      V"This variable indicates the storage type for this
        object. This object cannot be modified if
        mplsLabelStackRowStatus is active(1).
        No objects are required to be writable for
        rows in this table with this object set to
        permanent(4).

        The agent MUST ensure that all related entries
        in this table retain the same value for this
        object.  Agents MUST ensure that the storage type
        for all entries related to a particular mplsXCEntry
        retain the same value for this object as the
        mplsXCEntry's StorageType."                      %"This table specifies the mapping from the
        mplsInSegmentIndex to the corresponding
        mplsInSegmentInterface and mplsInSegmentLabel
        objects. The purpose of this table is to
        provide the manager with an alternative
        means by which to locate in-segments."                      ["An entry in this table represents one interface
        and incoming label pair.

        In cases where the label cannot fit into the
        mplsInSegmentLabel object, the mplsInSegmentLabelPtr
        will indicate this by being set to the first accessible
        column in the appropriate extension table's row,
        and the mplsInSegmentLabel SHOULD be set to 0.
        In all other cases when the label is
        represented within the mplsInSegmentLabel object, the
        mplsInSegmentLabelPtr MUST be 0.0.

        Implementors need to be aware that if the value of
        the mplsInSegmentMapLabelPtrIndex (an OID) has more
        that 111 sub-identifiers, then OIDs of column
        instances in this table will have more than 128
        sub-identifiers and cannot be accessed using SNMPv1,
        SNMPv2c, or SNMPv3."                       b"This index contains the same value as the
        mplsInSegmentIndex in the mplsInSegmentTable."                       b"This index contains the same value as the
        mplsInSegmentLabel in the mplsInSegmentTable."                      �"This index contains the same value as the
        mplsInSegmentLabelPtr.

        If the label for the InSegment cannot be represented
        fully within the mplsInSegmentLabel object,
        this index MUST point to the first accessible
        column of a conceptual row in an external table containing
        the label.  In this case, the mplsInSegmentTopLabel
        object SHOULD be set to 0 and ignored. This object MUST
        be set to zeroDotZero otherwise."                      "The mplsInSegmentIndex that corresponds
        to the mplsInSegmentInterface and
        mplsInSegmentLabel, or the mplsInSegmentInterface
        and mplsInSegmentLabelPtr, if applicable.
        The string containing the single octet 0x00
        MUST not be returned."                       �"If this object is set to true(1), then it enables
        the emission of mplsXCUp and mplsXCDown
        notifications; otherwise these notifications are not



        emitted." �"See also RFC3413 for explanation that
        notifications are under the ultimate control of the
        MIB module in this document."                             d"Collection of objects needed for MPLS interface
           and interface performance information."                 G"Collection of objects needed to implement an in-
           segment."                 N"Collection of objects needed to implement an out-



           segment."                 N"Collection of objects needed to implement a
           cross-connect entry."                 \"Collection of objects providing performance
           information
        about an LSR."                 �"Object(s) providing performance information
           specific to out-segments for which the object
           mplsInterfaceInOctets wraps around too quickly."                 �"Object(s) providing performance information
           specific to out-segments for which the object
           mplsInterfaceOutOctets wraps around too
           quickly."                 +"Objects needed to support label stacking."                 >"Set of notifications implemented in this
           module."                         �"Compliance statement for agents that provide full
                support for MPLS-LSR-STD-MIB. Such devices can
                then be monitored and also be configured using
                this MIB module."   �"This group is only mandatory for LSRs that wish to
                support the modification of LSP label stacks.
               ""This group is mandatory for those in-segment entries
                for which the object mplsInSegmentOutOctets wraps
                around too quickly based on the criteria specified in
                RFC 2863 for high-capacity counters.
               "
"This group is mandatory for those out-segment entries
                for which the object mplsOutSegmentPerfOctets wraps
                around too quickly based on the criteria specified in
                RFC 2863 for high-capacity counters.
               " �"This group is only mandatory for those implementations
                which can efficiently implement the notifications
                contained in this group." J"Support for createAndWait and notReady is
                not required." L"Only unknown(0), ipv4(1) and ipv6(2) support
                is required." g"An implementation is only required to support
                unknown(0), ipv4(1) and ipv6(2) sizes." J"Support for createAndWait and notReady is not
                required." J"Support for createAndWait and notReady is not
                required." J"Support for createAndWait and notReady is not
                required."             �"Compliance requirement for implementations that only
                provide read-only support for MPLS-LSR-STD-MIB. Such
                devices can then be monitored but cannot be configured
                using this MIB module.
               "   �"This group is only mandatory for LSRs that wish to
                support the modification of LSP label stacks.
               ""This group is mandatory for those in-segment entries
                for which the object mplsInSegmentOutOctets wraps
                around too quickly based on the criteria specified in
                RFC 2863 for high-capacity counters.
               "
"This group is mandatory for those out-segment entries
                for which the object mplsOutSegmentPerfOctets wraps
                around too quickly based on the criteria specified in
                RFC 2863 for high-capacity counters.
               " �"This group is only mandatory for those implementations
                which can efficiently implement the notifications
                contained in this group.
               " "Write access is not required." "Write access is not required." u"Write access is not required.  This object
                SHOULD be set to 1 if it is read-only.
               " �"Write access is not required.  A value of other(0)
                should be supported because there may be cases where
                the agent may not know about or support any address
                types.
               " "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." |"Write access is not required.  Only unknown(0),
                ipv4(1) and ipv6(2) support is required.
               " �"Write access is not required. An implementation is
                only required to support unknown(0), ipv4(1) and
                ipv6(2) sizes." "Write access is not required." "Write access is not required." "Write access is not required."  "Read only support is required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required."            