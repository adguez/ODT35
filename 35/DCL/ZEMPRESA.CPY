      ******************************************************************        
      * DCLGEN TABLE(DESARSVP.EMPRESA)                                 *        
      *        LIBRARY(IDCEX10.PO.DCLGEN(DEMPRESA))                    *        
      *        LANGUAGE(COBOL)                                         *        
      *        QUOTE                                                   *        
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *        
      ******************************************************************        
           EXEC SQL DECLARE EMPRESA TABLE                                       
           ( IEMPR                          CHAR(3) NOT NULL,                   
             NEMPR                          CHAR(50) NOT NULL,                  
             NEMPRCOR                       CHAR(10) NOT NULL,                  
             DCALLE                         CHAR(25) NOT NULL,                  
             DCOLON                         CHAR(25) NOT NULL,                  
             DPOBLA                         CHAR(30) NOT NULL,                  
             IPOS                           DECIMAL(5, 0) NOT NULL,             
             DESTADO                        CHAR(25) NOT NULL,                  
             ITEL1                          DECIMAL(7, 0) NOT NULL,             
             IEXT1                          DECIMAL(4, 0) NOT NULL,             
             ITEL2                          DECIMAL(7, 0) NOT NULL,             
             IEXT2                          DECIMAL(4, 0) NOT NULL,             
             ISUCMTZ                        CHAR(3) NOT NULL,                   
             IIDEBMV                        CHAR(5) NOT NULL                    
           ) END-EXEC.                                                          
      ******************************************************************        
      * COBOL DECLARATION FOR TABLE DESARSVP.EMPRESA                   *        
      ******************************************************************        
       01  DCLEMPRESA.                                                          
           10 IEMPR                PIC X(3).                                    
           10 NEMPR                PIC X(50).                                   
           10 NEMPRCOR             PIC X(10).                                   
           10 DCALLE               PIC X(25).                                   
           10 DCOLON               PIC X(25).                                   
           10 DPOBLA               PIC X(30).                                   
           10 IPOS                 PIC S9(5)V USAGE COMP-3.                     
           10 DESTADO              PIC X(25).                                   
           10 ITEL1                PIC S9(7)V USAGE COMP-3.                     
           10 IEXT1                PIC S9(4)V USAGE COMP-3.                     
           10 ITEL2                PIC S9(7)V USAGE COMP-3.                     
           10 IEXT2                PIC S9(4)V USAGE COMP-3.                     
           10 ISUCMTZ              PIC X(3).                                    
           10 IIDEBMV              PIC X(5).                                    
      ******************************************************************        
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 14      *        
      ******************************************************************        
