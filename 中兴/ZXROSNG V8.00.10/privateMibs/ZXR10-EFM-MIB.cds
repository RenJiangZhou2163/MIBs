V--  ***************************************************
--  $Id: ZXR10-EFM-MIB.mib 3 2013-06-14 01:34:21Z jyt $
--
--  ZXR10-EFM-MIB.mib: ZXR10 Ethernet OAM MIB file
--  
--  June. 2013, Jiang yuting
--   
--  Copyright(c) 2013 by ZTE Corporaton
--  All rights reservered
--
--  ***************************************************
   "Ethernet OAM state switch. "                                                                                     @"The MIB module to describe the 802.3ah Ethernet OAM protocol. " u"       Jiang yuting
            Tel:    +86-25-52870000
            E-Mail: jiang.yuting@zte.com.cn
            " "201611151000Z" "201401211000Z" "201311111000Z" "201308201000Z" "201306171000Z" "201303261000Z" "201303171000Z" �"Add:   zxr10EFMSymPerSetIfDownEnable
                    zxr10EFMFrameSetIfDownEnable
                    zxr10EFMFramePerSetIfDownEnable
                    zxr10EFMFrameSecSetIfDownEnable
                    zxr10EFMSetIfUp" 1"Modify DESCRIPTION of zxr10ethernetOamiftimeout" �"Add UNITS for zxr10ethernetOamifLinkMonitorSymbolPeriodwindow
                           zxr10ethernetOamifLinkMonitorFramePeriodwindow" �"Add: zxr10ethernetOamifVariRetrieval in 
                       zxr10ethernetOamIfConfigEntry,
                  zxr10ethernetOamIfVariableTable"�"Add UNITS for zxr10ethernetOamifLinkMonitorSymbolPeriodthreshold
                           zxr10ethernetOamifLinkMonitorFramethreshold
                           zxr10ethernetOamifLinkMonitorFramewindow
                           zxr10ethernetOamifLinkMonitorFramePeriodthreshold
                           zxr10ethernetOamifLinkMonitorFrameSecondsthreshold
                           zxr10ethernetOamifLinkMonitorFrameSecondswindow" "Modify DESCRIPTION of zxr10ethernetOamiffastflag,
             zxr10ethernetOamifTimeoutFast, and zxr10ethernetOamiftimeout." b"Add:   zxr10ethernetOamifRmtLoopbackMode
                    zxr10ethernetOamifRmtLoopbackGuard"       --2016-11-15 10:00
               5"Configure Ethernet OAM enable(0-disable, 1-enable)."                       )"Configure Ethernet OAM OUI information."                       2"Configure Ethernet OAM remote loopback time-out."                       ."Configure Ethernet OAM interface parameters."                       5"Configure Ethernet OAM interface config parameters."                       "Show interface name."                       ?"Configure interface Ethernet OAM enable(0-disable, 1-enable)."                       �"Configure Ethernet OAM remote loopback start/stop(0-stop,
            1-start). 
            As an interactive operation, zxr10ethernetOamRemoteLoopbackEnable
            will always be zero(0) because it can not reflect the value be set."                       ="Configure Ethernet OAM mode(0-passive mode, 1-active mode)."                       �"Configure Ethernet OAM link timeout value, in seconds, to indicate
            that during this time, if no OAMPDUs can be received, the link will
            be lost. 
            It is available when zxr10ethernetOamiffastflag is 0."                       B"Configure Ethernet OAM link monitor enable(0-disable, 1-enable)."                       �"Configure Ethernet OAM link monitor Symbol Period threshold.
            Each project has different range and default value of 
            zxr10ethernetOamifLinkMonitorSymbolPeriodthreshold."                       �"Configure Ethernet OAM link monitor Symbol Period window.
            Each project has different range, units and default value of 
            zxr10ethernetOamifLinkMonitorSymbolPeriodwindow."                       �"Configure Ethernet OAM link monitor Frame threshold.
            Each project has different range and default value of 
            zxr10ethernetOamifLinkMonitorFramethreshold."                       �"Configure Ethernet OAM link monitor Frame window.
            Each project has different range and default value of 
            zxr10ethernetOamifLinkMonitorFramewindow."                       �"Configure Ethernet OAM link monitor Frame Period threshold.
            Each project has different range and default value of 
            zxr10ethernetOamifLinkMonitorFramePeriodthreshold."                       �"Configure Ethernet OAM link monitor Frame Period window.
            Each project has different range, units and default value of 
            zxr10ethernetOamifLinkMonitorFramePeriodwindow."                       �"Configure Ethernet OAM link monitor Frame Seconds threshold.
            Each project has different range and default value of 
            zxr10ethernetOamifLinkMonitorFrameSecondsthreshold."                       �"Configure Ethernet OAM link monitor Frame Seconds window.
            Each project has different range and default value of 
            zxr10ethernetOamifLinkMonitorFrameSecondswindow."                       $"Configure Ethernet OAM PDU period."                      "Ethernet OAM timeout setting mode. 
            The link operates on slow mode and at this mode, hello OAMPDUs
            transmit in 1 pps rate when zxr10ethernetOamiffastflag is 0.
            The link operates on fast mode and at this mode, hello OAMPDUs
            transmit one packet per zxr10ethernetOamifperiod*100 milliseconds
            when zxr10ethernetOamiffastflag is 1.
            If zxr10ethernetOamiffastflag is 1, zxr10ethernetOamifTimeoutFast
            is available other than zxr10ethernetOamiftimeout."                       �"Configure Ethernet OAM link timeout value, in milliseconds, to
            indicate that juring this time, if no OAMPDUs can be received,
            the link will be lost.
            It is available when zxr10ethernetOamiffastflag is 1."                       6"Configure Ethernet OAM unidirection function enable."       --obsolete
               Z"Configure Ethernet OAM capability of responding to remote loopback
            request."                       �"Configure Ethernet OAM guard mode of disabling remote loopback mode
            from attack. True means recovering local slave state from LB to FWD
            forcefully."                       S"Configure Ethernet OAM capability of responding to variable
            request."                       �"Configure the function enable(0-disable, 1-enable) that the
            event of link monitor Symbol Period notify the interface down."                       �"Configure the function enable(0-disable, 1-enable) that the
            event of link monitor frame notify the interface down."                       �"Configure the function enable(0-disable, 1-enable) that the
            event of link monitor frame period notify the interface down."                       �"Configure the function enable(0-disable, 1-enable) that the
            event of link monitor frame seconds notify the interface down."                       �"Set the interface status to up because the 
            event of LM notify the interface to down.
            As an operation, zxr10EFMSetIfUp
            will always be got one(1) and be set one(1)."                       0"Show Ethernet OAM config parameters and state."                       :"Show Ethernet OAM interface config parameters and state."                       )"Show Ethernet OAM discovery parameters."                       ,"Show Ethernet OAM link monitor parameters."                       #"Show Ethernet OAM PDU statistics."                       O"Configure Ethernet OAM interface variable retrieval operation and parameters."                       O"Configure Ethernet OAM interface variable retrieval operation and parameters."                      
