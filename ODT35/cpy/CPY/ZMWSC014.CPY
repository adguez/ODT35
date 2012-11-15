      *****************************************************************         
      *                  COPY: ZMWSC014                               *         
      *****************************************************************         
      *                                                               *         
      *   ESTE COPY SE USA EN PAREJA CON EL COPY: ZMWSC015            *         
      *                                                               *         
      *   ESTOS COPYS SIRVEN PARA ALINEAR UN STRING A LA IZQUIERDA O  *         
      *   A LA DERECHA                                                *         
      *                                                               *         
      *         ELABORADO POR: ING ENRIQUE FERNANDEZ CHAPOU (AZERTIA) *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *  EJEMPLO: UN CAMPO A ALINEAR DE 25 CARAC. DE LONGITUD         *         
      *                                                               *         
      *01  WS-CAMPO-A-ALINEAR           PIC  X(25)  VALUE SPACES.     *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    PARA ALINEAR A LA IZQUIERDA LLAMAR A:                      *         
      *             PERFORM 9886-ALINEA-STRING-IZQ                    *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    MOVE WS-CAMPO-A-ALINEAR           TO WS-STRING-ENTRADA     *         
      *    MOVE 25                           TO WS-LONG-STRING        *         
      *    PERFORM 9886-ALINEA-STRING-IZQ.                            *         
      *    MOVE WS-STRING-SALIDA             TO WS-CAMPO-A-ALINEAR.   *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    PARA ALINEAR A LA DERECHA   LLAMAR A:                      *         
      *             PERFORM 9887-ALINEA-STRING-DER                    *         
      *                                                               *         
      *****************************************************************         
      *                                                               *         
      *    MOVE WS-CAMPO-A-ALINEAR           TO WS-STRING-ENTRADA     *         
      *    MOVE 25                           TO WS-LONG-STRING        *         
      *    PERFORM 9887-ALINEA-STRING-DER.                            *         
      *    MOVE WS-STRING-SALIDA             TO WS-CAMPO-A-ALINEAR.   *         
      *                                                               *         
      *****************************************************************         
                                                                                
      *                                                                         
      *****************************************************************         
      *    VARIABLES PARA ALINEAR UN STRING DE CARACTERES             *         
      *****************************************************************         
       01  WS-STRING-CARACTERES.                                                
          05 WS-IND1                    PIC  9(02)  VALUE ZEROS.                
          05 WS-IND2                    PIC  9(02)  VALUE ZEROS.                
          05 WS-LONG-STRING             PIC  9(02)  VALUE 80.                   
                                                                                
          05 WS-STRING-ENTRADA          PIC  X(80).                             
          05 FILLER  REDEFINES WS-STRING-ENTRADA.                               
             10 WS-LETRA-ORIGEN         PIC  X(01) OCCURS 80 TIMES.             
                                                                                
          05 WS-STRING-SALIDA           PIC  X(80).                             
          05 FILLER  REDEFINES WS-STRING-SALIDA.                                
             10 WS-LETRA-DESTINO        PIC  X(01) OCCURS 80 TIMES.             
      *                                                                         
      *****************************************************************         
      *                  FIN DE COPY: ZMWSC014                        *         
      *****************************************************************         
