*RST
SENS:FUNC 'CURR'
SYST:ZCH OFF
READ?



SENS:CURR:NPLCycles?
6.00

SENS:CURR:NPLCycles 1

SENS:CURR:NPLCycles?
1.00


SYST:LOC
SYST:REM
SYST:RWL


SYST:CLE

FUNC 'CURR' 

FUNC? 
*RST 
SENS:FUNC 'CURR'                                                                                            
SENS:FUNC?                                                                                                  
"CURR:DC"                                                                                                   
                                                                                                            
FUNC 'CURR'                                                                                                 
FUNC?                                                                                                       
"CURR:DC"                                                                                                   
                                                                                                            
FUNC 'VOLT'                                                                                                 
FUNC?                                                                                                       
"VOLT:DC"                 


SYST:ERR? 

                                                                                                            
CURR:RANGE?                                                                                                 
+2.100000E-04                                                                                               
               



CURR:NPLC 1                                                                                                 
CURR:NPLC?                                                                                                  
1.00    

CURR:NPLC 0.1                                                                                               
CURR:NPLC?                                                                                                  
0.10   
