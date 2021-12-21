D-- *****************************************************************
-- ZXR10_CONFIG_COPY_MIB.mib MIB for copying a ZTE router's  config
--
-- 2007-02-1 ninggang ZTE corp. 
--
-- Copyright (c) 2007 by ZTE corporation. 
-- All rights reserved.
-- *****************************************************************
--
   ""The various types of file check."               Y"The various types of files on which a copy operation
                can be performed."              �"The state of a copy operation.
                The description of each state is given below:
                waiting:        only one copy request can run at any time.
                                A newly activated copy request is placed
                                in this state if another request has already 
                                been activated.
                running:        this state signifies that the copy
                                request is running.
                successsful:    the state when a copy request is
                                successfully completed.
                failed:         the copy request was unsuccesful."               #"The reason a copy request failed."               Y"The various types of files on which a copy operation
                can be performed."               #"The reason a copy request failed."              j"The protocol file transfer protocol that should be used
                to copy the configuration file over the network. If the
                config file transfer is to occur locally on the SNMP
                agent, the method of transfer is left upto the 
                implementation, and is not restricted to the 
                protocols below."               #"The reason a copy request failed."                                                                                                                    w"This MIB facilitates writing of configuration files
                of an SNMP Agent running ZTE's ROS in the following
                ways: to and from the net, copying running
                configurations to startup configurations and 
                vice-versa, and copying a configuration
                (running or startup) to and from the local file system." " ZTE Corp." "201811070000Z" "201807130000Z" "201801030000Z" "201712210000Z" "201711080000Z" "201508210000Z" "201503030000Z" "201310150000Z" "201309160000Z" "200702010000Z"X"1.Add zxr10CopyProcess and zxr10CopyFinishRemainTime to 
                 the zxr10CopyTable.
                2.Add zxr10TFTPCopyProcess and zxr10TFTPCopyFinishRemainTime 
                 to the zxr10TFTPCopyTable.
                3.Add zxr10SftpCopyProcess and zxr10SftpCopyFinishRemainTime 
                 to the zxr10SftpCopyTable." /"Add FTP/SFTP/TFTP IPv6 address and interface." &"Modify SFTP SFTPCopyFailCause value." A"Modify SFTP zxr10SftpCopyVrfName and add SFTP zxr10SftpCopyMng." "Add SFTP zxr10SFTPCopyTable." 8"Add TFTP zxr10TFTPCopyTable and zxr10TFTPCopyMIBTraps." "Adds the ConfigCopyFailCause." S"1:Modifies the ConfigCopyFailCause. 
                2:Modifies the description."N"1:Adds two variables which are used for file check:
                - zxr10CopyFileCheckSumType: Specifies the type of file check.
                - zxr10CopyFileCheckSumString: The key of file check.
                2:Replaces the description about TFTP with FTP.   
                3:Adds and modifies the ConfigCopyFailCause." " Initial created"                       ""A table of config-copy requests."                      }"A config-copy request.
                A management station wishing to create an entry should
                first generate a random serial number to be used
                as the index to this sparse table.  The station should
                then create the associated instance of the row status
                and row index objects.  It __MUST__ in the same PDUs, 
                create an instance of copySourceFileType and copyDestFileType.
                At least one of the FileTypes must be an agent-config
                file type (i.e.        startupConfig or runningConfig).
                If one of the file types is a networkFile, a valid
                copyServerAddress and copyFileName must be created as well.
                For a file type of localFile, only a valid fileName needs to
                be created as an extra parameter.

                It should also modify the default values for the other
                configuration objects if the defaults are not appropriate.
                
                Once the appropriate instance of all the configuration
                objects have been created, the row status will automatically 
                be set to active to initiate the request. Note that this entire
                procedure __MUST__ be initiated via a single set request which
                specifies a row status of createAndGo as well as specifies
                valid values for the non-defaulted configuration objects.

                Once the config-copy request has been created (i.e. the
                copyEntryRowStatus has been made active), the entry
                cannot be modified - the only operation possible
                after this is to delete the row.

                Once the request completes, the management station 
                should retrieve the values of the status objects of 
                interest, and should then delete the entry.  In order 
                to prevent old entries from clogging the table, 
                entries will be aged out, but an entry will never be 
                deleted within 5 minutes of completing."                      t"Object which specifies a unique entry in the copyTable.
            A management station wishing to initiate a config-copy operation
            should use a random value for this object when creating or
            modifying an instance of a copyEntry.
            The RowStatus semantics of the copyEntryRowStatus
            object will prevent access conflicts."                      "The protocol to be used for any copy.
                Will default to FTP if not specified.
                If the copy operation occurs locally on the SNMP agent
                (e.g. runningConfigToStartupConfig), this object may
                be ignored by the implementation."                      _"specifies the type of file to copy from. Either the
                copySourceFileType or the copyDestFileType (or both)
                must be of type runningConfig or startupConfig. Also,the
                copySourceFileType must be different from the copyDestFileType.
        
                If the copySourceFileType has the value of networkFile,
                the copyServerAddress and copyFileName must also be created,
                and these 3 objects together
                (copySourceFileType, copyServerAddress, copyFileName)
                will uniquely identify the source file.

                If the copySourceFileType is localFile, the copyFileName
                must also be created, and the 2 objects together
                (copySourceFileType,copyFileName)
                will uniquely identify the source file."                      u"specifies the type of file to copy to. Either the
                copySourceFileType or the copyDestFileType (or both)
                must be of type runningConfig or startupConfig. Also,
                the copySourceFileType must be different from the
                copyDestFileType.
        
                If the copyDestFileType has the value of 
                networkFile, the copyServerAddress and 
                copyFileName must also be created, and these 3 objects together
                (copyDestFileType, copyServerAddress, 
                copyFileName) will uniquely identify the destination file.

                If the copyDestFileType is localFile, the copyFileName
                must also be created, and the 2 objects together
                (copyDestFileType, copyFileName) will uniquely
                identify the destination file."                      1"The IPv4 address of the FTP server from (or to) 
                which to copy the configuration file. This object
                can not be used with zxr10CopyServerV6Address at the 
                same time. Values of 0.0.0.0 or FF.FF.FF.FF for
                copyServerAddress are not allowed."                       �"The source file name (including the path, if applicable) of
                the file. This object must be created when either the
                copySourceFileType or copyDestFileType has the value
                networkFile or localFile."                       �"The destination file name (including the path, if applicable)
                of the file. This object must be created when either the
                copySourceFileType or copyDestFileType has the value
                networkFile or localFile."                       �"Remote user name for copy via FTP protocol.
                This object must be created when the copyProtocol
                is FTP."                       �"Password used by FTP for copying a 
                file to/from the FTP server. This object must 
                be created when the copyProtocol is FTP."                      �"Specifies whether or not a copyCompletion
                notification should be issued on completion of the FTP
                transfer. If such a notification is desired, it is the
                responsibility of the management entity to ensure
                that the SNMP administrative model is configured in
                such a way as to allow the notification to be 
                delivered."                       �"Specifies the state of this config-copy request.
                This value of this object is instantiated only after
                the row has been instantiated, i.e. after the
                copyEntryRowStatus has been made active."                      )"Specifies the time the copyState last transitioned
                to running, or 0 if the state has never transitioned to
                running        (for e.g., stuck in waiting state).
                This object is instantiated only after the row has been
                instantiated."                      %"Specifies the time the copyState last transitioned
                from running to successful or failed states. This
                object is instantiated only after the row has been 
                instantiated.
                Its value will remain 0 until the request has completed."                       �"The reason why the config-copy operation failed.
                This object is instantiated only when the copyState
                for this entry is in the failed state."                       �"The status of this table entry.  Once the entry
                status is set to active, the associated entry cannot
                be modified until the request completes (copyState
                transitions to successful or failed state)."                       "The VRF name for copy."                       /"Specifies whether or not choose the mng port."                       �"Specifies the type of file check.The value 0 means no check,
            1 means checking file with MD5,2 means checking file with SHA1."                       "The key of check."                       �"The IPv6 address of the FTP server from (or to) 
                which to copy the configuration file. This object
                can not be used with zxr10CopyServerAddress at the 
                same time."                       m"The interface name. This object is used only when
             the remote address is a link-local address."                       !"The progress of copy operation."                       $"Remaining time of copy completion."                        "A table of tftp copy requests."                      y"A tftp copy request.
                A management station wishing to create an entry should
                first generate a random serial number to be used
                as the index to this sparse table.  The station should
                then create the associated instance of the row status
                and row index objects.  It __MUST__ in the same PDUs, 
                create an instance of copySourceFileType and copyDestFileType.
                At least one of the FileTypes must be an agent-config
                file type (i.e.        startupConfig or runningConfig).
                If one of the file types is a networkFile, a valid
                copyServerAddress and copyFileName must be created as well.
                For a file type of localFile, only a valid fileName needs to
                be created as an extra parameter.

                It should also modify the default values for the other
                configuration objects if the defaults are not appropriate.
                
                Once the appropriate instance of all the configuration
                objects have been created, the row status will automatically 
                be set to active to initiate the request. Note that this entire
                procedure __MUST__ be initiated via a single set request which
                specifies a row status of createAndGo as well as specifies
                valid values for the non-defaulted configuration objects.

                Once the tftp copy request has been created (i.e. the
                copyEntryRowStatus has been made active), the entry
                cannot be modified - the only operation possible
                after this is to delete the row.

                Once the request completes, the management station 
                should retrieve the values of the status objects of 
                interest, and should then delete the entry.  In order 
                to prevent old entries from clogging the table, 
                entries will be aged out, but an entry will never be 
                deleted within 5 minutes of completing."                      r"Object which specifies a unique entry in the copyTable.
            A management station wishing to initiate a tftp copy operation
            should use a random value for this object when creating or
            modifying an instance of a copyEntry.
            The RowStatus semantics of the copyEntryRowStatus
            object will prevent access conflicts."                      "specifies the type of file to copy from. Either the
            copySourceFileType or the copyDestFileType (or both)
            must be of type runningConfig or startupConfig. Also,
            the copySourceFileType must be different from the copyDestFileType.
        
            If the copySourceFileType has the value of networkFile,
            the copyServerAddress and copyFileName must also be created,
            and these 3 objects together (copySourceFileType, copyServerAddress,
            copyFileName) will uniquely identify the source file.

            If the copySourceFileType is localFile, the copyFileName must
            also be created, and the 2 objects together (copySourceFileType,
            copyFileName) will uniquely identify the source file."                      1"specifies the type of file to copy to. Either the
            copySourceFileType or the copyDestFileType (or both)
            must be of type runningConfig or startupConfig. Also,
            the copySourceFileType must be different from the copyDestFileType.
        
            If the copyDestFileType has the value of networkFile,
            the copyServerAddress and copyFileName must also be created,
            and these 3 objects together
            (copyDestFileType, copyServerAddress, copyFileName)
            will uniquely identify the destination file.

            If the copyDestFileType is localFile, the copyFileName
            must also be created, and the 2 objects together
            (copyDestFileType, copyFileName) will uniquely
            identify the destination file."                      '"The IPv4 address of the TFTP server from (or to) 
            which to copy the configuration file. This object 
            can not be used with zxr10TFTPCopyServerV6Address
            at the same time. Values of 0.0.0.0 or FF.FF.FF.FF 
            for copyServerAddress are not allowed."                       �"The source file name (including the path, if applicable) of
            the file. This object must be created when either the
            copySourceFileType or copyDestFileType has the value
            networkFile or localFile."                       �"The destination file name (including the path, if applicable) of
            the file. This object must be created when either the
            copySourceFileType or copyDestFileType has the value
            networkFile or localFile."                      z"Specifies whether or not a copyCompletion
            notification should be issued on completion of the TFTP
            transfer. If such a notification is desired, it is the
            responsibility of the management entity to ensure
            that the SNMP administrative model is configured in
            such a way as to allow the notification to be delivered."                       �"Specifies the state of this tftp copy request.
            This value of this object is instantiated only after
            the row has been instantiated, i.e. after the
            copyEntryRowStatus has been made active."                      ."Specifies the time the copyState last transitioned to running,
            or 0 if the state has never transitioned to running
            (for e.g., stuck in waiting state). This object is instantiated
            only after the row has been instantiated.
            The value is system uptime."                      0"Specifies the time the copyState last transitioned from running
            to successful or failed states. This object is instantiated
            only after the row has been instantiated.
            Its value will remain 0 until the request has completed.
            The value is system uptime."                       �"The reason why the tftp copy operation failed.
            This object is instantiated only when the copyState
            for this entry is in the failed state."                       "The VRF name for copy."                       /"Specifies whether or not choose the mng port."                       _"Specifies the type of file check.
            You can check file with MD5 or SHA1 algorithm."                       "The key of check."                       �"The IPv6 address of the TFTP server from (or to) 
              which to copy the configuration file. This object
              can not be used with zxr10CopyTFTPServerAddress 
              at the same time."                       "The interface name."                       _"The progress of copy operation.
             When downloading file, the process can not get."                       $"Remaining time of copy completion."                       �"The status of this table entry.  Once the entry
            status is set to active, the associated entry cannot
            be modified until the request completes (copyState
            transitions to successful or failed state)."                        "A table of SFTP copy requests."                      �"A SFTP copy request.
                A management station wishing to create an entry should
                first generate a random serial number to be used
                as the index to this sparse table.  The station should
                then create the associated instance of the row status
                and row index objects.  It must in the same PDUs, 
                create an instance of copySourceFileType and copyDestFileType.
                If one of the file types is a networkFile, a valid
                copyServerAddress and copyFileName must be created as well.
                For a file type of localFile, only a valid fileName needs to
                be created as an extra parameter.

                It should also modify the default values for the other
                configuration objects if the defaults are not appropriate.
                
                Once the appropriate instance of all the configuration
                objects have been created, the row status will automatically 
                be set to active to initiate the request. Note that this entire
                procedure __MUST__ be initiated via a single set request which
                specifies a row status of createAndGo as well as specifies
                valid values for the non-defaulted configuration objects.

                Once the sftp copy request has been created (i.e. the
                copyEntryRowStatus has been made active), the entry
                cannot be modified - the only operation possible
                after this is to delete the row.

                Once the request completes, the management station 
                should retrieve the values of the status objects of 
                interest, and should then delete the entry.  In order 
                to prevent old entries from clogging the table, 
                entries will be aged out, but an entry will never be 
                deleted within 5 minutes of completing."                      r"Object which specifies a unique entry in the copyTable.
            A management station wishing to initiate a sftp copy operation
            should use a random value for this object when creating or
            modifying an instance of a copyEntry.
            The RowStatus semantics of the copyEntryRowStatus
            object will prevent access conflicts."                      _"specifies the type of file to copy from. Either the
                copySourceFileType or the copyDestFileType (or both)
                must be of type runningConfig or startupConfig. Also,the
                copySourceFileType must be different from the copyDestFileType.
        
                If the copySourceFileType has the value of networkFile,
                the copyServerAddress and copyFileName must also be created,
                and these 3 objects together
                (copySourceFileType, copyServerAddress, copyFileName)
                will uniquely identify the source file.

                If the copySourceFileType is localFile, the copyFileName
                must also be created, and the 2 objects together
                (copySourceFileType,copyFileName)
                will uniquely identify the source file."                      u"specifies the type of file to copy to. Either the
                copySourceFileType or the copyDestFileType (or both)
                must be of type runningConfig or startupConfig. Also,
                the copySourceFileType must be different from the
                copyDestFileType.
        
                If the copyDestFileType has the value of 
                networkFile, the copyServerAddress and 
                copyFileName must also be created, and these 3 objects together
                (copyDestFileType, copyServerAddress, 
                copyFileName) will uniquely identify the destination file.

                If the copyDestFileType is localFile, the copyFileName
                must also be created, and the 2 objects together
                (copyDestFileType, copyFileName) will uniquely
                identify the destination file."                      4"The IP address of the SFTP server from (or to) 
                which to copy the configuration file. This object
                can not be used with zxr10SftpCopyServerV6Address 
                at the same time.Values of 0.0.0.0 or FF.FF.FF.FF 
                for copyServerAddress are not allowed."                       �"The source file name (including the path, if applicable) of
                the file. This object must be created when either the
                copySourceFileType or copyDestFileType has the value
                networkFile or localFile."                       �"The destination file name (including the path, if applicable)
                of the file. This object must be created when either the
                copySourceFileType or copyDestFileType has the value
                networkFile or localFile."                       �"Remote user name for copy via SFTP protocol.
                This object must be created when the copyProtocol
                is SFTP."                       �"Password used by SFTP for copying a 
                file to/from the SFTP server. This object must 
                be created when the copyProtocol is SFTP."                       �"Specifies the state of this sftp copy request.
                This value of this object is instantiated only after
                the row has been instantiated, i.e. after the
                copyEntryRowStatus has been made active."                      )"Specifies the time the copyState last transitioned
                to running, or 0 if the state has never transitioned to
                running        (for e.g., stuck in waiting state).
                This object is instantiated only after the row has been
                instantiated."                      %"Specifies the time the copyState last transitioned
                from running to successful or failed states. This
                object is instantiated only after the row has been 
                instantiated.
                Its value will remain 0 until the request has completed."                       �"The reason why the config-copy operation failed.
                This object is instantiated only when the copyState
                for this entry is in the failed state."                       "The VRF name for sftp copy."                       /"Specifies whether or not choose the mng port."                       �"The IPv6 address of the SFTP server from (or to)
              which to copy the configuration file. This 
              object can not be used with zxr10SftpCopyServerAddress
              at the same time."                       m"The interface name. This object is used only when
             the remote address is a link-local address."                       !"The progress of copy operation."                       $"Remaining time of copy completion."                       �"The status of this table entry.  Once the entry
                status is set to active, the associated entry cannot
                be modified until the request completes (copyState
                transitions to successful or failed state)."                               �"A copyCompletion trap is sent at the completion
                of a config-copy request. The copyFailCause is not
                instantiated, and hence not included in a trap, when 
                the copyState is success."                     �"A copyCompletion trap is sent at the completion of a tftp
                copy request. The copyFailCause is not instantiated, and hence
                not included in a trap, when the copyState is success."                    