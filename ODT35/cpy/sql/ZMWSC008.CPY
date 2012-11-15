      *----                                                                     
      * ZMWSC008 : PREPARA LA INFORMACION PARA LA TRANSACCION DE ABORTA         
      *                                                                         
      *----                                                                     
       9800-ABORTA.                                                             
      *----                                                                     
           MOVE W000-PROG              TO AB-WAPLIC                             
      *                                                                         
           MOVE EIBTRNID               TO AB-TRAN-ORI                           
           MOVE EIBTASKN               TO AB-TASK-ORI                           
      *                                                                         
           EXEC CICS                                                            
                SYNCPOINT ROLLBACK                                              
           END-EXEC                                                             
                                                                                
           PERFORM 9889-ABORTA-QUEUES                                           
                                                                                
           EXEC CICS START                                                      
              TRANSID         ('Z532')                                          
              TERMID          (EIBTRMID)                                        
              FROM            (AB-REG)                                          
              LENGTH          (LENGTH  OF AB-REG)                               
           END-EXEC                                                             
           PERFORM 300000-TERMINA.
                                                                                
      *----                                                                     
      * ZMWSC008 : DAR BYPASS A LA RUTINA, ABORTA PREVIO.                       
      * (DOS)                                                                   
      *----                                                                     
       9888-ABORTA-RETURN.                                                      
      *----                                                                     
           EXEC CICS                                                            
                SYNCPOINT ROLLBACK                                              
           END-EXEC                                                             
                                                                                
           PERFORM 9889-ABORTA-QUEUES                                           
                                                                                
           PERFORM 300000-TERMINA.
      *----                                                                     
      * ZMWSC008 : BORRAR QUEUES DE PAGINACION PENDIENTES, DESPUES              
      *            DE GENERARSE UN ABORTA EN LA APLICACION O RUTINAS.           
      *                                                                         
      *           SIEMPRE DEBERAN BORRARSE LOS QUEUES EXISTENTES SI             
      *           ES UNA APLICACION(ZM1/ZM2) Y NO RUTINA(ZM9CR/ZM8CR):          
      *                                                                         
      *           (NOMBRE DE QUEUE = EIBTRMID                                   
      *                              + W000-PROG(6:3)                           
      *                              + CONSECUTIVO DESDE 1 A 9).                
      * (TRES)                                                                  
      *----                                                                     
       9889-ABORTA-QUEUES.                                                      
      *----                                                                     
           EXEC CICS                                                            
                IGNORE CONDITION                                                
                QIDERR                                                          
           END-EXEC                                                             
                                                                                
           IF W000-PROG(1:3)            = 'ZM1' OR 'ZM2'                        
              PERFORM VARYING             ZM-IND-Q FROM 1 BY 1                  
                        UNTIL             ZM-IND-Q > 9                          
                 MOVE EIBTRMID         TO ZM-TERMID                             
                 MOVE W000-PROG(6:3)   TO ZM-TRANSID                            
                 MOVE ZM-IND-Q         TO ZM-CONSEC                             
                 EXEC CICS                                                      
                      DELETEQ TS                                                
                      QUEUE (ZM-QUEUE)                                          
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
      *----                                                                     
