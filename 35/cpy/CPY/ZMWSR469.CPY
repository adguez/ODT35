      *-----------------------------------------------------------------        
      *  * RG *         AREA PARA PASO DE PARAMETROS ENTRE LA RUTINA QUE        
      *                 AUTORIZA AL USUARIO A OPERAR UN CONTRATO                
      *                 USUARIO --> CONTRATO                                    
      *                                                                         
      *  REFERENCIAS    NINGUNA                                                 
      *                 ABR/02                                                  
      *                                                                         
        02 UC-USUARIO-CONTRATO.                                                 
           05 UC-WCODRET               PIC S9(9) COMP.                          
           05 UC-USUARIO               PIC X(08).                               
                                                                                
      *-----------------------------------------------------------------        
      *    DEFINICION DEL REGISTRO DE LA TABLA CUENTA                           
      *-----------------------------------------------------------------        
           COPY ZMWSRDCU.                                                       
                                                                                
