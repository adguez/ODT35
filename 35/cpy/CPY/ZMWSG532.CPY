      *-----------------------------------------------------------------        
      *    ZMWSG532                    REGISTRO CON VARIABLES DE ERROR          
      *                                NECESARIAS PARA LLAMAR A LA              
      *                                RUTINA ZM2OG532.                         
      *                                                                         
      *    REFERENCIAS                 ZMWSC005                                 
      *                                ZMWSC006                                 
      *                                ZMWSC007                                 
      *                                ZMWSC008                                 
      *----                                                                     
        02 AB-REG.                                                              
           05 AB-WAPLIC                PIC X(08).                               
           05 AB-WPROCESO              PIC X(30).                               
           05 AB-WCODIGO               PIC 9(9)+.                               
           05 AB-WCAMPO                OCCURS 6.                                
              10 AB-WLLAVE             PIC X(08).                               
              10 AB-WCAMPOA.                                                    
                 15 AB-WCAMPON         PIC 9(18).                               
                 15 FILLER             PIC X(22).                               
           05 AB-WMENS1                PIC X(70).                               
           05 AB-WMENS2                PIC X(70).                               
           05 AB-WMENS3                PIC X(70).                               
           05 AB-AUX.                                                           
              10 AB-AUX-WMEN.                                                   
                 15 AB-AUX-MEN1        PIC X(15).                               
                 15 AB-AUX-WRN1        PIC X(01).                               
                 15 AB-AUX-FILL1       PIC X(10).                               
                 15 AB-AUX-MEN6        PIC X(15).                               
                 15 AB-AUX-WRN6        PIC X(01).                               
                 15 AB-AUX-FILL6       PIC X(28).                               
              10 AB-AUX-ROWS.                                                   
                 15 AB-AUX-ROWN        PIC 9(18).                               
                 15 AB-AUX-RWFILL      PIC X(02).                               
                 15 AB-AUX-ROWM        PIC X(20).                               
           05 AB-ESTADO                PIC X(01).                               
           05 AB-EMPRESA               PIC X(50).                               
      *                                                                         
           05 AB-LOG.                                                           
              10 AB-LOG-NUM.                                                    
                 15 AB-TASK-ORI        PIC S9(9) COMP.                          
                 15 AB-RES1-ORI        PIC S9(9) COMP.                          
                 15 AB-RES2-ORI        PIC S9(9) COMP.                          
              10 AB-LOG-ALFA.                                                   
                 15 AB-TRAN-ORI        PIC X(4).                                
                 15 AB-ABEN-ORI        PIC X(4).                                
                 15 AB-OBJE-ORI        PIC X(8).                                
                 15 AB-SOUR-ORI        PIC X(8).                                
                 15 AB-RCOD-ORI        PIC X(6).                                
                 15 AB-FUNC-ORI        PIC X(2).                                
      *                                                                         
      *-----------------------------------------------------------------        
