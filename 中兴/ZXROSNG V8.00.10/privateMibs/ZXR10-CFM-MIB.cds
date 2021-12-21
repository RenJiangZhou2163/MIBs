 �-- ******************************************************************
-- IEEE P802.1ag(TM) CFM MIB
-- ******************************************************************
  }"This textual convention is an extension of the
            InterfaceIndex convention.  The latter defines a
            greater than zero value used to identify an interface
            or interface sub-layer in the managed system.  This
            extension permits the additional value of zero.  the
            value zero is object-specific and must therefore be
            defined as part of the description of any object which
            uses this syntax.  Examples of the usage of zero might
            include situations where interface was unknown, or
            when none or all interfaces need to be referenced."              �"An integer which may be used as a new Index in a table.
            The special value of 0 indicates that no more new entries can
            be created in the relevant table.
            When a MIB is used for configuration, an object with this
            SYNTAX always contains a legal value (if non-zero) for an
            index that is not currently used in the relevant table. The
            Command Generator (Network Management Application) reads this
            variable and uses the (non-zero) value read when creating a
            new row with an SNMP SET. When the SET is performed, the
            Command Responder (agent) must determine whether the value is
            indeed still unused; Two Network Management Applications may
            attempt to create a row (configuration entry) simultaneously
            and use the same value. If it is currently unused, the SET
            succeeds and the Command Responder (agent) changes the value
            of this object, according to an implementation-specific
            algorithm. If the value is in use, however, the SET fails.
            The Network Management Application must then re-read this
            variable to obtain a new usable value.
            An OBJECT-TYPE definition using this SYNTAX MUST specify the
            relevant table for which the object is providing this
            functionality.
            "             D"IEEE Std 802.1Q 2003 Edition, Virtual Bridged Local Area Networks." �"The VLAN-ID that uniquely identifies a VLAN.  This
            is the 12-bit VLAN-ID used in the VLAN Tag header.
            The range is defined by the REFERENCEd specification."             &"802.1ag clause 21.6.5.4, Table 21-20"�"A value that represents a type (and thereby the format)
        of a Dot1agCfmMaintAssocName. The value can be one of
        the following:
        ieeeReserved(0) Reserved for definition by IEEE 802.1
        recommend to not use zero unless
        absolutely needed.
        primaryVid(1) Primary VLAN ID.
        12 bits represented in a 2-octet integer:
        - 4 least significant bits of the first
        byte contains the 4 most significant
        bits of the 12 bits primary VID
        - second byte contains the 8 least
        significant bits of the primary VID
        0 1 2 3 4 5 6 7 8
        +-+-+-+-+-+-+-+-+
        |0 0 0 0| (MSB) |
        +-+-+-+-+-+-+-+-+
        | VID LSB |
        +-+-+-+-+-+-+-+-+
        charString(2) RFC2579 DisplayString, except that the
        character codes 0-31 (decimal) are not
        used. (1..45) octets
        unsignedInt16 (3) 2-octet integer/big endian
        rfc2865VpnId(4) RFC 2685 VPN ID
        3 octet VPN authority Organizationally
        Unique Identifier followed by 4 octet VPN
        index identifying VPN according to the OUI:
        0 1 2 3 4 5 6 7 8
        +-+-+-+-+-+-+-+-+
        | VPN OUI (MSB) |
        +-+-+-+-+-+-+-+-+
        | VPN OUI |
        +-+-+-+-+-+-+-+-+
        | VPN OUI (LSB) |
        +-+-+-+-+-+-+-+-+
        |VPN Index (MSB)|
        +-+-+-+-+-+-+-+-+
        | VPN Index |
        +-+-+-+-+-+-+-+-+
        | VPN Index |
        +-+-+-+-+-+-+-+-+
        |VPN Index (LSB)|
        +-+-+-+-+-+-+-+-+
        iccString(32) ICC-based string. It consists of two subfields:
        the ITU carrier code (ICC) followed by a unique MEG ID code (UMC).
        The ITU Carrier Code consists of 1 6 left-justified characters,
        alphabetic, or leading alphabetic with trailing numeric. The UMC
        code immediately follows the ICC and shall consist of 7-12 characters, 
        with trailing NULLs, completing the 13-character MEG ID Value.
        The UMC shall be a matter for the organization to which the ICC
        has been assigned, provided that uniqueness is guaranteed. 
        ieeeReserved(xx) Reserved for definition by IEEE 802.1
        xx values can be [5..31] and [64..255]
        ituReserved(xx) Reserved for definition by ITU-T Y.1731
        xx values range from [33..63]
        To support future extensions, the Dot1agCfmMaintAssocNameType
        textual convention SHOULD NOT be sub-typed in object type
        definitions. It MAY be sub-typed in compliance statements in
        order to require only a subset of these address types for a
        compliant implementation.
        Implementations must ensure that Dot1agCfmMaintAssocNameType
        objects and any dependent objects (e.g.,
        Dot1agCfmMaintAssocName objects) are consistent. An
        inconsistentValue error must be generated if an attempt to
        change an Dot1agCfmMaintAssocNameType object would, for
        example, lead to an undefined Dot1agCfmMaintAssocName value.
        In particular,
        Dot1agCfmMaintAssocNameType/Dot1agCfmMaintAssocName pairs
        must be changed together if the nameType changes.
        The Maintenance Domain name and Maintenance Association name,
        when put together into the CCM PDU, MUST total 48 octets or
        less. If the Dot1agCfmMaintDomainNameType object contains
        none(1), then the Dot1agCfmMaintAssocName object MUST be
        45 octets or less in length. Otherwise, the length of
        the Dot1agCfmMaintDomainName object plus the length of the
        Dot1agCfmMaintAssocName object, added together, MUST total
        less than or equal to 44 octets.
        "             C"802.1ag clauses 12.14.7.5.3:g, 20.36.2.5, 21.9.5, and Table 21-27" 2"Possible values the Relay action field can take."             )"802.1ag clause 12.14.7.1.3:k and 20.9.5"x"An integer value specifying the lowest priority defect
            that is allowed to generate a Fault Alarm (20.9.5), either:
            allDef(1) DefRDICCM, DefMACstatus, DefRemoteCCM,
            DefErrorCCM, and DefXconCCM;
            macRemErrXcon(2) Only DefMACstatus, DefRemoteCCM,
            DefErrorCCM, and DefXconCCM (default);
            remErrXcon(3) Only DefRemoteCCM, DefErrorCCM,
            and DefXconCCM;
            errXcon(4) Only DefErrorCCM and DefXconCCM;
            xcon(5) Only DefXconCCM; or
            noXcon(6) No defects DefXcon or lower are to be
            reported;
            "             $"802.1ag clause 21.6.5, Table 21-19"�"A value that represents a type (and thereby the format)
            of a Dot1agCfmMaintDomainName. The value can be one of
            the following:
            ieeeReserved(0) Reserved for definition by IEEE 802.1
            recommend to not use zero unless
            absolutely needed.
            none(1) No format specified, usually because
            there is not (yet) a Maintenance
            Domain Name. In this case, a zero
            length OCTET STRING for the Domain
            Name field is acceptable.
            dnsLikeName(2) Domain Name like string, globally unique
            text string derived from a DNS name.
            macAddrAndUint(3) MAC address + 2-octet (unsigned) integer.
            charString(4) RFC2579 DisplayString, except that the
            character codes 0-31 (decimal) are not
            used.
            ieeeReserved(xx) Reserved for definition by IEEE 802.1
            xx values can be [5..31] and [64..255]
            ituReserved(xx) Reserved for definition by ITU-T Y.1731
            xx values range from [32..63]To
            support future extensions, the Dot1agCfmMaintDomainNameType
            textual convention SHOULD NOT be sub-typed in object type
            definitions. It MAY be sub-typed in compliance statements in
            order to require only a subset of these address types for a
            compliant implementation.
            Implementations must ensure that Dot1agCfmMaintDomainNameType
            objects and any dependent objects (e.g.,
            Dot1agCfmMaintDomainName objects) are consistent. An
            inconsistentValue error must be generated if an attempt to
            change an Dot1agCfmMaintDomainNameType object would, for
            example, lead to an undefined Dot1agCfmMaintDomainName value.
            In particular,
            Dot1agCfmMaintDomainNameType/Dot1agCfmMaintDomainName pairs
            must be changed together if the nameType changes.
            "             ("802.1ag clause 12.14.7.1.3:f and 20.35"x"Indicates the diferent states of the MEP Fault Notification
            Generator State Machine.
            fngReset(1) No defect has been present since the
            dot1agCfmMepFngResetTime timer
            expired, or since the state machine
            was last reset.
            fngDefect(2) A defect is present, but not for a
            long enough time to be reported
            (dot1agCfmMepFngAlarmTime).
            fngReportDefect(3) A momentary state during which the
            defect is reported by sending a
            dot1agCfmFaultAlarm notification,
            if that action is enabled.
            fngDefectReported(4) A defect is present, and some defect
            has been reported.
            fngDefectClearing(5) No defect is present, but the
            dot1agCfmMepFngResetTime timer has
            not yet expired.
            "             "802.1ag clause 21.6.5"."Denotes a generic Maintenance Domain Name.A Dot1agC
            fmMaintDomainName value is always interpreted within
            the context of a Dot1agCfmMaintDomainNameType value. Every
            usage of the Dot1agCfmMaintDomainName textual convention is
            required to specify the Dot1agCfmMaintDomainNameType object
            that provides the context. It is suggested that the
            Dot1agCfmMaintDomainNameType object be logically registered
            before the object(s) that use the Dot1agCfmMaintDomainName
            textual convention, if they appear in the same logical row.
            The value of a Dot1agCfmMaintDomainName object must always
            be consistent with the value of the associated
            Dot1agCfmMaintDomainNameType object. Attempts to set
            an Dot1agCfmMaintDomainName object to a value inconsistent
            with the associated Dot1agCfmMaintDomainNameType must fail
            with an inconsistentValue error.
            When this textual convention is used as the syntax of an
            index object, there may be issues with the limit of 128
            sub-identifiers specified in SMIv2, IETF STD 58. In this
            case, the object definition MUST include a 'SIZE' clause
            to limit the number of potential instance sub-identifiers;
            otherwise the applicable constraints MUST be stated in
            the appropriate conceptual row DESCRIPTION clauses, or
            in the surrounding documentation if there is no single
            DESCRIPTION clause that is appropriate.
            A value of none(1) in the associated
            Dot1agCfmMaintDomainNameType object means that no Maintenance
            Domain name is present, and the contents of the
            Dot1agCfmMaintDomainName object are meaningless.
            See the DESCRIPTION of the Dot1agCfmMaintAssocNameType
            TEXTUAL-CONVENTION for a discussion of the length limits on
            the Maintenance Domain name and Maintenance Association name.
            "             S"802.1ag clauses 12.14.7.5.3:o, 20.36.2.10, 21.9.9.1, and
            Table 21-32" 5"Possible values returned in the egress action field"              �"The VLAN-ID that uniquely identifies a specific VLAN,
            or no VLAN.  The special value of zero is used to
            indicate that no VLAN-ID is present or used.  This can
            be used in any situation where an object or a table entry
            must refer either to a specific VLAN, or to no VLAN.

            Note that a MIB object that is defined using this
            TEXTUAL-CONVENTION should clarify the meaning of
            'no VLAN' (i.e., the special value 0)."             )"802.1ag clause 12.14.6.1.3:d and 21.5.3"�"Indicates what, if anything, is to be included in the Sender
            ID TLV transmitted in CCMs, LBMs, LTMs, and LTRs. The valid
            values are:
            sendIdNone(1) The Sender ID TLV is not to be sent.
            sendIdChassis(2) The Chassis ID Length, Chassis ID
            Subtype, and Chassis ID fields of the
            Sender ID TLV are to be sent.
            sendIdManage(3) The Management Address Length and
            Management Address of the Sender ID TLV
            are to be sent.
            sendIdChassisManage(4) The Chassis ID Length, Chassis ID
            Subtype, Chassis ID, Management Address
            Length and Management Address fields are
            all to be sent.
            sendIdDefer(5) The contents of the Sender ID TLV are
            determined by the corresponding
            Maintenance Domain variable
            (dot1agCfmMaIdPermission).
            "               "Value equal to MD Level. "             !"802.1ag clauses 3.19 and 19.2.1" �"Maintenance association End Point Identifier (MEPID): A small
            integer, unique over a given Maintenance Association,
            identifying a specific MEP.
            "               S"Sequence number/transaction identifier received in
            a Loopback Reply."             "802.1ag clauses 12.14.6.3.2:c"@"Indicates the direction in which the Maintenance
            association (MEP or MIP) faces on the bridge port:
            down(1) Sends Continuity Check Messages away from the
            MAC Relay Entity.
            up(2) Sends Continuity Check Messages towards the
            MAC Relay Entity.
            "             ."802.1ag clauses 21.6.5.4, 21.6.5.5, 21.6.5.6"_"Denotes a generic Maintenance Association Name. It is the
            part of the Maintenance Association Identifier which is
            unique within the Maintenance Domain Name and is appended
            to the Maintenance Domain Name to form the Maintenance
            Association Identifier (MAID).
            A Dot1agCfmMaintAssocName value is always interpreted within
            the context of a Dot1agCfmMaintAssocNameType value. Every
            usage of the Dot1agCfmMaintAssocName textual convention is
            required to specify the Dot1agCfmMaintAssocNameType object
            that provides the context. It is suggested that the
            Dot1agCfmMaintAssocNameType object be logically registered
            before the object(s) that use the Dot1agCfmMaintAssocName
            textual convention, if they appear in the same logical row.
            The value of a Dot1agCfmMaintAssocName object must
            always be consistent with the value of the associated
            Dot1agCfmMaintAssocNameType object. Attempts to set
            an Dot1agCfmMaintAssocName object to a value inconsistent
            with the associated Dot1agCfmMaintAssocNameType must fail
            with an inconsistentValue error.
            When this textual convention is used as the syntax of an
            index object, there may be issues with the limit of 128
            sub-identifiers specified in SMIv2, IETF STD 58. In this
            case, the object definition MUST include a 'SIZE' clause
            to limit the number of potential instance sub-identifiers;
            otherwise the applicable constraints MUST be stated in
            the appropriate conceptual row DESCRIPTION clauses, or
            in the surrounding documentation if there is no single
            DESCRIPTION clause that is appropriate.
            "             `"802.1ag clauses 12.14.7.5.3:g, 20.36.2.6, 21.9.8.1, and
            Table 21-30
            " 7"Possible values returned in the ingress action field."             4"802.1ag clauses 12.14.6.1.3:e, 20.8.1 and 21.6.1.3"�"Indicates the interval at which CCMs are sent by a MEP.
            The possible values are:
            intervalInvalid(0) No CCMs are sent (disabled).
            interval300Hz(1) CCMs are sent every 3 1/3 milliseconds
            (300Hz).
            interval10ms(2) CCMs are sent every 10 milliseconds.
            interval100ms(3) CCMs are sent every 100 milliseconds.
            interval1s(4) CCMs are sent every 1 second.
            interval10s(5) CCMs are sent every 10 seconds.
            interval1min(6) CCMs are sent every minute.
            interval10min(7) CCMs are sent every 10 minutes.
            Note: enumerations start at zero to match the 'CCM Interval
            field' protocol field.
            "             2"802.1ag clause 20.1.2, 12.14.7.7.2:c and 20.33.9"1"An enumerated value, equal to the contents of the variable
            highestDefect (20.33.9 and Table 20-1), indicating the
            highest-priority defect that has been present since the MEP
            Fault Notification Generator State Machine was last in the
            FNG_RESET state, either:
            none(0) no defects since FNG_RESET
            defRDICCM(1) DefRDICCM
            defMACstatus(2) DefMACstatus
            defRemoteCCM(3) DefRemoteCCM
            defErrorCCM(4) DefErrorCCM
            defXconCCM(5) DefXconCCM
            The value 0 is used for no defects so that additional higher
            priority values can be added, if needed, at a later time, and
            so that these values correspond with those in
            Dot1agCfmLowestAlarmPri.
            "             m"802.1ag clauses 12.14.7.1.3:o, 12.14.7.1.3:p, 12.14.7.1.3:q,
            12.14.7.1.3:r, and 12.14.7.1.3:s."�"A MEP can detect and report a number of defects, and multiple
            defects can be present at the same time. These defects are:
            bDefRDICCM(1) A remote MEP is reported the RDI bit in its
            last CCM.
            bDefMACstatus(2) Either some remote MEP is reporting its
            Interface Status TLV as not isUp, or all remote
            MEPs are reporting a Port Status TLV that
            contains some value other than psUp.
            bDefRemoteCCM(3) The MEP is not receiving valid CCMs from at
            least one of the remote MEPs.
            bDefErrorCCM(4) The MEP has received at least one invalid CCM
            whose CCM Interval has not yet timed out.
            bDefXconCCM(5) The MEP has received at least one CCM from
            either another MAID or a lower MD Level whose
            CCM Interval has not yet timed out.
            "             )"802.1ag clause 12.14.5.1.3:c and 22.2.3"�"Indicates if the Management Entity can create MHFs.
            The valid values are:
            defMHFnone(1) No MHFs can be created for this VID.
            defMHFdefault(2) MHFs can be created on this VID on any
            Bridge port through which this VID can
            pass.
            defMHFexplicit(3) MHFs can be created for this VID only on
            Bridge ports through which this VID can
            pass, and only if a MEP is created at some
            lower MD Level.
            defMHFdefer(4) The creation of MHFs is determined by the
            corresponding Maintenance Domain variable
            (dot1agCfmMaMhfCreation).
            "             "802.1ag clauses 18.3, 21.4.1"�"Integer identifying the Maintenance Domain Level (MD Level).
            Higher numbers correspond to higher Maintenance Domains,
            those with the greatest physical reach, with the highest
            values for customers' CFM PDUs. Lower numbers correspond
            to lower Maintenance Domains, those with more limited
            physical reach, with the lowest values for CFM PDUs
            protecting single bridges or physical links.
            "                                                                                             @"Connectivity Fault Management module for managing IEEE 802.1ag"�"WG-URL: http://grouper.ieee.org/groups/802/1/index.html
            WG-EMail: stds-802-1@ieee.org
            Contact: David Elie-Dit-Cosaque
            Alcatel North America
            3400 W. Plano Pkwy.
            Plano, TX 75075, USA
            E-mail: david.elie_dit_cosaque@alcatel.com
            Contact: Norman Finn
            Cisco Systems
            170 W. Tasman Drive
            SJ-03/2/2
            San Jose, CA 95134, USA
            E-mail: nfinn@cisco.com
            " "201904191000Z" "201710191000Z" "201308291000Z" "201306251000Z" "201306131000Z" "201305231000Z" "201303251000Z" "200701240000Z" w"modify: modify the attribute of MAX-ACCESS on 
             dot1agCfmPwMipPortName from not-accessible to read-only." 9"modify: modify size list of dot1agCfmMepCcmLtmPriority." M"add: dot1agCfmMepDLMCountOamFlag,
             dot1agCfmMepLMMCountOamFlag"�"modify: dot1agCfmMepLMMInterval,
             dot1agCfmMepLMMRequireTime,
             dot1agCfmMepDMMInterval,
             dot1agCfmMepDMMRequireTime,
             dot1agCfmMepDMMFrameSize,
             dot1agCfmMep1DMInterval,
             dot1agCfmMep1DMRequireTime,
             dot1agCfmMep1DMFrameSize,
             dot1agCfmMepProcDMMInterval,
             dot1agCfmMepProcDMMFrameSize,
             dot1agCfmMepProc1DMInterval,
             dot1agCfmMepProc1DMFrameSize,
             dot1agCfmMepAISInterval,
             dot1agCfmMepLCKInterval,
             dot1agCfmMepDbDaly,
             dot1agCfmMepDbDalyChg,
             dot1agCfmMepDbProcDaly,
             dot1agCfmMepDbProcDalyChg" %"modify: Dot1agCfmMaintAssocNameType" :"modify: Dot1agCfmMaintDomainName,Dot1agCfmMaintAssocName" "Included in ITU-T Y.1731." $"Included in IEEE P802.1ag Draft 8."       -- 2019-04-19
               �"This object contains an unused value for dot1agCfmMdIndex in
            the dot1agCfmMdTable, or a zero to indicate that none exist.
            "                      �"The Maintenance Domain table. Each row in the table
            represents a different Maintenance Domain.
            A Maintenance Domain is described in 802.1ag (3.22) as the
            network or the part of the network for which faults in
            connectivity are to be managed. The boundary of a Maintenance
            Domain is defined by a set of DSAPs, each of which can become
            a point of connectivity to a service instance.
            " "802.1ag clauses 3.22 and 18.1"                     �"The Maintenance Domain table entry. This entry is not lost
            upon reboot. It is backed up by stable storage.
            "                      "The index to the Maintenance Domain table.
            dot1agCfmMdTableNextIndex needs to be inspected to find an
            available index for row-creation.
            Referential integrity is required i.e. the index needs to be
            persistent upon a reboot or restart of a device. The index
            can never be reused for other Maintenance Domain. The index
            value should keep increasing up to the time that they wrap
            around. This is to facilitate access control based on OID.
            "                       ?"The type (and thereby format) of the Maintenance Domain Name." "802.1ag clause 21.6.5.1"                    �"The Maintenance Domain name. The type/format of this object
            is determined by the value of the dot1agCfmMdNameType object.
            Each Maintenance Domain has unique name amongst all those
            used or available to a service provider or operator. It
            facilitates easy identification of administrative
            responsibility for each Maintenance Domain.
            Clause 3.24 defines a Maintenance Domain name as the
            identifier, unique over the domain for which CFM is to
            protect against accidental concatenation of Service
            Instances, of a particular Maintenance Domain.
            " -"802.1ag clauses 3.24, 12.14.5, and 21.6.5.3"                     "The Maintenance Domain Level." "802.1ag clause 12.14.5.1.3:b"                     �"Enumerated value indicating whether the management entity can
            create MHFs (MIP Half Function) for this Maintenance Domain.
            " "802.1ag clause 12.14.5.1.3:c"                    b"Enumerated value indicating what, if anything, is to be
            included in the Sender ID TLV (21.5.3) transmitted by MPs
            configured in this Maintenance Domain. Since, in this
            variable, there is no encompassing Maintenance Domain, the
            value sendIdDefer takes the meaning of sendIdChassisManage.
            " "802.1ag clause 12.14.5.1.3:d"                     �"Value to be used as the index of the MA table entries for
            this Maintenance Domain when the management entity wants to
            create a new row in the MA table.
            "                       �"The status of the row.
            The writable columns in a row can not be changed if the row
            is active. All columns must have a valid value before a row
            can be activated.
            "                          g"The Maintenance Association table. Each row in the table
            represents an MA. An MA is a set of MEPs, each configured
            with a single service instance.
            Creation of a Service Instance establishes a connectionless
            association among the selected DSAPs. Configuring a
            Maintenance association End Point (MEP) at each of the
            DSAPs creates a Maintenance Association (MA) to monitor
            that connectionless connectivity. The MA is identified by a
            Short MA Name that is unique within the Maintenance Domain
            and chosen to facilitate easy identification of the Service
            Instance. Together, the Maintenance Domain Name and the
            Short MA Name form the Maintenance Association Identifier
            (MAID) that is carried in CFM Messages to identify
            incorrect connectivity among Service Instances. A small
            integer, the Maintenance association End Point Identifier
            (MEPID), identifies each MEP among those configured on a
            single MA (802.1ag clauses 3.17 and 18.2).
            This table uses two indices, first index is the index of the
            Maintenance Domain table.
            The writable objects in this table need to be persistent
            upon reboot or restart of a device.
            " "802.1ag clause 18.2"                     "The MA table entry."                       �"Index of the MA table dot1agCfmMdMaTableNextIndex needs to
            be inspected to find an available index for row-creation.
            "                       �"The Primary VLAN ID with which the Maintenance Association is
            associated, or 0 if the MA is not attached to any VID. If
            the MA is associated with more than one VID, the
            dot1agCfmVlanTable lists them.
            " "802.1ag clause 12.14.6.1.3:b"                     D"The type (and thereby format) of the Maintenance Association Name." "802.1ag clauses 21.6.5.4"                     �"The Short Maintenance Association name. The type/format of
            this object is determined by the value of the
            dot1agCfmMaNameType object.
            " +"802.1ag clauses 21.6.5.6, and Table 21-20"                     p"Indicates if the Management entity can create MHFs (MIP Half
            Function) for this MA.
            " "802.1ag clause 12.14.6.1.3:c"                     �"Enumerated value indicating what, if anything, is to be
            included in the Sender ID TLV (21.5.3) transmitted by MPs
            configured in this MA.
            " "802.1ag clause 12.14.6.1.3:d"                     a"Interval between CCM transmissions to be used by all MEPs
            in the MA.
            " "802.1ag clause 12.14.6.1.3:e"                     �"The status of the row.
            The writable columns in a row can not be changed if the row
            is active. All columns must have a valid value before a row
            can be activated.
            "                       "List of Vlan. "                       "The known Vlan table entry."                       "VlanId"                       �"The status of the row. Read SNMPv2-TC (RFC1903) for an
            explanation of the possible values this object can take.
            "                      �"List of MEPIDs (in any bridge) that belong to the same MA.
            Clause 12.14.6.1.3 specifies that a list of MEPIDs in all
            bridges in that MA, but since SNMP SMI does not allow to
            state in a MIB that an object in a table is an array, the
            information has to be stored in another table with two
            indices, being the first index, the index of the table that
            contains the list or array.
            " "802.1ag clause 12.14.6.1.3:g"                     "The known MEPS table entry."                       "MEPID" "802.1ag clause 12.14.6.1.3:g"                     �"The status of the row. Read SNMPv2-TC (RFC1903) for an
            explanation of the possible values this object can take.
            "                          �"The Maintenance Association End Point (MEP) table.
        Each row in the table represents a different MEP. A MEP is
        an actively managed CFM entity, associated with a specific
        DSAP of a Service Instance, which can generate and receive
        CFM PDUs and track any responses. It is an end point of a
        single Maintenance Association, and is an endpoint of a
        separate Maintenance Entity for each of the other MEPs in
        the same Maintenance Association (802.1ag clause 3.18).
        This table uses three indices. The first two indices are the
        indices of the Maintenance Domain and MA tables, the reason
        being that a MEP is always related to an MA and Maintenance
        Domain.
        The Transmit Loopback table. Entries in this table are
        created/removed at the same time than entries in the MEP
        table are created/removed.
        The MEP table also stores all the managed objects for sending
        LBM and LTM.
        *LBM Managed objects
        LBM Managed objects in the MEP table
        enables the management entity to initiate
        transmission of Loopback messages. It will signal the MEP
        that it should transmit some number of Loopback messages
        and detect the detection (or lack thereof) of the
        corresponding Loopback messages.
        Steps to use entries in this table:
        1) Wait for dot1agCfmMepTransmitLbmStatus value to be
        'ready'. To do this do this sequence:
        a. an SNMP GET for both SnmpSetSerialNo and
        dot1agCfmMepTransmitLbmStatus objects (in same SNMP
        PDU).
        b. Check if value for dot1agCfmMepTransmitLbmStatus is
        'ready'
        - if not, wait x seconds, go to step a above.
        - if yes, save the value of SnmpSetSerialNo and go
        to step 2) below
        2) Change dot1agCfmMepTransmitLbmStatus value from 'ready' to
        'notReady' to ensure no other management entity will use
        the service. In order to not disturb a possible other NMS
        do this by sending an SNMP SET for both SnmpSetSerialNo
        and dot1agCfmMepTransmitLbmStatus objects (in same SNMP
        PDU, and make sure SNmpSetSerialNo is the first varBind).
        For the SnmpSetSerialNo varBind, use the value that you
        obtained in step 1)a.. This ensures that two cooperating
        NMSes will not step on each others toes.
        3) Setup the different data to be sent (number of messages,
        optional TLVs,...).
        4) Record the current values of dot1agCfmMepLbrIn,
        dot1agCfmMepLbrInOutOfOrder, and dot1agCfmMepLbrBadMsdu.
        6) Change dot1agCfmMepTransmitLbmStatus value from 'notReady'
        to 'transmit' to initiate transmission of Loopback
        messages.
        7) Check the value of dot1agCfmMepTransmitLbmResultOK to
        find out if the operation was successfully initiated or
        not.
        8) Monitor the value of dot1agCfmMepTransmitLbmMessages.
        When it reaches 0, the last LBM has been transmitted.
        Wait an additional 5 seconds to ensure that all LBRs have
        been returned.
        9) Compare dot1agCfmMepLbrIn, dot1agCfmMepLbrInOutOfOrder,
        and dot1agCfmMepLbrBadMsdu to their old values from step
        4, above, to get the results of the test.
        10) Change the dot1agCfmMepTransmitLbmStatus value back to
        'ready' to allow other management entities to use the
        table.
        *LTM Managed objects
        The LTM Managed objects in the MEP table are used in a manner
        similar to that described for LBM transmission, above. Upon
        successfully initiating the transmission, the variables
        dot1agCfmMepTransmitLtmSeqNumber and
        dot1agCfmMepTransmitLtmEgressIdentifier return the information
        required to recover the results of the LTM from the
        dot1agCfmLtrTable.
        " ""802.1ag clauses 12.14.7 and 19.2"                     "The MEP table entry"                      <"Integer that is unique among all the MEPs in the same MA.
            Other definition is: a small integer, unique over a given
            Maintenance Association, identifying a specific Maintenance
            association End Point (3.19).
            MEP Identifier is also known as the MEPID.
            " ("802.1ag clauses 3.19, 19.2 and 12.14.7"                    ."This object is the interface index of the interface either a
            bridge port, or an aggregated IEEE 802.1 link within a bridge
            port, to which the MEP is attached.
            Upon a restart of the system, the system SHALL, if necessary,
            change the value of this variable so that it indexes the
            entry in the interface table with the same value of ifAlias
            that it indexed before the system restart. If no such
            entry exists, then the system SHALL set this variable to 0.
            " "802.1ag clause 12.14.7.1.3:b"                     :"The direction in which the MEP faces on the Bridge port." ("802.1ag clauses 12.14.7.1.3:c and 19.2"                    "An integer indicating the Primary VID of the MEP, always
            one of the VIDs assigned to the MEP's MA. The value 0
            indicates that either the Primary VID is that of the
            MEP's MA, or that the MEP's MA is associated with no VID." "802.1ag clauses 12.14.7.1.3:d"                     �"Administrative state of the MEP
            A Boolean indicating the administrative state of the MEP.
            True indicates that the MEP is to function normally, and
            false that it is to cease functioning." *"802.1ag clauses 12.14.7.1.3:e and 20.9.1"                     a"Current state of the MEP Fault Notification Generator
            State Machine.
            " )"802.1ag clauses 12.14.7.1.3:f and 20.35"                     5"If set to true, the MEP will generate CCM messages." +"802.1ag clauses 12.14.7.1.3:g and 20.10.1"                    "The priority value for CCMs and LTMs transmitted by the MEP.
            Default Value in the highest priority value allowed to pass
            through the bridge port for any of this MEPs VIDs.
            The management entity can obtain the default value for this
            variable from the priority regeneration table by extracting the
            highest priority value in this table on this MEPs bridge port.
            (1 is lowest, then 2, then 0, then 3-7, 255 is an invalid value).
            " "802.1ag clause 12.14.7.1.3:h"                     "MAC address of the MEP." '"802.1ag clause 12.14.7.1.3:i and 19.4"                     |"An integer value specifying the lowest priority defect
            that is allowed to generate fault alarm.
            " 8"802.1ag clause 12.14.7.1.3:k and 20.9.5 and Table 20-1"                     �"The highest priority defect that has been present since the
            MEPs Fault Notification Generator State Machine was last in
            the FNG_RESET state.
            " 5"802.1ag clause 12.14.7.1.3:n 20.33.9 and Table 21-1"                     �"A vector of Boolean error conditions from Table 20-1, any of
            which may be true:
            DefRDICCM(1)
            DefMACstatus(2)
            DefRemoteCCM(3)
            DefErrorCCM(4)
            DefXconCCM(5)
            " �"802.1ag clauses 12.14.7.1.3:o, 12.14.7.1.3:p, 12.14.7.1.3:q,
            12.14.7.1.3:r, 12.14.7.1.3:s, 20.21.3, 20.23.3, 20.33.5,
            20.33.6, 20.33.7."                     8"Total number of Continuity Check messages transmitted." +"802.1ag clauses 12.14.7.1.3:w and 20.10.2"                    <"Integer that is unique among all the MEPs in the same MA.
            Other definition is: a small integer, unique over a given
            Maintenance Association, identifying a specific Maintenance
            association End Point (3.18).
            MEP Identifier is also known as the MEPID.
            " ("802.1ag clauses 3.18, 19.2 and 12.14.7"                     ("Name of interface on which mep reside." "802.1ag clause 12.14.7.1.3:b"                     <"Total number of valid, in-order Loopback Replies received." *"802.1ag clause 12.14.7.1.3:y and 20.31.1"                     _"The total number of valid, out-of-order Loopback Replies
            received.
            " *"802.1ag clause 12.14.7.1.3:z and 20.31.1"                     �"(optional) The total number of LBRs received whose
            mac_service_data_unit did not match (except for the OpCode)
            that of the corresponding LBM (20.2.3).
            " &"802.1ag clause 12.14.7.1.3:aa 20.2.3"                     �"Next transaction identifier/sequence number to be sent in a
            Linktrace message. This sequence number can be zero because
            it wraps around.
            " +"802.1ag clause 12.14.7.1.3:ab and 20.36.1"                     9"The total number of unexpected LTRs received (20.39.1)." '"802.1ag clause 12.14.7.1.3:ac 20.39.1"                     /"Total number of Loopback Replies transmitted." +"802.1ag clause 12.14.7.1.3:ad and 20.26.2"                     �"The status of the row.
            The writable columns in a row can not be changed if the row
            is active. All columns must have a valid value before a row
            can be activated.
            "                       "Mep cc check flag"                       "ClientLevel: Mep Client-Level"                       "AIS enable state"                       "LCK enable state"                       "Local loss rate "       --obsolete
               "Remote loss rate "       --obsolete
               "Time delay "       --obsolete
               "Time delay change "       --obsolete
               "DLM enable state"                       "LMM enable state"                       "DMM enable state"                       "1DM enable state"                       "Proactive DMM enable state."                       "Proactive 1DM enable state."                       �"Maintenance association End Point Identifier of a remote MEP
            whose information from the MEP Database is to be returned.
            "                       ;"Interval between LMM transmissions to be used by the MEP."                       "Require time of LMM function."                       �"Maintenance association End Point Identifier of a remote MEP
            whose information from the MEP Database is to be returned.
            "                       ;"Interval between DMM transmissions to be used by the MEP."                       "Require time of DMM function."                       "Frame size of DMM."                       �"Maintenance association End Point Identifier of a remote MEP
            whose information from the MEP Database is to be returned.
            "                       ;"Interval between 1DM transmissions to be used by the MEP."                       "Require time of 1DM function."                       "Frame size of 1DM."                       �"Maintenance association End Point Identifier of a remote MEP
            whose information from the MEP Database is to be returned.
            "                       ;"Interval between DMM transmissions to be used by the MEP."                       "Frame size of DMM."                       �"Maintenance association End Point Identifier of a remote MEP
            whose information from the MEP Database is to be returned.
            "                       ;"Interval between 1DM transmissions to be used by the MEP."                       "Frame size of 1DM."                       ;"Interval between AIS transmissions to be used by the MEP."                       ;"Interval between LCK transmissions to be used by the MEP."                      �"Transmit and receive counters do not count the OAM frames
            transmitted or received by the MEP at the MEP's MEG Level
            normally. This flag set true provide rules of countting OAM
            frames at the MEP's MEG Level as below:
            A. For single-ended ETH-LM, both counters do not need to
            count on-demand OAM frames for ETH-LB, ETH-LT, ETH-LM,
            ETH-DM, and ETH-Test. Instead, proactive OAM frames for
            ETH-CC and ETH-APS need to be counted. For dual-ended
            ETH-LM, the counters do not need to count on-demand OAM
            frames for ETH-LB, ETH-LT, ETH-LM, ETH-DM, and ETH-Test
            and proactive OAM frames for ETH-CC. However, proactive
            OAM frames for ETH-APS need to be counted.
            B. As OAM frames for ETH-AIS and ETH-LCK are only sent in
            the defect conditions where the result of loss measurements
            is invalid, it is unnecessary to count these frames.
            "                      �"Transmit and receive counters do not count the OAM frames
            transmitted or received by the MEP at the MEP's MEG Level
            normally. This flag set true provide rules of countting OAM
            frames at the MEP's MEG Level as below:
            A. For single-ended ETH-LM, both counters do not need to
            count on-demand OAM frames for ETH-LB, ETH-LT, ETH-LM,
            ETH-DM, and ETH-Test. Instead, proactive OAM frames for
            ETH-CC and ETH-APS need to be counted. For dual-ended
            ETH-LM, the counters do not need to count on-demand OAM
            frames for ETH-LB, ETH-LT, ETH-LM, ETH-DM, and ETH-Test
            and proactive OAM frames for ETH-CC. However, proactive
            OAM frames for ETH-APS need to be counted.
            B. As OAM frames for ETH-AIS and ETH-LCK are only sent in
            the defect conditions where the result of loss measurements
            is invalid, it is unnecessary to count these frames.
            "                      �"This table extends the MEP table and contains a list of
            Linktrace replies received by a specific MEP in response to
            a linktrace message.
            SNMP SMI does not allow to state in a MIB that an object in
            a table is an array. The solution is to take the index (or
            indices) of the first table and add one or more indices.
            " "802.1ag clause 12.14.7.5"                     ""The Linktrace Reply table entry."                       �"Transaction identifier/Sequence number returned by a previous
            transmit linktrace message command, indicating which LTM's
            response is going to be returned.
            " "802.1ag clause 12.14.7.5.2:b"                    "An index to distinguish among multiple LTRs with the same LTR
            Transaction Identifier field value.  dot1agCfmLtrReceiveOrder
            are assigned sequentially from 1, in the order that the
            Linktrace Initiator received the LTRs.
            " "802.1ag clause 12.14.7.5.2:c"                     %"TTL field value for a returned LTR." ("802.1ag clause 12.14.7.5 and 20.36.2.2"                     �"Indicates if a LTM was forwarded by the responding MP, as
            returned in the 'FwdYes' flag of the flags field.
            " -"802.1ag clauses 12.14.7.5.3:c and 20.36.2.1"                     �"A boolean value stating whether the forwarded LTM reached a
            MEP enclosing its MA, as returned in the Terminal MEP flag of
            the Flags field.
            " -"802.1ag clauses 12.14.7.5.3:d and 20.36.2.1"                    �"An octet field holding the Last Egress Identifier returned
            in the LTR Egress Identifier TLV of the LTR.
            The Last Egress Identifier identifies the MEP Linktrace
            Initiator that originated, or the Linktrace Responder that
            forwarded, the LTM to which this LTR is the response. This
            is the same value as the Egress Identifier TLV of that LTM.
            " -"802.1ag clauses 12.14.7.5.3:e and 20.36.2.3"                    Y"An octet field holding the Next Egress Identifier returned
            in the LTR Egress Identifier TLV of the LTR. The Next Egress
            Identifier Identifies the Linktrace Responder that
            transmitted this LTR, and can forward the LTM to the next
            hop. This is the same value as the Egress Identifier TLV of
            the forwarded LTM, if any. If the FwdYes bit of the Flags
            field is false, the contents of this field are undefined,
            i.e. any value can be transmitted, and the field is ignored
            by the receiver.
            " -"802.1ag clauses 12.14.7.5.3:f and 20.36.2.4"                     +"Value returned in the Relay Action field." -"802.1ag clauses 12.14.7.5.3:g and 20.36.2.5"                     <"The value returned in the Ingress Action Field of the LTM." -"802.1ag clauses 12.14.7.5.3:k and 20.36.2.6"                     8"MAC address returned in the ingress MAC address field." -"802.1ag clauses 12.14.7.5.3:l and 20.36.2.7"                     ;"The value returned in the Egress Action Field of the LTM." ."802.1ag clauses 12.14.7.5.3:o and 20.36.2.10"                     7"MAC address returned in the egress MAC address field." ."802.1ag clauses 12.14.7.5.3:p and 20.36.2.11"                    �"The MEP Database. A database, maintained by every MEP, that
            maintains received information about other MEPs in the
            Maintenance Domain.
            The SMI does not allow to state in a MIB that an object in
            a table is an array. The solution is to take the index (or
            indices) of the first table and add one or more indices.
            " "802.1ag clause 19.2.15"                     "The MEP Database table entry."                       �"Maintenance association End Point Identifier of a remote MEP
            whose information from the MEP Database is to be returned.
            " "802.1ag clause 12.14.7.6.2:b"                     $"The MAC address of the remote MEP." *"802.1ag clause 12.14.7.6.3:d and 20.19.7"                     �"State of the RDI bit in the last received CCM (true for
            RDI=1), or false if none has been received.
            " +"802.1ag clauses 12.14.7.6.3:e and 20.19.2"                     "Local loss rate "                       "Remote loss rate "                       "Time delay."                       "Time delay change."                       "Proactive time delay."                       "Proactive time delay change."                           "Loopback Reply state"                       "Loopback Reply state"                       "MIP Table" ""802.1ag clauses 12.14.7 and 19.2"                     "The MIP table entry"                       "Session Id"                       "Mip Port Name" "802.1ag clause 12.14.7.1.3:b"                         "CFM global state"                           "PW MIP Table"                       "The PW MIP table entry"                       "PW MIP port name"                       "PW MIP level"                      