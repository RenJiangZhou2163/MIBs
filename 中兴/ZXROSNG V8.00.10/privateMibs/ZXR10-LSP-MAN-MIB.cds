                           X"This MIB module provides commonly used textual conventions for 
        lsp manager. " �"Mao Lihua              
                      Tel:    +86-25-5287xxxx           
                      E-Mail: mao.lihua@zte.com.cn " "201810232000Z" "201304241000Z" "201303211000Z" "Add IPv4 label forward table." 4"Add zxr10LspInstDestFlag node to zxr10LspInstTable" "Initial version"                   �" The config of gr service status for PSS module.
            1: means Gr of PSS module is disable.
            2: means Gr of PSS module is enable."                           '"A tabel of label forward information."                       ""An entry to label forward table."                      W"The destination IP address of this route. An entry with a value 
        of 0.0.0.0 is considered a default route.  Multiple routes to a single
        destination can appear in the table, but access to such multiple 
        entries is dependent on the table-access mechanisms defined by the 
        network management protocol in use."                      "Indicate the mask to be logical-ANDed with the destination address
        before being compared to the value in the ipRouteDest field.  For those
        systems that do not support arbitrary subnet masks, an agent constructs
        the value of the ipRouteMask by determining whether the value of the 
        correspondent ipRouteDest field belong to a class-A, B, or C network, 
        and then using one of:

            mask           network
            8              class-A
            16             class-B
            24             class-C

            If the value of the ipRouteDest is 0 (a default route), then the 
        mask value is also 0.  It should be noted that all IP routing 
        subsystems implicitly use this mechanism."                       �"This value is used to distinguish out segment who have the same 
        Dest and Mask.In other words, it's a speical id for out segment with 
        the same destination IP address."                       �"The IP address of the next hop of this route.(In the case of a
        route bound to an interface which is realized via a broadcast media, 
        the value of this field is the agent's IP address on that interface.)"                      "The interface name which uniquely identifies the local interface
        through which the next hop of this route should be reached.  The
        interface identified by a particular value of this index is the same
        interface as identified by the same value of ifIndex."                       !"The incoming label of this LSP."                       !"The outgoing label of this LSP."                      Z"This flag indicate the link info about this IP address.
            1: means it's an master entry,at the sametime,indicate the master
        link under fast-re-route application.
            2: means it's a slave entry under fast-re-route application.
            3: means it's a loadshare entry.  
            4: means none of the above."                       ("A tabel of static LSP instance config."                       ("An entry to static LSP instance table."                       5"Static LSP instance name, which is key of instance."                       \"The incoming label of this Staic LSP instance, label range is
        static label range."                       <"IPv4 address, which is the static LSP instance binding to."                       9"IPv4 mask, which is the static LSP instance binding to."                       �"This flag indicate whether force to advertise incoming label to 
        upstream.
            1: means it's not forcing to advertise in-label to upstream.
            2: means it's forcing to advertise in-label to upstream."                       �"This flag indicate whether bind FEC to the static LSP instance.
            1: means FEC is not binding to the static LSP instance.
            2: means FEC is binding to the static LSP instance."                       *"A tabel of static LSP outsegment config."                       *"An entry to static LSP outsegment table."                       C"The name of static LSP instance, which the out segment belong to."                       �"The interface name which uniquely identifies the local interface
        through which the next hop of this out segment should be reached. ."                       5"The IP address of the next hop of this out segment."                       1"The outgoing label of this Staic LSP instance.."                       �"This flag indicate whether force to use configured label as 
        out-label.
            1: means it's not forcing to use configured label as out-label.
            2: means it's forcing to use configured label as out-label."                       '"A tabel of label forward information."                       '"An entry to IPv4 label forward table."                       !"The incoming label of this LSP."                       "The index of nexthop."                       )"The destination IP address of this LSP."                       "The length of the LSP's mask."                       "VRF name of the LSP."                       %"The nexthop IP address of this LSP."                       $"The out interface name of the LSP."                       ""the nexthop VRF name of the LSP."                       '"The first outgoing label of this LSP."                       ("The second outgoing label of this LSP."                       '"The third outgoing label of this LSP."                       '"The forth outgoing label of this LSP."                       '"The fifth outgoing label of this LSP."                      *"This flag indicate the link info about this IP address.
            1: means it's an master entry,at the sametime,indicate the master
        link under fast-re-route application.
            2: means it's a slave entry under fast-re-route application.
            3: means none of the above."                       ."The original nexthop IP address of this LSP."                                                          