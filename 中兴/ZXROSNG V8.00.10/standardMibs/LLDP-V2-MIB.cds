                                                                      �"Management Information Base module for LLDP configuration,
            statistics, local system data and remote systems data
            components.

            This MIB module supports the architecture described in
            Clause 6, where multiple LLDP agents can be associated with
            a single Port, each supporting transmission by means of a
            different MAC address.

            Unless otherwise indicated, the references in this
            MIB module are to IEEE 802.1AB-2009.

            Copyright (C) IEEE (2009). This version of this MIB module
            is published as subclause 11.5.2 of IEEE Std 802.1AB-2009;
            see the standard itself for full legal notices."T"WG-URL: http://grouper.ieee.org/groups/802/1/index.html
             WG-EMail: stds-802-1@ieee.org

            Contact: Tony Jeffree
            Postal:  11a Poplar Grove
                     Sale 
                     Cheshire M33 3AX
                     UK
            Tel:     +44-161-973-4278
            E-mail:  tony@jeffree.co.uk" "200906080000Z" �"Published as part of IEEE Std 802.1AB-2009 revision.
            This revision incorporated changes to the MIB to
            support the use of LLDP with multiple destination MAC
            addresses."       -- June 08, 2009 
              �"A lldpV2RemTablesChange notification is sent when the value
            of lldpV2StatsRemTablesLastChangeTime changes. It can be
            utilized by an NMS to trigger LLDP remote systems table
            maintenance polls.

            Note that transmission of lldpV2RemTablesChange
            notifications are throttled by the agent, as specified by the
            'lldpV2NotificationInterval' object."                        F"The interval at which LLDP frames are transmitted on
            behalf of this LLDP agent.

            The default value for lldpV2MessageTxInterval object is
            30 seconds.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." 	"9.2.5.7"                    "The time-to-live value expressed as a multiple of the
            lldpV2MessageTxInterval object. The actual time-to-live value
            used in LLDP frames, transmitted on behalf of this LLDP agent,
            can be expressed by the following formula: TTL = min(65535,
            (lldpV2MessageTxInterval * lldpV2MessageTxHoldMultiplier)) For
            example, if the value of lldpV2MessageTxInterval is '30', and
            the value of lldpV2MessageTxHoldMultiplier is '4', then the
            value '120' is encoded in the TTL field in the LLDP header.

            The default value for lldpV2MessageTxHoldMultiplier object is 4.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." 	"9.2.5.6"                    �"The lldpV2ReinitDelay indicates the delay (in units of
            seconds) from when lldpPortConfigAdminStatus object of a
            particular port becomes 'disabled' until re-initialization
            is attempted.

            The default value for lldpV2ReinitDelay is two seconds.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." 
"9.2.5.10"                    
"This object controls the interval between transmission of
            LLDP notifications during normal transmission periods.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system."                      ."The maximum number of consecutive LLDPDUs that can be
            transmitted at any time.

            The default value for lldpV2TxCreditMax object is 5 PDUs.
            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." 
"9.2.5.17"                    �"The interval at which LLDP frames are transmitted on
                behalf of this LLDP agent during fast transmission period
                (e.g. when a new neighbor is detected).
                The default value for lldpV2MessageFastTx object is
                1 second.
                The value of this object is restored from non-volatile
                storage after a re-initialization of the management system." 	"9.2.5.5"                    �"The initial value used to initialize the txFast variable
                which determines the number of transmissions that are
                made in fast transmission mode.
                The default value for lldpV2TxFastInit object is
                4.
                The value of this object is restored from non-volatile
                storage after a re-initialization of the management system." 
