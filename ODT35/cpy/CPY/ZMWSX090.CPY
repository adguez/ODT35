      *----------------------------------------------------------------*        
      * ZMWSR090 : AREAS DE TRABAJO PARA VALIDAR FECHAS EN 6 Y 8 NUMEROS        
      *            (A#O EN 2 POSICIONES, O EN 4 POSICIONES).           *        
      *            (CON FORMATOS AAMMDD Y AAAAMMDD).                   *        
      *----------------------------------------------------------------*        
           02 VF-FECHAS.                                                        
      *----------------------------------------------------------------*        
           05 VF-WCODRET            PIC S9(9) COMP.                             
           05 VF-FECHA              PIC 9(08).                                  
           05 FILLER REDEFINES VF-FECHA.                                        
              10 VF-SA              PIC 9999.                                   
              10 FILLER REDEFINES VF-SA.                                        
                 15 VF-SS           PIC 99.                                     
                 15 VF-AA           PIC 99.                                     
              10 VF-MM              PIC 99.                                     
              10 VF-DD              PIC 99.                                     
           05 VF-FECHA-TEXTO.                                                   
              10 VF-AAT             PIC 9999.                                   
              10 FILLER REDEFINES VF-AAT.                                       
                 15 VF-AA1          PIC 99.                                     
                 15 VF-AA2          PIC 99.                                     
              10 VF-GUION1          PIC X.                                      
              10 VF-MMT             PIC 99.                                     
              10 VF-GUION2          PIC X.                                      
              10 VF-DDT             PIC 99.                                     
      *----------------------------------------------------------------*        
                                                                                
