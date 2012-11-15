      *----                                                                     
      * ZMWSC005 : PROCESOS LOGICOS PARA REVISAR Y ABORTAR POR ERROR            
      *            DE UNA INSTRUCCION DE CICS                                   
      *                                                                         
      * EJEMPLO:         IF EIBRESP NOT = DFHRESP(NORMAL)                       
      *                     INITIALIZE AB-REG                                   
      *                     MOVE 'ERROR EN XXXX' TO AB-WMSG1                    
      *                     MOVE 'YYYY'          TO AB-WMSG2                    
      *                     PERFORM 9500-VALIDA-CICS                            
      *                  END-IF                                                 
      *----                                                                     
       9500-VALIDA-CICS.                                                        
      *----                                                                     
           IF EIBRESP               NOT = DFHRESP(NORMAL)                       
              MOVE W000-PROG           TO AB-WAPLIC                             
              MOVE EIBRESP             TO AB-WCODIGO                            
              MOVE 'EIBRESP'           TO AB-WLLAVE(1)                          
              MOVE 'EIBRESP2'          TO AB-WLLAVE(2)                          
              MOVE 'EIBTRNID'          TO AB-WLLAVE(3)                          
              MOVE 'EIBTRMID'          TO AB-WLLAVE(4)                          
              MOVE 'EIBRSRCE'          TO AB-WLLAVE(5)                          
              MOVE 'EIBFN'             TO AB-WLLAVE(6)                          
              MOVE EIBRESP             TO AB-WCAMPON(1)                         
              MOVE EIBRESP2            TO AB-WCAMPON(2)                         
              MOVE EIBTRNID            TO AB-WCAMPOA(3)                         
              MOVE EIBTRMID            TO AB-WCAMPOA(4)                         
              MOVE EIBRSRCE            TO AB-WCAMPOA(5)                         
              MOVE EIBFN(1:1)          TO WE-COMP-1                             
              MOVE EIBFN(2:1)          TO WE-COMP-2                             
              MOVE WE-COMP             TO AB-WCAMPON(6)                         
              MOVE 'ERROR DE CICS'     TO AB-WMENS3                             
      *                                                                         
              MOVE EIBRESP             TO AB-RES1-ORI                           
              MOVE EIBRESP2            TO AB-RES2-ORI                           
              MOVE EIBERRCD            TO AB-ABEN-ORI                           
              MOVE EIBDS               TO AB-OBJE-ORI                           
              MOVE EIBRSRCE            TO AB-SOUR-ORI                           
              MOVE EIBRCODE            TO AB-RCOD-ORI                           
              MOVE EIBFN               TO AB-FUNC-ORI                           
      *                                                                         
              PERFORM 9800-ABORTA                                               
           END-IF.                                                              
