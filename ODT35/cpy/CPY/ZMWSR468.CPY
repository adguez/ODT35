      *-----------------------------------------------------------------        
      *  * RG *         AREA PARA PASO DE PARAMETROS ENTRE LA RUTINA QUE        
      *                 AUTORIZA AL USUARIO PARA EFECTUAR UNA OPERACION         
      *                 Y PROGRAMAS QUE LA LLAMEN                               
      *                 ABR/02                                                  
      *-----                                                                    
        02 UO-USUARIO-OPERACION.                                                
           05 UO-WCODRET               PIC S9(9) COMP.                          
           05 UO-USUARIO               PIC X(08).                               
           05 UO-IOPERA                PIC S9(5) COMP-3.                        
           05 UO-FOPERA                PIC X(10).                               
           05 UO-HOPERA                PIC X(08).                               
      *-----------------------------------------------------------------        
