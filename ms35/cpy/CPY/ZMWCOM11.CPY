      *----                                                                     
      * ZMWCOM11 : REGISTRO CON VARIABLES DE COMUNICACION PARA LA               
      *            TRANSFERENCIA DE APLICACIONES. SI SE DESEA ENVIAR            
      *            MAS DATOS SE PUEDEN INCLUIR EN UN NIVEL 02 ADICIONAL         
      *                                                                         
      * EJEMPLO:     *----                                                      
      *              * VARIABLES DE COMUNICACION (WC-COMMAREA)                  
      *              *----                                                      
      *                  COPY ZMWCOM11.                                         
      *                  02 WC-EXTRA.                                           
      *                     05 WC-VAR1      PIC  X(50).                         
      *                     05 WC-VAR2      PIC S9(04) COMP.                    
      *----                                                                     
       01  WC-COMMAREA.                                                         
           02 WC-FIJA.                                                          
              05 WC-FIJA-CICS.                                                  
                 07 WC-FIJA-CSP.                                                
                    10 WC-WAPLIC            PIC  X(08) VALUE SPACES.            
                    10 WC-WPARAM            PIC  X(65) VALUE SPACES.            
                    10 WC-WCODIGO           PIC S9(08) COMP VALUE 0.            
                 07 WC-EMPRESA              PIC  X(50) VALUE SPACES.            
                 07 WC-PGMID                PIC  X(08) VALUE SPACES.            
                 07 WC-ESTADO               PIC  9(02) VALUE 0.                 
                 07 WC-QUEUES               PIC  9(01) VALUE 0.                 
                 07 WC-IEMPR                PIC  X(03) VALUE SPACES.            
                 07 WC-ISUCMTZ              PIC  X(03) VALUE SPACES.            
                 07 WC-IIDEBMV              PIC  X(05) VALUE SPACES.            
                 07 WC-SALCANCE             PIC  X(01) VALUE SPACES.            
                 07 WC-ICTASIS              PIC  X(04) VALUE SPACES.            
                 07 WC-ICCOSTO              PIC  9(05) VALUE 0.                 
                 07 WC-IPROM                PIC  9(04) VALUE 0.                 
                 07 WC-IPERFIL              PIC  X(08) VALUE SPACES.            
                 07 WC-ISUCCASA             PIC  X(03) VALUE SPACES.            
                 07 WC-TFECHOY              PIC  X(10) VALUE SPACES.            
                 07 WC-TFECVN               PIC  X(10) VALUE SPACES.            
                 07 WC-TDIASVN              PIC  9(09) COMP  VALUE 0.           
                 07 WC-TFEC48               PIC  X(10) VALUE SPACES.            
                 07 WC-TDIAS48              PIC  9(09) COMP  VALUE 0.           
                 07 WC-TFEC72               PIC  X(10) VALUE SPACES.            
                 07 WC-TDIAS72              PIC  9(09) COMP  VALUE 0.           
                 07 WC-TFEC96               PIC  X(10) VALUE SPACES.            
                 07 WC-TDIAS96              PIC  9(09) COMP  VALUE 0.           
              05 FILLER                     PIC  X(04) VALUE SPACES.            
      *---                                       -----                          
      *---    TOTAL LONGITUD FIJA                 245 CHARS.                    