"9.2.5.19"                     �"The table that controls LLDP frame transmission on individual
            ports and using particular destination MAC addresses."                      Z"LLDP configuration information for a particular port and
            destination MAC address.

            This configuration parameter controls the transmission and
            the reception of LLDP frames on those interface/address 
            combinations whose rows are created in this table.

            Rows in this table can only be created for MAC addresses
            that can validly be used in association with the type of 
            interface concerned, as defined by table 8-2.

            The contents of this table is persistent across
            re-initializations or re-boots."                       �"The interface index value used to identify the port
            associated with this entry. Its value is an index into
            the interfaces MIB.

            The value of this object is used as an index to the
            lldpV2PortConfigTable."                      A"The index value used to identify the destination
            MAC address associated with this entry. Its value identifies
            the row in the lldpV2DestAddressTable where the MAC address
            can be found.

            The value of this object is used as an index to the
            lldpV2PortConfigTable."                      �"The administratively desired status of the local LLDP agent.

            If the associated lldpV2PortConfigAdminStatus object is
            set to a value of 'txOnly(1)', then LLDP agent transmits
            LLDPframes on this port and it does not store any
            information about the remote systems connected.
         
            If the associated lldpV2PortConfigAdminStatus object is 
            set to a value of 'rxOnly(2)', then the LLDP agent
            receives, but it does not transmit LLDP frames on this port.

            If the associated lldpV2PortConfigAdminStatus object is set
            to a value of 'txAndRx(3)', then the LLDP agent transmits
            and receives LLDP frames on this port.

            If the associated lldpV2PortConfigAdminStatus object is set
            to a value of 'disabled(4)', then LLDP agent does not
            transmit or receive LLDP frames on this port. If there is
            remote systems information which is received on this port
            and stored in other tables, before the port's
            lldpV2PortConfigAdminStatus becomes disabled, then that
            information is deleted." 	"9.2.5.1"                    	"The lldpV2PortConfigNotificationEnable controls, on a per
            agent basis, whether or not notifications from the agent
            are enabled. The value true(1) means that notifications are
            enabled; the value false(2) means that they are not."                      9"The lldpV2PortConfigTLVsTxEnable, defined as a bitmap,
            includes the basic set of LLDP TLVs whose transmission is
            allowed on the local LLDP agent by the network management.
            Each bit in the bitmap corresponds to a TLV type associated
            with a specific optional TLV.

            It should be noted that the organizationally-specific TLVs
            are excluded from the lldpV2PortConfigTLVsTxEnable bitmap.
            
            LLDP Organization Specific Information Extension MIBs should
            have similar configuration object to control transmission
            of their organizationally defined TLVs.

            The bit 'portDesc(0)' indicates that LLDP agent should
            transmit 'Port Description TLV'.

            The bit 'sysName(1)' indicates that LLDP agent should transmit
            'System Name TLV'.

            The bit 'sysDesc(2)' indicates that LLDP agent should transmit
            'System Description TLV'.

            The bit 'sysCap(3)' indicates that LLDP agent should transmit
            'System Capabilities TLV'.

            There is no bit reserved for the management address TLV type
            since transmission of management address TLVs are controlled
            by another object, lldpV2ConfigManAddrTable.

            The default value for lldpV2PortConfigTLVsTxEnable object is
            empty set, which means no enumerated values are set.

            The value of this object is restored from non-volatile
            storage after a re-initialization of the management system." 	"9.1.2.1"                     v"The table that contains the set of MAC addresses used
            by LLDP for transmission and reception of LLDPDUs."                      k"Destination MAC address information for LLDP.

            This configuration parameter identifies a MAC address
            corresponding to a LldpV2DestAddressTableIndex value.

            Rows in this table are created as necessary, to support
            MAC addresses needed by other tables in the MIB that
            are indexed by MAC address.

            A given row in this table cannot be deleted if the MAC
            address table index value is in use in any other table
            in the MIB.

            The contents of this table is persistent aacross
            re-initializations or re-boots."                       �"The index value used to identify the destination
            MAC address associated with this entry.

            The value of this object is used as an index to the
            lldpV2DestAddressTable."                      7"The MAC address associated with this entry.

            The octet string identifies an individual or a group
            MAC address that is in use by LLDP as a destination
            MAC address.
            The MAC address is encoded in the octet string in
            canonical format (see IEEE Std 802)."                       �"The table that controls selection of LLDP management address
            TLV instances to be transmitted on individual port/
            destination address pairs."                      x"LLDP configuration information that specifies the set
            of port/destination address pairs on which the local
            system management address instance is transmitted.

            Each active lldpManAddrConfigTxPortsTableV2Entry is 
            restored from non-volatile storage and re-created 
            after a re-initialization of the management system."                      z"The interface index value used to identify the port
            associated with this entry. Its value is an index into
            the interfaces MIB.

            The value of this object is used as an index to the
            lldpV2PortConfigTable.
            The value in this column of the table MUST match
            the IfIndex value specified in the BridgePort table."                      A"The index value used to identify the destination
            MAC address associated with this entry. Its value identifies
            the row in the lldpV2DestAddressTable where the MAC address
            can be found.

            The value of this object is used as an index to the
            lldpV2PortConfigTable."                      "The type of management address identifier encoding used in
            the associated 'lldpLocManagmentAddr' object.

            It should be noted that only a subset of the possible
            address encodings enumerated in AddressFamilyNumbers
            are appropriate for use as a LLDP management
            address, either because some are just not apliccable or 
            because the maximum size of a LldpV2ManAddress octet string
            would prevent the use of some address identifier encodings." 	"8.5.9.3"                     �"The string value used to identify the management address
            component associated with the local system. The purpose of
            this address is to contact the management entity." 	"8.5.9.4"                    �"A boolean controlling the transmission of system
             management address instance for the specified port,
             destination, subtype and MAN address used to index
             this table. If set to the default value of false,
             no transmission occurs. If set to true, the
             appropriate information is transmitted out of the
             port specified in the row's index." 	"9.1.2.1"                   -- not transmitted
