�-- *****************************************************************
-- $Id: Zxr10VrfRoutes.mib 27 2009-07-13 08:47:59Z hejide $
--
-- Zxr10VrfRoutes.mib: ZTE Corporation Enterprise Structure of Management Information
--
-- JUNE 2005, hejide
--
-- Copyright (c) 2009 by ZTE Corporation
-- All rights reserved.
-- 
-- *****************************************************************
--
                                             "ZXROSNG VRF ROUTE MIB" k"Meng meihua (He yunbo)
         Tel: +86-25-52871138
         E-Mail: meng.meihua@zte.com.cn
         " "201705111000Z" "201304090000Z" "200504120000Z" a"modify the sizelist of zxr10VrfIndex which is in the
            zxr10VrfRouteStatisticsTable." d"modify the description of zxr10VrfIndex which is in the
            zxr10VrfRouteStatisticsTable." ""       -- May 11, 2017   
               A"ZTE Corporation Enterprise Structure of Management Information."         �--DESCRIPTION
-- ""
--LAST-UPDATED "200907131200Z"
--ORGANIZATION "ZTE Corporation Enterprise Structure of Management Information"
--CONTACT-INFO
--"ZTE Corporation Enterprise Structure of Management Information"
     "zxr10VrfRouteStatisticsTable"                       "Zxr10VrfRouteStatisticsEntry"                       Z"Vrf Name.If this attribute has NULL value, 
    it means that this is the global table."                       "The routes of IPv4."                       "The Connected Routes of IPv4."                       "The Static Routes of IPv4."                       "The RIP Routes of IPv4."                       "The OSPF Routes of IPv4."                       "The ISIS Routes of IPv4."                       "The BGP Routes of IPv4."                          