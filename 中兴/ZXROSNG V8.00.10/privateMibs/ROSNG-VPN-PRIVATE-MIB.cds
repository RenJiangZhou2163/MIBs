�-- *****************************************************************
-- $Id: rosngmplsVpnPrivateMIB.mib  $
--
-- rosngmplsVpnPrivate.mib: ZTE Corporation Enterprise Structure of Management Information
--
-- Dec 2009, zhouzheng
--
-- Copyright (c) 2009-2010 by ZTE Corporation
-- All rights reserved.
-- 
-- *****************************************************************
--
                             "ZXROS SMI MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "200504120000Z" ""       -- April 12, 2005
               @"ZTE Corporation Enterprise Structure of Management Information"         --DESCRIPTION
-- "This mib is created for China Mobile test"
--LAST-UPDATED "20091214"
--ORGANIZATION "ZTE Corporation Enterprise Structure of Management Information"
--CONTACT-INFO
--	"ZTE Corporation Enterprise Structure of Management Information"
         $"This rosngmplsVpnPrivateTable is ."                       6"Entry containing information about a particular VPN." 1"RFC 2547 VPNs (see draft-ietf-ppvpn-rfc2547bis)"                    �"Type of the VPN.  The following types have been defined:
            bgpIpVpn:   RFC 2547 VPNs (see draft-ietf-ppvpn-rfc2547bis);
            bgpL2Vpn:   BGP-based Layer 2 VPNs (see
                        draft-kompella-ppvpn-l2vpn);
            bgpVpls:    BGP-based VPLS (see draft-kompella-ppvnp-vpls);
            l2Circuit:  LDP-based point-to-point Layer 2 circuits (see
                        draft-martini-l2circuit-trans-mpls);
            ldpVpls:    LDP-based VPLS (see
                        draft-lasserre-vkompella-ppvpn-vpls);
            opticalVpn: BGP-based Optical (port based) VPNs (see
                        draft-ouldbrahim-bgpgmpls-ovpn);
            vpOxc:         Virtual Private Optical Cross-Connect (see
                        draft-ouldbrahim-ppvpn-vpoxc);
            ccc:        proprietary Layer 2 circuit;
            bgpAtmVpn:  ATM over MPLS (draft to be published)."                       k"Type of the VPN Identifier.  This includes Route
             Distinguishers, Route Targets, and VC IDs."                       %"The connect status of Layer 2 VPNs."                       %"The connect status of Layer 3 VPNs."                       b"The age (i.e., time from creation till now) of this
             VPN in hundredths of a second."                       4"The threshol value (%) at which to give a warning."                           7"The number of VRFs that are configured in the global."                              