�"Indicates the status of an entry in this table, and is used
        to create/delete entries.
        The corresponding instances of the following objects
        must be set before this object can be made active(1):
           lldpV2ManAddrConfigDestAddressIndex
           lldpV2ManAddrConfigLocManAddrSubtype
           lldpV2ManAddrConfigLocManAddr 
           lldpV2ManAddrConfigTxEnable

        The corresponding instances of the following objects
        may not be changed while this object is active(1):
           lldpV2ManAddrConfigDestAddressIndex
           lldpV2ManAddrConfigLocManAddrSubtype
           lldpV2ManAddrConfigLocManAddr "                          �"The value of sysUpTime object (defined in IETF RFC 3418)
            at the time an entry is created, modified, or deleted in the
            in tables associated with the lldpV2RemoteSystemsData objects
            and all LLDP extension objects associated with remote systems.

            An NMS can use this object to reduce polling of the
            lldpV2RemoteSystemsData objects."                      �"The number of times the complete set of information
            advertised by a particular MSAP has been inserted into tables
            contained in lldpV2RemoteSystemsData and lldpV2Extensions objects.

            The complete set of information received from a particular
            MSAP should be inserted into related tables. If partial
            information cannot be inserted for a reason such as lack
            of resources, all of the complete set of information should
            be removed.

            This counter should be incremented only once after the
            complete set of information is successfully recorded
            in all related tables. Any failures during inserting
            information set which result in deletion of previously
            inserted information should not trigger any changes in
            lldpV2StatsRemTablesInserts since the insert is not completed
            yet or in lldpStatsRemTablesDeletes, since the deletion
            would only be a partial deletion. If the failure was the
            result of lack of resources, the lldpStatsRemTablesDrops
            counter should be incremented once."                      ^"The number of times the complete set of information
            advertised by a particular MSAP has been deleted from
            tables contained in lldpV2RemoteSystemsData and lldpV2Extensions
            objects.

            This counter should be incremented only once when the
            complete set of information is completely deleted from all
            related tables. Partial deletions, such as deletion of
            rows associated with a particular MSAP from some tables,
            but not from all tables are not allowed, thus should not
            change the value of this counter."                       �"The number of times the complete set of information
            advertised by a particular MSAP could not be entered into
            tables contained in lldpV2RemoteSystemsData and lldpV2Extensions
            objects because of insufficient resources."                      O"The number of times the complete set of information
            advertised by a particular MSAP has been deleted from tables
            contained in lldpV2RemoteSystemsData and lldpV2Extensions objects
            because the information timeliness interval has expired.

            This counter should be incremented only once when the complete
            set of information is completely invalidated (aged out)
            from all related tables. Partial ageing, similar to deletion
            case, is not allowed, and thus, should not change the value
            of this counter."                      "A table containing LLDP transmission statistics for
            individual port/destination address combinations. 
            Entries are not required to exist in
            this table while the lldpPortConfigEntry object is equal to
            'disabled(4)'."                      �"LLDP frame transmission statistics for a particular port
             and destination MAC address. 
             The port is contained in the same chassis as the
             LLDP agent.
            
             All counter values in a particular entry shall be
             maintained on a continuing basis and shall not be deleted
             upon expiration of rxInfoTTL timing counters in the LLDP
             remote systems MIB of the receipt of a shutdown frame from
             a remote LLDP agent.

             All statistical counters associated with a particular
             port on the local LLDP agent become frozen whenever the
             adminStatus is disabled for the same port.

             Rows in this table can only be created for MAC addresses
             that can validly be used in association with the type of 
             interface concerned, as defined by table 8-2."                       �"The interface index value used to identify the port
            associated with this entry. Its value is an index
            into the interfaces MIB

            The value of this object is used as an index to the
            lldpV2StatsTxPortTable."                      B"The index value used to identify the destination
            MAC address associated with this entry. Its value identifies
            the row in the lldpV2DestAddressTable where the MAC address
            can be found.

            The value of this object is used as an index to the
            lldpV2StatsTxPortTable."                       �"The number of LLDP frames transmitted by this LLDP agent
            on the indicated port to the destination MAC address
            associated with this row of the table." 	"9.2.6.5"                     ;"The number of LLDPDU Length Errors recorded for the Port." 	"9.2.6.8"                     �"A table containing LLDP reception statistics for individual
            ports and destination MAC addresses. 
            Entries are not required to exist in this table while
            the lldpPortConfigEntry object is equal to 'disabled(4)'."                      �"LLDP frame reception statistics for a particular port.
             The port is contained in the same chassis as the
             LLDP agent.
            
             All counter values in a particular entry shall be
             maintained on a continuing basis and shall not be deleted
             upon expiration of rxInfoTTL timing counters in the LLDP
             remote systems MIB of the receipt of a shutdown frame from
             a remote LLDP agent.

             All statistical counters associated with a particular
             port on the local LLDP agent become frozen whenever the
             adminStatus is disabled for the same port.

             Rows in this table can only be created for MAC addresses
             that can validly be used in association with the type of 
             interface concerned, as defined by table 8-2.

             The contents of this table is persistent across
             re-initializations or re-boots."                       �"The interface index value used to identify the port
            associated with this entry. Its value is an index
            into the interfaces MIB

            The value of this object is used as an index to the
            lldpStatsRxPortV2Table."                      B"The index value used to identify the destination
            MAC address associated with this entry. Its value identifies
            the row in the lldpV2DestAddressTable where the MAC address
            can be found.

            The value of this object is used as an index to the
            lldpStatsRxPortV2Table."                      �"The number of LLDP frames received by this LLDP agent on
            the indicated port, and then discarded for any reason.
            This counter can provide an indication that LLDP header
            formatting problems may exist with the local LLDP agent in
            the sending system or that LLDPDU validation problems may
            exist with the local LLDP agent in the receiving system." 	"9.2.6.2"                     �"The number of invalid LLDP frames received by this LLDP
            agent on the indicated port, while this LLDP agent is enabled." 	"9.2.6.3"                     �"The number of valid LLDP frames received by this LLDP agent
            on the indicated port, while this LLDP agent is enabled." 	"9.2.6.4"                     h"The number of LLDP TLVs discarded for any reason by this LLDP
            agent on the indicated port." 	"9.2.6.6"                    �"The number of LLDP TLVs received on the given port that
            are not recognized by this LLDP agent on the indicated port.
            
            An unrecognized TLV is referred to as the TLV whose type value
            is in the range of reserved TLV types (000 1001 - 111 1110)
            in Table 9.1 of IEEE Std 802.1AB-2004. An unrecognized
            TLV may be a basic management TLV from a later LLDP version." 	"9.2.6.7"                    K"The counter that represents the number of age-outs that
            occurred on a given port. An age-out is the number of
            times the complete set of information advertised by a
            particular MSAP has been deleted from tables contained in
            lldpV2RemoteSystemsData and lldpV2Extensions objects because
            the information timeliness interval has expired.

            This counter is similar to lldpV2StatsRemTablesAgeouts, except
            that the counter is on a per port basis. This enables NMS to
            poll tables associated with the lldpV2RemoteSystemsData objects
            and all LLDP extension objects associated with remote systems
            on the indicated port only.

            This counter is set to zero during agent initialization
            and its value should not be saved in non-volatile storage.

            This counter is incremented only once when the
            complete set of information is invalidated (aged out) from
            all related tables on a particular port. Partial ageing
            is not allowed." 	"9.2.6.1"                         a"The type of encoding used to identify the chassis
            associated with the local system." 	"8.5.2.2"                     g"The string value used to identify the chassis component
            associated with the local system." 	"8.5.2.3"                     �"The string value used to identify the system name of the
            local system. If the local agent supports IETF RFC 3418,
            lldpLocSysName object should have the same value of sysName
            object." 	"8.5.6.2"                     �"The string value used to identify the system description
            of the local system. If the local agent supports IETF RFC 3418,
            lldpLocSysDesc object should have the same value of sysDesc
            object." 	"8.5.7.2"                     l"The bitmap value used to identify which system capabilities
            are supported on the local system." 	"8.5.8.1"                     j"The bitmap value used to identify which system capabilities
            are enabled on the local system." 	"8.5.8.2"                     �"This table contains one row per port
            of information associated with the local
            system known to this agent."                      �"Information about a particular port component.

            Entries may be created and deleted in this table by the
            agent.

            Rows in this table can only be created for MAC addresses
            that can validly be used in association with the type of 
            interface concerned, as defined by table 8-2.

            The contents of this table is persistent across
            re-initializations or re-boots."                       �"The interface index value used to identify the port
            associated with this entry. Its value is an index
            into the interfaces MIB

            The value of this object is used as an index to the
            lldpV2LocPortTable."                       a"The type of port identifier encoding used in the associated
            'lldpLocPortId' object." 	"8.5.3.2"                     t"The string value used to identify the port component
            associated with a given port in the local system." 	"8.5.3.3"                    "The string value used to identify the IEEE 802 LAN station's port
            description associated with the local system. If the local
            agent supports IETF RFC 2863, lldpLocPortDesc object should
            have the same value of ifDescr object." 	"8.5.5.2"                     i"This table contains management address information on the
            local system known to this agent."                      �"Management address information about a particular chassis
            component. There may be multiple management addresses
            configured on the system identified by a particular
            lldpLocChassisId. Each management address should have
            distinct 'management address type' (lldpV2LocManAddrSubtype) and
            'management address' (lldpLocManAddr.)

            Entries may be created and deleted in this table by the
            agent.
            Since a variable length octetstring is used as an index
            in a table, the address length is encoded as part of the OID
            (as per IETF RFC 2578)."                      "The type of management address identifier encoding used in
            the associated 'lldpLocManagmentAddr' object.

            It should be noted that only a subset of the possible
            address encodings enumerated in AddressFamilyNumbers
            are appropriate for use as a LLDP management
            address, either because some are just not apliccable or 
            because the maximum size of a LldpV2ManAddress octet string
            would prevent the use of some address identifier encodings." 	"8.5.9.3"                     �"The string value used to identify the management address
            component associated with the local system. The purpose of
            this address is to contact the management entity." 	"8.5.9.4"                    �"The total length of the management address subtype and the
            management address fields in LLDPDUs transmitted by the
            local LLDP agent.

            The management address length field is needed so that the
            receiving systems that do not implement SNMP are not
            required to implement an iana family numbers/address length
            equivalency table in order to decode the management address." 	"8.5.9.2"                     �"The enumeration value that identifies the interface numbering
            method used for defining the interface number
            (lldpV2LocManAddrIfId), associated with the local system." 	"8.5.9.5"                     �"The integer value used to identify the interface number
            regarding the management address component associated with
            the local system." 	"8.5.9.6"                     �"The OID value used to identify the type of hardware component
            or protocol entity associated with the management address
            advertised by the local system agent." 	"8.5.9.8"                        
