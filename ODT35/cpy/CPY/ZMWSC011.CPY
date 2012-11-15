      *----                                                                     
      * ZMWSC011 : VARIABLES PARA OBTENER LA VXT001                             
      *            OBTIENE FECHAS VALOR HOY,NORMAL, 24, 48, 72 Y 96 HRS.        
      *                                                                         
      * EJEMPLO  : PERFORM A 9300-OBTENER-FECHAS-VXT                            
      *            MOVE WX-TFECHOY   TO FEVENTO  OF DCLCTLPROC                  
      *-----------------------------------------------------------              
       01  WX-ITEM-1                   PIC S9(04) COMP  VALUE 0.                
      *                                                                         
       01  WX-REG.                                                              
           05 WX-TESTATUS                   PIC X(01).                          
           05 WX-TFECHOY                    PIC X(10).                          
           05 WX-TFECVN                     PIC X(10).                          
           05 WX-TDIASVN                    PIC 9(09)  COMP.                    
           05 WX-TFEC48                     PIC X(10).                          
           05 WX-TDIAS48                    PIC 9(09)  COMP.                    
           05 WX-TFEC72                     PIC X(10).                          
           05 WX-TDIAS72                    PIC 9(09)  COMP.                    
           05 WX-TFEC96                     PIC X(10).                          
           05 WX-TDIAS96                    PIC 9(09)  COMP.                    
           05 WX-TRENDIS4                   PIC 9(09)  COMP.                    
           05 WX-TRENDIS5                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN2                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN3                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN4                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN5                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN6                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN7                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN8                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN9                   PIC 9(09)  COMP.                    
           05 WX-TMAXREN11                  PIC 9(09)  COMP.                    
      *-----------------------------------------------------------              
      *          VARIABLES PARA VXT006.                                         
      *-----------------------------------------------------------              
       01  WC-ITEM-2                   PIC S9(04) COMP  VALUE 0.        00390000
      *                                                                 00391005
       01  WX-TABLA-VXT006.                                             00400005
           05 WX6-DIASFER              PIC X(10) OCCURS 200 TIMES.      00410006
      *                                                                         
       01  REG-VXT006.                                                          
           05 WX6-TFERIADO             PIC X(10).                               
      *-----------------------------------------------------------              
