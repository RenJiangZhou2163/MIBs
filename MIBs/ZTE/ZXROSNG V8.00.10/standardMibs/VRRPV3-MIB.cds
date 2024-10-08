   !"RFC 5798 (Sections 3 and 5.2.3)" �"The value of the Virtual Router Identifier noted as
           (VRID) in RFC 5798.  This, along with interface index
           (ifIndex) and IP version, serves to uniquely identify
           a virtual router on a given VRRP router."                                                                                                                        "This MIB describes objects used for managing Virtual
            Router Redundancy Protocol version 3 (VRRPv3).

            Copyright (c) 2012 IETF Trust and the persons
            identified as authors of the code.  All rights
            reserved.

            Redistribution and use in source and binary forms,
            with or without modification, is permitted pursuant
            to, and subject to the license terms contained in,
            the Simplified BSD License set forth in Section
            4.c of the IETF Trust's Legal Provisions Relating
            to IETF Documents
            (http://trustee.ietf.org/license-info).

            This version of the MIB module is part of RFC 6527.
            Please see the RFC for full legal notices." �"WG E-Mail: vrrp@ietf.org

               Editor:    Kalyan Tata
                          Nokia
                          313 Fairchild Dr,
                          Mountain View, CA 94043
                          Tata_kalyan@yahoo.com" "201202120000Z" +"Initial version as published in RFC 6527."       -- Feb 13, 2012
           k"The newMaster notification indicates that the sending
           agent has transitioned to master state."                 �"The notification indicates that the sending agent has
           encountered the protocol error indicated by
           vrrpv3StatisticsProtoErrReason."                        "Unified Operations table for a VRRP router that
            consists of a sequence (i.e., one or more conceptual
            rows) of 'vrrpv3OperationsEntry' items each of which
            describe the operational characteristics of a virtual
            router."                      �"An entry in the vrrpv3OperationsTable containing the
            operational characteristics of a virtual router.
            On a VRRP router, a given virtual router is
            identified by a combination of ifIndex, VRID, and
            the IP version.  ifIndex represents an interface of
            the router.

            A row must be created with vrrpv3OperationsStatus
            set to initialize(1) and cannot transition to
            backup(2) or master(3) until
            vrrpv3OperationsRowStatus is transitioned to
            active(1).

            The information in this table is persistent and when
            written the entity SHOULD save the change to non-
            volatile storage."                       I"This object contains the Virtual Router Identifier
            (VRID)." 
"RFC 4001"                    i"The IP address type of Vrrpv3OperationsEntry and
           Vrrpv3AssociatedIpAddrEntry.  This value determines
           the type for vrrpv3OperationsMasterIpAddr,
           vrrpv3OperationsPrimaryIpAddr, and
           vrrpv3AssociatedIpAddrAddress.

            ipv4(1) and ipv6(2) are the only two values supported
            in this MIB module." 
"RFC 4001"                    I"The master router's real IP address.  The master router
         would set this address to vrrpv3OperationsPrimaryIpAddr
         while transitioning to master state.  For backup
         routers, this is the IP address listed as the source in
         the VRRP advertisement last received by this virtual
         router." 
"RFC 5798"                    F"In the case where there is more than one IP
           Address (associated IP addresses) for a given
           'ifIndex', this object is used to specify the IP
           address that will become the
           vrrpv3OperationsMasterIpAddr', should the virtual
           router transition from backup state to master."                      *"The virtual MAC address of the virtual router.
          Although this object can be derived from the
          'vrrpv3OperationsVrId' object, it is defined so that it
          is easily obtainable by a management application and
          can be included in VRRP-related SNMP notifications."                      "The current state of the virtual router.  This object
           has three defined values:

           - 'initialize', which indicates that the
              virtual router is waiting for a startup event.

           - 'backup', which indicates that the virtual router is
              monitoring the availability of the master router.

           - 'master', which indicates that the virtual router
              is forwarding packets for IP addresses that are
              associated with this router." 
"RFC 5798"                    C"This object specifies the priority to be used for the
         virtual router master election process; higher values
         imply higher priority.

         A priority of '0', although not settable, is sent by
         the master router to indicate that this router has
         ceased to participate in VRRP, and a backup virtual
         router should transition to become a new master.

         A priority of 255 is used for the router that owns the
         associated IP address(es) for VRRP over IPv4 and hence
         is not settable.

         Setting the values of this object to 0 or 255 should be
         rejected by the agents implementing this MIB module.
         For example, an SNMP agent would return 'badValue(3)'
         when a user tries to set the values 0 or 255 for this
         object." "RFC 5798, Section 6.1"                     �"The number of IP addresses that are associated with
           this virtual router.  This number is equal to the
           number of rows in the vrrpv3AssociatedAddrTable that
           correspond to a given ifIndex/VRID/IP version." "RFC 5798, Section 6.1"                     �"The time interval, in centiseconds, between sending
           advertisement messages.  Only the master router sends
           VRRP advertisements." "RFC 5798, Section 6.1"                     c"Controls whether a higher priority virtual router will
         preempt a lower priority master." "RFC 5798, Section 6.1"                    R"Controls whether a virtual router in master state
          will accept packets addressed to the address owner's
          IPv6 address as its own if it is not the IPv6 address
          owner.  Default is false(2).
          This object is not relevant for rows representing VRRP
          over IPv4 and should be set to false(2)."                       �"This value represents the amount of time, in
           TimeTicks (hundredth of a second), since this virtual
           router (i.e., the 'vrrpv3OperationsStatus')
           transitioned out of 'initialize'." "RFC 5798, Section 6.1"                    �"The RowStatus variable should be used in accordance to
          installation and removal conventions for conceptual
          rows.

          To create a row in this table, a manager sets this
          object to either createAndGo(4) or createAndWait(5).
          Until instances of all corresponding columns are
          appropriately configured, the value of the
          corresponding instance of the
          'vrrpv3OperationsRowStatus' column will be read as
          notReady(3).

          In particular, a newly created row cannot be made
          active(1) until (minimally) the corresponding instance
          of vrrpv3OperationsInetAddrType, vrrpv3OperationsVrId,
          and vrrpv3OperationsPrimaryIpAddr has been set, and
          there is at least one active row in the
          'vrrpv3AssociatedIpAddrTable' defining an associated
          IP address.

          notInService(2) should be used to administratively
          bring the row down.

          A typical order of operation to add a row is:
          1. Create a row in vrrpv3OperationsTable with
          createAndWait(5).
          2. Create one or more corresponding rows in
          vrrpv3AssociatedIpAddrTable.
          3. Populate the vrrpv3OperationsEntry.
          4. Set vrrpv3OperationsRowStatus to active(1).

          A typical order of operation to delete an entry is:
          1. Set vrrpv3OperationsRowStatus to notInService(2).
          2. Set the corresponding rows in
          vrrpv3AssociatedIpAddrTable to destroy(6) to delete
          the entry.
          3. Set vrrpv3OperationsRowStatus to destroy(6) to
          delete the entry."                       J"The table of addresses associated with each virtual
            router."                      �"An entry in the table contains an IP address that is
          associated with a virtual router.  The number of rows
          for a given IP version, VrID, and ifIndex will equal
          the number of IP addresses associated (e.g., backed up)
          by the virtual router (equivalent to
          'vrrpv3OperationsIpAddrCount').

          Rows in the table cannot be modified unless the value
          of 'vrrpv3OperationsStatus' for the corresponding entry
          in the vrrpv3OperationsTable has transitioned to
          initialize(1).

          The information in this table is persistent and when
          written the entity SHOULD save the change to non-
          volatile storage."                       �"The assigned IP addresses that a virtual router is
           responsible for backing up.

           The IP address type is determined by the value of
           vrrpv3OperationsInetAddrType in the index of this
           row." 
"RFC 5798"                    �"The row status variable, used according to
         installation and removal conventions for conceptual
         rows.  To create a row in this table, a manager sets
         this object to either createAndGo(4) or
         createAndWait(5).  Setting this object to active(1)
         results in the addition of an associated address for a
         virtual router.  Setting this object to notInService(2)
         results in administratively bringing down the row.

         Destroying the entry or setting it to destroy(6)
         removes the associated address from the virtual router.
         The use of other values is implementation-dependent.

         Implementations should not allow deletion of the last
         row corresponding to an active row in
         vrrpv3OperationsTable.

         Refer to the description of vrrpv3OperationsRowStatus
         for typical row creation and deletion scenarios."                          M"The total number of VRRP packets received with an
           invalid VRRP checksum value.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3GlobalStatisticsDiscontinuityTime." "RFC 5798, Section 5.2.8"                    W"The total number of VRRP packets received with an
           unknown or unsupported version number.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3GlobalStatisticsDiscontinuityTime." "RFC 5798, Section 5.2.1"                    {"The total number of VRRP packets received with a
            VRID that is not valid for any virtual router on this
            router.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3GlobalStatisticsDiscontinuityTime." "RFC 5798, Section 5.2.3"                    �"The value of sysUpTime on the most recent occasion at
         which one of vrrpv3RouterChecksumErrors,
         vrrpv3RouterVersionErrors, and vrrpv3RouterVrIdErrors
         suffered a discontinuity.

         If no such discontinuities have occurred since the last
         re-initialization of the local management subsystem,
         then this object contains a zero value."                       %"Table of virtual router statistics."                       c"An entry in the table containing statistics
           information about a given virtual router."                      X"The total number of times that this virtual router's
           state has transitioned to master state.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime."                      �"This indicates the reason for the virtual router to
          transition to master state.  If the virtual router
          never transitioned to master state, the value of this
          object is notMaster(0).  Otherwise, this indicates the
          reason this virtual router transitioned to master
          state the last time.  Used by vrrpv3NewMaster
          notification."                      D"The total number of VRRP advertisements received by
           this virtual router.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime."                      �"The total number of VRRP advertisement packets
           received for which the advertisement interval is
           different from the vrrpv3OperationsAdvInterval
           configured on this virtual router.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime."                      �"The total number of VRRP packets received by the
           virtual router with IPv4 TTL (for VRRP over IPv4) or
           IPv6 Hop Limit (for VRRP over IPv6) not equal to 255.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime." "RFC 5798, Section 5.1.1.3"                     �"This indicates the reason for the last protocol
           error.  This SHOULD be set to noError(0) when no
           protocol errors are encountered.  Used by
           vrrpv3ProtoError notification."                      S"The total number of VRRP packets received by the
           virtual router with a priority of '0'.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime." "RFC 5798, Section 5.2.4"                    O"The total number of VRRP packets sent by the virtual
           router with a priority of '0'.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime." "RFC 5798, Section 5.2.4"                    `"The number of VRRP packets received by the virtual
           router with an invalid value in the 'type' field.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime."                      �"The total number of packets received for which the
           address list does not match the locally configured
           list for the virtual router.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime."                      ^"The total number of packets received with a packet
           length less than the length of the VRRP header.

           Discontinuities in the value of this counter can occur
           at re-initialization of the management system, and at
           other times as indicated by the value of
           vrrpv3StatisticsRowDiscontinuityTime."                      I"The value of sysUpTime on the most recent occasion at
         which any one or more of this entry's counters
         suffered a discontinuity.

         If no such discontinuities have occurred since the last
         re-initialization of the local management subsystem,
         then this object contains a zero value."                       �"The minimum reasonable polling interval for this entry.
         This object provides an indication of the minimum
         amount of time required to update the counters in this
         entry."                               "The compliance statement"   #"Setable values are from 1 to 254."            "When this MIB module is implemented without support
          for read-create (i.e., in read-only mode), then such
          an implementation can claim read-only compliance.
          Such a device can then be monitored, but cannot be
          configured with this MIB."   "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required." "Write access is not required."                 *"Conformance group for VRRPv3 operations."                 *"Conformance group for VRRPv3 statistics."                 J"Objects providing information about counter
           discontinuities."                 N"Conformance group for objects contained in VRRPv3
           notifications."                 ""The VRRP MIB Notification Group."                            