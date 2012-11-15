      *****************************************************************         
      *                  COPY: ZMWSC015                               *         
      *****************************************************************         
      *                                                               *         
      *   ESTE COPY SE USA EN PAREJA CON EL COPY: ZMWSC014            *         
      *                                                               *         
      *   ESTOS COPYS SIRVEN PARA ALINEAR UN STRING A LA IZQUIERDA O  *         
      *   A LA DERECHA                                                *         
      *                                                               *         
      *         ELABORADO POR: ING ENRIQUE FERNANDEZ CHAPOU (AZERTIA) *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *  EJEMPLO: UN CAMPO A ALINEAR DE 25 CARAC. DE LONGITUD         *         
      *                                                               *         
      *01  WS-CAMPO-A-ALINEAR           PIC  X(25)  VALUE SPACES.     *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    PARA ALINEAR A LA IZQUIERDA LLAMAR A:                      *         
      *                                PERFORM 9886-ALINEA-STRING-IZQ *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    MOVE WS-CAMPO-A-ALINEAR           TO WS-STRING-ENTRADA     *         
      *    MOVE 25                           TO WS-LONG-STRING        *         
      *    PERFORM 9886-ALINEA-STRING-IZQ.                            *         
      *    MOVE WS-STRING-SALIDA             TO WS-CAMPO-A-ALINEAR.   *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    PARA ALINEAR A LA DERECHA LLAMAR A:                        *         
      *                                PERFORM 9887-ALINEA-STRING-DER *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    MOVE WS-CAMPO-A-ALINEAR           TO WS-STRING-ENTRADA     *         
      *    MOVE 25                           TO WS-LONG-STRING        *         
      *    PERFORM 9887-ALINEA-STRING-DER.                            *         
      *    MOVE WS-STRING-SALIDA             TO WS-CAMPO-A-ALINEAR.   *         
      *                                                               *         
      *****************************************************************         
                                                                                
      *                                                                         
      *****************************************************************         
      *         ALINEA A LA IZQUIERDA UN STRING DE CARACTERES         *         
      *****************************************************************         
       9886-ALINEA-STRING-IZQ.                                                  
           INSPECT WS-STRING-ENTRADA                                            
                   REPLACING ALL LOW-VALUES BY SPACES                           
                                                                                
           MOVE 1                       TO WS-IND1.                             
           MOVE 1                       TO WS-IND2.                             
           MOVE SPACES                  TO WS-STRING-SALIDA.                    
           PERFORM UNTIL ( WS-LETRA-ORIGEN(WS-IND1) NOT = ' ') OR               
                         ( WS-IND1          = WS-LONG-STRING )                  
              ADD 1                     TO WS-IND1                              
           END-PERFORM.                                                         
                                                                                
           PERFORM UNTIL ( WS-IND1 > WS-LONG-STRING ) OR                        
                         ( WS-IND2 > WS-LONG-STRING )                           
              MOVE WS-LETRA-ORIGEN(WS-IND1)                                     
                                        TO WS-LETRA-DESTINO(WS-IND2)            
              ADD 1                     TO WS-IND1                              
              ADD 1                     TO WS-IND2                              
           END-PERFORM.                                                         
       9886-FIN.                                                                
           EXIT.                                                                
                                                                                
      *                                                                         
      *****************************************************************         
      *          ALINEA A LA DERECHA UN STRING DE CARACTERES          *         
      *****************************************************************         
       9887-ALINEA-STRING-DER.                                                  
           INSPECT WS-STRING-ENTRADA                                            
                   REPLACING ALL LOW-VALUES BY SPACES                           
                                                                                
           MOVE WS-LONG-STRING          TO WS-IND1.                             
           MOVE WS-LONG-STRING          TO WS-IND2.                             
           MOVE SPACES                  TO WS-STRING-SALIDA.                    
           PERFORM UNTIL ( WS-LETRA-ORIGEN(WS-IND1) NOT = ' ') OR               
                         ( WS-IND1                      = 01 )                  
              SUBTRACT 1              FROM WS-IND1                              
           END-PERFORM.                                                         
                                                                                
           PERFORM UNTIL ( WS-IND1 < 01 ) OR                                    
                         ( WS-IND2 < 01 )                                       
              MOVE WS-LETRA-ORIGEN(WS-IND1)                                     
                                        TO WS-LETRA-DESTINO(WS-IND2)            
              SUBTRACT 1              FROM WS-IND1                              
              SUBTRACT 1              FROM WS-IND2                              
           END-PERFORM.                                                         
       9887-FIN.                                                                
           EXIT.                                                                
      *                                                                         
      *****************************************************************         
      *                  FIN DE COPY: ZMWSC015                        *         
      *****************************************************************         
