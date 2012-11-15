      *-----------------------------------------------------------------        
      *  * RG *                        REGISTRO DE PARAMETROS REQUERI-          
      *                                DOS PARA LA RUTINA DE CENTRADO           
      *                                DE TEXTO.                                
      *                                                                         
      *  REFERENCIAS    NINGUNA                                                 
      *                 FEB/02                                                  
      *                                                                         
        02 L000-PARAM.                                                          
           05 L000-LONG                PIC S9(9) COMP.                          
           05 L000-TEXTO.                                                       
              10 L000-CAR              OCCURS 1 TO 1000                         
                                       DEPENDING ON L000-LONG                   
                                       INDEXED BY L000-I1                       
                                                 L000-I2                        
                                                  L000-I-LONG                   
                                       PIC X.                                   
      *-----------------------------------------------------------------        
