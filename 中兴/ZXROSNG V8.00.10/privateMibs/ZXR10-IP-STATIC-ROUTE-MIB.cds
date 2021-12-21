-- *****************************************************************
-- ZXR10-IP-STATIC-ROUTE-MIB.mib
-- 00105254
-- 2010-11-9
--
-- Copyright (c) 1985-2010 by ZTE Corp.
-- All rights reserved.
-- *****************************************************************
--
                                                                                     "ZXR10-IP-STATIC-ROUTE-MIB" "ZTE" "201811071010Z" "201411281010Z" "201410291010Z" "201403031000Z" "201303291000Z" o"Add public(5) in zxR10Ipv4SrNexthopType node.
            Modify the description of zxR10Ipv4SrNexthop node." \"modify the rights of zxR10Ipv4SrPermanent node from read-create
            to read-only." t"Change the all names in this file to be standard.
            Add create rights to the Zxr10Ipv4StaticRouteEntry." n"Modify the description of ipStaticRouteSlave node;
            Add the rang of ipStaticRoutePrefixLen node." "ZXR10-IP-STATIC-ROUTE-MIB"               /"A list of current IPv4 static route entries. "                       ]"An entry containing information applicable to a particular IPv4
             static route."                       $"IPv4 Static Route Dest ip address."                        "IPv4 Static Route Mask length."                       r"VRF Name. If this attribute has NULL value, it means that this 
             route belongs to the global table."                       �"Static route nexthop type,as follow:
             ipv4 address(2),
             outinterfacename(3),
             outinterfacename and ipv4(4),
             public(5),
             otherwise,is invalid(1)"                       �"The nexthop address of this static route. 
             If zxR10Ipv4SrNexthopType's value is outinterfacename(3), 
             public(5) or invalid(1), the zxR10Ipv4SrNexthop is NULL."                       �"The outinterface name of this static route.
             If zxR10Ipv4SrNexthopType's value is outinterfacename(3) or 
             outintandipv4(4), the zxR10Ipv4SrNexthop cannot be NULL."                       ,"Is the static route nexthop global or not."                       %"The tag value of this static route."                       "The static route mode."                       "The static route metric."                       4"The number of this static route ping detect group."                     --DEFVAL { 0 }
 +"This static route's status is down or up."                      ("The status of this conceptual row.

             The supported actions of this conceptual row only include:
             'createAndGo' and 'destroy'.

             To create a row in this table, a manager must set this object to
             createAndGo(4), and must comply with the multi-variables binding
             rule described in zxR10Ipv4StaticRouteEntry.

             To delete a row in this table, a manager must set this object to
             destroy(6).

             To get this object, the agent always returns active(1)."                       0"The static route's related track session name."                       3"The static route's tracksession is enable or not."                       +"The static route is a slave route or not."                       6"The static route's related bfd is disable or enable."                       $"The distance of this static route."                       "The static route name."                       -"The static route is permanent route or not."                       1"A list of current static route entries for frr."                       A"An entry containing information applicable to static frr route."                       "The VRF name frred on."                       "Frr is enable or disable."                       !"Static route wtr time interval."                           5"The interface bound to static route nexthop source."                      