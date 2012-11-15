      *-----------------------------------------------------------------        
      *  * RG *                        REGISTRO DE PARAMETROS REQUERI-          
      *                                DOS PARA LA RUTINA DE NOMBRE DE          
      *                                LA COMPA¦IA.                             
      *                                ABR/02                                   
      *  * PARAMETROS *                                                         
      *                                                                         
      *  * ENTRADA *  NINGUNO                                                   
      *                                                                         
      *  * SALIDA  *  NC-WCODRET, NC-REG-RETURN, NC-T01NOMBR                    
      *----                                                                     
        02 NC-NOMBRE-PARM.                                                      
           05 NC-WCODRET               PIC S9(09) COMP.                         
           05 NC-T01NOMBR              PIC X(50).                               
      *-----------------------------------------------------------------        
           05 NC-REG-RETURN.                                                    
              08 NC-IUSUARIO           PIC X(08).                               
              08 NC-SEXISTE            PIC X(01).                               
              08 NC-REG-USUARIO.                                                
                 10 NC-SALCANCE        PIC X.                                   
                 10 NC-FEXPIRA         PIC X(10).                               
                 10 NC-ICCOSTO         PIC S99999V USAGE COMP-3.                
                 10 NC-IPROM           PIC S9999V USAGE COMP-3.                 
                 10 NC-IPERFIL         PIC X(8).                                
                 10 NC-ISUCCASA        PIC X(3).                                
                 10 NC-NAPELL1         PIC X(40).                               
                 10 NC-NAPELL2         PIC X(20).                               
                 10 NC-NOMBRE          PIC X(20).                               
                 10 NC-SALCANCA        PIC X.                                   
                 10 NC-SALCANPR        PIC X.                                   
                 10 NC-ICTASIS         PIC X(4).                                
                 10 NC-FSIST           PIC X(26).                               
                 10 NC-IUSERAUT        PIC X(8).                                
                 10 NC-ITERM           PIC X(8).                                
                 10 NC-SVIGEN          PIC X.
      *          10 NC-IEMPR           PIC X(03).
                 10 NC-ISUCMTZ         PIC X(03).
                 10 NC-IIDEBMV         PIC X(05).                               
      *-----------------------------------------------------------------        
