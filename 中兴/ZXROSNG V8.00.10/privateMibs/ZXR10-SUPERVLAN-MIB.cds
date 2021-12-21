     '"A simple status value for the object."               ("A special status value for the object."                                                                     3"The MIB module to describe the SuperVLAN protocol" f"       Zeng wanmei 
            Tel:    +86-25-52870000
            E-Mail: zeng.wanmei@zte.com.cn" "201707051630Z" "201305311200Z" ["
            modify DESCRIPTION:
            zxr10SupervlanIfAttrInterSubRout
        " $"Initial version of this MIB module"                           %"The attribute of current SuperVLAN."                       -"This list contains SuperVLAN configuration."                       4"SuperVLAN interface name,for example supervlanXXX."                       m"SuperVLAN inter-subvlan-routing attribute status,3 mean enable,4 
        mean disable,default value is 3."                       �"SuperVLAN inter-subvlan-routing attribute status is used to 
        distinguish between IPv4 and IPv6,1 mean IPv4 enable,2 mean IPv6 enable.
        default value is 5."                       S"SuperVLAN ip-pool-filter attribute status,1 mean enable,
        2 mean disable."                       e"SuperVLAN arp-broadcast attribute status,1 mean enable,2 
        mean disable,default value is 2."                       p"SuperVLAN gratuitous-arp-broadcast attribute status,1 
        mean enable,2 mean disable,default value is 1."                       m"SuperVLAN nd-broadcast attribute status for IPv6,1 mean enable,2 
        mean disable,default value is 2."                           )"Bound information of current SuperVLAN."                       0"This list contains sub-interface of SuperVLAN."                       4"SuperVLAN interface name,for example supervlanXXX."                       "Sub-interface name."                       "SuperVLAN ID."                       0"Switch Bound information of current SuperVLAN."                       *"This list contains SubVLAN of SuperVLAN."                       "SuperVLAN ID."                       "SubVLAN ID."                       "SubVLAN name."                       "SuperVLAN interface name."                           ."Ippool information of current sub-interface."                       -"This list contains Ippool of sub-interface."                       "Sub-interface name."                       "IP-POOL address begin."                       "IP-POOL address end."                       ("Ippool information of current SubVLAN."                       ("This list contains IP-POOL of SubVLAN."                       "SubVLAN ID."                       "Ippool address begin."                       "Ipppol address end."                       "SubVLAN name."                           #"The attribute of current SubVLAN."                       *"This list contains attribute of SubVLAN."                       "SubVLAN ID."                       n"SubVLAN gratuitous-arp-broadcast attribute status,1 mean 
        enable,2 mean disable,default value is 1."                       "SubVLAN name."                                  