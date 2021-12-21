    W"Used to report the result of an operation:

         responseReceived(1) - Operation is completed successfully.
         unknown(2) - Operation failed due to unknown error.
         internalError(3) - An implementation detected an error
              in its own processing that caused an operation
              to fail.
         requestTimedOut(4) - Operation failed to receive a
              valid reply within the time limit imposed on it.
         unknownDestinationAddress(5) - Invalid destination
              address.
         noRouteToTarget(6) - Could not find a route to target.
         interfaceInactiveToTarget(7) - The interface to be
              used in sending a probe is inactive, and an
              alternate route does not exist.
         arpFailure(8) - Unable to resolve a target address to a
              media-specific address.
         maxConcurrentLimitReached(9) - The maximum number of
              concurrent active operations would have been exceeded
              if the corresponding operation was allowed.
         unableToResolveDnsName(10) - The DNS name specified was
              unable to be mapped to an IP address.
         invalidHostAddress(11) - The IP address for a host
              has been determined to be invalid.  Examples of this
              are broadcast or multicast addresses."                                                                                                        1"The Ping MIB (DISMAN-PING-MIB) provides the capability of
        controlling the use of the ping function at a remote
        host.

        Copyright (C) The Internet Society (2006).  This version of
        this MIB module is part of RFC 4560; see the RFC itself for
        full legal notices." �"Juergen Quittek

        NEC Europe Ltd.
        Network Laboratories
        Kurfuersten-Anlage 36
        69115 Heidelberg
        Germany

        Phone: +49 6221 4342-115
        Email: quittek@netlab.nec.de" "200606130000Z" "200009210000Z"�"Updated version, published as RFC 4560.
             - Correctly considered IPv6 in DESCRIPTION
               clause of pingCtlDataSize
             - Replaced references to RFC 2575 by RFC 3415
             - Replaced references to RFC 2571 by RFC 3411
             - Replaced references to RFC 2851 by RFC 4001
             - Added DEFVAL { {} } to definition of
               pingCtlTrapGeneration
             - Changed DEFVAL of object pingCtlDescr from
               DEFVAL { '00'H } to DEFVAL { ''H }
             - Changed DEFVAL of object pingCtlSourceAddressType
               from DEFVAL { ipv4 } to DEFVAL { unknown }
             - Extended DESCRIPTION clause of pingResultsTable
               describing re-initialization of entries
             - Changed SYNTAX of pingResultsProbeResponses and
               pingResultsSentProbes from Unsigned32 to Gauge32
             - Changed status of pingCompliance to deprecated
             - Added pingFullCompliance and pingMinimumCompliance
             - Changed status of pingGroup and pingTimeStampGroup
               to deprecated
             - Added pingMinimumGroup, pingCtlRowStatusGroup,
               and pingHistoryGroup" )"Initial version, published as RFC 2925."       -- 13 June 2006
          �"Generated when a probe failure is detected, when the
          corresponding pingCtlTrapGeneration object is set to
          probeFailure(0), subject to the value of
          pingCtlTrapProbeFailureFilter.  The object
          pingCtlTrapProbeFailureFilter can be used to specify the
          number of consecutive probe failures that are required
          before this notification can be generated."                ["Generated when a ping test is determined to have failed,
          when the corresponding pingCtlTrapGeneration object is
          set to testFailure(1).  In this instance,
          pingCtlTrapTestFailureFilter should specify the number of
          probes in a test required to have failed in order to
          consider the test failed."                 �"Generated at the completion of a ping test when the
          corresponding pingCtlTrapGeneration object has the
          testCompletion(2) bit set."                    �"The maximum number of concurrent active ping requests
       that are allowed within an agent implementation.  A value
       of 0 for this object implies that there is no limit for
       the number of concurrent active requests in effect.
       The limit applies only to new requests being activated.
       When a new value is set, the agent will continue processing
       all the requests already active, even if their number
       exceeds the limit just imposed."                       �"Defines the ping Control Table for providing, via SNMP,
        the capability of performing ping operations at
        a remote host.  The results of these operations are
        stored in the pingResultsTable and the
        pingProbeHistoryTable."                      �"Defines an entry in the pingCtlTable.  The first index
        element, pingCtlOwnerIndex, is of type SnmpAdminString,
        a textual convention that allows for use of the SNMPv3
        View-Based Access Control Model (RFC 3415, VACM)
        and that allows a management application to identify its
        entries.  The second index, pingCtlTestName (also an
        SnmpAdminString), enables the same management
        application to have multiple outstanding requests."                      $"To facilitate the provisioning of access control by a
       security administrator using the View-Based Access
       Control Model (RFC 2575, VACM) for tables in which
       multiple users may need to create or
       modify entries independently, the initial index is used
       as an 'owner index'.  Such an initial index has a syntax
       of SnmpAdminString and can thus be trivially mapped to a
       securityName or groupName defined in VACM, in
       accordance with a security policy.

       When used in conjunction with such a security policy, all
       entries in the table belonging to a particular user (or
       group) will have the same value for this initial index.
       For a given user's entries in a particular table, the
       object identifiers for the information in these entries
       will have the same subidentifiers (except for the 'column'
       subidentifier) up to the end of the encoded owner index.
       To configure VACM to permit access to this portion of the
       table, one would create vacmViewTreeFamilyTable entries
       with the value of vacmViewTreeFamilySubtree including
       the owner index portion, and vacmViewTreeFamilyMask
       'wildcarding' the column subidentifier.  More elaborate
       configurations are possible."                       g"The name of the ping test.  This is locally unique, within
        the scope of a pingCtlOwnerIndex."                       j"Specifies the type of host address to be used at a remote
        host for performing a ping operation."                      o"Specifies the host address to be used at a remote host for
        performing a ping operation.  The host address type is
        determined by the value of the corresponding
        pingCtlTargetAddressType.

        A value for this object MUST be set prior to transitioning
        its corresponding pingCtlEntry to active(1) via
        pingCtlRowStatus."                      �"Specifies the size of the data portion to be
        transmitted in a ping operation, in octets.  Whether this
        value can be applied depends on the selected
        implementation method for performing a ping operation,
        indicated by pingCtlType in the same conceptual row.
        If the method used allows applying the value contained
        in this object, then it MUST be applied.  If the specified
        size is not appropriate for the chosen ping method, the
        implementation SHOULD use whatever size (appropriate to
        the method) is closest to the specified size.

        The maximum value for this object was computed by
        subtracting the smallest possible IP header size of
        20 octets (IPv4 header with no options) and the UDP
        header size of 8 octets from the maximum IP packet size.
        An IP packet has a maximum size of 65535 octets
        (excluding IPv6 Jumbograms)."                       Q"Specifies the time-out value, in seconds, for a
        remote ping operation."          --[ZXROSNG] Unsigned32 (1..20)
             t"Specifies the number of times to perform a ping
        operation at a remote host as part of a single ping test."                      �"Reflects the desired state that a pingCtlEntry should be
        in:
           enabled(1)  - Attempt to activate the test as defined by
                         this pingCtlEntry.
           disabled(2) - Deactivate the test as defined by this
                         pingCtlEntry.

        Refer to the corresponding pingResultsOperStatus to
        determine the operational state of the test defined by
        this entry."                      �"The content of this object is used together with the
        corresponding pingCtlDataSize value to determine how to
        fill the data portion of a probe packet.  The option of
        selecting a data fill pattern can be useful when links
        are compressed or have data pattern sensitivities.  The
        contents of pingCtlDataFill should be repeated in a ping
        packet when the size of the data portion of the ping
        packet is greater than the size of pingCtlDataFill."                      �"The number of seconds to wait before repeating a ping test
        as defined by the value of the various objects in the
        corresponding row.

        A single ping test consists of a series of ping probes.
        The number of probes is determined by the value of the
        corresponding pingCtlProbeCount object.  After a single
        test is completed the number of seconds as defined by the
        value of pingCtlFrequency MUST elapse before the
        next ping test is started.

        A value of 0 for this object implies that the test
        as defined by the corresponding entry will not be
        repeated."                      �"The maximum number of corresponding entries allowed
        in the pingProbeHistoryTable.  An implementation of this
        MIB will remove the oldest corresponding entry in the
        pingProbeHistoryTable to allow the addition of an
        new entry once the number of corresponding rows in the
        pingProbeHistoryTable reaches this value.

        Old entries are not removed when a new test is
        started.  Entries are added to the pingProbeHistoryTable
        until pingCtlMaxRows is reached before entries begin to
        be removed.

        A value of 0 for this object disables creation of
        pingProbeHistoryTable entries."                       �"The storage type for this conceptual row.
        Conceptual rows having the value 'permanent' need not
        allow write-access to any columnar objects in the row."                      �"The value of this object determines when and whether
        to generate a notification for this entry:
        probeFailure(0)   - Generate a pingProbeFailed
            notification subject to the value of
            pingCtlTrapProbeFailureFilter.  The object
            pingCtlTrapProbeFailureFilter can be used
            to specify the number of consecutive probe
            failures that are required before a
            pingProbeFailed notification can be generated.
        testFailure(1)    - Generate a pingTestFailed
            notification.  In this instance the object
            pingCtlTrapTestFailureFilter can be used to
            determine the number of probe failures that
            signal when a test fails.
        testCompletion(2) - Generate a pingTestCompleted
            notification.

        By default, no bits are set, indicating that
        none of the above options is selected."                     -- no bits set.
