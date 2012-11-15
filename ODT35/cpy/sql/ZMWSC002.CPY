      *----                                                                     
      * ZMWSC002 : PROCESOS LOGICOS PARA OBTENER EL MENSAJE                     
      *            DE ERROR CORRESPONDIENTE AL CODIGO INDICADO                  
      *                                                                         
      * EJEMPLO:         MOVE 100        TO WM-CODIGO                           
      *                  PERFORM 9200-MENSAJE-ERROR                             
      *                  MOVE WM-MENSAJE TO VARIABLE-MAPA                       
      *----                                                                     
       9200-MENSAJE-ERROR.                                                      
      *----                                                                     
           INITIALIZE WM-MENSAJE                                                
           MOVE WM-CODIGO                   TO WM-MENS-CODIGO                   
           MOVE 'SIVA-ZME *** MENSAJE INEXISTENTE'                              
                                            TO WM-MENS-TEXTO                    
           MOVE 1                           TO WM-INI                           
           MOVE WM-INI                      TO WM-ITEM                          
           PERFORM 9201-LEE-ITEM                                                
           SET SM-SALIR-SI                  TO TRUE                             
           IF WM-NUMITEMS > 0                                                   
              MOVE WM-DATO-CODIGO           TO WM-INI-CODIGO                    
              MOVE WM-NUMITEMS              TO WM-FIN                           
              MOVE WM-FIN                   TO WM-ITEM                          
              PERFORM 9201-LEE-ITEM                                             
              MOVE WM-DATO-CODIGO           TO WM-FIN-CODIGO                    
              IF WM-CODIGO <= WM-FIN-CODIGO                                     
                 SET SM-SALIR-NO            TO TRUE                             
              END-IF                                                            
           END-IF                                                               
           PERFORM UNTIL SM-SALIR-SI                                            
              MOVE WM-INI                   TO WM-ITEM                          
              IF WM-FIN-CODIGO > WM-INI-CODIGO                                  
                 COMPUTE WM-ITEM-AUX = (WM-FIN - WM-INI)                        
                                     * (WM-CODIGO - WM-INI-CODIGO)              
                 COMPUTE WM-ITEM     = (WM-ITEM-AUX                             
                                     / (WM-FIN-CODIGO - WM-INI-CODIGO))         
                 ADD WM-INI                 TO WM-ITEM                          
              END-IF                                                            
              PERFORM 9201-LEE-ITEM                                             
              IF WM-RESP = DFHRESP(NORMAL)                                      
                 EVALUATE TRUE                                                  
                 WHEN WM-DATO-CODIGO = WM-CODIGO                                
                    MOVE WM-DATO            TO WM-MENSAJE                       
                    SET SM-SALIR-SI         TO TRUE                             
                 WHEN WM-DATO-CODIGO < WM-CODIGO                                
                    MOVE WM-ITEM            TO WM-INI                           
                    ADD 1                   TO WM-INI                           
                    MOVE WM-DATO-CODIGO     TO WM-INI-CODIGO                    
                 WHEN WM-DATO-CODIGO > WM-CODIGO                                
                    MOVE WM-ITEM            TO WM-FIN                           
                    SUBTRACT 1            FROM WM-FIN                           
                    MOVE WM-DATO-CODIGO     TO WM-FIN-CODIGO                    
                 END-EVALUATE                                                   
                 IF WM-INI > WM-FIN                                             
                    SET SM-SALIR-SI         TO TRUE                             
                 END-IF                                                         
              ELSE                                                              
                 SET SM-SALIR-SI            TO TRUE                             
              END-IF                                                            
           END-PERFORM.                                                         
      *----                                                                     
       9201-LEE-ITEM.                                                           
      *----                                                                     
           MOVE LENGTH OF WM-DATO           TO WM-LENGTH                        
           MOVE 0                           TO WM-NUMITEMS                      
           EXEC CICS                                                            
              READQ TS                                                          
                 QUEUE    (WM-QUEUE)                                            
                 INTO     (WM-DATO)                                             
                 LENGTH   (WM-LENGTH)                                           
                 NUMITEMS (WM-NUMITEMS)                                         
                 ITEM     (WM-ITEM)                                             
              RESP(WM-RESP)                                                     
           END-EXEC.                                                            
           IF  WM-RESP NOT = DFHRESP(NORMAL)                                    
           AND WM-RESP NOT = DFHRESP(ITEMERR)                                   
              MOVE 'SIVA-ZME *** ERROR AL LEER MENSAJE. ERR:'                   
                                            TO WM-MENS-TEXTO                    
              MOVE WM-RESP                  TO WM-MENS-TEXTO(34:8)              
           END-IF.                                                              
      *----                                                                     
