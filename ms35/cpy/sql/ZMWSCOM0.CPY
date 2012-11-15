      *----                                                                     
      * ZMWSCOM0 : PROCESO LOGICO DE INICIO DE UNA FUNCION EN CICS.             
      *            UNA APLICACION PUEDE SER CORRER EN TRES FORMAS:              
      *                - START CON DATOS (USA RETRIEVE)                         
      *                - START SIN DATOS (INICIALIZAR OPCION SIVA)              
      *                - REINICIAR FUNCION (EIBTRNID-MOVER DFHCOMMAREA)         
      *                                                                         
      *----                                                                     
       9000-INICIO.                                                             
      *----                                                                     
           IF LENGTH OF WC-COMMAREA     > LENGTH OF DFHCOMMAREA                 
              INITIALIZE                  AB-REG                                
              MOVE W000-PROG           TO AB-WAPLIC                             
              MOVE 999                 TO AB-WCODIGO                            
              MOVE '9000-INICIO'       TO AB-WPROCESO                           
              MOVE 'WC-COMMAREA:'      TO AB-WLLAVE(1)                          
              MOVE 'DFHCOMMAREA:'      TO AB-WLLAVE(2)                          
              MOVE LENGTH OF WC-COMMAREA                                        
                                       TO AB-WCAMPON(1)                         
              MOVE LENGTH OF DFHCOMMAREA                                        
                                       TO AB-WCAMPON(2)                         
              MOVE 'LONGITUD DE WC-COMMAREA > LONGITUD DE DFHCOMMAREA'          
                                       TO AB-WMENS1                             
              MOVE 'ERROR EN EL PROGRAMA. INCREMENTE LA DFHCOMMAREA'            
                                       TO AB-WMENS2                             
              PERFORM 9800-ABORTA                                               
           END-IF                                                               
                                                                                
           INITIALIZE                     AB-REG                                
                                                                                
           IF EIBCALEN              EQUAL ZEROES                                
              INITIALIZE                  WC-COMMAREA                           
              PERFORM 9000-NOMBRE-EMPRESA                                       
              MOVE L000-TEXTO          TO WC-EMPRESA                            
              MOVE W000-PROG(5:4)      TO WC-PGMID(1:4)                         
              MOVE W000-OPC            TO WC-PGMID(6:3)                         
              MOVE NC-IEMPR            TO WC-IEMPR                              
              MOVE NC-SALCANCE         TO WC-SALCANCE                           
              MOVE NC-ICTASIS          TO WC-ICTASIS                            
              MOVE NC-ISUCMTZ          TO WC-ISUCMTZ                            
              MOVE NC-IIDEBMV          TO WC-IIDEBMV                            
              MOVE NC-ICCOSTO          TO WC-ICCOSTO                            
              MOVE NC-IPROM            TO WC-IPROM                              
              MOVE NC-IPERFIL          TO WC-IPERFIL                            
              MOVE NC-ISUCCASA         TO WC-ISUCCASA                           
                                                                                
              PERFORM 9100-OBTENER-FECHAS-VXT                                   
              MOVE WX-TFECHOY          TO WC-TFECHOY                            
              MOVE WX-TFECVN           TO WC-TFECVN                             
              MOVE WX-TDIASVN          TO WC-TDIASVN                            
              MOVE WX-TFEC48           TO WC-TFEC48                             
              MOVE WX-TDIAS48          TO WC-TDIAS48                            
              MOVE WX-TFEC72           TO WC-TFEC72                             
              MOVE WX-TDIAS72          TO WC-TDIAS72                            
              MOVE WX-TFEC96           TO WC-TFEC96                             
              MOVE WX-TDIAS96          TO WC-TDIAS96                            
                                                                                
              EXEC CICS                                                         
                   ASSIGN                                                       
                   STARTCODE              (WR-STARTCODE)                        
              END-EXEC                                                          
                                                                                
              IF WR-STARTCODE       EQUAL WR-STARTCODE-SD                       
                                                                                
                 MOVE LENGTH OF WC-FIJA-CSP                                     
                                       TO WI-LENGTH                             
                 EXEC CICS                                                      
                      RETRIEVE                                                  
                      INTO    (WC-FIJA-CSP)                                     
                      LENGTH  (LENGTH  OF WC-FIJA-CSP)                          
                      RESP    (W000-RESP)                                       
                 END-EXEC                                                       
                                                                                
                 IF  W000-RESP          = DFHRESP(NORMAL)                       
                 OR (W000-RESP          = DFHRESP(LENGERR)                      
                 AND WI-LENGTH         >= LENGTH OF WC-FIJA-CSP)                
                    MOVE WC-WAPLIC     TO W000-OPC                              
                 ELSE                                                           
                    MOVE W000-OPC      TO WC-WAPLIC                             
                 END-IF                                                         
                                                                                
              ELSE                                                              
                 MOVE W000-OPC         TO WC-WAPLIC                             
              END-IF                                                            
              MOVE W000-OPC            TO WC-PGMID(6:3)                         
                                                                                
           ELSE                                                                 
                                                                                
              MOVE L000-COMMAREA       TO WC-COMMAREA                           
                                                                                
           END-IF.                                                              
                                                                                
      *----                                                                     
       9000-REINICIO.                                                           
      *----                                                                     
           EXEC CICS                                                            
              RETURN                                                            
                 TRANSID  (EIBTRNID)                                            
                 COMMAREA (WC-COMMAREA)                                         
                 LENGTH   (LENGTH OF WC-COMMAREA)                               
           END-EXEC.                                                            
      *----                                                                     
      *            OBTENER EL NOMBRE DE LA EMPRESA DEL USUARIO/PROMOTOR         
      *            FIRMADO - ESQUEMA MULTIMEPRESA.                              
      *                                                                         
      *----                                                                     
       9000-NOMBRE-EMPRESA.                                                     
      *----                                                                     
           EXEC CICS                                                            
                LINK PROGRAM             (wsc-ZM9CR403)
                     COMMAREA            (NC-NOMBRE-PARM)                       
                     LENGTH   (LENGTH  OF NC-NOMBRE-PARM)                       
                     RESP                (W000-RESP)                            
           END-EXEC                                                             
                                                                                
           PERFORM 9500-VALIDA-CICS                                             
                                                                                
           IF NC-WCODRET                = ZM-WCODRET                            
              PERFORM 9888-ABORTA-RETURN                                        
           END-IF                                                               
                                                                                
           MOVE 50                     TO L000-LONG                             
           MOVE NC-T01NOMBR            TO L000-TEXTO                            
                                                                                
           EXEC CICS                                                            
               LINK PROGRAM              (wsc-ZM8CR009)
                    COMMAREA             (L000-PARAM)                           
                    LENGTH   (LENGTH   OF L000-PARAM)                           
                    RESP                 (W000-RESP)                            
           END-EXEC                                                             
                                                                                
           PERFORM 9500-VALIDA-CICS.                                            
      *----                                                                     