�"The value of this object is used to determine when
        to generate a pingProbeFailed NOTIFICATION.

        Setting BIT probeFailure(0) of object
        pingCtlTrapGeneration to '1' implies that a
        pingProbeFailed NOTIFICATION is generated only when

        a number of consecutive ping probes equal to the
        value of pingCtlTrapProbeFailureFilter fail within
        a given ping test.  After triggering the notification,
        the probe failure counter is reset to zero."                      �"The value of this object is used to determine when
        to generate a pingTestFailed NOTIFICATION.

        Setting BIT testFailure(1) of object
        pingCtlTrapGeneration to '1' implies that a
        pingTestFailed NOTIFICATION is generated only when
        a number of consecutive ping tests equal to the
        value of pingCtlTrapProbeFailureFilter fail.
        After triggering the notification, the test failure
        counter is reset to zero."                      �"The value of this object is used either to report or
        to select the implementation method to be used for
        calculating a ping response time.  The value of this
        object MAY be selected from pingImplementationTypeDomains.

        Additional implementation types SHOULD be allocated as
        required by implementers of the DISMAN-PING-MIB under
        their enterprise-specific registration point and not
        beneath pingImplementationTypeDomains."                       _"The purpose of this object is to provide a
        descriptive name of the remote ping test."                       �"Specifies the type of the source address,
        pingCtlSourceAddress, to be used at a remote host
        when a ping operation is performed."                      �"Use the specified IP address (which must be given in
        numeric form, not as a hostname) as the source address
        in outgoing probe packets.  On hosts with more than one
        IP address, this option can be used to select the address
        to be used.  If the IP address is not one of this
        machine's interface addresses, an error is returned and
        nothing is sent.  A zero-length octet string value for
        this object disables source address specification.

        The address type (InetAddressType) that relates to
        this object is specified by the corresponding value
        of pingCtlSourceAddressType."                      "Setting this object to an interface's ifIndex prior
        to starting a remote ping operation directs
        the ping probes to be transmitted over the
        specified interface.  A value of zero for this object
        means that this option is not enabled."                      "The purpose of this object is to enable optional
       bypassing the route table.  If enabled, the remote
       host will bypass the normal routing tables and send
       directly to a host on an attached network.  If the
       host is not on a directly attached network, an
       error is returned.  This option can be used to perform
       the ping operation to a local host through an
       interface that has no route defined (e.g., after the
       interface was dropped by the routing daemon at the host)."                      G"Specifies the value to store in the Type of Service
        (TOS) octet in the IPv4 header or in the Traffic
        Class octet in the IPv6 header, respectively, of the
        IP packet used to encapsulate the ping probe.

        The octet to be set in the IP header contains the
        Differentiated Services (DS) Field in the six most
        significant bits.

        This option can be used to determine what effect an
        explicit DS Field setting has on a ping response.
        Not all values are legal or meaningful.  A value of 0
        means that the function represented by this option is
        not supported.  DS Field usage is often not supported
        by IP implementations, and not all values are supported.
        Refer to RFC 2474 and RFC 3260 for guidance on usage of
        this field." �"Refer to RFC 1812 for the definition of the IPv4 TOS
        octet and to RFC 2460 for the definition of the IPv6
        Traffic Class octet.  Refer to RFC 2474 and RFC 3260
        for the definition of the Differentiated Services Field."                    �"This object allows entries to be created and deleted
        in the pingCtlTable.  Deletion of an entry in this
        table results in the deletion of all corresponding (same
        pingCtlOwnerIndex and pingCtlTestName index values)
        pingResultsTable and pingProbeHistoryTable entries.

        A value MUST be specified for pingCtlTargetAddress
        prior to acceptance of a transition to active(1) state.

        When a value for pingCtlTargetAddress is set,
        the value of object pingCtlRowStatus changes
        from notReady(3) to notInService(2).

        Activation of a remote ping operation is controlled
        via pingCtlAdminStatus, not by changing
        this object's value to active(1).

        Transitions in and out of active(1) state are not
        allowed while an entry's pingResultsOperStatus is
        active(1), with the exception that deletion of
        an entry in this table by setting its RowStatus
        object to destroy(6) will stop an active
        ping operation.

        The operational state of a ping operation
        can be determined by examination of its
        pingResultsOperStatus object." T"See definition of RowStatus in RFC 2579, 'Textual
        Conventions for SMIv2.'"                    �"Defines the Ping Results Table for providing
        the capability of performing ping operations at
        a remote host.  The results of these operations are
        stored in the pingResultsTable and the pingProbeHistoryTable.

        An entry is added to the pingResultsTable when an
        pingCtlEntry is started by successful transition
        of its pingCtlAdminStatus object to enabled(1).

        If the object pingCtlAdminStatus already has the value
        enabled(1), and if the corresponding pingResultsOperStatus
        object has the value completed(3), then successfully writing
        enabled(1) to object pingCtlAdminStatus re-initializes the
        already existing entry in the pingResultsTable.  The values
        of objects in the re-initialized entry are the same as the
        values of objects in a new entry would be.

        An entry is removed from the pingResultsTable when
        its corresponding pingCtlEntry is deleted."                       �"Defines an entry in the pingResultsTable.  The
        pingResultsTable has the same indexing as the
        pingCtlTable so that a pingResultsEntry
        corresponds to the pingCtlEntry that caused it to
        be created."                       �"Reflects the operational state of a pingCtlEntry:

           enabled(1)    - Test is active.
           disabled(2)   - Test has stopped.
           completed(3)  - Test is completed."                       |"This object indicates the type of address stored
        in the corresponding pingResultsIpTargetAddress
        object."                      �"This object reports the IP address associated
        with a pingCtlTargetAddress value when the destination
        address is specified as a DNS name.  The value of
        this object should be a zero-length octet string
        when a DNS name is not specified or when a
        specified DNS name fails to resolve.

        The address type (InetAddressType) that relates to
        this object is specified by the corresponding value
        of pingResultsIpTargetAddressType."                       �"The minimum ping round-trip-time (RTT) received.  A value
        of 0 for this object implies that no RTT has been received."                       �"The maximum ping round-trip-time (RTT) received.  A value
        of 0 for this object implies that no RTT has been received."                       1"The current average ping round-trip-time (RTT)."                       �"Number of responses received for the corresponding
        pingCtlEntry and pingResultsEntry.  The value of this object
        MUST be reported as 0 when no probe responses have been
        received."                       �"The value of this object reflects the number of probes sent
        for the corresponding pingCtlEntry and pingResultsEntry.
        The value of this object MUST be reported as 0 when no probes
        have been sent."                      "This object contains the sum of the squares for all ping
        responses received.  Its purpose is to enable standard
        deviation calculation.  The value of this object MUST
        be reported as 0 when no ping responses have been
        received."                       I"Date and time when the last response was received for
        a probe."                      �"Defines a table for storing the results of ping
        operations.  The number of entries in this table is
        limited per entry in the pingCtlTable by the value
        of the corresponding pingCtlMaxRows object.

        An entry in this table is created when the result of
        a ping probe is determined.  The initial 2 instance
        identifier index values identify the pingCtlEntry
        that a probe result (pingProbeHistoryEntry) belongs
        to.  An entry is removed from this table when
        its corresponding pingCtlEntry is deleted.

        An implementation of this MIB will remove the oldest
        entry in the pingProbeHistoryTable of the
        corresponding entry in the pingCtlTable to allow
        the addition of an new entry once the number of rows
        in the pingProbeHistoryTable reaches the value
        specified by pingCtlMaxRows for the corresponding
        entry in the pingCtlTable."                       �"Defines an entry in the pingProbeHistoryTable.
        The first two index elements identify the
        pingCtlEntry that a pingProbeHistoryEntry belongs
        to.  The third index element selects a single
        probe result."                      �"An entry in this table is created when the result of
        a ping probe is determined.  The initial 2 instance
        identifier index values identify the pingCtlEntry
        that a probe result (pingProbeHistoryEntry) belongs
        to.

        An implementation MUST start assigning
        pingProbeHistoryIndex values at 1 and wrap after
        exceeding the maximum possible value as defined by
        the limit of this object ('ffffffff'h)."                       �"The amount of time measured in milliseconds from when
        a probe was sent to when its response was received or
        when it timed out.  The value of this object is reported
        as 0 when it is not possible to transmit a probe."                       9"The result of a particular probe done by a remote host."                      �"The last implementation-method-specific reply code received.
        If the ICMP Echo capability is being used, then a successful
        probe ends when an ICMP response is received that contains
        the code ICMP_ECHOREPLY(0).  The ICMP codes are maintained
        by IANA.  Standardized ICMP codes are listed at
        http://www.iana.org/assignments/icmp-parameters.
        The ICMPv6 codes are listed at
        http://www.iana.org/assignments/icmpv6-parameters."                       6"Timestamp for when this probe result was determined."                               c"The compliance statement for SNMP entities that
            fully implement the DISMAN-PING-MIB."   R"The agent is not required to support set
            operations to this object." "Write access is not required." �"Write access is not required.  In addition, the only
            value that MUST be supported by an implementation is
            pingIcmpEcho." �"Write access to this object is not required by
            implementations that are not capable of binding the
            send socket with a source address.  An implementation
            is only required to support IPv4 and IPv6 addresses." �"Write access to this object is not required by
            implementations that are not capable of binding the
            send socket with a source address.  An implementation
            is only required to support IPv4 and IPv6 addresses." �"Write access is not required.  If write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported.""Write access to this object is not required by
            implementations that are not capable of its
            implementation.  The function represented by this
            object is implementable if the setsockopt
            SOL_SOCKET SO_DONTROUTE option is supported." �"Write access is not required.  If write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported." U"An implementation is only required to
            support IPv4 and IPv6 addresses." e"An implementation is only required to
            support IPv4 and globally unique IPv6 addresses."2"This object is mandatory for implementations that have
            access to a system clock and that are capable of setting
            the values for DateAndTime objects.  It is RECOMMENDED
            that when this object is not supported its values
            be reported as '0000000000000000'H."2"This object is mandatory for implementations that have
            access to a system clock and that are capable of setting
            the values for DateAndTime objects.  It is RECOMMENDED
            that when this object is not supported its values
            be reported as '0000000000000000'H."             �"The minimum compliance statement for SNMP entities
            that implement the minimal subset of the
            DISMAN-PING-MIB.  Implementors might choose this
            subset for small devices with limited resources."   _"A compliant implementation does not have to implement
            the pingCtlRowStatusGroup." Z"A compliant implementation does not have to implement
            the pingHistoryGroup." `"A compliant implementation does not have to implement
            the pingNotificationsGroup." R"The agent is not required to support set
            operations to this object." R"The agent is not required to support set
            operations to this object." �"Write access is not required.  If write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported." �"Write access is not required.  If the
            pingHistoryGroup is not implemented, then write
            access to this object MUST be disabled, and the object
            MUST return a value of 0 when retrieved." "Write access is not required."B"Write access is not required.  If the
            pingNotificationsGroup is not implemented, then write
            access to this object MUST be disabled, and the object
            MUST return a value with no bit set when retrieved.
            No bit set indicates that not notification is
            generated." �"If write access to pingCtlTrapGeneration is not
            supported, then write access to this object must also
            not be supported.  In this case, return 0 as the value
            of this object." �"If write access to pingCtlTrapGeneration is not
            supported, then write access to this object must also
            not be supported.  In this case, return 0 as the value
            of this object." �"Write access is not required.  In addition, the only
            value that MUST be supported by an implementation is
            pingIcmpEcho." R"The agent is not required to support set
            operations to this object." �"Write access to this object is not required by
            implementations that are not capable of binding the
            send socket with a source address.  An implementation
            is only required to support IPv4 and IPv6 addresses." �"Write access to this object is not required by
            implementations that are not capable of binding the
            send socket with a source address.  An implementation
            is only required to support IPv4 and IPv6 addresses." �"Write access is not required.  If write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported." �"Write access is not required.  If write access is
            not supported, return false(2) as the value of this
            object.  A value of false(2) means that the function
            represented by this option is not supported." �"Write access is not required.  If write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported." U"An implementation is only required to
            support IPv4 and IPv6 addresses." e"An implementation is only required to
            support IPv4 and globally unique IPv6 addresses."2"This object is mandatory for implementations that have
            access to a system clock and that are capable of setting
            the values for DateAndTime objects.  It is RECOMMENDED
            that when this object is not supported its values
            be reported as '0000000000000000'H."l"If the pingHistoryGroup is implemented, then this
            object is mandatory for implementations that have
            access to a system clock and that are capable of setting
            the values for DateAndTime objects.  It is RECOMMENDED
            that when this object is not supported its values
            be reported as '0000000000000000'H."            b"The compliance statement for the DISMAN-PING-MIB.  This
            compliance statement has been deprecated because the
            group pingGroup and the pingTimeStampGroup have been
            split and deprecated.  The pingFullCompliance statement
            is semantically identical to the deprecated
            pingCompliance statement."  ["This group is mandatory for implementations that have
            access to a system clock and that are capable of setting
            the values for DateAndTime objects.  It is RECOMMENDED
            that when this group is not supported the values
            for the objects in this group be reported as
            '0000000000000000'H." R"The agent is not required to support set
            operations to this object." �"Write access is not required.  It is also allowed
            that implementations support only the volatile
            StorageType enumeration." �"Write access is not required.  In addition, the only
            value that MUST be supported by an implementation is
            pingIcmpEcho."	"This object is not required by implementations that
            are not capable of its implementation.  The function
            represented by this object is implementable if the
            setsockopt SOL_SOCKET SO_DONTROUTE option is
            supported." �"This object is not required by implementations that
            are not capable of binding the send socket with a
            source address.  An implementation is only required to
            support IPv4 and IPv6 addresses." �"This object is not required by implementations that
            are not capable of binding the send socket with a
            source address.  An implementation is only required to
            support IPv4 and globally unique IPv6 addresses." �"Write access is not required.  When write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported." �"Write access is not required.  When write access is
            not supported, return a 0 as the value of this object.
            A value of 0 means that the function represented by
            this option is not supported." U"An implementation is only required to
            support IPv4 and IPv6 addresses." e"An implementation is only required to
            support IPv4 and globally unique IPv6 addresses."                 J"The group of objects that constitute the remote ping
       capability."                 +"The RowStatus object of the pingCtlTable."                 F"The group of objects that constitute the history
       capability."                 \"The notification that are required to be supported by
       implementations of this MIB."                     J"The group of objects that constitute the remote ping
       capability."                 #"The group of DateAndTime objects."                     r"Indicates that an implementation is using the Internet
        Control Message Protocol (ICMP) 'ECHO' facility."               K"Indicates that an implementation is using the UDP echo
        port (7)." "RFC 862, 'Echo Protocol'."             c"Indicates that an implementation is using an SNMP query
         to calculate a round trip time."               �"Indicates that an implementation is attempting to
        connect to a TCP port in order to calculate a round
        trip time."                  