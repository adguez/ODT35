      *----                                                                     
      * ZMWSC013 : REGISTRO CON VARIABLES PARA OBTENER EL USUARIO,              
      *            LA FECHA Y LA HORA ACTUAL                                    
      *                                                                         
      * EJEMPLO:         PERFORM 9300-USER-FECHA-HORA                           
      *                  MOVE FH-FECHA-10  TO VARIABLE-MAPA                     
      *                  MOVE FH-HORA      TO VARIABLE-MAPA                     
      *----                                                                     
       01  FH-REG.                                                              
           03 FH-USUARIO               PIC  X(08) VALUE SPACES.                 
           03 FH-FECHA-10.                                                      
              05 FH-SIGLO-10           PIC  9(02) VALUE 0.                      
              05 FH-ANO-10             PIC  9(02) VALUE 0.                      
              05 FH-GUION1             PIC  X(01) VALUE '-'.                    
              05 FH-MES-10             PIC  9(02) VALUE 0.                      
              05 FH-GUION2             PIC  X(01) VALUE '-'.                    
              05 FH-DIA-10             PIC  9(02) VALUE 0.                      
           03 FH-HORA                  PIC  X(08) VALUE SPACES.                 
           03 FH-TIEMPO                PIC S9(15) COMP VALUE 0.                 
           03 FH-FECHA-6.                                                       
              05 FH-DIA-6              PIC  9(02) VALUE 0.                      
              05 FH-MES-6              PIC  9(02) VALUE 0.                      
              05 FH-ANO-6              PIC  9(02) VALUE 0.                      
      *----                                                                     
