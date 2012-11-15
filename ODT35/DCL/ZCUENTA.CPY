      ******************************************************************        
      * DCLGEN TABLE(DESARSVP.CUENTA)                                  *        
      *        LIBRARY(SIVA.SIVAC.PARMDCN(DCUENTA))                    *        
      *        QUOTE                                                   *        
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *        
      ******************************************************************        
           EXEC SQL DECLARE CUENTA TABLE                                        
           ( SVIGEN                         CHAR(1) NOT NULL,                   
             ICTAGLO                        DECIMAL(7, 0),                      
             ICUENTA                        DECIMAL(7, 0) NOT NULL,             
             ITIPOCTA                       CHAR(1) NOT NULL,                   
             IPERJUR                        CHAR(2),                            
             IRFC                           CHAR(13),                           
             ITASAFIS                       CHAR(1),                            
             INACIO                         CHAR(2),                            
             IPROM                          DECIMAL(4, 0),                      
             ICCOSTO                        DECIMAL(5, 0) NOT NULL,             
             IUSUARIO                       CHAR(8) NOT NULL,                   
             IPROGRAM                       CHAR(8),                            
             FALTA                          DATE NOT NULL,                      
             FALTAANT                       DATE,                               
             FBAJA                          DATE,                               
             FULTCAMB                       DATE,                               
             FULTMOV                        DATE,                               
             IENVDOC                        DECIMAL(2, 0),                      
             NPROF                          CHAR(5),                            
             NABREV                         CHAR(25),                           
             NOMBRE                         CHAR(20),                           
             NAPELL1                        CHAR(40) NOT NULL,                  
             NAPELL2                        CHAR(20),                           
             DCALLE                         CHAR(25),                           
             DCOLON                         CHAR(25),                           
             DPOBLA                         CHAR(30),                           
             IPOS                           DECIMAL(5, 0),                      
             DESTADO                        CHAR(25),                           
             DCALLEP                        CHAR(25),                           
             DCOLONP                        CHAR(25),                           
             DPOBLAP                        CHAR(30),                           
             IPOSP                          DECIMAL(5, 0),                      
             DESTADOP                       CHAR(25),                           
             ITEL1                          DECIMAL(7, 0),                      
             IEXT1                          DECIMAL(4, 0),                      
             ITEL2                          DECIMAL(7, 0),                      
             IEXT2                          DECIMAL(4, 0),                      
             ICAPTA                         CHAR(1),                            
             IFIRMA                         CHAR(1),                            
             IRUTA                          CHAR(3),                            
             SCOMPNAC                       CHAR(1),                            
             SDOCUM                         CHAR(1),                            
             SLIQUID                        CHAR(1),                            
             SOPER12                        CHAR(1),                            
             PCOMCTA                        DECIMAL(5, 4) NOT NULL,             
             MABOANO                        DECIMAL(15, 2) NOT NULL,            
             MABOMES                        DECIMAL(15, 2) NOT NULL,            
             MCGOANO                        DECIMAL(15, 2) NOT NULL,            
             MCGOMES                        DECIMAL(15, 2) NOT NULL,            
             MCARACT                        DECIMAL(15, 2) NOT NULL,            
             MCARIMES                       DECIMAL(15, 2) NOT NULL,            
             APREFMAR                       DECIMAL(9, 5),                      
             FDEBEDES                       DATE,                               
             XSEG                           CHAR(5),                            
             IEMICHE                        CHAR(1) NOT NULL,                   
             IESTRATO                       CHAR(3) NOT NULL,                   
             ISUCCASA                       CHAR(3) NOT NULL,                   
             IZONECO                        CHAR(3) NOT NULL,                   
             IESTMIG                        CHAR(1) NOT NULL,                   
             STARFIR                        CHAR(1) NOT NULL,                   
             SCONFIR                        CHAR(1) NOT NULL,                   
             SCANDADO                       CHAR(1) NOT NULL,                   
             ISUBCLAS                       CHAR(3) NOT NULL,                   
             PCOMCTA1                       DECIMAL(5, 4) NOT NULL,             
             PCOMCTA2                       DECIMAL(5, 4) NOT NULL,             
             PCOMCTA3                       DECIMAL(5, 4) NOT NULL,             
             PCOMCTA4                       DECIMAL(5, 4) NOT NULL,             
             SIMPRESO                       CHAR(1) NOT NULL,                   
             SACTCON                        CHAR(1) NOT NULL,                   
             SPODERES                       CHAR(1) NOT NULL,                   
             ICANDAD1                       DECIMAL(1, 0) NOT NULL,             
             ICANDAD2                       DECIMAL(1, 0) NOT NULL,             
             ICLACTO                        DECIMAL(1, 0) NOT NULL,             
             INSTENV                        DECIMAL(1, 0) NOT NULL,             
             SREPASAM                       CHAR(1) NOT NULL,                   
             IAPLIDER                       DECIMAL(1, 0) NOT NULL,             
             FSIST                          TIMESTAMP NOT NULL,                 
             ITERM                          CHAR(8) NOT NULL,                   
             IESTCON                        CHAR(3) NOT NULL,                   
             STIPOIN                        CHAR(1) NOT NULL,                   
             CIMPRESO                       DECIMAL(2, 0) NOT NULL,             
             ISERSP                         CHAR(1) NOT NULL,                   
             ICODAREA                       DECIMAL(6, 0) NOT NULL,             
             MLINCRB                        DECIMAL(15, 2) NOT NULL,            
             CEXINDEV                       CHAR(9) NOT NULL,                   
             PCUSTOD                        DECIMAL(5, 4) NOT NULL,             
             IREPRCAS                       DECIMAL(7, 0) NOT NULL,             
             IEMPR                          CHAR(3) NOT NULL                    
           ) END-EXEC.                                                          
      ******************************************************************        
      * COBOL DECLARATION FOR TABLE DESARSVP.CUENTA                    *        
      ******************************************************************        
       01  DCLCUENTA.                                                           
           10 SVIGEN               PIC X(1).                                    
           10 ICTAGLO              PIC S9999999V USAGE COMP-3.                  
           10 ICUENTA              PIC S9999999V USAGE COMP-3.                  
           10 ITIPOCTA             PIC X(1).                                    
           10 IPERJUR              PIC X(2).                                    
           10 IRFC                 PIC X(13).                                   
           10 ITASAFIS             PIC X(1).                                    
           10 INACIO               PIC X(2).                                    
           10 IPROM                PIC S9999V USAGE COMP-3.                     
           10 ICCOSTO              PIC S99999V USAGE COMP-3.                    
           10 IUSUARIO             PIC X(8).                                    
           10 IPROGRAM             PIC X(8).                                    
           10 FALTA                PIC X(10).                                   
           10 FALTAANT             PIC X(10).                                   
           10 FBAJA                PIC X(10).                                   
           10 FULTCAMB             PIC X(10).                                   
           10 FULTMOV              PIC X(10).                                   
           10 IENVDOC              PIC S99V USAGE COMP-3.                       
           10 NPROF                PIC X(5).                                    
           10 NABREV               PIC X(25).                                   
           10 NOMBRE               PIC X(20).                                   
           10 NAPELL1              PIC X(40).                                   
           10 NAPELL2              PIC X(20).                                   
           10 DCALLE               PIC X(25).                                   
           10 DCOLON               PIC X(25).                                   
           10 DPOBLA               PIC X(30).                                   
           10 IPOS                 PIC S99999V USAGE COMP-3.                    
           10 DESTADO              PIC X(25).                                   
           10 DCALLEP              PIC X(25).                                   
           10 DCOLONP              PIC X(25).                                   
           10 DPOBLAP              PIC X(30).                                   
           10 IPOSP                PIC S99999V USAGE COMP-3.                    
           10 DESTADOP             PIC X(25).                                   
           10 ITEL1                PIC S9999999V USAGE COMP-3.                  
           10 IEXT1                PIC S9999V USAGE COMP-3.                     
           10 ITEL2                PIC S9999999V USAGE COMP-3.                  
           10 IEXT2                PIC S9999V USAGE COMP-3.                     
           10 ICAPTA               PIC X(1).                                    
           10 IFIRMA               PIC X(1).                                    
           10 IRUTA                PIC X(3).                                    
           10 SCOMPNAC             PIC X(1).                                    
           10 SDOCUM               PIC X(1).                                    
           10 SLIQUID              PIC X(1).                                    
           10 SOPER12              PIC X(1).                                    
           10 PCOMCTA              PIC S9V9999 USAGE COMP-3.                    
           10 MABOANO              PIC S9999999999999V99 USAGE COMP-3.          
           10 MABOMES              PIC S9999999999999V99 USAGE COMP-3.          
           10 MCGOANO              PIC S9999999999999V99 USAGE COMP-3.          
           10 MCGOMES              PIC S9999999999999V99 USAGE COMP-3.          
           10 MCARACT              PIC S9999999999999V99 USAGE COMP-3.          
           10 MCARIMES             PIC S9999999999999V99 USAGE COMP-3.          
           10 APREFMAR             PIC S9999V99999 USAGE COMP-3.                
           10 FDEBEDES             PIC X(10).                                   
           10 XSEG                 PIC X(5).                                    
           10 IEMICHE              PIC X(1).                                    
           10 IESTRATO             PIC X(3).                                    
           10 ISUCCASA             PIC X(3).                                    
           10 IZONECO              PIC X(3).                                    
           10 IESTMIG              PIC X(1).                                    
           10 STARFIR              PIC X(1).                                    
           10 SCONFIR              PIC X(1).                                    
           10 SCANDADO             PIC X(1).                                    
           10 ISUBCLAS             PIC X(3).                                    
           10 PCOMCTA1             PIC S9V9999 USAGE COMP-3.                    
           10 PCOMCTA2             PIC S9V9999 USAGE COMP-3.                    
           10 PCOMCTA3             PIC S9V9999 USAGE COMP-3.                    
           10 PCOMCTA4             PIC S9V9999 USAGE COMP-3.                    
           10 SIMPRESO             PIC X(1).                                    
           10 SACTCON              PIC X(1).                                    
           10 SPODERES             PIC X(1).                                    
           10 ICANDAD1             PIC S9V USAGE COMP-3.                        
           10 ICANDAD2             PIC S9V USAGE COMP-3.                        
           10 ICLACTO              PIC S9V USAGE COMP-3.                        
           10 INSTENV              PIC S9V USAGE COMP-3.                        
           10 SREPASAM             PIC X(1).                                    
           10 IAPLIDER             PIC S9V USAGE COMP-3.                        
           10 FSIST                PIC X(26).                                   
           10 ITERM                PIC X(8).                                    
           10 IESTCON              PIC X(3).                                    
           10 STIPOIN              PIC X(1).                                    
           10 CIMPRESO             PIC S99V USAGE COMP-3.                       
           10 ISERSP               PIC X(1).                                    
           10 ICODAREA             PIC S999999V USAGE COMP-3.                   
           10 MLINCRB              PIC S9999999999999V99 USAGE COMP-3.          
           10 CEXINDEV             PIC X(9).                                    
           10 PCUSTOD              PIC S9V9999 USAGE COMP-3.                    
           10 IREPRCAS             PIC S9999999V USAGE COMP-3.                  
           10 IEMPR                PIC X(3).                                    
      ******************************************************************        
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 88      *        
      ******************************************************************        
