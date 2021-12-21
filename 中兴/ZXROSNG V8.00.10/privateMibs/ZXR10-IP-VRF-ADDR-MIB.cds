 �--  Protocol private MIB Definitions
--  if compiles this mib with mg-soft, there must be mpls-vpn.mib and zxr10.mib files in
--  the same director.
                                                             j"The description of zxr10 vrf address table.
                       It is a list of vrf address entries."                       �"A vrf address entry containing objects that
                       vrf interface address infomation,such as:
                       vrf ifindex, vrf address, mask."                       '"The IP address of this vrf interface."             --not-accessible
         '"The IP address of this vrf interface."                       �"The subnet mask associated with the IP address of
                  this vrf interface.  The value of the mask is an IP
                  address with all the network bits set to 1 and all
                  the hosts bits set to 0."                       "The index value which uniquely identifies the vrf
                     interface.  The interface identified by a particular value of this
                     index is the same interface as identified by the
                     same value of ifIndex."                      �"The value of the least-significant bit in the IP
                     broadcast address used for sending datagrams on
                     the vrf interface associated with the IP address.
                     For example, when the Internet standard all-ones 
                     broadcast address is used, the value will be 1. 
                     This value applies to both the subnet and network 
                     broadcasts addresses used by the vrf interface."                       �"The size of the largest IP datagram which this
                     vrf interface can re-assemble from incoming IP fragmented
                     datagrams received on this interface."                           P"A table containing TCP connection-specific
                      information."                      #"Information about a particular current TCP
                      connection.  An object of this type is transient,
                      in that it ceases to exist when (or soon after)
                      the connection makes the transition to the CLOSED
                      state."                       '"The IP address of this vrf interface."             --not-accessible
        �"The state of this TCP connection.

                      The only value which may be set by a management
                      station is deleteTCB(12).  Accordingly, it is
                      appropriate for an agent to return a `badValue'
                      response if a management station attempts to set
                      this object to any other value.

                      If a management station sets this object to the
                      value deleteTCB(12), then this has the effect of
                      deleting the TCB (as defined in RFC 793) of the
                      corresponding connection on the managed node,
                      resulting in immediate termination of the
                      connection.

                      As an implementation-specific option, a RST
                      segment may be sent from the managed node to the
                      other TCP endpoint (note however that RST segments
                      are not sent reliably)."                      -"The local IP address for this TCP connection.  In
                      the case of a connection in the listen state which
                      is willing to accept connections for any IP
                      interface associated with the node, the value
                      0.0.0.0 is used."                       0"The local port number for this TCP connection."                       0"The remote IP address for this TCP connection."                       1"The remote port number for this TCP connection."                          