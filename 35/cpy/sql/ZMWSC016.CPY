      *----------------------------------------------------------------         
      *  ZMWSC017: VARIABLES PARA ESTA RUTINA                                   
      *  ZMWSC016: RUTINA 9350 PARA VALIDAR Y FORMATEAR DATOS NUMERICOS         
      *----------------------------------------------------------------         
      *  VARIABLES DE ENTRADA:                                                  
      *                                                                         
      *     W9350-IMP-ALFA  (CADENA DE 25 CARACTERES)                           
      *                     (SE PUEDE INCLUIR SIGNO NEGATIVO AL FINAL)          
      *     W9350-ENTEROS   (DE 0 A 18. SI ES CERO, ACEPTARA HASTA              
      *                      18 - LOS DECIMALES).                               
      *     W9350-DECIMALES (CANTIDAD DE DECIMALES. DE 0 A 17).                 
      *     W9350-REDONDEO  (' ' = ESPACIO. ASUME EXACTO.             )         
      *                     ('E' = EXACTO. NO PERMITE EXCEDER DECIM.  )         
      *                     ('T' = TRUNCA DECIMALES EXCEDENTES        )         
      *                     ('R' = REDONDEA HASTA EL DECIMAL PERMITIDO)         
      *                     SI EL NUMERO DE DECIMALES DIGITADOS ES              
      *                     MENOR AL INDICADO EN W9350-DECIMALES,               
      *                     RELLENARA EL FALTANTE CON CEROS.                    
      *----------------------------------------------------------------         
      *  VARIABLES DE SALIDA:                                                   
      *                                                                         
      *     W9350-IMP-00DEC Y SUS REDEFINICIONES PARA DIFERENTES                
      *                     CANTIDADES DE DECIMALES.                            
      *     W9350-SIGNO     EL SIGNO DEL IMPORTE                                
      *                     (ESPACIO = POSITIVO)                                
      *                     ('+' =  POSITIVO)                                   
      *                     ('-' =  NEGATIVO)                                   
      *     W9350-CODIGO    CODIGO DE ERROR (NO HABILITADO TODAVIA)             
      *     W9350-MSGERROR  MENSAJE DE ERROR.                                   
      *                                                                         
      *----------------------------------------------------------------         
      *  CRITERIOS DE VALIDACION:                                               
      *                                                                         
      *     1. SE MANEJARAN CANTIDADES DE HASTA UN MAXIMO DE 18 DIGITOS         
      *     2. LA SUMA DE LOS ENTEROS Y LOS DECIMALES NO PODRA EXCEDER          
      *        LOS 18 DIGITOS.                                                  
      *     3. SE PODRAN VALIDAR DATOS NEGATIVOS. PARA ELLO EL SIGNO            
      *        DEBERA SER DIGITADO AL FINAL DE LA CANTIDAD.                     
      *        EJEMPLO:  123.00-                                                
      *     4. SI SE DESEA EVITAR EL USO DE CANTIDADES NEGATIVAS,               
      *        SE PODRA PREGUNTAR POR EL VALOR DE W9350-SIGNO                   
      *     5. SI SE DIGITAN MENOS DECIMALES DE LOS PERMITIDOS EN               
      *        W9350-DECIMALES, SE RELLENARAN LOS FALTANTES CON CEROS.          
      *     6. NO SE ACEPTARAN CARACTERES DIFERENTES A NUMEROS,                 
      *        COMAS, PUNTO, SIGNO, Y ESPACIOS INTERMEDIOS.                     
      *     7. SI HAY ERROR DEBIDO A QUE LA CANTIDAD ESTA FUERA DEL             
      *        RANGO DE LOS PARAMETROS DADOS, ENVIARA EL MENSAJE                
      *        DE ERROR CORRESPONDIENTE EN W9350-MSGERROR.                      
      *----------------------------------------------------------------         
      *  UTILIZACION:                                                           
      *                                                                         
      *  EN LA WORKING STORAGE PONER EL COPY DE LA RUTINA:                      
      *                                                                         
      *      COPY ZMWSC017.                                                     
      *                                                                         
      *  EN LA PROCEDURE DIVISION:                                              
      *                                                                         
      *      MOVE M1CANT                 TO W9350-IMP-ALFA                      
      *      MOVE 05                     TO W9350-ENTEROS                       
      *      MOVE 07                     TO W9350-DECIMALES                     
      *      MOVE 'E'                    TO W9350-REDONDEO                      
      *      PERFORM 9350-VALIDA-CANTIDAD                                       
      *      IF NOT W9350-MSGERROR = SPACES                                     
      *         MOVE 9350-CODIGO  TO WM-CODIGO                                  
      *         PERFORM 8500-RECICLA-PANTALLA                                   
      *      END-IF                                                             
      *      MOVE W9350-IMP-07DEC TO W-CANTIDAD                                 
      *      ...ETC.                                                            
      *----------------------------------------------------------------         
       9350-VALIDA-CANTIDAD.                                                    
      *----------------------------------------------------------------         
           MOVE SPACES TO W9350-SIGNO                                           
                          W9350-MSGERROR                                        
                          W9350-DI                                              
                          W9350-PUNTO                                           
                          W9350-COMA                                            
           MOVE ZEROS  TO W9350-IMPOR                                           
           MOVE 'X'    TO W9350-ESPACIO                                         
                                                                                
           IF W9350-DECIMALES > 17                                              
              MOVE 'SOLO SE ACEPTAN HASTA 17 DECIMALES'                         
                   TO W9350-MSGERROR                                            
              MOVE 17 TO W9350-DECIMALES                                        
              MOVE 1  TO W9350-ENTEROS                                          
           END-IF                                                               
                                                                                
           IF W9350-ENTEROS > 18                                                
              MOVE 'SOLO SE ACEPTAN HASTA 18 ENTEROS'                           
                   TO W9350-MSGERROR                                            
              MOVE 18 TO W9350-ENTEROS                                          
              MOVE 0  TO W9350-DECIMALES                                        
           END-IF                                                               
                                                                                
           IF (W9350-ENTEROS + W9350-DECIMALES) > 18                            
              MOVE 'SOLO SE ACEPTAN HASTA 18 DIGITOS'                           
                   TO W9350-MSGERROR                                            
              COMPUTE W9350-DECIMALES = 18 - W9350-ENTEROS                      
           END-IF                                                               
                                                                                
           IF NOT W9350-OPCRED-VALID                                            
              MOVE 'ERROR EN OPCION DE REDONDEO'                                
                   TO W9350-MSGERROR                                            
              MOVE ' '  TO  W9350-REDONDEO                                      
           END-IF                                                               
                                                                                
           COMPUTE W9350-J = 18 - W9350-DECIMALES                               
           IF W9350-ENTEROS = 0                                                 
              MOVE W9350-J TO W9350-ENTEROS                                     
           END-IF                                                               
           MOVE W9350-ENTEROS  TO W9350-ENTEROSN                                
           MOVE W9350-DECIMALES  TO W9350-DECIMALESN                            
           INSPECT W9350-IMP-ALFA REPLACING                                     
                   LEADING '0' BY ' '                                           
                   LEADING ',' BY ' '                                           
                   ALL     LOW-VALUES BY SPACES                                 
                                                                                
           PERFORM VARYING W9350-I FROM 1 BY 1                                  
                   UNTIL W9350-I > 25                                           
              IF W9350-ES-VALIDO (W9350-I)                                      
                 IF W9350-ES-NUMERO (W9350-I)                                   
                    IF W9350-HAY-PUNTO                                          
                       IF W9350-J = 18                                          
                          IF W9350-EXACTO                                       
                             MOVE 'SOLO SE ACEPTAN XX DECIMALES'                
                                  TO W9350-MSGERROR                             
                             MOVE W9350-DECIMALESX                              
                                  TO W9350-MSGERROR(17:2)                       
                          END-IF                                                
                          IF W9350-REDONDEAR                                    
                             IF W9350-DIG (W9350-I) > '4'                       
                                ADD 1 TO W9350-IMPORN                           
                             END-IF                                             
                          END-IF                                                
                       ELSE                                                     
                          ADD 1 TO W9350-J                                      
                          MOVE W9350-DIG (W9350-I)                              
                               TO W9350-DIGI (W9350-J)                          
                       END-IF                                                   
                    ELSE                                                        
                       MOVE W9350-I  TO  W9350-K                                
                    END-IF                                                      
                    IF W9350-HAY-SIGNO                                          
                       MOVE 'ERROR EN POSICION DE SIGNO'                        
                            TO W9350-MSGERROR                                   
                    END-IF                                                      
                    IF W9350-HAY-NUMERO                                         
                    AND W9350-HAY-ESPACIO                                       
                       MOVE 'ERROR. HAY ESPACIOS INTERMEDIOS'                   
                            TO W9350-MSGERROR                                   
                    END-IF                                                      
                    MOVE W9350-DIG (W9350-I) TO W9350-DI                        
                 END-IF                                                         
                 IF W9350-ES-SIGNO (W9350-I)                                    
                    IF W9350-HAY-SIGNO                                          
                    OR W9350-HAY-ESPACIO                                        
                       MOVE 'ERROR EN POSICION DEL SIGNO'                       
                            TO W9350-MSGERROR                                   
                    END-IF                                                      
                    MOVE W9350-DIG (W9350-I) TO W9350-SIGNO                     
                 END-IF                                                         
                 IF W9350-ES-COMA (W9350-I)                                     
                    COMPUTE W9350-L = W9350-I - 4                               
                    IF W9350-HAY-COMA                                           
                       IF NOT W9350-ES-COMA (W9350-L)                           
                          MOVE 'ERROR EN POSICION DE LAS COMAS'                 
                               TO W9350-MSGERROR                                
                       END-IF                                                   
                    END-IF                                                      
                    IF W9350-HAY-PUNTO                                          
                    OR W9350-HAY-ESPACIO                                        
                       MOVE 'ERROR EN POSICION DE LAS COMAS'                    
                            TO W9350-MSGERROR                                   
                    END-IF                                                      
                    MOVE W9350-DIG (W9350-I) TO W9350-COMA                      
                 END-IF                                                         
                 IF W9350-ES-PUNTO (W9350-I)                                    
                    COMPUTE W9350-L = W9350-I - 4                               
                    IF W9350-HAY-COMA                                           
                       IF NOT W9350-ES-COMA (W9350-L)                           
                          MOVE 'ERROR EN POSICION DE LAS COMAS'                 
                               TO W9350-MSGERROR                                
                       END-IF                                                   
                    END-IF                                                      
                    IF W9350-HAY-PUNTO                                          
                    OR W9350-HAY-ESPACIO                                        
                    OR W9350-HAY-SIGNO                                          
                       MOVE 'ERROR EN POSICION DEL PUNTO'                       
                            TO W9350-MSGERROR                                   
                    END-IF                                                      
                    IF NOT W9350-HAY-PUNTO                                      
                       MOVE W9350-DIG (W9350-I) TO W9350-PUNTO                  
                       COMPUTE W9350-K = W9350-I - 1                            
                    END-IF                                                      
                 END-IF                                                         
                 IF W9350-ES-ESPACIO (W9350-I)                                  
                    IF W9350-HAY-SIGNO                                          
                    OR W9350-HAY-PUNTO                                          
                    OR W9350-HAY-NUMERO                                         
                       MOVE SPACES TO W9350-ESPACIO                             
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
                 MOVE 'CARACTERES INVALIDOS EN EL CAMPO'                        
                      TO W9350-MSGERROR                                         
              END-IF                                                            
           END-PERFORM                                                          
                                                                                
           COMPUTE W9350-J = 19 - W9350-DECIMALES                               
           MOVE 0       TO W9350-L                                              
           PERFORM VARYING W9350-I FROM W9350-K BY -1                           
                   UNTIL W9350-I < 1                                            
              IF W9350-ES-NUMERO (W9350-I)                                      
                 IF W9350-J = 1                                                 
                    MOVE 'EXCEDE CANTIDAD DE ENTEROS PERMITIDOS'                
                         TO W9350-MSGERROR                                      
                 ELSE                                                           
                    ADD 1 TO W9350-L                                            
                    SUBTRACT 1 FROM W9350-J                                     
                    MOVE  W9350-DIG (W9350-I)                                   
                          TO W9350-DIGI (W9350-J)                               
                    IF W9350-L > W9350-ENTEROS                                  
                       MOVE 'SOLO SE ACEPTAN XX ENTEROS'                        
                            TO W9350-MSGERROR                                   
                       MOVE W9350-ENTEROSN TO W9350-MSGERROR(17:2)              
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM                                                          
                                                                                
           IF W9350-SIGNO = '-'                                                 
              COMPUTE W9350-IMP-00DEC = W9350-IMPORN * -1                       
           ELSE                                                                 
              COMPUTE W9350-IMP-00DEC = W9350-IMPORN * +1                       
           END-IF.                                                              
                                                                                
