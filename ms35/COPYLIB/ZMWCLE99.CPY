      *----------------------------------------------------------------*        
      * ZM                                                                      
      *----------------------------------------------------------------*        
      * APLICACION.: ZM                                                *        
      * NOMBRE.....: ZMWCLE99                                          *        
      * DESCRIPCION: COMUNICACION DE CAMPOS COMUNES                    *        
      *                                                                *        
      * CREACION...: 06-11-2012 / CDA INFORMATICA                      *        
      * LONGITUD...:                                                *           
      *                                                                *        
      *----------------------------------------------------------------*        
      *           L O G    D E   M O D I F I C A C I O N E S           *        
      *----------------------------------------------------------------*        
      *    MARCA      AUTOR   FECHA   DESCRIPCION                      *        
      *----------------------------------------------------------------*        
      * FS-0.0.0-00  XXXXXXX DDMMMAA  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  *        
      * -----------  ------- -------  -------------------------------- *        
      *                                                                *        
      *----------------------------------------------------------------*        
      * CAMPO                DESCRIPCION                               *        
      * --------------       ----------------------------------------- *        
      * ZMWCLE99             S/DESCRIPCION                             *        
      * ZM99-ENTRADA         S/DESCRIPCION                             *        
      * ZM99-SALIDA          S/DESCRIPCION                             *        
      *----------------------------------------------------------------*        
       02 ZMWCLE99.                                                             
          05 ZM99-ENTRADA.                                                      
             10 ZM99-TECLA             PIC  X(01).                              
             10 ZM99-ESTADO            PIC  X(01).                              
          05 ZM99-SALIDA.                                                       
             10 ZM99-CODRET            PIC  X(02).                              
             10 ZM99-CODTRAN-SIG       PIC  X(04).                              
             10 ZM99-ERROR-USU.                                                 
                15 ZM99-COD-ERROR      PIC  X(07).                              
                15 ZM99-COD-AVISO1     PIC  X(07).                              
                15 ZM99-COD-AVISO2     PIC  X(07).                              
                15 ZM99-VAR1-ERROR     PIC  X(20).                              
                15 ZM99-VAR2-ERROR     PIC  X(20).                              
                15 ZM99-VAR1-AVISO1    PIC  X(20).                              
                15 ZM99-VAR2-AVISO1    PIC  X(20).                              
                15 ZM99-VAR1-AVISO2    PIC  X(20).                              
                15 ZM99-VAR2-AVISO2    PIC  X(20).                              
             10 ZM99-ERROR-SIS.                                                 
                15 ZM99-ERROR-DB2.                                              
                   20 ZM99-OBJETO-ERROR                                         
                                       PIC  X(08).                              
                   20 ZM99-SQLCODE     PIC S9(09) COMP.                         
                15 ZM99-ERROR-CICS.                                             
                   20 ZM99-EIBFN       PIC  X(02).                              
                   20 ZM99-EIBRSRCE    PIC  X(08).                              
                   20 ZM99-EIBRCODE    PIC  X(06).                              
                   20 ZM99-EIBRESP     PIC S9(08) COMP.                         
                   20 ZM99-EIBRESP2    PIC S9(08) COMP.                         
      *----------------------------------------------------------------*        
      *                        FIN COPY ZMWCLE99                       *        
      *----------------------------------------------------------------*        
