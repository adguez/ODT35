      *----                                                                     
      * ZMWSC006 : PROCESOS LOGICOS PARA REVISAR Y ABORTAR POR ERROR            
      *            POR CODIGOS DE SQL DIFERENTES DE 0 O +100                    
      *                                                                         
      *----                                                                     
       9600-VALIDA-SQL.                                                         
      *----                                                                     
           IF SQLCODE               EQUAL 0 OR +100                             
                                                                                
              CONTINUE                                                          
                                                                                
           ELSE                                                                 
                                                                                
              MOVE SQLCODE             TO AB-WCODIGO                            
              MOVE SQLERRMC            TO AB-WMENS2                             
              MOVE ' '                 TO AB-WMENS3                             
              MOVE ' '                 TO AB-WCAMPO(6)                          
              MOVE ' '                 TO AB-AUX-WMEN                           
                                                                                
      *       - NO. DE RENGLONES                                                
              MOVE SQLWARN3            TO AB-AUX-ROWN                           
              IF AB-AUX-ROWN        NOT = ZEROS                                 
                 MOVE 'RENGLONES PROCESADOS'                                    
                                       TO AB-AUX-ROWM                           
                 MOVE AB-AUX-ROWS      TO AB-WCAMPOA(6)                         
              END-IF                                                            
                                                                                
      *       - TRUNCAMIENTO                                                    
              MOVE SQLWARN1            TO AB-AUX-WRN1                           
              IF AB-AUX-WRN1        NOT = SPACE                                 
                MOVE 'TRUNCAMIENTO = ' TO AB-AUX-MEN1                           
              END-IF                                                            
                                                                                
      *       - ERROR SEVERO                                                    
              MOVE SQLWARN6            TO AB-AUX-WRN6                           
              IF AB-AUX-WRN6        NOT = SPACE                                 
                MOVE 'ERROR SEVERO = ' TO AB-AUX-MEN6                           
              END-IF                                                            
                                                                                
              MOVE AB-AUX-WMEN         TO AB-WMENS3                             
              MOVE '0'                 TO AB-ESTADO                             
                                                                                
      *                                                                         
              INITIALIZE AB-LOG                                                 
      *                                                                         
                                                                                
              PERFORM 9800-ABORTA                                               
                                                                                
           END-IF.                                                              
      *----                                                                     
