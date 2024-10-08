    	�"To be used for the index to a table.  Allows an application
        to download only those rows changed since a particular time.
        A row is considered changed if the value of any object in the
        row changes or if the row is created or deleted.

        When sysUpTime is equal to zero, this table shall be empty.

        One entry exists for each past value of sysUpTime, except that
        the whole table is purged should sysUpTime wrap.

        As this basic row is updated new conceptual rows are created
        (which still share the now updated object values with all
        other instances).  The number of instances which are created
        is determined by the value of sysUpTime at which the basic row
        was last updated.  One instance will exist for each value of
        sysUpTime at the last update time for the row.  A new
        timeMark instance is created for each new sysUpTime value.
        Each new conceptual row will be associated with the timeMark
        instance which was created at the value of sysUpTime with
        which the conceptual row is to be associated.

        By definition all conceptual rows were updated at or after
        time zero and so at least one conceptual row (associated with
        timeMark.0) must exist for each underlying (basic) row.

        See the appendix for further discussion of this variable.

        Consider the following fooTable:

        fooTable ...
        INDEX { fooTimeMark, fooIndex }

        FooEntry {
           fooTimeMark  TimeFilter
           fooIndex     INTEGER,
           fooCounts    Counter
        }

        Should there be two basic rows in this table (fooIndex == 1,
        fooIndex == 2) and row 1 was updated most recently at time 6,
        while row 2 was updated most recently at time 8, and both rows
        had been updated on several earlier occasions such that the
        current values were 5 and 9 respectively then the following
        fooCounts instances would exist.

        fooCounts.0.1  5
        fooCounts.0.2  9
        fooCounts.1.1  5
        fooCounts.1.2  9
        fooCounts.2.1  5
        fooCounts.2.2  9
        fooCounts.3.1  5
        fooCounts.3.2  9
        fooCounts.4.1  5
        fooCounts.4.2  9
        fooCounts.5.1  5
        fooCounts.5.2  9
        fooCounts.6.1  5
        fooCounts.6.2  9
        fooCounts.7.2  9    -- note that row 1 doesn't exist for
        fooCounts.8.2  9    -- times 7 and 8"              ;"Each octet within this value specifies a set of eight
		ports, with the first octet specifying ports 1 through
		8, the second octet specifying ports 9 through 16, etc.
		Within each octet, the most significant bit represents
		the lowest numbered port, and the least significant bit
		represents the highest numbered port. Thus, each port
		of the bridge is represented by a single bit within the
		value of this object. If that bit has a value of 1
		then that port is included in the set of ports; the port
		is not included if its bit has a value of 0."               '"A simple status value for the object."              &"A value used to index per-VLAN tables: values of 0 and
		4095 are not permitted; if the value is between 1 and
		4094 inclusive, it represents an IEEE 802.1Q VLAN-ID with
		global scope within a given bridged domain (see VlanId
		textual convention). If the value is greater than 4095
		then it represents a VLAN with scope local to the
		particular agent, i.e. one without a global VLAN-ID
		assigned to it. Such VLANs are outside the scope of
		IEEE 802.1Q but it is convenient to be able to manage them
		in the same way using this MIB."               /"A 12-bit VLAN ID used in the VLAN Tag header."                                                                 p"The VLAN Bridge MIB module for managing Virtual Bridged
	Local Area Networks, as defined by IEEE 802.1Q-1998."�" Les Bell
	Postal: 3Com Europe Ltd.
	3Com Centre, Boundary Way
	Hemel Hempstead, Herts. HP2 7YU
	UK
	Phone: +44 1442 438025
	Email: Les_Bell@3Com.com
	Andrew Smith
	Postal: Extreme Networks
	3585 Monroe St.
	Santa Clara CA 95051
	USA
	Phone: +1 408 579 2821
	Email: andrew@extremenetworks.com
	Paul Langille
	Postal: Newbridge Networks
	5 Corporate Drive
	Andover, MA 01810
	USA
	Phone: +1 978 691 4665
	Email: langille@newbridge.com
	Anil Rijhsinghani
	Postal: Cabletron Systems
	50 Minuteman Road
	Andover, MA 01810
	USA
	Phone: +1 978 684 1295
	Email: anil@cabletron.com
	Keith McCloghrie
	Postal: cisco Systems, Inc.
	170 West Tasman Drive
	San Jose, CA 95134-1706
	USA
	Phone: +1 408 526 5260
	Email: kzm@cisco.com" "9908250000Z" )"Initial version, published as RFC 2674."                       >"The version number of IEEE 802.1Q that this device supports." #"IEEE 802.1Q/D11 Section 12.10.1.1"                     <"The maximum IEEE 802.1Q VLAN ID that this device supports." !"IEEE 802.1Q/D11 Section 9.3.2.3"                     D"The maximum number of IEEE 802.1Q VLANs that this device supports." #"IEEE 802.1Q/D11 Section 12.10.1.1"                     P"The current number of IEEE 802.1Q VLANs that are
		configured in this device." ""IEEE 802.1Q/D11 Section 12.7.1.1"                    �"The administrative status requested by management for
		GVRP. The value enabled(1) indicates that GVRP should
		be enabled on this device, on all ports for which it has
		not been specifically disabled. When disabled(2), GVRP
		is disabled on all ports and all GVRP packets will be
		forwarded transparently. This object affects all GVRP
		Applicant and Registrar state machines. A transition
		from disabled(2) to enabled(1) will cause a reset of all
		GVRP state machines on all ports."                           �"A table that contains configuration and control
		information for each Filtering Database currently
		operating on this device. Entries in this table appear
		automatically when VLANs are assigned FDB IDs in the
		dot1qVlanCurrentTable."                       2"Information about a specific Filtering Database."                       *"The identity of this Filtering Database."                       C"The current number of dynamic entries in this Filtering Database." $"IEEE 802.1Q/D11 Section 12.7.1.1.3"                     �"A table that contains information about unicast entries
		for which the device has forwarding and/or filtering
		information. This information is used by the
		transparent bridging function in determining how to
		propagate a received frame."  "IEEE 802.1Q/D11 Section 12.7.7"                     "Information about a specific unicast MAC address for
		which the device has some forwarding and/or filtering
		information."                       \"A unicast MAC address for which the device has
		forwarding and/or filtering information."                      J"Either the value 0, or the port number of the port on
		which a frame having a source address equal to the value
		of the corresponding instance of dot1qTpFdbAddress has
		been seen. A value of 0 indicates that the port
		number has not been learned but that the device does
		have some forwarding/filtering information about this
		address (e.g. in the dot1qStaticUnicastTable).
		Implementors are encouraged to assign the port value to
		this object whenever it is learned even for addresses
		for which the corresponding value of dot1qTpFdbStatus is
		not learned(3)."                      	"The status of this entry. The meanings of the values
		are:
		other(1) - none of the following. This may include
		the case where some other MIB object (not the
		corresponding instance of dot1qTpFdbPort, nor an
		entry in the dot1qStaticUnicastTable) is being
		used to determine if and how frames addressed to
		the value of the corresponding instance of
		dot1qTpFdbAddress are being forwarded.
		invalid(2) - this entry is no longer valid (e.g., it
		was learned but has since aged out), but has not
		yet been flushed from the table.
		learned(3) - the value of the corresponding instance
		of dot1qTpFdbPort was learned and is being used.
		self(4) - the value of the corresponding instance of
		dot1qTpFdbAddress represents one of the devices
		addresses. The corresponding instance of
		dot1qTpFdbPort indicates which of the devices
		ports has this address.
		mgmt(5) - the value of the corresponding instance of
		dot1qTpFdbAddress is also the value of an
		existing instance of dot1qStaticAddress."                      4"A table containing filtering information for VLANs
		configured into the bridge by (local or network)
		management, or learnt dynamically, specifying the set of
		ports to which frames received on a VLAN for this FDB
		and containing a specific Group destination address are
		allowed to be forwarded."                      7"Filtering information configured into the bridge by
		management, or learnt dynamically, specifying the set of
		ports to which frames received on a VLAN and containing
		a specific Group destination address, are allowed to be
		forwarded. The subset of these ports learnt dynamically
		is also provided."                       f"The destination Group MAC address in a frame to which
		this entrys filtering information applies."                      "The complete set of ports, in this VLAN, to which
		frames destined for this Group MAC address are currently
		being explicitly forwarded. This does not include ports
		for which this address is only implicitly forwarded, in
		the dot1qForwardAllPorts list."                       �"The subset of ports in dot1qTpGroupEgressPorts which
		were learnt by GMRP or some other dynamic mechanism, in
		this Filtering database."                      "A table containing forwarding information for each
		VLAN, specifying the set of ports to which forwarding of
		all multicasts applies, configured statically by
		management or dynamically by GMRP. An entry appears in
		this table for all VLANs that are currently
		instantiated." ("IEEE 802.1Q/D11 Section 12.7.2, 12.7.7"                     �"Forwarding information for a VLAN, specifying the set
		of ports to which all multicasts should be forwarded,
		configured statically by management or dynamically by
		GMRP."                       �"The complete set of ports in this VLAN to which all
		multicast group-addressed frames are to be forwarded.
		This includes ports for which this need has been
		determined dynamically by GMRP, or configured statically
		by management."                      �"The set of ports configured by management in this VLAN
		to which all multicast group-addressed frames are to be
		forwarded. Ports entered in this list will also appear
		in the complete set shown by dot1qForwardAllPorts. This
		value will be restored after the device is reset. This
		only applies to ports that are members of the VLAN,
		defined by dot1qVlanCurrentEgressPorts. A port may not
		be added in this set if it is already a member of the
		set of ports in dot1qForwardAllForbiddenPorts. The
		default value is a string of ones of appropriate length,
		to indicate standard non-EFS behaviour, i.e. forward
		all multicasts to all ports."                      �"The set of ports configured by management in this VLAN
		for which the Service Requirement attribute Forward All
		Multicast Groups may not be dynamically registered by
		GMRP. This value will be restored after the device is
		reset. A port may not be added in this set if it is
		already a member of the set of ports in
		dot1qForwardAllStaticPorts. The default value is a
		string of zeros of appropriate length."                      �"A table containing forwarding information for each
		VLAN, specifying the set of ports to which forwarding of
		multicast group-addressed frames for which there is no
		more specific forwarding information applies. This is
		configured statically by management and determined
		dynamically by GMRP. An entry appears in this table for
		all VLANs that are currently instantiated." ("IEEE 802.1Q/D11 Section 12.7.2, 12.7.7"                     �"Forwarding information for a VLAN, specifying the set
		of ports to which all multicasts for which there is no
		more specific forwarding information shall be forwarded.
		This is configured statically by management or
		dynamically by GMRP."                      ("The complete set of ports in this VLAN to which
		multicast group-addressed frames for which there is no
		more specific forwarding information will be forwarded.
		This includes ports for which this need has been
		determined dynamically by GMRP, or configured statically
		by management."                      �"The set of ports configured by management, in this
		VLAN, to which multicast group-addressed frames for
		which there is no more specific forwarding information
		are to be forwarded. Ports entered in this list will
		also appear in the complete set shown by
		dot1qForwardUnregisteredPorts. This value will be
		restored after the device is reset. A port may not be
		added in this set if it is already a member of the set
		of ports in dot1qForwardUnregisteredForbiddenPorts. The
		default value is a string of zeros of appropriate
		length, although this has no effect with the default
		value of dot1qForwardAllStaticPorts."                      �"The set of ports configured by management in this VLAN
		for which the Service Requirement attribute Forward
		Unregistered Multicast Groups may not be dynamically
		registered by GMRP. This value will be restored after
		the device is reset. A port may not be added in this
		set if it is already a member of the set of ports in
		dot1qForwardUnregisteredStaticPorts. The default value
		is a string of zeros of appropriate length."                          v"A table containing filtering information for Unicast
		MAC addresses for each Filtering Database, configured
		into the device by (local or network) management
		specifying the set of ports to which frames received
		from specific ports and containing specific unicast
		destination addresses are allowed to be forwarded. A
		value of zero in this table as the port number from
		which frames with a specific destination address are
		received, is used to specify all ports for which there
		is no specific entry in this table for that particular
		destination address. Entries are valid for unicast
		addresses only." >"IEEE 802.1Q/D11 Section 12.7.7,ISO/IEC 15802-3 Section 7.9.1"                     �"Filtering information configured into the device by
		(local or network) management specifying the set of
		ports to which frames received from a specific port and
		containing a specific unicast destination address are
		allowed to be forwarded."                       �"The destination MAC address in a frame to which this
		entrys filtering information applies. This object must
		take the value of a unicast address."                      "Either the value 0, or the port number of the port
		from which a frame must be received in order for this
		entrys filtering information to apply. A value of zero
		indicates that this entry applies on all ports of the
		device for which there is no other applicable entry."                      c"The set of ports for which a frame with a specific
		unicast address will be flooded in the event that it
		has not been learned. It also specifies the set of
		ports a specific unicast address may be dynamically
		learnt on. The dot1qTpFdbTable will have an equivalent
		entry with a dot1qTpFdbPort value of 0 until this
		address has been learnt, when it will be updated with
		the port the address has been seen on. This only
		applies to ports that are members of the VLAN, defined
		by dot1qVlanCurrentEgressPorts. The default value of
		this object is a string of ones of appropriate length." 6"IEEE 802.1Q/D11 Table 8-5, ISO/IEC 15802-3 Table 7-5"                    O"This object indicates the status of this entry.
		other(1) - this entry is currently in use but
		the conditions under which it will remain
		so differ from the following values.
		invalid(2) - writing this value to the object
		removes the corresponding entry.
		permanent(3) - this entry is currently in use
		and will remain so after the next reset of
		the bridge.
		deleteOnReset(4) - this entry is currently in
		use and will remain so until the next
		reset of the bridge.
		deleteOnTimeout(5) - this entry is currently in
		use and will remain so until it is aged out."                      �"A table containing filtering information for Multicast
		and Broadcast MAC addresses for each VLAN, configured
		into the device by (local or network) management
		specifying the set of ports to which frames received
		from specific ports and containing specific Multicast
		and Broadcast destination addresses are allowed to be
		forwarded. A value of zero in this table as the port
		number from which frames with a specific destination
		address are received, is used to specify all ports for
		which there is no specific entry in this table for that
		particular destination address. Entries are valid for
		Multicast and Broadcast addresses only." >"IEEE 802.1Q/D11 Section 12.7.7,ISO/IEC 15802-3 Section 7.9.1"                    "Filtering information configured into the device by
		(local or network) management specifying the set of
		ports to which frames received from this specific port
		for this VLAN and containing this Multicast or Broadcast
		destination address are allowed to be forwarded."                       �"The destination MAC address in a frame to which this
		entrys filtering information applies. This object must
		take the value of a Multicast or Broadcast address."                      "Either the value 0, or the port number of the port
		from which a frame must be received in order for this
		entrys filtering information to apply. A value of zero
		indicates that this entry applies on all ports of the
		device for which there is no other applicable entry."                      �"The set of ports to which frames received from a
		specific port and destined for a specific Multicast or
		Broadcast MAC address must be forwarded, regardless of
		any dynamic information e.g. from GMRP. A port may not
		be added in this set if it is already a member of the
		set of ports in dot1qStaticMulticastForbiddenEgressPorts.
		The default value of this object is a string of ones of
		appropriate length."                      �"The set of ports to which frames received from a
		specific port and destined for a specific Multicast or
		Broadcast MAC address must not be forwarded, regardless
		of any dynamic information e.g. from GMRP. A port may
		not be added in this set if it is already a member of the
		set of ports in dot1qStaticMulticastStaticEgressPorts.
		The default value of this object is a string of zeros of
		appropriate length."                      O"This object indicates the status of this entry.
		other(1) - this entry is currently in use but
		the conditions under which it will remain
		so differ from the following values.
		invalid(2) - writing this value to the object
		removes the corresponding entry.
		permanent(3) - this entry is currently in use
		and will remain so after the next reset of
		the bridge.
		deleteOnReset(4) - this entry is currently in
		use and will remain so until the next
		reset of the bridge.
		deleteOnTimeout(5) - this entry is currently in
		use and will remain so until it is aged out."                           �"The number of times a VLAN entry has been deleted from
		the dot1qVlanCurrentTable (for any reason). If an entry
		is deleted, then inserted, and then deleted, this
		counter will be incremented by 2."                       �"A table containing current configuration information
		for each VLAN currently configured into the device by
		(local or network) management, or dynamically created
		as a result of GVRP requests received."                       �"Information for a VLAN configured into the device by
		(local or network) management, or dynamically created
		as a result of GVRP requests received."                       ^"A TimeFilter for this entry. See the TimeFilter
		textual convention to see how this works."                       8"The VLAN-ID or other identifier refering to this VLAN."                      �"The Filtering Database used by this VLAN. This is one
		of the dot1qFdbId values in the dot1qFdbTable. This
		value is allocated automatically by the device whenever
		the VLAN is created: either dynamically by GVRP, or by
		management, in dot1qVlanStaticTable. Allocation of this
		value follows the learning constraints defined for this
		VLAN in dot1qLearningConstraintsTable."                       g"The set of ports which are transmitting traffic for
		this VLAN as either tagged or untagged frames." #"IEEE 802.1Q/D11 Section 12.10.2.1"                     V"The set of ports which are transmitting traffic for
		this VLAN as untagged frames." #"IEEE 802.1Q/D11 Section 12.10.2.1"                    �"This object indicates the status of this entry.
		other(1) - this entry is currently in use but the
		conditions under which it will remain so differ
		from the following values.
		permanent(2) - this entry, corresponding to an entry
		in dot1qVlanStaticTable, is currently in use and
		will remain so after the next reset of the
		device. The port lists for this entry include
		ports from the equivalent dot1qVlanStaticTable
		entry and ports learnt dynamically.
		dynamicGvrp(3) - this entry is currently in use
		and will remain so until removed by GVRP. There
		is no static entry for this VLAN and it will be
		removed when the last port leaves the VLAN."                       4"The value of sysUpTime when this VLAN was created."                       �"A table containing static configuration information for
		each VLAN configured into the device by (local or
		network) management. All entries are permanent and will
		be restored after the device is reset."                       _"Static information for a VLAN configured into the
		device by (local or network) management."                       N"An administratively assigned string, which may be used to identify the VLAN." #"IEEE 802.1Q/D11 Section 12.10.2.1"                    �"The set of ports which are permanently assigned to the
		egress list for this VLAN by management. Changes to a
		bit in this object affect the per-port per-VLAN
		Registrar control for Registration Fixed for the
		relevant GVRP state machine on each port. A port may
		not be added in this set if it is already a member of
		the set of ports in dot1qVlanForbiddenEgressPorts. The
		default value of this object is a string of zeros of
		appropriate length, indicating not fixed." ."IEEE 802.1Q/D11 Section 12.7.7.3, 11.2.3.2.3"                    0"The set of ports which are prohibited by management
		from being included in the egress list for this VLAN.
		Changes to this object that cause a port to be included
		or excluded affect the per-port per-VLAN Registrar
		control for Registration Forbidden for the relevant GVRP
		state machine on each port. A port may not be added in
		this set if it is already a member of the set of ports
		in dot1qVlanStaticEgressPorts. The default value of
		this object is a string of zeros of appropriate length,
		excluding all ports from the forbidden set." ."IEEE 802.1Q/D11 Section 12.7.7.3, 11.2.3.2.3"                    '"The set of ports which should transmit egress packets
		for this VLAN as untagged. The default value of this
		object for the default VLAN (dot1qVlanIndex = 1) is a string
		of appropriate length including all ports. There is no
		specified default for other VLANs. If a device agent cannot
		support the set of ports being set then it will reject the
		set operation with an error. An example might be if a
		manager attempts to set more than one VLAN to be untagged
		on egress where the device does not support this IEEE 802.1Q
		option." #"IEEE 802.1Q/D11 Section 12.10.2.1"                     1"This object indicates the status of this entry."                       "The next available value for dot1qVlanIndex of a local
		VLAN entry in dot1qVlanStaticTable. This will report
		values >=4096 if a new Local VLAN may be created or else
		the value 0 if this is not possible.
		A row creation operation in this table for an entry with a local
		VlanIndex value may fail if the current value of this object
		is not used as the index. Even if the value read is used,
		there is no guarantee that it will still be the valid index
		when the create operation is attempted - another manager may
		have already got in during the intervening time interval.
		In this case, dot1qNextFreeLocalVlanIndex should be re-read
		and the creation re-tried with the new value.
		This value will automatically change when the current value is
		used to create a new row."                       e"A table containing per port control and status
		information for VLAN configuration in the device."                       k"Information controlling VLAN configuration for a port
		on the device. This is indexed by dot1dBasePort."                       g"The PVID, the VLAN ID assigned to untagged frames or
		Priority-Tagged frames received on this port." #"IEEE 802.1Q/D11 Section 12.10.1.1"                    �"When this is admitOnlyVlanTagged(2) the device will
		discard untagged frames or Priority-Tagged frames
		received on this port. When admitAll(1), untagged
		frames or Priority-Tagged frames received on this port
		will be accepted and assigned to the PVID for this port.
		This control does not affect VLAN independent BPDU
		frames, such as GVRP and STP. It does affect VLAN
		dependent BPDU frames, such as GMRP." #"IEEE 802.1Q/D11 Section 12.10.1.3"                    O"When this is true(1) the device will discard incoming
		frames for VLANs which do not include this Port in its
		Member set. When false(2), the port will accept all
		incoming frames.
		This control does not affect VLAN independent BPDU
		frames, such as GVRP and STP. It does affect VLAN
		dependent BPDU frames, such as GMRP." #"IEEE 802.1Q/D11 Section 12.10.1.4"                    Z"The state of GVRP operation on this port. The value
		enabled(1) indicates that GVRP is enabled on this port,
		as long as dot1qGvrpStatus is also enabled for this
		device. When disabled(2) but dot1qGvrpStatus is still
		enabled for the device, GVRP is disabled on this port:
		any GVRP packets received will be silently discarded and
		no GVRP registrations will be propagated from other
		ports. This object affects all GVRP Applicant and
		Registrar state machines on this port. A transition
		from disabled(2) to enabled(1) will cause a reset of all
		GVRP state machines on this port."                       Q"The total number of failed GVRP registrations, for any
		reason, on this port."                       K"The Source MAC Address of the last GVRP message
		received on this port."                      P"A table containing per-port, per-VLAN statistics for
		traffic received. Separate objects are provided for both the
		most-significant and least-significant bits of statistics
		counters for ports that are associated with this transparent
		bridge. The most-significant bit objects are only required on
		high capacity interfaces, as defined in the conformance clauses
		for these objects. This mechanism is provided as a way to read
		64-bit counters for agents which support only SNMPv1.
		Note that the reporting of most-significant and leastsignificant
		counter bits separately runs the risk of missing
		an overflow of the lower bits in the interval between sampling.
		The manager must be aware of this possibility, even within the
		same varbindlist, when interpreting the results of a request or
		asynchronous notification."                       0"Traffic statistics for a VLAN on an interface."                      �"The number of valid frames received by this port from
		its segment which were classified as belonging to this
		VLAN. Note that a frame received on this port is
		counted by this object if and only if it is for a
		protocol being processed by the local forwarding process
		for this VLAN. This object includes received bridge
		management frames classified as belonging to this VLAN
		(e.g. GMRP, but not GVRP or STP)." '"IEEE 802.1Q/D11 Section 12.6.1.1.3(a)"                    "The number of valid frames transmitted by this port to
		its segment from the local forwarding process for this
		VLAN. This includes bridge management frames originated
		by this device which are classified as belonging to this
		VLAN (e.g. GMRP, but not GVRP or STP)." '"IEEE 802.1Q/D11 Section 12.6.1.1.3(d)"                    "The number of valid frames received by this port from
		its segment which were classified as belonging to this
		VLAN which were discarded due to VLAN related reasons.
		Specifically, the IEEE 802.1Q counters for Discard
		Inbound and Discard on Ingress Filtering." $"IEEE 802.1Q/D11 Section 12.6.1.1.3"                     W"The number of times the associated
		dot1qTpVlanPortInFrames counter has overflowed." $"ISO/IEC 15802-3 Section 14.6.1.1.3"                     X"The number of times the associated
		dot1qTpVlanPortOutFrames counter has overflowed." $"ISO/IEC 15802-3 Section 14.6.1.1.3"                     Y"The number of times the associated
		dot1qTpVlanPortInDiscards counter has overflowed." $"ISO/IEC 15802-3 Section 14.6.1.1.3"                     ^"A table containing per port, per VLAN statistics for
		traffic on high capacity interfaces."                       ="Traffic statistics for a VLAN on a high capacity interface."                      �"The number of valid frames received by this port from
		its segment which were classified as belonging to this
		VLAN. Note that a frame received on this port is
		counted by this object if and only if it is for a
		protocol being processed by the local forwarding process
		for this VLAN. This object includes received bridge
		management frames classified as belonging to this VLAN
		(e.g. GMRP, but not GVRP or STP)." '"IEEE 802.1Q/D11 Section 12.6.1.1.3(a)"                    "The number of valid frames transmitted by this port to
		its segment from the local forwarding process for this
		VLAN. This includes bridge management frames originated
		by this device which are classified as belonging to this
		VLAN (e.g. GMRP, but not GVRP or STP)." '"IEEE 802.1Q/D11 Section 12.6.1.1.3(d)"                    "The number of valid frames received by this port from
		its segment which were classified as belonging to this
		VLAN which were discarded due to VLAN related reasons.
		Specifically, the IEEE 802.1Q counters for Discard
		Inbound and Discard on Ingress Filtering." $"IEEE 802.1Q/D11 Section 12.6.1.1.3"                     Y"A table containing learning constraints for sets of
		Shared and Independendent VLANs." #"IEEE 802.1Q/D11 Section 12.10.3.1"                     +"A learning constraint defined for a VLAN."                       Z"The index of the row in dot1qVlanCurrentTable for the
		VLAN constrained by this entry."                       �"The identity of the constraint set to which
		dot1qConstraintVlan belongs. These values may be chosen
		by the management station."                      n"The type of constraint this entry defines.
		independent(1) - the VLAN, dot1qConstraintVlan,
		uses an independent filtering database from all
		other VLANs in the same set, defined by
		dot1qConstraintSet.
		shared(2) - the VLAN, dot1qConstraintVlan, shares
		the same filtering database as all other VLANs
		in the same set, defined by dot1qConstraintSet."                       "The status of this entry."                       �"The identity of the constraint set to which a VLAN
		belongs, if there is not an explicit entry for that VLAN
		in dot1qLearningConstraintsTable."                       �"The type of constraint set to which a VLAN belongs, if
		there is not an explicit entry for that VLAN in
		dot1qLearningConstraintsTable. The types are as defined
		for dot1qConstraintType."                               w"A collection of objects providing device level control
		and status information for the Virtual LAN bridge services."                 �"A collection of objects providing information about all
		unicast addresses, learnt dynamically or statically
		configured by management, in each Filtering Database."                 �"A collection of objects providing information about all
		multicast addresses, learnt dynamically or statically
		configured by management, in each Filtering Database."                 �"A collection of objects providing information about
		service requirements, learnt dynamically or statically
		configured by management, in each Filtering Database."                 �"A collection of objects providing information about
		unicast and multicast addresses statically configured by
		management, in each Filtering Database or VLAN."                 g"A collection of objects providing information about
		all VLANs currently configured on this device."                 c"A collection of objects providing information about
		VLANs statically configured by management."                 d"A collection of objects providing port level VLAN
		control and status information for all ports."                 t"A collection of objects providing per-port packet
		statistics for all VLANs currently configured on this device."                $"A collection of objects providing overflow counters for
		per-port packet statistics for all VLANs currently configured
		on this device for high capacity interfaces, defined as those
		that have the value of the corresponding instance of
		ifSpeed greater than 650,000,000 bits/second."                "A collection of objects providing per-port packet
		statistics for all VLANs currently configured on this
		device for high capacity interfaces, defined as those
		that have the value of the corresponding instance of
		ifSpeed greater than 650,000,000 bits/second."                 h"A collection of objects defining the Filtering Database
		constraints all VLANs have with each other."                 �"A collection of objects defining the default Filtering
		Database constraints for VLANs which have no specific
		constraints defined."                     P"The compliance statement for device support of Virtual
		LAN Bridge services."   T"This group is mandatory for bridges that implement
		802.1Q transparent bridging." T"This group is mandatory for bridges that implement
		802.1Q transparent bridging." �"This group is mandatory for bridges that implement
		extended filtering services. All objects must be
		read-write if extended-filtering services are enabled." "This group is optional." h"This group is optional as there may be significant
		implementation cost associated with its support." �"This group is optional as there may be significant
		implementation cost associated with its support. It is most
		relevant for high capacity interfaces where the SNMP agent
		supports only SNMPv1." �"This group is optional as there may be significant
		implementation cost associated with its support. It is most
		relevant for high capacity interfaces." �"This group is mandatory for devices implementing
		both Independent VLAN Learning (IVL) and Shared
		VLAN Learning (SVL) modes of operation of the
		filtering database, as defined by IEEE 802.1Q." �"This group is mandatory for devices implementing
		both Independent VLAN Learning (IVL) and Shared
		VLAN Learning (SVL) modes of operation of the
		filtering database, as defined by IEEE 802.1Q." S"Write access is not required as this is an optional
		capability in IEEE 802.1Q." S"Write access is not required as this is an optional
		capability in IEEE 802.1Q." S"Write access is not required as this is an optional
		capability in IEEE 802.1Q." S"Write access is not required as this is an optional
		capability in IEEE 802.1Q."                                