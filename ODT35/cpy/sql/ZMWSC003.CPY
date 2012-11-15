      *----                                                                     
      * ZMWSC003 : OBTENER USUARIO FIRMADO, FECHA Y HORA DEL SISTEMA            
      *                                                                         
      *----                                                                     
       9300-USER-FECHA-HORA.                                                    
      *----                                                                     
           EXEC CICS ASSIGN                                                     
                USERID(FH-USUARIO)                                              
           END-EXEC                                                             
           EXEC CICS ASKTIME                                                    
                ABSTIME(FH-TIEMPO)                                              
           END-EXEC                                                             
           EXEC CICS FORMATTIME                                                 
                ABSTIME(FH-TIEMPO)                                              
                DDMMYY(FH-FECHA-6)                                              
                TIME(FH-HORA)                                                   
                TIMESEP                                                         
           END-EXEC                                                             
           MOVE 20                     TO FH-SIGLO-10                           
           MOVE FH-DIA-6               TO FH-DIA-10                             
           MOVE FH-MES-6               TO FH-MES-10                             
           MOVE FH-ANO-6               TO FH-ANO-10.                            
      *----                                                                     
