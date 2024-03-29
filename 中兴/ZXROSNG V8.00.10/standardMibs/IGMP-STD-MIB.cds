 �-- file: IGMP-STD-MIB.my
-- Extracted from RFC2933 by MG-SOFT Corp.
-- Changes:
--      No changes needed.
-- http://www.mg-soft.com/
                                                             %"The MIB module for IGMP Management." �" Dave Thaler
              Microsoft Corporation
              One Microsoft Way
              Redmond, WA  98052-6399
              US

              Phone: +1 425 703 8835
              EMail: dthaler@microsoft.com" "200009280000Z" )"Initial version, published as RFC 2933."       -- September 28, 2000
           V"The (conceptual) table listing the interfaces on which IGMP
            is enabled."                       \"An entry (conceptual row) representing an interface on
            which IGMP is enabled."                       L"The ifIndex value of the interface for which IGMP is
            enabled."                       `"The frequency at which IGMP Host-Query packets are
            transmitted on this interface."                       "The activation of a row enables IGMP on the interface.  The
            destruction of a row disables IGMP on the interface."                      2"The version of IGMP which is running on this interface.
            This object can be used to configure a router capable of
            running either value.  For IGMP to function correctly, all
            routers on a LAN must be configured to run the same version
            of IGMP on that LAN."                       h"The address of the IGMP Querier on the IP subnet to which


            this interface is attached."                       ^"The maximum query response time advertised in IGMPv2
            queries on this interface."                       7"The time since igmpInterfaceQuerier was last changed."                       �"The amount of time remaining before the Other Querier
            Present Timer expires.  If the local system is the querier,
            the value of this object is zero."                       �"The time remaining until the host assumes that there are no
            IGMPv1 routers present on the interface.  While this is non-
            zero, the host will reply to all queries with version 1
            membership reports."                      v"The number of queries received whose IGMP version does not
            match igmpInterfaceVersion, over the lifetime of the row
            entry.  IGMP requires that all routers on a LAN be
            configured to run the same version of IGMP.  Thus, if any
            queries are received with the wrong version, this indicates
            a configuration error."                      >"The number of times a group membership has been added on
            this interface; that is, the number of times an entry for
            this interface has been added to the Cache Table.  This
            object gives an indication of the amount of IGMP activity
            over the lifetime of the row entry."                      %"Some devices implement a form of IGMP proxying whereby
            memberships learned on the interface represented by this
            row, cause IGMP Host Membership Reports to be sent on the
            interface whose ifIndex value is given by this object.  Such
            a device would implement the igmpV2RouterMIBGroup only on
            its router interfaces (those interfaces with non-zero
            igmpInterfaceProxyIfIndex).  Typically, the value of this
            object is 0, indicating that no proxying is being done."                       S"The current number of entries for this interface in the
            Cache Table."                      "The Robustness Variable allows tuning for the expected
            packet loss on a subnet.  If a subnet is expected to be
            lossy, the Robustness Variable may be increased.  IGMP is
            robust to (Robustness Variable-1) packet losses."                      "The Last Member Query Interval is the Max Response Time
            inserted into Group-Specific Queries sent in response to
            Leave Group messages, and is also the amount of time between
            Group-Specific Query messages.  This value may be tuned to
            modify the leave latency of the network.  A reduced value
            results in reduced time to detect the loss of the last
            member of a group.  The value of this object is irrelevant
            if igmpInterfaceVersion is 1."                       |"The (conceptual) table listing the IP multicast groups for
            which there are members on a particular interface."                       2"An entry (conceptual row) in the igmpCacheTable."                       X"The IP multicast group address for which this entry
            contains information."                       i"The interface for which this entry contains information for
            an IP multicast group address."                       m"An indication of whether the local system is a member of
            this group address on this interface."                       �"The IP address of the source of the last membership report
            received for this IP Multicast group address on this
            interface.  If no membership report has been received, this
            object has the value 0.0.0.0."                       0"The time elapsed since this entry was created."                      �"The minimum amount of time remaining before this entry will
            be aged out.  A value of 0 indicates that the entry is only
            present because igmpCacheSelf is true and that if the router
            left the group, this entry would be aged out immediately.
            Note that some implementations may process membership
            reports from the local system in the same way as reports
            from other hosts, so a value of 0 is not required."                       "The status of this entry."                      �"The time remaining until the local router will assume that
            there are no longer any IGMP version 1 members on the IP
            subnet attached to this interface.  Upon hearing any IGMPv1
            Membership Report, this value is reset to the group
            membership timer.  While this time remaining is non-zero,
            the local router ignores any IGMPv2 Leave messages for this
            group that it receives on this interface."                               _"The compliance statement for hosts running IGMPv1 and
            implementing the IGMP MIB."   "Write access is not required." "Write access is not required."             a"The compliance statement for routers running IGMPv1 and
            implementing the IGMP MIB."   "Write access is not required." "Write access is not required."             _"The compliance statement for hosts running IGMPv2 and
            implementing the IGMP MIB."   "Write access is not required." "Write access is not required."             a"The compliance statement for routers running IGMPv2 and
            implementing the IGMP MIB."   "Write access is not required." "Write access is not required."                 ["The basic collection of objects providing management of
            IGMP version 1 or 2."                 c"A collection of additional objects for management of IGMP
            version 1 or 2 in routers."                 \"A collection of additional objects for management of IGMP
            version 2 in hosts."                 �"A collection of optional objects for IGMP hosts.
            Supporting this group can be especially useful in an
            environment with a router which does not support the IGMP
            MIB."                 ^"A collection of additional objects for management of IGMP
            version 2 in routers."                 W"A collection of additional objects for management of IGMP
            proxy devices."                    