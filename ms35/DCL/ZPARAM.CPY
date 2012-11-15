      ******************************************************************        
      * DCLGEN TABLE(PRODUSVP.PARAM)                                   *        
      *        LIBRARY(SIVA.PARMDCN(DPARAM))                           *        
      *        QUOTE                                                   *        
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *        
      ******************************************************************        
           EXEC SQL DECLARE PARAM TABLE                                         
           ( ITIPOPAR                       CHAR(3) NOT NULL,                   
             IPARAM                         CHAR(19) NOT NULL,                  
             DATOSPAR                       CHAR(58) NOT NULL                   
           ) END-EXEC.                                                          
      ******************************************************************        
      * COBOL DECLARATION FOR TABLE PRODUSVP.PARAM                     *        
      ******************************************************************        
       01  DCLPARAM.                                                            
           10 ITIPOPAR             PIC X(3).                                    
           10 IPARAM               PIC X(19).                                   
           10 DATOSPAR             PIC X(58).                                   
      ******************************************************************        
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 3       *        
      ******************************************************************        