n"This table contains one or more rows per physical network
            connection known to this agent. The agent may wish to ensure
            that only one lldpRemEntry is present for each local port
            and destination MAC address,
            or it may choose to maintain multiple lldpRemEntries for
            the same local port and destination MAC address.

            The following procedure may be used to retrieve remote
            systems information updates from an LLDP agent:

               1. NMS polls all tables associated with remote systems
                  and keeps a local copy of the information retrieved.
                  NMS polls periodically the values of the following
                  objects:
                     a. lldpV2StatsRemTablesInserts
                     b. lldpV2StatsRemTablesDeletes
                     c. lldpV2StatsRemTablesDrops
                     d. lldpV2StatsRemTablesAgeouts
                     e. lldpV2StatsRxPortAgeoutsTotal for all ports.

               2. LLDP agent updates remote systems MIB objects, and
                  sends out notifications to a list of notification
                  destinations.

               3. NMS receives the notifications and compares the new
                  values of objects listed in step 1. 

                  Periodically, NMS should poll the object
                  lldpV2StatsRemTablesLastChangeTime to find out if anything
                  has changed since the last poll. if something has
                  changed, NMS polls the objects listed in step 1 to
                  figure out what kind of changes occurred in the tables.

                  if value of lldpV2StatsRemTablesInserts has changed,
                  then NMS walks all tables by employing TimeFilter
                  with the last-polled time value. This request
                  returns new objects or objects whose values have been
                  updated since the last poll.

                  if value of lldpV2StatsRemTablesAgeouts has changed,
                  then NMS walks the lldpStatsRxPortAgeoutsTotal and
                  compares the new values with previously recorded ones.
                  For ports whose lldpStatsRxPortAgeoutsTotal value is
                  greater than the recorded value, NMS can
                  retrieve objects associated with those ports from
                  table(s) without employing a TimeFilter (which is
                  performed by specifying 0 for the TimeFilter.)

                  lldpV2StatsRemTablesDeletes and lldpV2StatsRemTablesDrops
                  objects are provided for informational purposes."                      �"Information about a particular physical network connection.
            Entries may be created and deleted in this table by the agent,
            if a physical topology discovery process is active.

            Rows in this table can only be created for MAC addresses
            that can validly be used in association with the type of 
            interface concerned, as defined by table 8-2.

            The contents of this table is persistent across
            re-initializations or re-boots."                       �"A TimeFilter for this entry. See the TimeFilter textual
            convention in IETF RFC 4502 and 
            http://www.ietf.org/IESG/Implementations/RFC2021-Implementation.txt
            to see how TimeFilter works." "IETF RFC 4502 section 6"                     �"The interface index value used to identify the port
            associated with this entry. Its value is an index
            into the interfaces MIB

            The value of this object is used as an index to the
            lldpV2RemTable."                      :"The index value used to identify the destination
            MAC address associated with this entry. Its value identifies
            the row in the lldpV2DestAddressTable where the MAC address
            can be found.

            The value of this object is used as an index to the
            lldpV2RemTable."                      �"This object represents an arbitrary local integer value used
            by this agent to identify a particular connection instance,
            unique only for the indicated remote system.

            An agent is encouraged to assign monotonically increasing
            index values to new entries, starting with one, after each
            reboot. It is considered unlikely that the lldpRemIndex
            can wrap between reboots."                       b"The type of encoding used to identify the chassis associated
            with the remote system." 	"8.5.2.2"                     h"The string value used to identify the chassis component
            associated with the remote system." 	"8.5.2.3"                     a"The type of port identifier encoding used in the associated
            'lldpRemPortId' object." 	"8.5.3.2"                     e"The string value used to identify the port component
            associated with the remote system." 	"8.5.3.3"                     t"The string value used to identify the description of
            the given port associated with the remote system." 	"8.5.5.2"                     U"The string value used to identify the system name of the
            remote system." 	"8.5.6.2"                     \"The string value used to identify the system description
            of the remote system." 	"8.5.7.2"                     m"The bitmap value used to identify which system capabilities
            are supported on the remote system." 	"8.5.8.1"                     k"The bitmap value used to identify which system capabilities
            are enabled on the remote system." 	"8.5.8.2"                     v"Indicates that there are chances in the remote systems
            MIB, as determined by the variable remoteChanges." 
