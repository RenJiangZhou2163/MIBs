 '-- Start of MPLS-FRR-FACILITY-STD-MIB
                                            �"Copyright (c) 2011 IETF Trust and the persons
          identified as authors of the code.  All rights
          reserved.

          Redistribution and use in source and binary forms,
          with or without modification, is permitted pursuant
          to, and subject to the license terms contained in,
          the Simplified BSD License set forth in Section 4.c
          of the IETF Trust's Legal Provisions Relating to
          IETF Documents
          (http://trustee.ietf.org/license-info).

          This MIB module contains object definitions for the
          MPLS Traffic Engineering facility backup method for
          Fast Reroute as defined in RFC 4090."�"
                     Riza Cetin
              Email: riza.cetin@alcatel.be

                     Thomas D. Nadeau
              Email: thomas.nadeau@ca.com

                     A S Kiran Koushik
              Email: kkoushik@cisco.com

                     Stefaan De Cnodder
              Email: Stefaan.de_cnodder@alcatel.be

                     Der-Hwa Gan
              Email: dhg@juniper.net
            " "201111030000Z" *"Initial version.  Published as RFC 6445."       -- 03 Nov 2011 00:00:00 GMT
          �"This notification is generated when a tunnel running over an
          interface as specified in the mplsFrrConstraintsTable is
          initially protected by the backup tunnel also specified in the
          mplsFrrConstraintsTable.  In some implementations, there may
          be a difference between when the control plane triggers
          this notification and when the hardware is programmed to
          utilize the protection path.  Due to the urgency of this
          operation, it is acceptable for the control plane to
          issue this notification either before or after it programs
          the hardware.  In cases where it is the latter approach,
          the notification MUST be sent immediately after the
          data plane has been altered.

          This notification should not be generated for each subsequent
          tunnel that is backed up by the FRR feature on this LSR, as
          this may result in potential scaling issues with regard to
          LSR performance and network load.  Note also that
          notifications MUST be generated in accordance with the

          mplsFrrNotificationsMaxRate."                "This notification is generated when the final tunnel that is
          being protected by a backup tunnel as specified in the
          mplsFrrConstraintsTable is restored to normal operation.  This
          notification should not be generated for each restored tunnel,
          as this may result in potential scaling issues with regard to
          LSR performance and network load.  Note also that
          notifications MUST be generated in accordance with the
          mplsFrrNotificationsMaxRate."                     O"Indicates the number of MPLS interfaces configured for
          protection."                       �"Indicates the number of interfaces currently being
          protected.  This value MUST be less than or equal
          to mplsFrrConfiguredInterfaces."                       a"Indicates the number of bypass tunnels configured to
          protect TE tunnels on this LSR."                       �"Indicates the number of bypass tunnels indicated in
          mplsFrrConfiguredBypassTunnels whose operStatus
          is up(1), indicating that they are currently protecting
          TE tunnels on this LSR."                       �"Enables or disables FRR notifications defined in this
          MIB module.  Notifications are disabled by default.

          This object is needed to control the notifications
          emitted by this implementation."                      �"This variable indicates the maximum number of
          notifications issued per second.  If events occur
          more rapidly, the implementation may simply fail to
          emit these notifications during that period, or may
          queue them until an appropriate time.  In case the
          implementation chooses to drop the events during
          throttling instead of queuing them to be sent at a later
          time, it is assumed that there will be no indication
          that events are being thrown away.

          A value of 0 means no throttling is applied and
          events may be generated at the rate at which they occur."                      �"The mplsFrrFacilityDBTable provides information about the
           fast-reroute database.  Each entry belongs to a protected
           interface, protecting backup tunnel, and protected tunnel.
           MPLS interfaces defined on this node are protected by
           backup tunnels and are indicated by the index
           mplsFrrFacilityProtectedIfIndex.  If the interface index is
           set to 0, this indicates that the remaining indexes apply
           to all configured protected interfaces.

           Note that all objects in this table are read-only, and
           if new objects are added to this table, they should also
           be read-only.

           It is recommended that ifIndex persistence be enabled
           across re-initializations.
           If persistence is not implemented, then the value of
           mplsFrrFacilityProtectedIfIndex in this
           table cannot be guaranteed across restarts and all entries
           in this table MUST NOT be persistent, or the values of
           mplsFrrFacilityProtectedIfIndex MUST be reconstructed
           on restart.

           It is recommended that entries in this table be persistent
           across reboots.

           The protecting tunnel is indicated by the
           index mplsFrrFacilityProtectingTunnelIndex and
           represents a valid mplsTunnelEntry.  Note that the tunnel
           instance index of the protecting tunnel may be set to 0,
           which indicates the tunnel head interface for the
           protecting tunnel, as per RFC 3812, but it may also be
           defined using the following semantics:

           - lower 16 bits : protected tunnel instance
           - higher 16 bits: must be all zeros"                      "An entry in the mplsFrrFacilityDBTable represents a single
          protected LSP, protected by a backup tunnel on a
          specific protected interface, or if the interface
          index is set to 0, on all interfaces.  Note that for
          brevity, managers should consult the mplsTunnelTable
          present in the MPLS-TE-STD-MIB module for
          additional information about the protecting and protected
          tunnels, and the ifEntry in the IF-MIB module

          for the protected interface."                      "Uniquely identifies the interface configured for FRR
          protection.  If this object is set to 0, this indicates
          that the remaining indexing combinations for this row
          apply to all interfaces on this device for which
          the FRR feature can operate."                      x"Uniquely identifies the mplsTunnelEntry primary index for
          the tunnel head interface designated to protect the
          interface as specified in the mplsFrrFacilityProtectedIfIndex
          (and all of the tunnels using this interface).  Note
          that the corresponding mplsTunnelInstance MUST BE
          0 as per the indexing convention stipulated." "Section 6.1 of RFC 3812."                     �"Uniquely identifies the mplsTunnelEntry primary index for
          the TE tunnel LSP being protected on the
          interface as specified by mplsFrrFacilityProtectedIfIndex."                       �"Uniquely identifies the mplsTunnelEntry secondary index
          for the TE tunnel LSP being protected on the
          interface as specified by mplsFrrFacilityProtectedIfIndex."                       �"Uniquely identifies the mplsTunnelEntry third index
          for the TE tunnel LSP being protected on the
          interface as specified by mplsFrrFacilityProtectedIfIndex." "Section 6.1 of RFC 3812."                     �"Uniquely identifies the mplsTunnelEntry fourth index
          for the TE tunnel LSP being protected on the
          interface as specified by mplsFrrFacilityProtectedIfIndex."                       p"The number of backup tunnels protecting the
          interface specified by mplsFrrFacilityProtectedIfIndex."                       �"The number of LSPs currently being protected on
          the interface specified by
          mplsFrrFacilityProtectedIfIndex."                       k"The number of tunnels protected on the interface
          specified by mplsFrrFacilityProtectedIfIndex."                      �"Specifies the state of the protecting tunnel as
          specified by mplsFrrFacilityProtectingTunnelIndex.

          active  - This tunnel's label has been placed in the
                    LFIB and is ready to be applied to incoming
                    packets.
          ready   - This tunnel's label entry has been created but
                    is not yet in the LFIB.
          partial - This tunnel's label entry has not been fully
                    created."                      �"Specifies the amount of bandwidth in units
          of '1,000 bits per second', actually reserved by
          the protecting tunnel for facility backup purposes.
          This value is repeated here from the MPLS-TE-STD-MIB
          module because the tunnel entry will reveal the
          bandwidth reserved by the signaling protocol, which is
          typically 0 for backup tunnels so as to not over-book
          bandwidth.  However, internal reservations are
          typically made on the PLR; thus, this value should be
          revealed here, as it is often different from
          mplsTunnelResourceMeanRate found in the MPLS-TE-STD-MIB
          module."                               f"Compliance statements for SNMP engines that support the
          MPLS-FRR-FACILITY-STD-MIB module."               f"Compliance statements for SNMP engines that support the
          MPLS-FRR-FACILITY-STD-MIB module."                   `"Objects that are required to represent the FRR
          Facility Route Database information."                 `"Objects that are required to represent the FRR
          Facility Route Database information."                 ;"Objects that are required to represent FRR notifications."                        