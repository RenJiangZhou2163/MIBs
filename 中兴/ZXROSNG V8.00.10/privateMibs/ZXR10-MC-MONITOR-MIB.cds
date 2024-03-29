                                                                       g"The MIB module for management of Mcast Mroute monitor.
            This MIB module is a private MIB." �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation  
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         Tel: +86-25-52870000" "201507271500Z" "201008020000Z" �"modify: the description of zxr10McastMonitorMrouteTable, 
             delete: the punctuation of zxr10McastMonitorMrouteEntry."?" This MIB module is a private MIB,the object defined as 
                  follows:
                  
                 o  This MIB module includes objects that are specifies monitor interface.                    
                 o  This MIB module includes a table of monitor mroute
                    Table. "       -- 02 Auguest 2010
           "Monitor interface."                       o"The (conceptual) table containing monitor mroute
            information for source and destination address."                      D"An entry (conceptual row) containing the monitor mroute
            information for IP datagrams from a particular source and
            addressed to a particular IP multicast group address.

            OIDs are limited to 128 sub-identifiers, but this limit
            is not enforced by the syntax of this entry."                       ""The IP multicast source address."                       !"The IP multicast group address."                       4"The activation of a row enables Multicast Monitor."                       >"The forwarding interface of a row enables Multicast Monitor."                          