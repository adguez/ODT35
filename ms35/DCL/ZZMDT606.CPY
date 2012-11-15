      ******************************************************************        
      * DCLGEN TABLE(PRODUSVP.ZMDT606)                                 *        
      *        LIBRARY(ZIVA.DCLGEN(ZZMDT606))                          *        
      *        ACTION(REPLACE)                                         *        
      *        LANGUAGE(COBOL)                                         *        
      *        QUOTE                                                   *        
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *        
      ******************************************************************        
           EXEC SQL DECLARE PRODUSVP.ZMDT606 TABLE                              
           ( ZM606_IEMPR                    CHAR(3) NOT NULL,                   
             ZM606_ICUENTA                  DECIMAL(7, 0) NOT NULL,             
             ZM606_ICONCEPT                 DECIMAL(5, 0) NOT NULL,             
             ZM606_IEMISORA                 CHAR(7) NOT NULL,                   
             ZM606_ISERIE                   CHAR(8) NOT NULL,                   
             ZM606_IEMICOL                  DECIMAL(5, 0) NOT NULL,             
             ZM606_SVIGEN                   CHAR(1) NOT NULL,                   
             ZM606_IND_CARTAS               CHAR(10) NOT NULL,                  
             ZM606_PROMOT                   DECIMAL(4, 0) NOT NULL,             
             ZM606_GRUPO                    DECIMAL(1, 0) NOT NULL,             
             ZM606_INSTRUMENTO              CHAR(8) NOT NULL,                   
             ZM606_FCANC                    TIMESTAMP NOT NULL,                 
             ZM606_IUSUARIO                 CHAR(8) NOT NULL,                   
             ZM606_IPROGRAM                 CHAR(8) NOT NULL,                   
             ZM606_ITERM                    CHAR(8) NOT NULL,                   
             ZM606_FREG                     TIMESTAMP NOT NULL                  
           ) END-EXEC.                                                          
      ******************************************************************        
      * COBOL DECLARATION FOR TABLE PRODUSVP.ZMDT606                   *        
      ******************************************************************        
       01  DCLZMDT606.                                                          
           10 ZM606-IEMPR          PIC X(3).                                    
           10 ZM606-ICUENTA        PIC S9(7)V USAGE COMP-3.                     
           10 ZM606-ICONCEPT       PIC S9(5)V USAGE COMP-3.                     
           10 ZM606-IEMISORA       PIC X(7).                                    
           10 ZM606-ISERIE         PIC X(8).                                    
           10 ZM606-IEMICOL        PIC S9(5)V USAGE COMP-3.                     
           10 ZM606-SVIGEN         PIC X(1).                                    
           10 ZM606-IND-CARTAS     PIC X(10).                                   
           10 ZM606-PROMOT         PIC S9(4)V USAGE COMP-3.                     
           10 ZM606-GRUPO          PIC S9(1)V USAGE COMP-3.                     
           10 ZM606-INSTRUMENTO    PIC X(8).                                    
           10 ZM606-FCANC          PIC X(26).                                   
           10 ZM606-IUSUARIO       PIC X(8).                                    
           10 ZM606-IPROGRAM       PIC X(8).                                    
           10 ZM606-ITERM          PIC X(8).                                    
           10 ZM606-FREG           PIC X(26).                                   
      ******************************************************************        
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 16      *        
      ******************************************************************        
