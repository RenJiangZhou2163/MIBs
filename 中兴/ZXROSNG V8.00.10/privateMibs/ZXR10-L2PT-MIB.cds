d--  ********************************************************
--  $Id: ZXR10-MSTP.mib 2010-03-01 01:34:21Z Jiashurui $
--
--  ZXR10-MSTP.mib: ZXR10 MSTP MIB file
--
--  Mar. 2010, Jia Shurui
--  modify by yuly 187517
--  Copyright(c) 2010 by ZTE Corporation
--  All rights reserved
--
--  ********************************************************
                                   '"Whether rewrite mac enabled in Switch"               0"Whether rewrite mac enabled on the switch-port"               1"Whether bpdu-protect enabled on the switch-port"                                 "ZXROSNG 11R1 L2PT MIB create" �"ZTE Corporation

             Nanjing Institute of ZTE Corporation

             No.68 ZiJinghua Rd. YuHuatai District, Nanjing, China

             Tel: +86-25-52870000" "201001240000Z" "201212180000Z" %"ZXROSNG 30R2 L2PT MIB modify access" %"ZXROSNG 30R2 L2PT MIB modify access"       -- 12/18/2012 00:00GMT
                "Configure Global Write Enable."                       "Configure STP Rewrite MAC."                       "Configure Dot1x Rewrite MAC."                       "Configure Dot3x Rewrite MAC."                       "Configure GVRP Rewrite MAC."                       "Configure LACP Rewrite MAC."                       "Configure LLDP Rewrite MAC."                        "Configure ZDP/ZTP Rewrite MAC."                       "Configure VTP Rewrite MAC."                       "Configure CDP Rewrite MAC."                       "Configure UDLD Rewrite MAC."                       !"Configure L2PT Port parameters."                       I"Each row index by zxL2ptPortIndex And contain l2pt imformation of Port."                       "Interface Index."                       "Interface Name."                       "Config Rewrite Enable."                       "Interface BPDU rewrite type."                       "Config BPDU Protect Enable."                       "Config BPDU Protect Limit."                      