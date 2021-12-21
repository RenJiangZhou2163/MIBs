   1"IEEE 802.1Qau clause 32.3.6, 32.4.4, Table 32-1"�"Specifies how to determine what index value is to be used as
        the index to lldpDestAddressTable, the table of destination MAC
        addresses, for both the destination addresses on transmitted
        LLDPDUs and on received LLDPDUs, found in the LLDP-MIB, either:

            cnlNone(1)      No LLDP Congestion Notification TLV is to
                            carry Per-priority CNPV indicators or
                            Per-priority Ready indicators on this Port
                            for this priority (or all Ports and all
                            priorities, as appropriate to the managed
                            object).
            cnlAdmin(2)     The administrative LLDP instance selector
                            in the same table entry as this object
                            governs which LLDP instance will carry the
                            Per-priority CNPV indicators and
                            Per-priority Ready indicators for this
                            priority in its Congestion Notification TLV
                            on this Port (or all Ports and all
                            priorities, as appropriate to the managed
                            object).
            cnlComponent(3) ieee8021CnComPriLldpInstanceSelector governs
                            LLDP instance selection for this Port and
                            priority.
       "             2"IEEE 802.1Qau clauses 32.3.1, 32.4.1, Table 32-2"�"This controls what other object selects the CND defense mode and
        the Congestion Notification Priority Value (CNPV) alternate
        priority for a CNPV in an end station or bridge component, or
        for a CNPV on a particular Port in an end station or bridge
        component.  It can take the following values:

        cpcAdmin(1) The CND defense mode and alternate priority are
                    controlled by the administrative variables in the
                    same table entry as this object.
        cpcAuto(2)  This Port or all Ports' CND defense modes are
                    controlled automatically, as indicated by
                    ieee8021CnPortPriAutoDefenseMode, and the
                    alternate priority by ieee8021CnComPriAutoAltPri.
        cpcComp(3)  This CND defense mode and alternate priority are
                    both controlled by ieee8021CnPortPriTable.
       "             A"IEEE 802.1Qau clause 32.1.1, 32.3.4, 32.4.2, 32.4.3, Table 32-2"�"For a given Congestion Notification Priority Value (CNPV), a
        port can operate in one of four CND defense modes.  The CND
        defense mode determines whether congestion notification is
        enabled or not, and if enabled, whether the port translates the
        CNPV to a non-CNPV value on input, and whether the port removes
        CN-TAGs on output.

        cptDisabled(1)      The congestion notification capability is
                            administratively disabled for this priority
                            value and port. This priority is not a CNPV.
                            The priority regeneration table controls the
                            remapping of input frames on this port for
                            this priority. CN-TAGs are neither added by
                            an end station nor stripped by a bridge.
        cptInterior(2)      On this port and for this CNPV, the priority
                            parameters of input frames are not remapped,
                            regardless of the priority regeneration
                            table. CN-TAGs are not added by an end
                            station, and are removed from frames before
                            being output by a bridge.
        cptInteriorReady(3) On this port and for this CNPV, the priority
                            parameters of input frames are not remapped,
                            regardless of the priority regeneration
                            table. CN-TAGs can be added by an end
                            station, and are not removed from frames by
                            a bridge.
        cptEdge(4)          On this port and for this CNPV, the priority
                            parameters of input frames are remapped to
                            an alternate (non-CNPV) value, regardless of
                            the priority regeneration table. CN-TAGs are
                            not added by an end station, and are removed
                            from frames before being output by a bridge.
                            This mode is optional for an end station.
       "                                                                                                            "Congestion notification module.
      Unless otherwise indicated, the references in this MIB
      module are to IEEE Std 802.1Q-2011.

      Copyright (C) IEEE.
      This version of this MIB module is part of IEEE802.1Q;
      see the draft itself for full legal notices."�"WG-URL: http://grouper.ieee.org/groups/802/1/index.html
         WG-EMail: stds-802-1@ieee.org 

          Contact: Norman Finn
           Postal: C/O IEEE 802.1 Working Group
                   IEEE Standards Association
                   445 Hoes Lane
                   P.O. Box 1331
                   Piscataway
                   NJ 08855-1331
                   USA
           E-mail: STDS-802-1-L@LISTSERV.IEEE.ORG
       " "201102270000Z" "200912180000Z" \"Minor edits to contact information etc. as part of 
    2011 revision of IEEE Std 802.1Q." ?"Included in IEEE 802.1Qau-2010

        Copyright (C) IEEE."       -- February 27, 2011
          6"A table containing the global variables for each component of
        a bridge or for an end station.  A value of 1 is used in a
        bridge or end station that does not have multiple components.

        The contents of this table SHALL be maintained across a restart
        of the system.
       " "802.1Qau clause 12.21.1"                     \"A list of objects pertaining to a whole bridge component or
        end station.
       "                      "The bridge component within the system to which the information
        in this ieee8021CnGlobalEntry applies.  If the system is not
        a Bridge, or if only one component is present in the Bridge,
        then this variable (index) MUST be equal to 1.
       "                       �"The state of the congestion notification feature on this bridge
        component or system.  If true, Congestion notification is
        enabled, and if false, congestion notification is disabled.
       " "802.1Qau clause 32.2.1"                     �"The priority to use for all Congestion Notification Messages
        transmitted by this bridge component or end station.
       " "802.1Qau clause 32.2.2"                    J"The number of frames discarded from full CP queues, in spite
        of the efforts of congestion notification to avoid discards.

        This object is incremented whenever any of the
        ieee8021CnCpDiscardedFrames objects on any Port or priority in
        this same component are incremented.

        Discontinuities in the value of this counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any).
       " "802.1Qau clause 32.2.3"                    "There is one Errored Port Table per bridge component or end
        station. It permits the retrieval of information about which
        interfaces have congestion notification configuration errors,
        namely, those specifying an alternate priority that is a CNPV.
       " "802.1Qau clause 32.2.4"                     �"A list of interfaces whose ieee8021CnComPriAlternatePriority
        and/or ieee8021CnPortPriAlternatePriority specify a priority
        value that is a Congestion Notification Priority Value.
       " "802.1Qau clause 32.2.4"                    "The bridge component within the system to which the information
        in this ieee8021CnErroredPortEntry applies.  If the system is
        not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       " "802.1Qau clause 32.2.4"                     H"The priority value whose alternate priority is misconfigured.
       " "802.1Qau clause 32.2.4"                    "This object represents the Bridge Port or aggregated port
        on which the congestion notification alternate priority is
        misconfigured.
        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this variable so that it references the row
        in the ifXTable with the same value of ifAlias that it
        referenced before the system restart.  If no such row exists,
        then the system SHALL delete this row in the
        ieee8021CnErroredPortTable.
       " "802.1Qau clause 32.2.4"                    "Each row in this table supplies default values for one
        Congestion Notification Priority Value for a whole bridge 
        component or end station.

        Creating a row in this table makes the priority value of
        ieee8021CnComPriPriority a
        Congestion Notification Priority Value.
        Deleting a row in this table makes the value in the deleted
        ieee8021CnComPriPriority no longer a
        Congestion Notification Priority Value.

        A  system SHALL NOT allow eight rows in this table
        to be created with the same value of
        ieee8021CnComPriComponentId; see the description of
        ieee8021CnComPriRowStatus.

        The contents of this table SHALL be maintained across a restart
        of the system.
       " /"802.1Qau clause 12.21.2, 12.21.2.1, 12.21.2.2"                     m"One entry per Congestion Notification Priority Value per
        bridge component or end station.
       " /"802.1Qau clause 12.21.2, 12.21.2.1, 12.21.2.2"                    "The bridge component within the system to which the information
        in this ieee8021CnCompntPriEntry applies.  If the system is
        not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       " /"802.1Qau clause 12.21.2, 12.21.2.1, 12.21.2.2"                     j"The Congestion Notification Priority Value for which this
        row supplies default values.
       " "802.1Qau clauses 12.21.2"                    �"Specifies how the default CND defense mode and alternate
        priority for this Congestion Notification Priority Value on all
        ports on this bridge component or end station are to be chosen,
        either:

            cpcAdmin(1) Default CND defense mode is chosen by
                        ieee8021CnComPriAdminDefenseMode, and alternate
                        priority by ieee8021CnComPriAlternatePriority.
            cpcAuto(2)  Default CND defense mode is chosen by
                        ieee8021CnPortPriAutoDefenseMode, and alternate
                        priority by ieee8021CnComPriAutoAltPri.

        This variable can be overridden by
        ieee8021CnPortPriDefModeChoice.
       "  "802.1Qau clause 32.1.3, 32.3.1"                    �"The Congestion Notification Priority Value to which an
        incoming frame is to be mapped, in spite of what the
        Priority Regereration Table says, if 1) Congestion
        Notification is enabled and 2) the CND defense mode of the
        port is cptEdge.

        Deleting a row in this table does not alter the value of any
        other row's ieee8021CnComPriAlternatePriority.
       " "802.1Qau clauses 32.3.2"                    %"The Congestion Notification Priority Value to which an
        incoming frame can be mapped, in spite of what the
        Priority Regereration Table says, if 1) Congestion
        Notification is enabled, 2) the CND defense mode of the
        port is cptEdge, and 3) ieee8021CnComPriDefModeChoice
        contains the value cpcAuto (2).

        The value of this object is the next lower priority value
        than this row's ieee8021CnComPriPriority that is not a CNPV,
        or the next higher non-CNPV, if all lower values are CNPVs.

        The value of this object, and any consequent priority
        regeneration, is automatically updated by the managed system
        whenever a row in the ieee8021CnCompntPriTable is created or
        deleted.  The value of this object is not dependent upon
        whether congestion notification is enabled or disabled for any
        priority or for the whole bridge component or end station; it
        depends only upon whether the ieee8021CnCompntPriTable row
        exists.
       " "802.1Qau clauses 32.3.3"                     �"The default CND defense mode for this
        Congestion Notification Priority Value on all ports on this
        bridge component or end station.

        This variable can be overridden by
        ieee8021CnPortPriAdminDefenseMode.
       "  "802.1Qau clause 32.1.3, 32.3.4"                    �"The default value for ieee8021CnComPriDefModeChoice for
        newly-created entries in the ieee8021CnPortPriTable:

            cncpAutoEnable (1)  Newly-created
                                ieee8021CnPortPriDefModeChoice
                                objects take the value cpcComp (3).
            cncpAutoDisable(2)  Newly-created
                                ieee8021CnPortPriDefModeChoice
                                objects take the value cpcAdmin (1).
       " "802.1Qau clause 32.3.5"                    9"Specifies whether or not the default value for all Ports is to
        send and receive the Congestion Notification TLV in LLDPDUs,
        either:
            cnlNone(1)  Do not send Congestion Notification TLVs, and
                        ignore them on receipt.
            cnlAdmin(2) Use the LLDP instance selected by
                        ieee8021CnComPriLldpInstanceSelector to send and
                        receive the Congestion Notification TLV.

        This object can be overridden by
        ieee8021CnPortPriLldpInstanceChoice.
       "  "802.1Qau clause 32.1.3, 32.3.6"                    �"Specifies a default value for which LLDP instance is to be
        used to provide the information for automatic configuration
        of ports' CND defense modes (ieee8021CnPortPriAutoDefenseMode).

        This object is ignored by the managed system if
        ieee8021CnComPriLldpInstanceChoice contains the value cnlNone
        (1).

        This object can be overridden by 
        ieee8021CnPortPriLldpInstanceChoice and
        ieee8021CnPortPriLldpInstanceChoice.
       "  "802.1Qau clause 32.1.3, 32.3.7"                    "This object indicates the status of an entry, and is used
        to create/delete entries.

        A system SHALL NOT permit eight ieee8021CnComPriRowStatus
        objects, all with the same value of ieee8021CnComPriComponentId,
        to have the value active(1).  An attempt to create or activate
        a row when there are already seven active rows SHALL result in
        that eighth row's ieee8021CnComPriRowStatus having the value
        notReady(3), and the return of an inconsistentValue error.
       " "802.1Qau clause 30.4"                    m"Each row in this table supplies values for one port's
        Congestion Notification Priority Value (CNPV).

        Creating an entry in ieee8021CnCompntPriTable creates this
        entry, with the default values, on all ports in the bridge
        component or end station.  Deleting an entry in
        ieee8021CnCompntPriTable deletes this ieee8021CnCompntPriEntry
        on all ports in the bridge component or end station.

        The contents of this table SHALL be maintained across a restart
        of the system, except as noted in the description of
        ieee8021CnPortPriIfIndex.
       " "802.1Qau clause 12.21.3"                     v"One entry per port per Congestion Notification Priority Value
        per bridge component or end station.
       " "802.1Qau clause 12.21.3"                    "The bridge component within the system to which the information
        in this ieee8021CnPortPriEntry applies.  If the system is
        not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       " "802.1Qau clause 12.21.3"                     j"The Congestion Notification Priority Value for which
        this row supplies default values.
       " "802.1Qau clauses 12.21.3"                    F"This object represents the port or aggregated port
        to which the entry applies.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this object, and rearrange the order of the
        ieee8021CnPortPriTable, so that the value in
        ieee8021CnPortPriIfIndex references the row in the ifXTable
        with the same value for ifAlias that it referenced before the
        system restart.  If no such entry exists in the ifXTable, then
        the system SHALL delete the row in the ieee8021CnPortPriTable.
       " "802.1Qau clause 12.21.3"                    #"This object determines how the CND defense mode and alternate
        priority value of this port for this CNPV is to be selected,
        either:

            cpcAdmin(1) CND defense mode is controlled by
                        ieee8021CnPortPriAdminDefenseMode, and alternate
                        priority by ieee8021CnPortPriAlternatePriority.
            cpcAuto(2)  CND defense mode is controlled by
                        ieee8021CnPortPriAutoDefenseMode and alternate
                        priority by ieee8021CnComPriAlternatePriority.
            cpcComp(3)  CND defense mode and alternate priority are
                        controlled by
                        ieee8021CnComPriDefModeChoice.

        This variable can override ieee8021CnComPriDefModeChoice.
       " %"IEEE 802.1Qau clause 32.1.3, 32.4.1"                    "This object indicates the operator's choice for the CND defense
        mode in which this port is to operate for this CNPV whenever
        ieee8021CnPortPriDefModeChoice has the value cpcAdmin(1).

        This variable can override ieee8021CnComPriDefModeChoice.
       " %"IEEE 802.1Qau clause 32.1.3, 32.4.1"                     �"This object indicates in which the CND defense mode this port
        would operate for this CNPV as determined by the LLDP
        Congestion Notification TLV.
       " "IEEE 802.1Qau clause 32.4.3"                    �"Specifies how to determine the LLDP instance to be used for the
        Congestion Notification TLV, either:
            cnlNone(1)      No LLDP Congestion Notification TLV is to
                            carry Per-priority CNPV indicators or
                            Per-priority Ready indicators on this Port
                            for this priority.
            cnlAdmin(2)     ieee8021CnPortPriLldpInstanceSelector
                            governs which LLDP instance is to carry
                            Per-priority CNPV indicators and
                            Per-priority Ready indicators for this
                            priority in its Congestion Notification TLV
                            on this Port
            cnlComponent(3) ieee8021CnComPriLldpInstanceChoice
                            governs LLDP instance selection for this
                            Port and priority.

        This object can override ieee8021CnComPriLldpInstanceChoice.
       "  "802.1Qau clause 32.1.3, 32.4.4"                     �"This object determines which LLDP instance selector, if any,
        is used for automatic determination of the CND defense mode for
        this port and CNPV.

        This object can override ieee8021CnComPriLldpInstanceSelector.
       "  "802.1Qau clause 32.1.3, 32.4.5"                    �"The Congestion Notification Priority Value to which an
        incoming frame is to be mapped, in spite of what the
        Priority Regereration Table says, if 1) Congestion
        Notification is enabled and 2) the port is acting in the
        cptEdge (4) CND defense mode.

        This object is ignored unless ieee8021CnPortPriDefModeChoice
        contains the value cpcAdmin (1).
       " "802.1Qau clause 32.4.6"                    W"Each row in this table supplies values for one
        Congestion Point (CP).

        This table is indexed by component, port (interface), and
        an arbitrary CP index.  This arbitrary CP index is not
        necessarily the Congestion Point Identifier (CPID) carried in
        Congestion Notification Messages (CNMs).

        Creating an entry in ieee8021CnCompntPriTable can create an
        entry in this table, with the default values, on all ports in
        the bridge component or end station.  Because more than one
        Congestion Notification Priority Value (CNPV) can flow
        through a single CP, the creation of an entry in
        ieee8021CnCompntPriTable does not necessarily create a new
        entry in this table.  An end station can have more than one
        CP for the same CNPV, so creating an entry in
        ieee8021CnCompntPriTable can create multiple entries in this
        table.

        Because each port in a bridge component or end station can have
        a different relationship between CNPVs and CPs, the entries
        created or deleted on each port can be different.

        Deleting the last entry in ieee8021CnCompntPriTable for a
        CNPV passing through the CP controlled by this entry deletes
        the entry on some or all of the ports in the bridge component
        or end station.

        Because each port in a bridge component or end station can have
        a different relationship between CNPVs and CPs, the entries
        created or deleted on each port can be different.

        The relationship between ieee8021CnCpIndex
        values and CPs is an implementation dependent matter.

        The contents of this table SHALL be maintained across a restart
        of the system, except as noted in the description of
        ieee8021CnCpIfIndex.
       " "802.1Qau clause 12.21.4"                     �"An entry in the Congestion Point table controls a single
        Congestion Point on a port in a bridge component or end station.
       " "802.1Qau clause 12.21.4"                    
