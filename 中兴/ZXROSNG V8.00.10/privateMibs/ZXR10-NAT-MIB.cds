2--  ************************************************
--  $Id: nat.mib  2012-11-26 12:17:08Z xiaoliujun $
--
--  nat.mib: ZXR10 NAT MIB file
--
--  Nov. 2012, xiaoliujun 
--
--  Copyright(c) 2008 by ZTE Corporaton
--  All rights reservered
--
--  ************************************************
   Y"suggests that a Hundredths value of 1234 be 
                       rendered as 12.34."                                                                     !"The MIB module to describe NAT." \"       Yi Hong
           Tel:    +86-25-52870000
           E-Mail: yi.hong@zte.com.cn " "201904081605Z" "201704141058Z" "201509070000Z" "201312100000Z" "201301170000Z"m"modify:    zxr10NatCntInstName
                       zxr10NatIPv4SubscribersType
                       zxr10NatIPv4SubscribersVrf
                       zxr10NatIPv4SubscribersIPv4Address
                       zxr10NatIPv6SubscribersType
                       zxr10NatIPv6SubscribersVrf
                       zxr10NatIPv6SubscribersAftrAddress
                       zxr10NatIPv6SubscribersIPv6Address
                       zxr10NatPoolName
                       zxr10NatPoolIPPoolName
                       zxr10NatPoolIPAddr
                       change MAX-ACCESS from not-accessible to read-only" �"modify:    zxr10NatUploadFtpUserName
                       zxr10NatUploadFtpUserPassword
                       zxr10NatUploadFtpFileName
                       zxr10NatUploadFtpVrfName
                       change minimum length from 1 to 0" L"modify:    zxr10NatCntSoftware
                       zxr10NatCntSoftwire" ~"add:       zxr10NatUploadFtpGroup
                       zxr10NatCntIpv4Address
                       zxr10NatCntSoftware" %"Initial version of this MIB module."                           6"The number of packets to which NAT has been applied."                       a"The number of packets to which NAT could not be applied because no external port was available."                       �"The number of packets to which NAT could not be applied because of exceeded quotas. 
                           Quotas include absolute limits as well as limits on rate of allocation."                        "The number of active mappings."                       /"The number of IPv4 address with NAT SR users."                       E"The number of IPv6 softwire ,include dislite users and nat64 users."                       ""Information of the NAT instance "                       ""Information of the NAT instance."                       %"The instance name of this instance."                       &"The instance index of this instance."                       6"The number of packets to which NAT has been applied."                       a"The number of packets to which NAT could not be applied because no external port was available."                       �"The number of packets to which NAT could not be applied because of exceeded quotas. 
                               Quotas include absolute limits as well as limits on rate of allocation."                        "The number of active mappings."                           )"Information of the NAT IPv4 subscriber."                       )"Information of the NAT IPv4 subscriber."                       #"The type of this IPv4 subscriber."                       '"The VRF name of this IPv4 subscriber."                       +"The IPv4 address of this IPv4 subscriber."                       ,"The instance name of this IPv4 subscriber."                       ("The pool name of this IPv4 subscriber."                       G"The number of packets to which this IPv4 subscriber has been applied."                       8"The number of active mappings of this IPv4 subscriber."                       )"Information of the NAT IPv6 subscriber."                       )"Information of the NAT IPv6 subscriber."                       #"The type of this IPv6 subscriber."                       '"The VRF name of this IPv6 subscriber."                       +"The AFTR address of this IPv6 subscriber."                       *"The CPE address of this IPv6 subscriber."                       ,"The instance name of this IPv6 subscriber."                       ("The pool name of this IPv6 subscriber."                       G"The number of packets to which this IPv6 subscriber has been applied."                       8"The number of active mappings of this IPv6 subscriber."                           "Information of the CGN pool."                       "Information of the CGN pool."                       "Name of an address pool."                       "Index of an address pool."                       ("The instance number of an address pool"                       S"One ten-thousandth of the pool's total number of external ports currently mapped."                       "Bind VRF name."                       "Describe the pool."                       "NAT or PAT pool."                       -"Max ports of each protocol for per address."                       4"The number of users for each protocol per address."                       ,"Ratio alarm threshold (%) of pool sharing."                       "Port range size."                       "Port range start port."                       "Port range end port."                       "Port range count."                       "Used port range count."                       ="Ratio alarm threshold (%) of used port range count in a IP."                       :"Ratio alarm threshold (%) of used port count in a range."                        "Number of used IP in NAT pool."                       &"Ratio(0.01%) of used IP in NAT pool."                       "Information about an IP."                       "Information about an IP."                        "The pool name this IP belongs."                       "IP address."                       "Number of used TCP resource."                       "Number of used UDP resource."                       "Number of used ICMP resource."                       $"Ratio(0.01%) of used TCP resource."                       $"Ratio(0.01%) of used UDP resource."                       %"Ratio(0.01%) of used ICMP resource."                       %"Number of users using this address."                       "Port range count."                       "Used port range count."                               /"Global limit on the total number of mappings."                       /"Global limit on the total number of mappings."                       A"Global limit on the number of subscribers with active mappings."                           "The type of this request."                       ="The IP address for the FTP server used for uploading files."                       "The FTP user name."                       "The FTP user password."                       "The FTP file path and name."                        "Save flash operational status."                       "Stored data percent."                       "The FTP vrf name."                          