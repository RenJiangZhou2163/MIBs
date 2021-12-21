-- *****************************************************************
-- ZXR10-ROUTE-LABEL.mib 
--
-- 2008-3-18 10:50
-- 
--
-- Copyright (c) 1985-2008 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
                                                     "" "" "200405140000Z" ""               ""A list of rtm label information."                       "An entry to rtm label table."                      �"The destination IP address of this route.  An
             entry with a value of 0.0.0.0 is considered a
             default route.  Multiple routes to a single
             destination can appear in the table, but access to
             such multiple entries is dependent on the table-
             access mechanisms defined by the network
             management protocol in use."                      �"Indicate the mask to be logical-ANDed with the
             destination address before being compared to the
             value in the ipRouteDest field.  For those systems
             that do not support arbitrary subnet masks, an
             agent constructs the value of the ipRouteMask by
             determining whether the value of the correspondent
             ipRouteDest field belong to a class-A, B, or C
             network, and then using one of:

                           mask           network
                           8              class-A
                           16             class-B
                           24             class-C

             If the value of the ipRouteDest is 0 (a
             default route), then the mask value is also
             0.  It should be noted that all IP routing
             subsystems implicitly use this mechanism."                      "This value is used to distinguish route entry 
            who have the same Dest and Mask.In other words,
            it's a speical id for route entry with the same 
            destination IP address(For static route it can 
            be configured by user)."                      "The IP address of the next hop of this route.
             (In the case of a route bound to an interface
              which is realized via a broadcast media, the value
              of this field is the agent's IP address on that
              interface.)"                      C"The interface name which uniquely identifies the
             local interface through which the next hop of this
             route should be reached.  The interface identified
             by a particular value of this index is the same
             interface as identified by the same value of
             ifIndex"                      A"The index value which uniquely identifies the
             local interface through which the next hop of this
             route should be reached.  The interface identified
             by a particular value of this index is the same
             interface as identified by the same value of
             ifIndex."                       !"The incoming label of this LSP."                        "The outgoing label of this LSP"                      �"This flag indicate the link info about this IP address.
                     0: means it's an active route entry,at the sametime,
                        indicate the master link under fast-re_route application.
                     1: means it's a slave route entry under fast-re-route
                        application.
                     2: means it's a loadshare route entry.  
                     3: means none of the above. "                          