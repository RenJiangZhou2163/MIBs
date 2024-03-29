                                   O"A table containing UDP listener information for
         UDP/IPv6 endpoints."                      "Information about a particular current UDP listener.

         Note that conceptual rows in this table require an
         additional index object compared to udpTable, since
         IPv6 addresses are not guaranteed to be unique on the
         managed node."                       �"The local IPv6 address for this UDP listener.
         In the case of a UDP listener which is willing
         to accept datagrams for any IPv6 address
         associated with the managed node, the value ::0
         is used."                       ."The local port number for this UDP listener."                      �"An index object used to disambiguate conceptual rows in
         the table, since the ipv6UdpLocalAddress/ipv6UdpLocalPort
         pair may not be unique.

         This object identifies the local interface that is
         associated with ipv6UdpLocalAddress for this UDP listener.
         If such a local interface cannot be determined, this object
         should take on the value 0.  (A possible example of this
         would be if the value of ipv6UdpLocalAddress is ::0.)

         The interface identified by a particular non-0 value of
         this index is the same interface as identified by the same
         value of ipv6IfIndex.

         The value of this object must remain constant during
         the life of this UDP endpoint."                           9"The MIB module for entities implementing UDP over IPv6.""               Mike Daniele

                Postal: Compaq Computer Corporation
                        110 Spitbrook Rd
                        Nashua, NH 03062.
                        US

                Phone:  +1 603 884 1423
                Email:  daniele@zk3.dec.com"                       W"The compliance statement for SNMPv2 entities which
         implement UDP over IPv6."                   G"The group of objects providing management of
         UDP over IPv6."                    