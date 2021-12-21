                                                                   3"The MIB Module for managing SAVI implementations." �"Changqing An
        
         Postal:  Network Research Center, Tsinghua University
         Beijing 100084
         China
         
         Email: acq@tsinghua.edu.cn"       --March 08,2010
           3"The table containing savi system-wide parameters."                       ^"Each entry  containing savi system-wide parameters for a
            particular IP version."                       "The IP version "                       !"IP Address Assignment Methods. "                      ""A constant. When A gratuitous ARP Request or Duplicate 
            Address Detection Neighbor Solicitation is received 
            from anchor, the lifetime of the BST(Binding State Table)
            entry MUST be set to be MAX_ARP_DELAY or MAX_DAD_DELAY 
            respectively."                       �"A constant. When a DHCPv4 DHCPACK or DHCPv6 REPLY message
            is received, the lifetime of the BST(Binding State Table)
            entry MUST be set to be MAX_ARP_PREPARE_DELAY or 
            MAX_DAD_PREPARE_DELAY respectively."                       >"The table containing SAVI running parameters of each anchor."                       ;"An entry containing SAVI running parameters of an anchor."                       "The IP version "                      "The index value that uniquely identifies the interface to
            which this entry is applicable.  The interface identified by
            a particular value of this index is the same interface as
            identified by the same value of the IF-MIB's ifIndex."                       �"The validation status of the interface.  
            enable(1), check source address.
            disable(2), don't check source address. 
            "                      Q"The trust status of the interface.  
           no-trust(1), discard dhcp adv/reply and ra packet,
           dhcp-trust(2), permit dhcp adv/reply packet and discard ra packet,
           ra-trust(3), permit ra packet and discard dhcp adv/reply packet,
           dhcp-ra-trust(4), permit dhcp adv/reply and ra packet.
           "                       +"The max filtering number of the Interface"                       j"The Binding State Table containing the state of binding 
            between source address and anchor."                       �"An entry containing the state of binding between source 
            address and anchor. Entries are keyed on the anchor, 
            binding type, source IP address version, and source IP 
            address."                       +"IP address type of the  binding source IP"                        "IP address assignment methods."                      "The index value that uniquely identifies the interface to
            which this entry is applicable.  The interface identified by
            a particular value of this index is the same interface as
            identified by the same value of the IF-MIB's ifIndex."                       "The binding source IP address"                       !"The binding source mac address."                       ""The state of the binding entry. "                       �"The remaining lifetime of the entry. 
           If saviObjectsBindingType=static, a value of 2147483647 
           represents infinity."                       �"The status of this row, by which new entries may be
              created, or old entries deleted from this table. 
              An Entry can be created or deleted only when 
              saviObjectsBindingType=static."                       0"The Filtering Table is used to filter packets."                       P"An entry containing the filtering parameters. Entries are keyed on the anchor."                       -"IP address type of the  filtering source IP"                      "The index value that uniquely identifies the interface to
            which this entry is applicable.  The interface identified by
            a particular value of this index is the same interface as
            identified by the same value of the IF-MIB's ifIndex."                       !"The filtering source IP address"                       #"The filtering source mac address."                               ="The compliance statement for entities which implement SAVI."                   ?"The system group of objects containing savi system parameter."                 ]"The if group of objects containing the savi running parameters
            of each anchor."                 p"The binding group of objects containing the binding information 
            of anchor and soure ip address. "                 t"The filtering group of objects containing the filtering information 
            of anchor and soure ip address. "                