"9.2.5.11"                     j"Indicates that there are too many neighbors
             as determined by the variable tooManyNeighbors." 
"9.2.5.15"                     �"This table contains one or more rows per management address
            information on the remote system learned on a particular port
            contained in the local chassis known to this agent."                      "Management address information about a particular chassis
            component. There may be multiple management addresses
            configured on the remote system identified by a particular
            lldpRemIndex whose information is received on
            an interface of the local system and a given destination
            MAC address. Each management
            address should have distinct 'management address
            type' (lldpRemManAddrSubtype) and 'management address'
            (lldpRemManAddr.)

            Entries may be created and deleted in this table by the
            agent.
            Since a variable length octetstring is used as an index
            in a table, theaddress length is encoded as part of the OID
            (as per IETF RFC 2578)."                      "The type of management address identifier encoding used in
            the associated 'lldpRemManagmentAddr' object.

            It should be noted that only a subset of the possible
            address encodings enumerated in AddressFamilyNumbers
            are appropriate for use as a LLDP management
            address, either because some are just not apliccable or 
            because the maximum size of a LldpV2ManAddress octet string
            would prevent the use of some address identifier encodings." 	"8.5.9.3"                     �"The string value used to identify the management address
            component associated with the remote system. The purpose
            of this address is to contact the management entity." 	"8.5.9.4"                     �"The enumeration value that identifies the interface numbering
            method used for defining the interface number, associated
            with the remote system." 	"8.5.9.5"                     "The integer value used to identify the interface number
            regarding the management address component associated with
            the remote system. The value depends upon the value of the
            lldpV2RemManAddrIfSubtype for the table row." 	"8.5.9.6"                     �"The OID value used to identify the type of hardware component
            or protocol entity associated with the management address
            advertised by the remote system agent." 	"8.5.9.8"                    "This table contains information about an incoming TLV which
            is not recognized by the receiving LLDP agent. The TLV may
            be from a later version of the basic management set.

            This table should only contain TLVs that are found in
            a single LLDP frame. Entries in this table, associated
            with an MAC service access point (MSAP, the access point
            for MAC services provided to the LCC sublayer, defined
            in IEEE 100, which is also identified with a particular
            lldpRemLocalPortNum, lldpRemIndex pair) are overwritten with
            most recently received unrecognized TLV from the same MSAP,
            or they naturally age out when the rxInfoTTL timer
            (associated with the MSAP) expires." "9.2.7.7.1"                     �"Information about an unrecognized TLV received from a
            physical network connection. Entries may be created and
            deleted in this table by the agent, if a physical topology
            discovery process is active."                       X"This object represents the value extracted from the type
            field of the TLV." "9.2.7.7.1"                     Y"This object represents the value extracted from the value
            field of the TLV." "9.2.7.7.1"                    $"This table contains one or more rows per physical network
            connection which advertises the organizationally defined
            information.

            Note that this table contains one or more rows of
            organizationally defined information that is not recognized
            by the local agent.

            If the local system is capable of recognizing any
            organizationally defined information, appropriate extension
            MIBs from the organization should be used for information
            retrieval."                      e"Information about the unrecognized organizationally
            defined information advertised by the remote system.
            The lldpRemTimeMark, lldpRemLocalPortNum, lldpRemIndex,
            lldpRemOrgDefInfoOUI, lldpRemOrgDefInfoSubtype, and
            lldpRemOrgDefInfoIndex are indexes to this table. If there is
            an lldpRemOrgDefInfoEntry associated with a particular remote
            system identified by the lldpRemLocalPortNum and lldpRemIndex,
            then there is an lldpRemEntry associated with the same
            instance (i.e, using same indexes.) When the lldpRemEntry
            for the same index is removed from the lldpRemTable, the
            associated lldpRemOrgDefInfoEntry is removed from
            the lldpRemOrgDefInfoTable.

            Entries may be created and deleted in this table by the
            agent."                       �"The Organizationally Unique Identifier (OUI), as defined
            in IEEE Std 802, is a 24 bit (three octets) globally
            unique assigned number referenced by various standards,
            of the information received from the remote system." 	"8.6.1.3"                    �"The integer value used to identify the subtype of the
            organizationally defined information received from the
            remote system.

            The subtype value is required to identify different instances
            of organizationally defined information that could not be
            retrieved without a unique identifier that indicates the
            particular type of information contained in the information
            string." 	"8.6.1.4"                    6"This object represents an arbitrary local integer value
            used by this agent to identify a particular unrecognized
            organizationally defined information instance, unique only
            for the lldpRemOrgDefInfoOUI and lldpRemOrgDefInfoSubtype
            from the same remote system.

            An agent is encouraged to assign monotonically increasing
            index values to new entries, starting with one, after each
            reboot. It is considered unlikely that the
            lldpRemOrgDefInfoIndex can wrap between reboots."                       �"The string value used to identify the organizationally
            defined information of the remote system. The encoding for
            this object should be as defined for SnmpAdminString TC." 	"8.6.1.5"                                 �"A compliance statement for all SNMP entities that 
            implement the LLDP MIB as either a transmitter or 
            a receiver of LLDPDUs.

            This version defines compliance requirements for
            V2 of the LLDP MIB module."       F--V2 to add ifGeneralInformationGroup
