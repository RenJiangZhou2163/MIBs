 �-- *****************************************************************
--
-- Copyright (c) 2009 by ZTE Corporation
-- All rights reserved.
-- 
-- *****************************************************************
--
   ("The reason a file-copy request failed."              �"The state of a copy operation. 
                 The description of each state is given below:

                 waiting:     only one file-copy request can run 
                              at any time. A newly activated 
                              file-copy request is placed in this 
                              state if another request has already 
                              been activated.

                 running:     this state signifies that the file-copy
                              request is running.

                 successsful: the state when a file-copy request is
                              successfully completed.

                 failed:      the file-copy request was unsuccesful.
                "                                                                                                         !"ZXR10 T8000 ZXR10FILESYSTEM-MIB" �"ZTE Corporation 
         Nanjing Institute of ZTE Corporation
         
         No.68 Zijinghua Rd. Yuhuatai District, Nanjing, China
         
         Tel: +86-25-52870000" "201504140000Z" "200908120000Z"�"Delete the TAB char,
            modify SYNTAX of zxr10FSCopyTable,
                   SYNTAX of zxr10fileEntry,
                   definition of Zxr10fileEntry,
                   SYNTAX of zxr10fileIndex,
                   SYNTAX of zxr10FSCopyTable,
                   SYNTAX of zxr10FSCopyEntry,
                   and SYNTAX of zxr10FSCopyNotificationOnCompletion.
            " " "                           " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                       " "                        "The table of file information "                       '"An entry containing file information "                       "The index number of the file "                       "The name of the file"                       �"The attribute of the item. Use <DIR> to describe the attribute of the item 
                   if the attribute is directory, else use ---- to describe the attribute of the item."                       "The size of the file"                       ("The last modification time of the file"                       "The location of the file"                       "The table of file-copy"                       *"This list contains file-copy parameters "                      �"Object which specifies a unique entry in the
                copyTable.  A management station wishing
                to initiate a config-copy operation should use a
                random value for this object when creating
                or modifying an instance of a copyEntry.
                The RowStatus semantics of the copyEntryRowStatus
                object will prevent access conflicts."                       �"The source file name (including the path, if applicable) of
                the file. This object must be created when either the
                copySourceFileType or copyDestFileType has the value
                networkFile or localFile."                       "The cpu-node of source file."                       �"The destination file name (including the path, if applicable) of
                the file. This object must be created when either the
                copySourceFileType or copyDestFileType has the value
                networkFile or localFile."                       #"The cpu-node of destination file."                      �"Specifies whether or not a copyCompletion
                notification should be issued on completion of copy
                . If such a notification is desired, it is the
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
                instantiated."                      $"Specifies the time the copyState last transitioned
                from running to successful or failed states. This
                object is instantiated only after the row has been 
                instantiated.
                Its value will remain 0 until he request has completed."                       �"The reason why the config-copy operation failed.
                This object is instantiated only when the copyState 
                for this entry is in the failed state."                       �"The status of this table entry.  Once the entry 
                status is set to active, the associated entry cannot 
                be modified until the request completes (copyState 
                transitions to successful or failed state)."                           �"A copyCompletion trap is sent at the completion
                of a config-copy request. The copyFailCause is not
                instantiated, and hence not included in a trap, when 
                the copyState is success."                    