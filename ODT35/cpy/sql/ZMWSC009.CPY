      *----                                                                     
      * ZMWSC009 : PROCESOS LOGICOS PARA TRANSFERIR EL CONTROL A LA             
      *            TRANSACCION ASOCIADA A LA OPCION DE MENU ASOCIADO            
      *            SE REGRESA EL MENSAJE DE ERROR EN CASO DE ERROR              
      *                                                                         
      * EJEMPLO:         MOVE MAPA-COMANDO  TO MM-COMANDO                       
      *                  MOVE W000-APLIC    TO MM-WAPLIC                        
      *                  PERFORM 9900-TRANSFIERE                                
      *                  MOVE MM-CODIGO     TO MAPA-ERROR                       
      *----                                                                     
       9900-TRANSFIERE.                                                         
      *----                                                                     
           EVALUATE EIBAID                                                      
           WHEN DFHENTER                                                        
              MOVE 2                   TO MM-WPFK                               
           WHEN DFHPF2                                                          
              MOVE 2                   TO MM-WPFK                               
           WHEN DFHPF3                                                          
              MOVE 3                   TO MM-WPFK                               
           WHEN DFHPF5                                                          
              MOVE 5                   TO MM-WPFK                               
           END-EVALUATE                                                         
           MOVE 0                      TO MM-WCODRET                            
           EXEC CICS                                                            
              LINK                                                              
              PROGRAM          (wsc-ZM9CR432)
              COMMAREA         (MM-LLAMA-MENU)                                  
              LENGTH           (LENGTH OF MM-LLAMA-MENU)                        
              RESP             (W000-RESP)                                      
           END-EXEC                                                             
                                                                                
           IF W000-RESP             NOT = DFHRESP(NORMAL)                       
              INITIALIZE                  AB-REG                                
              MOVE 'ERROR AL EJECUTAR TRANSFERENCIA'                            
                                       TO AB-WMENS1                             
              MOVE wsc-ZM9CR432        TO AB-WMENS2
              PERFORM 9500-VALIDA-CICS                                          
           END-IF                                                               
                                                                                
           IF MM-WCODRET                = ZM-WCODRET                            
              PERFORM 9888-ABORTA-RETURN                                        
           END-IF                                                               
                                                                                
           IF MM-WCODRET                = 0                                     
              MOVE MM-WAPLICN          TO WC-WAPLIC                             
              MOVE MM-WPARAM           TO WC-WPARAM                             
              MOVE MM-WCODTRA          TO WC-WCODIGO                            
              EXEC CICS                                                         
                 START                                                          
                 TRANSID       (MM-WTCICS)                                      
                 TERMID        (EIBTRMID)                                       
                 FROM          (WC-FIJA-CSP)                                    
                 LENGTH        (LENGTH OF WC-FIJA-CSP)                          
                 RESP          (W000-RESP)                                      
              END-EXEC                                                          
                                                                                
              IF W000-RESP          NOT = DFHRESP(NORMAL)                       
                 INITIALIZE               AB-REG                                
                 MOVE 'ERROR AL INICIAR TRANSACCION'                            
                                       TO AB-WMENS1                             
                 MOVE MM-WTCICS        TO AB-WMENS2                             
                 PERFORM 9500-VALIDA-CICS                                       
              END-IF                                                            
                                                                                
              PERFORM 9900-BORRA-QUEUES                                         
                                                                                
              PERFORM 9400-RETURN                                               
                                                                                
           END-IF                                                               
                                                                                
           MOVE MM-WCODRET             TO MM-CODIGO                             
                                          WM-CODIGO.                            
      *----                                                                     
      * ZMWSC009 : BORRAR TODAS LAS QUEUE'S DE UNA FUNCION APLICA-              
      *            TIVA CON PAGINACION PRINCIPALMENTE.                          
      *                                                                         
      *            SI WC-NUM-QUEUES ES MAYOR A CEROS BORRAR QUEUES.             
      *            (NOMBRE DE QUEUE = EIBTRMID                                  
      *                               + W000-PROG(6:3)                          
      *                               + CONSECUTIVO                             
      *                                 DESDE 1 HASTA > WC-QUEUES)              
      *----                                                                     
       9900-BORRA-QUEUES.                                                       
      *----                                                                     
           EXEC CICS                                                            
                IGNORE CONDITION                                                
                QIDERR                                                          
           END-EXEC                                                             
                                                                                
           IF WC-QUEUES                 > 0                                     
              PERFORM VARYING             ZM-IND-Q FROM 1 BY 1                  
                        UNTIL             ZM-IND-Q > WC-QUEUES                  
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
