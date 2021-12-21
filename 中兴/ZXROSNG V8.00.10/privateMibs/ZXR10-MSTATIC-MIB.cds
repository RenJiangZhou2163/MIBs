                                                       n"The MIB module for management of IP Static Multicast routing.
            This MIB module is a private MIB." �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation  
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         Tel: +86-25-52870000" "200811240000Z"" This MIB module is a private MIB,the object defined as 
                  follows:
             
                 o  This MIB module includes a table of IP Mstatic Routing
                    Table.
                                            
                 o  This MIB module includes a table of IP Mstatic Oif Routing 
                    Table.
                                        
                 o  This MIB module includes objects that are specifies the 
                    amount of SG and XG route entry."       -- 24 November 2008
           3"The amount of SG route entry of static multicast."                       3"The amount of XG route entry of static multicast."                       �"The (conceptual) table containing multicast routing
            information for source addressdestination address
            input interface address and uptime ."                      G"An entry (conceptual row) containing the multicast routing
            information for IP datagrams from a particular source and
            addressed to a particular IP multicast group address.

            OIDs are limited to 128 sub-identifiers, but this limit
            is not enforced by the syntax of this entry."                       )"The static IP multicast source address."                       ("The static IP multicast group address."                       �"The address of interface on which IP datagrams sent by 
             certain sources to certain multicast address are received."                       �"The value of sysUpTime at which the multicast routing
            information represented by this entry was learned by the
            router."                       �"The (conceptual) table containing multicast routing
            information for source addressdestination addressthe 
            index and address of output interface."                      G"An entry (conceptual row) containing the multicast routing
            information for IP datagrams from a particular source and
            addressed to a particular IP multicast group address.

            OIDs are limited to 128 sub-identifiers, but this limit
            is not enforced by the syntax of this entry."                       )"The static IP multicast source address."                       ("The static IP multicast group address."                       �"The outindex of interface on which IP datagrams from certain 
             sources to certain multicast address are sent from."                       �"The address of interface on which IP datagrams from certain 
             sources to certain multicast address are sent from."                          