--and support re-indexed tables
       �"A compliance statement for SNMP entities that implement
            the LLDP MIB and have the capability of transmitting
            LLDP frames.

            This version defines compliance requirements for
            V2 of the LLDP MIB module."       a--V2 requirements for transmitters of LLDPDUs                   
--and support re-indexed tables
       �"The compliance statement for SNMP entities that implement
            the LLDP MIB.

            This version defines compliance requirements for
            V2 of the LLDP MIB module."       K--V2 requirements for receivers of LLDPDUs
--and support re-indexed tables
           e"The collection of objects which are used to configure the
            LLDP implementation behavior."                 e"The collection of objects which are used to configure the
            LLDP implementation behavior."                 e"The collection of objects which are used to configure the
            LLDP implementation behavior."                 ^"The collection of objects which are used to represent LLDP
            reception statistics."                 a"The collection of objects which are used to represent LLDP
            transmission statistics."                 b"The collection of objects which are used to represent LLDP
            Local System Information."                �"The collection of objects which are used to represent
            LLDP Remote Systems Information. The objects represent the
            information associated with the basic TLV set. Please note
            that even the agent doesn't implement some of the optional
            TLVs, it shall recognize all the optional TLV information
            that the remote system may advertise."                 x"The collection of notifications used to indicate LLDP MIB
            data consistency and general status information."                                