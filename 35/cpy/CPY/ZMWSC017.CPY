      *----------------------------------------------------------------         
      *  ZMWSC017  RUTINA PARA VALIDACION Y FORMATEO DE                         
      *            CAMPOS NUMERICOS. (VEA DOCUMENTACION EN ZMWSC016).           
      *----------------------------------------------------------------         
       01  W9350-REGISTRO.                                                      
           05 FILLER               PIC X(03)  VALUE SPACES.                     
           05 W9350-IMP-ALFA.                                                   
              10 W9350-DIG                                                      
                 OCCURS 25 TIMES   PIC X(01).                                   
                 88 W9350-ES-VALIDO    VALUE ' ', '.', ',', '+', '-',           
                                             '0' THRU '9'.                      
                 88 W9350-ES-ESPACIO   VALUE ' '.                               
                 88 W9350-ES-PUNTO     VALUE '.'.                               
                 88 W9350-ES-COMA      VALUE ','.                               
                 88 W9350-ES-SIGNO     VALUE '+', '-'.                          
                 88 W9350-ES-NUMERO    VALUE '0' THRU '9'.                      
           05 W9350-ENTEROS        PIC S9(04) COMP.                             
           05 W9350-ENTEROSX.                                                   
              10 W9350-ENTEROSN    PIC Z9.                                      
           05 W9350-DECIMALES      PIC S9(04) COMP.                             
           05 W9350-DECIMALESX.                                                 
              10 W9350-DECIMALESN  PIC Z9.                                      
           05 W9350-REDONDEO       PIC X    VALUE ' '.                          
              88 W9350-OPCRED-VALID    VALUE ' ', 'E', 'R', 'T'.                
              88 W9350-EXACTO          VALUE ' ', 'E'.                          
              88 W9350-TRUNCAR         VALUE 'T'.                               
              88 W9350-REDONDEAR       VALUE 'R'.                               
      *----------------------------------------------------------------         
           05 W9350-SIGNO          PIC X.                                       
              88 W9350-HAY-SIGNO       VALUE '+', '-'.                          
           05 W9350-CODIGO         PIC S9999 COMP   VALUE 0.                    
           05 W9350-MSGERROR       PIC X(40).                                   
              88 W9350-NO-HAY-ERROR    VALUE ' '.                               
      *----------------------------------------------------------------         
           05 W9350-I              PIC S9(04) COMP.                             
           05 W9350-J              PIC S9(04) COMP.                             
           05 W9350-K              PIC S9(04) COMP.                             
           05 W9350-L              PIC S9(04) COMP.                             
           05 W9350-IMPOR.                                                      
              10 W9350-DIGI                                                     
                 OCCURS 18 TIMES   PIC X(01).                                   
           05 W9350-IMPORN                                                      
              REDEFINES                                                         
              W9350-IMPOR          PIC 9(18).                                   
           05 W9350-DI             PIC X.                                       
              88 W9350-HAY-NUMERO      VALUE '0' THRU '9'.                      
           05 W9350-COMA           PIC X.                                       
              88 W9350-HAY-COMA        VALUE ','.                               
           05 W9350-PUNTO          PIC X.                                       
              88 W9350-HAY-PUNTO       VALUE '.'.                               
           05 W9350-ESPACIO        PIC X.                                       
              88 W9350-HAY-ESPACIO     VALUE ' '.                               
      *----------------------------------------------------------------         
           05 W9350-IMP-00DEC      PIC S9(18).                                  
           05 W9350-IMP-01DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(17)V9.                                
           05 W9350-IMP-02DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(16)V99.                               
           05 W9350-IMP-03DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(15)V999.                              
           05 W9350-IMP-04DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(14)V9999.                             
           05 W9350-IMP-05DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(13)V9(05).                            
           05 W9350-IMP-06DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(12)V9(06).                            
           05 W9350-IMP-07DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(11)V9(07).                            
           05 W9350-IMP-08DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(10)V9(08).                            
           05 W9350-IMP-09DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(09)V9(09).                            
           05 W9350-IMP-10DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(08)V9(10).                            
           05 W9350-IMP-11DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(07)V9(11).                            
           05 W9350-IMP-12DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(06)V9(12).                            
           05 W9350-IMP-13DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(05)V9(13).                            
           05 W9350-IMP-14DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(04)V9(14).                            
           05 W9350-IMP-15DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(03)V9(15).                            
           05 W9350-IMP-16DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(02)V9(16).                            
           05 W9350-IMP-17DEC                                                   
              REDEFINES                                                         
              W9350-IMP-00DEC      PIC S9(01)V9(17).                            
                                                                                