"The bridge component within the system to which the information
        in this ieee8021CnCpEntry applies.  If the system is
        not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       " "802.1Qau clause 12.21.4"                    7"This object represents the port or aggregated port
        to which the entry applies.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this object, and rearrange the order of the
        ieee8021CnCpTable, so that the value in ieee8021CnCpIfIndex
        references the row in the ifXTable with the same value for
        ifAlias that it referenced before the system restart.  If no
        such entry exists in the ifXTable, then the system SHALL delete
        the row in the ieee8021CnCpTable.
       " "802.1Qau clause 12.21.4"                    �"This object is an arbitrary integer indexing the entries in
        this table among the entries for the same component and
        interface.  In a system that supports no more than one
        Congestion Point per priority per interface, ieee8021CnCpIndex
        SHALL be equal to the lowest numerical
        Congestion Notification Priority Value served by this
        Congestion Point.  Otherwise, it SHOULD be a small integer
        value.
       " "802.1Qau clause 12.21.4"                     �"This object indicates the lowest numerical
        Congestion Notification Priority Value that this entry's
        Congestion Point serves.
       " "802.1Qau clause 12.21.4"                     �"This object indicates the MAC address used as the source
        address in Congestion Notification Message transmitted
        by this Congestion Point.
       " "802.1Qau clause 32.8.1"                    W"This object indicates the Congestion Point Identifier (CPID)
        transmitted in Congestion Notification Message by this
        Congestion Point.

        It is not specified whether the CPID reported in a CNM by a CP
        that serves multiple CNPVs does or does not have the same value
        for its different CNPVs.
       " "802.1Qau clause 32.8.2"                    8"This object is the set point for the queue managed by this
        Congestion Point (CP).  Congestion Notification Messages are
        transmitted to the sources of frames queued in this CP's
        queue in order to keep the total number of octets stored in
        the queue at this set point.
       " "802.1Qau clause 30.2, 32.8.3"                    >"This object controls the weight (cpW) change in queue length
        in the calculation of cpFb when the Congestion Point is
        generating a Congestion Notification Message.

        The weight cpW is equal to two to the power of this object.
        Thus, if this object contains a -1, cpW = 1/2.
       " "802.1Qau clause 32.8.6"                     �"This object determines the minimum number of octets to
        enqueue in the Congestion Point's queue between transmissions
        of Congestion Notification Messages.
       " "802.1Qau clause 32.8.11"                    �"The number of data frames discarded by the queue controlled
        by this Congestion Point due to queue congestion.

        Discontinuities in the value of this counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any).
       " "802.1Qau clause 32.8.12"                    �"The number of data frames passed on to the queue controlled by
        this Congestion Point that were not discarded due to queue
        congestion.

        Discontinuities in the value of this counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any).
       " "802.1Qau clause 32.8.13"                    t"The number of Congestion Notification Message transmitted
        by this Congestion Point.

        Discontinuities in the value of this counter can occur
        at re-initialization of the management system, and at
        other times as indicated by the value of
        ifCounterDiscontinuityTime object of the associated
        interface (if any).
       " "802.1Qau clause 32.8.14"                    w"Specifies the minimum number of octets to be returned in a
        Congestion Notification Message from the mac_service_data_unit
        of the data frame that triggered transmission of the CNM.  If
        the mac_service_data_unit has fewer octets than the value of
        this object, then all of the mac_service_data_unit is returned
        in the CNM.
       " $"802.1Qau clause 32.8.15, 32.9.4 k)"                    �"This table allows the network manager to obtain the
        interface index and CP index needed to access an entry in
        the ieee8021CnCpTable, given a Congestion Point Identifier
        (CPID) received a Congestion Notification Messages (CNMs).

        Upon a restart of the system, the system SHALL, if necessary,
        update this table to be consistent with the ieee8021CnCpTable.
       " *"802.1Qau clause 17.2.13, 12.21.4, 32.8.2"                     �"An entry in the ieee8021CnCpidToInterfaceTable.  Translates
        a Congestion Point Identifier to a component identifier,
        interface index, and CP index
       " "802.1Qau clause 17.2.13"                     �"This object is the Congestion Point Identifier (CPID)
        transmitted in Congestion Notification Message by a
        Congestion Point residing in this bridge component or
        end station.
       " !"802.1Qau clause 17.2.13, 32.8.2"                    "The bridge component within the system to which the information
        in this ieee8021CnCpidToInterfaceEntry applies.  If the system
        is not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       " "802.1Qau clause 17.2.13"                     �"This object indicates the interface on which the selected
        Congestion Point resides.  This value can be used, along
        with ieee8021CnCpidToIfCpIndex, to find the Congestion Point
        in the ieee8021CnCpTable.
       " "802.1Qau clause 17.2.13"                    "This object indicates the Congestion Point's index on the
        interface on which the selected Congestion Point resides.
        This value can be used, along with ieee8021CnCpidToIfIfIndex,
        to find the Congestion Point in the ieee8021CnCpTable.
       " "802.1Qau clause 17.2.13"                    "Each row in this table supplies values for all of the
        Reaction Points (RPs) on one Port and one priority of an end
        station or bridge component.  This table is indexed by
        component, port (interface), and priority.

        Creating an entry in ieee8021CnCompntPriTable can create an
        entry in this table, with the default values, on all ports
        in the end station.

        Deleting the an entry in ieee8021CnCompntPriTable for a
        CNPV passing through the RP controlled by this entry deletes
        entries on some or all of the ports in the end station.

        The contents of this table SHALL be maintained across a restart
        of the system, except as noted in the description of
        ieee8021CnRpPortPriIfIndex.
       " "802.1Qau clause 12.21.5"                     �"An entry in the Reaction Point table controls all of the
        Reaction Points on a port in an end station that share the same
        priority value.
       " "802.1Qau clause 12.21.5"                    "The bridge component within the system to which the information
        in this ieee8021CnRpGroupEntry applies.  If the system is
        not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       "                       �"This object indicates the lowest numerical
        Congestion Notification Priority Value that this entry's
        Reaction Point serves.
       " "802.1Qau clause 12.21.5"                    X"This object indicates the interface on which the selected
        Reaction Points reside.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this object, and rearrange the order of the
        ieee8021CnRpPortPriTable, so that the value in
        ieee8021CnRpPortPriIfIndex references the row in the ifXTable
        with the same value for ifAlias that it referenced before the
        system restart.  If no such entry exists in the ifXTable, then
        the system SHALL delete the row in the
        ieee8021CnRpPortPriTable.
       " "802.1Qau clause 12.21.5"                     �"An integer controlling the maximum number of Reaction Points
        allowed for this CNPV on this Port. An end station SHALL
        not create more than this many Reaction Point on this Port,
        but it MAY create fewer.
       " "802.1Qau clause 32.10.1"                    �"This object returns the number of times any of the
        Reaction Points (RPs) controlled by this entry has had
        its rpEnabled variable set TRUE by the reception of a
        Congestion Notification Message.

        Dividing the change in ieee8021CnRpPortPriCentiseconds by the
        change in this object over a time interval yields the average
        lifetime of an active RP during that interval.
       " +"802.1Qau clause 32.10.2, 32.10.3, 32.13.1"                    �"This object returns the total number of centi-seconds that
        any of the Reaction Points (RPs) controlled by this entry
        has had its rpEnabled variable in the TRUE state.  That is,
        once each centi-second, this counter is incremented by the
        number of RPs this entry controls that are actively rate
        limiting output frames.

        Dividing the change in this object over a time interval by the
        length of the interval yields the average number of RPs active
        over that interval.  Dividing the change in this object by the
        change in ieee8021CnRpPortPriCreatedRps over that same time
        interval yields the average lifetime of an active RP during that
        interval.
       " ""802.1Qau clause 32.10.3, 32.13.1"                    �"Each row in this table supplies values for one or more
        Reaction Points (RPs).  This table is indexed by component,
        port (interface), and an arbitrary RP index.

        Creating an entry in ieee8021CnCompntPriTable can create an
        entry in this table, with the default values, on all ports
        in the end station.  An end station can have more than one
        RP for the same Congestion Notification Priority Value
        (CNPV), so creating an entry in ieee8021CnCompntPriTable can
        create multiple entries in this table.

        Because each port in a bridge component or end station can have
        a different relationship between CNPVs and RPs, the entries
        created or deleted on each port can be different.

        Deleting the an entry in ieee8021CnCompntPriTable for a
        CNPV passing through the RP controlled by this entry deletes
        entries on some or all of the ports in the end station.

        Because each port in an end station can have a
        different relationship between CNPVs and RPs, the entries
        created or deleted on each port can be different.

        The relationship between ieee8021CnRpgIdentifier
        values and RPs is an implementation dependent matter.

        The contents of this table SHALL be maintained across a restart
        of the system, except as noted in the description of
        ieee8021CnRpgIfIndex.
       " "802.1Qau clause 12.21.6"                     �"An entry in the Reaction Point table controls a group of
        Reaction Points, on a port in an end station.  All of the
        Reaction Point controlled by this entry serve the same
        Congestion Notification Priority Value.
       "                      "The bridge component within the system to which the information
        in this ieee8021CnRpGroupEntry applies.  If the system is
        not a Bridge, or if only one component is present in the
        Bridge, then this variable (index) MUST be equal to 1.
       "                       �"This object indicates the lowest numerical
        Congestion Notification Priority Value that this entry's
        Reaction Point serves.
       " "802.1Qau clause 12.21.5"                    E"This object indicates the interface on which the group of
        Reaction Points reside.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this object, and rearrange the order of the
        ieee8021CnRpGroupTable, so that the value in
        ieee8021CnRpgIfIndex references the row in the ifXTable with
        the same value for ifAlias that it referenced before the system
        restart.  If no such entry exists in the ifXTable, then the
        system SHALL delete the row in the ieee8021CnRpGroupTable.
       " "802.1Qau clause 12.21.5"                    "This object is an arbitrary integer indexing the entries in
        this table among the entries for the same interface.  This
        index SHOULD, where possible, be equal to the
        Congestion Notification Priority Value served by this
        Reaction Point.
       " "802.1Qau clause 12.21.6"                    �"Controls the rpEnabled variable of the Reaction Point state
        machines of the Reaction Points (RPs) controlled by this
        entry as follows:
            true(1)     The rpEnabled variable for the RPs controlled by
                        this object are not held in the FALSE state,
                        thus enabling them to pay attention to received
                        CNMs.
            false(2)    The rpEnabled variable for the RPs controlled by
                        this object are held in the FALSE state, thus
                        disabling them from paying attention to received
                        CNMs.
       " ""802.1Qau clause 32.11.1, 32.13.1"                     �"This object controls the value for all of the state machine
        variables, rpgTimeReset, used to reset the timers RpWhile.
       " "802.1Qau clause 32.11.2"                     �"This object controls the value for all of the state machine
        variables, rpgByteReset, used to reset the counters
        rpByteCount.
       " "802.1Qau clause 32.11.3"                     �"This object controls the number of times rpByteStage or
        rpTimeStage can count before the
        RP rate control state machine advances states.
       " "802.1Qau clause 32.11.4"                    �"This object controls the maximum rate, in multiples of 1 Mbit/s,
        at which an RP can transmit. Default value is the speed of the
        port. A system SHALL support a minimim  value for this object
        that is no larger than 5 Mbits/s (object value 5). This rate
        includes all bits consequent to transmitting the frame on the
        LAN, including preamble, inter-frame gap, etc.
       " "802.1Qau clause 32.11.5"                    "This object controls the transmission rate increment in the
        RPR_ACTIVE_INCREASE state (rpgAiRate) in multiples of 1 Mbit/s.
        This rate includes all bits consequent to transmitting the
        frame on the LAN, including preamble, inter-frame gap, etc.
       " "802.1Qau clause 32.11.6"                    "This object controls the transmission rate increment in the
        RPR_HYPER_INCREASE state (rpgHaiRate) in multiples of 1 Mbit/s.
        This rate includes all bits consequent to transmitting the
        frame on the LAN, including preamble, inter-frame gap, etc.
       " "802.1Qau clause 32.11.7"                    "This object controls the number of bits that the value of the
        Quantized Feedback field received in a CNM PDU is shifted to
        the right to decrease rpTargetRate. rpgGd is thus 2 to the
        negative power of this object, e.g., 7 means rpgGd = 1/128.
       " "802.1Qau clause 32.11.8"                     "This object controls the minimum factor by which the current
        RP transmit rate rpCurrentRate can be changed by reception
        of a Congestion Notification Message.  Its integer value
        represents a percentage, from 1% to 100%.
       " "802.1Qau clause 32.11.9"                    ["This object controls the minimum transmission rate (rpgMinRate)
        in multiples of 1 Mbit/s.  A system SHALL support a value for
        this object that is no larger than 5 Mbit/s per second.
        This rate includes all bits consequent to transmitting the
        frame on the LAN, including preamble, inter-frame gap, etc.
       " "802.1Qau clause 32.11.10"                             Z"The compliance statement for support by a bridge of
        the IEEE8021-CN-MIB module."   ,"Support for createAndWait is not required."             `"The compliance statement for support by an end station of
        the IEEE8021-CN-MIB module."   k"This group is optional and supports end stations that
            choose to implement Congestion Points." k"This group is optional and supports end stations that
            choose to implement Congestion Points." k"This group is optional and supports end stations that
            choose to implement Congestion Points." k"This group is optional and supports end stations that
            choose to implement Congestion Points." k"This group is optional and supports end stations that
            choose to implement Congestion Points." k"This group is optional and supports end stations that
            choose to implement Congestion Points."                 '"Objects in the global required group."                 /"Objects in the Congestion Point global group."                 &"Objects in the CPID translate group."                 ,"Objects for the Errored Ports Table group."                 ,"Objects for the global per-priority group."                 6"Objects for the Congestion Point per-priority group."                 5"Objects for the global per-priority per-port group."                 Q"Objects for the Congestion Point per-priority per-port
        group.
       "                 )"Objects for the Congestion Point group."                 ="Objects for the Reaction Point per-Port per-priority group."                 '"Objects for the Reaction Point group."                    