D"The value of variable leaf id.
            Supported variable leaf id as follows:
            value  description                       
            236    OAMID                             
            237    OAMAdminState                     
            238    OAMMode                           
            239    OAMRemoteMACaddress               
            240    OAMRemoteConfiguration            
            241    OAMRemotePDUConfiguration         
            242    OAMLocalFlagsField                
            243    OAMRemoteFlagsField               
            244    OAMRemoteRevision                 
            245    OAMRemoteState                    
            246    OAMRemoteVendorOUI                
            247    OAMRemoteVendorSpecificinfo       
            250    OAMUnsupportedCodesRX             
            251    OAMInformationTX                  
            252    OAMInformationRX                  
            254    OAMUniqueEventNotificationRX      
            255    OAMDuplicateEventNotificationRX   
            256    OAMLoopbackControlTX              
            257    OAMLoopbackControlRX              
            258    OAMVariableRequestTX              
            259    OAMVariableRequestRX              
            260    OAMVariableResponseTX             
            261    OAMVariableResponseRX             
            262    OAMOrganizationSpecificTX         
            263    OAMOrganizationSpecificRX         
            264    OAMLocalErrSymPeriodConfig        
            265    OAMLocalErrSymPeriodEvent         
            266    OAMLocalErrFrameConfig            
            267    OAMLocalErrFrameEvent             
            268    OAMLocalErrFramePeriodConfig      
            269    OAMLocalErrFramePeriodEvent       
            270    OAMLocalErrFrameSecsSummaryConfig 
            271    OAMLocalErrFrameSecsSummaryEvent  
            272    OAMRemoteErrSymPEriodEvent        
            273    OAMRemoteErrFrameEvent            
            274    OAMRemoteErrFramePeriodEvent      
            275    OAMRemoteErrFrameSecsSummaryEvent 
            333    OAMDiscoveryState                 
            334    OAMLocalConfiguration             
            335    OAMLocalPDUConfiguration          
            336    OAMLocalRevision                  
            337    OAMLocalState                     
            338    OAMUnsupportedCodesTX             
            339    OAMUniqueEventNotificationTX      
            340    OAMDuplicateEventNotificationTX   
            "                      V"Configure interface Ethernet OAM variable request operation.
            The operation can request MIB attributes, objects and packages,
            while only MIB attributes can be requested by the device.
            It can only be set 1 which means request operation, 
            when get 0 only for it's unmeaningful.
            "                       r"Show interface Ethernet OAM variable response value, as value
            of set zxr10ethernetOamifVariRequest."                      