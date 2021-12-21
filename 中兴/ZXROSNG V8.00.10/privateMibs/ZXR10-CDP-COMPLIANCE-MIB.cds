                                                           �"This file is a file for CDP compliance. It provides such functions of 
           globally enabling or disabling the CDP compliance function, enabling the global
           alarm, querying statistics." h"       Liu hu
            Tel : +86-25-52870000
            E-Mail: liu.hu2@zte.com.cn
            " "201901140000Z" "Initial revision."                  b"The administratively desired status of the global CDP compliance function.
        If the associated zxr10CdpEnable object has a
        value of 'disabled(2)', then the system will discard CDP packets.
        If the associated zxr10CdpEnable object has a
        value of 'enabled(1)', then the system will counter and keep the latest CDP packet."                                "The number of frames received."                       ("The number of invalid frames received."                       D"The number of frames received, and then discarded for some reason."                       %"The number of times neighbor added."                       '"The number of times neighbor deleted."                      "The number of times the complete set of information
        advertised by a particular MSAP has been deleted from tables
        contained in zxr10CdpRemSysData because the information timeliness 
        interval has expired.
        This counter should be incremented only once when the complete
        set of information is completely invalidated (aged out)
        from all related tables. Partial aging, similar to deletion
        case, is not allowed, and thus, should not change the value
        of this counter."                       L"A table containing CDP reception statistics for individual
        ports."                       �"CDP frame reception statistics for a particular port.
        All counter values in a particular entry shall be
        maintained on a continuing basis and shall not be deleted
        until aged out."                       R"The interface index of the bridge port receiving CDP packets, reference RFC2233."                       ,"The number of frames received on the port."                       4"The number of invalid frames received on the port."                       P"The number of frames received, and then discarded for some reason on the port."                       +"The number of neighbor added on the port."                       -"The number of neighbor deleted on the port."                       �"The number of times the complete set of information
        advertised by a particular MSAP has been deleted on a port from tables
        contained in zxr10CdpRemSysData because the information timeliness 
        interval has expired."                          1"This table contains one or more rows per physical network
        connection known to this agent. The agent may wish to ensure
        that only one zxr10CdpRemoteEntry is present for each local port,
        or it may choose to maintain multiple zxr10CdpRemoteEntry for
        the same local port."                       �"Information about a particular physical network connection.
        Entries may be created and deleted in this table by the agent,
        if a physical topology discovery process is active."                       X"The interface index of the local bridge port receiving CDP packets, reference RFC2233."                      �"This object represents an arbitrary local integer value used
            by this agent to identify a particular connection instance,
            unique only for the indicated remote system.
            An agent is encouraged to assign monotonically increasing
            index values to new entries, starting with one, after each
            reboot.  It is considered unlikely that the zxr10CdpRemIndex
            will wrap between reboots."                       ""The source MAC of remote system."                       !"The device ID of remote system."                       "The port ID of remote system."                       $"The address type of remote system."                       "The address of remote system."                               K"A zxr10CdpRemTablesChange notification is sent when the neighbor changes."                        