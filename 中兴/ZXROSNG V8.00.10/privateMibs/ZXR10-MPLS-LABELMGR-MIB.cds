                                           k"This MIB contains managed object definitions for the
             'Label Management, labelmgr' document."�"Joan Cucchiara (jcucchiara@crescentnetworks.com)
              Crescent Networks

              Hans Sjostrand (hans@ipunplugged.com)
              ipUnplugged

              James V. Luciani (jluciani@crescentnetworks.com)
              Crescent Networks

              Working Group Chairs:
              George Swallow,   email: swallow@cisco.com
              Vijay Srinivasan, email: vijay@cosinecom.com
              MPLS Working Group, email: mpls@uu.net
         "               �"LabelRange Table. This table contains label range, 
                    including the type of label pool, the label range in use 
                    and the label range configured."                       %"The parameter of label range entry."                       "The type of the label pool."                      ."The begin of label range configured. If its value is 0, it shows that it uses default
                    label range. If its value is different from the begin of label range in use, it shows that 
                    the configured label range doesn't work. It will take effect at the next reload."                      *"The end of label range configured. If its value is 0, it shows that it uses default
                    label range. If its value is different from the end of label range in use, it shows that 
                    the configured label range doesn't work. It will take effect at the next reload."                       ""The begin of label range in use."                        "The end of label range in use."                          