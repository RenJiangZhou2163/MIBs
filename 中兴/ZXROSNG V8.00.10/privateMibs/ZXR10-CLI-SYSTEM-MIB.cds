    �"The RowStatus of this row instance.It could be used for creating,
             modify or remove instance. But only some of the six enumerated values 
             for the RowStatus textual convention need be supported, specifically: 
             active(1):      the row is active,
             createAndGo(4): Create a new row, 
             destroy(6):     Remove current row."                                                                 "" ^"Chen Wenbo
                Tel: 675166      
                E-Mail: chen.wenbo@zte.com.cn" "201510210000Z" "201503200000Z" �"Modify zxr10SystemSecretEncrypted MAX-ACCESS :read-only,
             modify zxr10SystemSecretPassword MAX-ACCESS :read-only,
             modify SecretRowStatus STATUS : obsolete." �"Delete the TAB char,
             modify invalid TC definition : SecretRowStatus,
             add MODULE-IDENTITY and LAST-UPDATED."               *"the description of zxr10 secret entries."                       \"A secret entry containing objects that
             descript the enable secret infomation"                       �"The level of the secret.
             The max level is decided by performance parameter.
             It may be (1..18) or (1..15)"                       e"Specifies an ENCRYPTED password or not.
             0----Unencrypted
             5----Encrypted"                       q"Specifies an secret.
             Unencrypted password: size(3..16)
             Encrypted password: size(24)"                      �"The RowStatus of this row instance.It could be used for creating,
             modify or remove instance. But only some of the six
             enumerated values for the RowStatus textual convention
             need be supported, specifically: 
             active(1):      the row is active, 
             createAndGo(4): Create a new row, 
             destroy(6):     Remove current row."                          