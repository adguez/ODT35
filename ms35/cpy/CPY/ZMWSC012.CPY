      *----                                                             00010000
      * ZMWSC012 : REGISTRO CON VARIABLES PARA OBTENER EL MENSAJE       00020000
      *            DE ERROR CORRESPONDIENTE AL CODIGO INDICADO          00030000
      *                                                                 00040000
      * EJEMPLO:         MOVE 100        TO WM-CODIGO                   00050000
      *                  PERFORM 9200-MENSAJE-ERROR                     00060000
      *                  MOVE WM-MENSAJE TO VARIABLE-MAPA               00070000
      *----                                                             00080000
       01 WM-REG.                                                       00090000
          03 WM-CODIGO                   PIC  9(04) VALUE 0.            00100000
          03 WM-MENSAJE.                                                00110000
             05 FILLER                   PIC  X(04) VALUE SPACES.       00120000
             05 WM-MENS-CODIGO           PIC  9(04) VALUE 0.            00130000
             05 WM-MENS-TEXTO            PIC  X(70) VALUE SPACES.       00140000
          03 WM-QUEUE                    PIC  X(08) VALUE 'ZMMSG01'.    00150000
          03 WM-LENGTH                   PIC S9(04) COMP VALUE 0.       00160000
          03 WM-NUMITEMS                 PIC S9(04) COMP VALUE 0.       00170000
          03 WM-RESP                     PIC S9(08) COMP VALUE 0.       00180000
          03 WM-ITEM                     PIC S9(04) COMP VALUE 0.       00190000
          03 WM-ITEM-AUX                 PIC S9(08) COMP VALUE 0.       00200000
          03 WM-INI                      PIC S9(04) COMP VALUE 0.       00210000
          03 WM-FIN                      PIC S9(04) COMP VALUE 0.       00220000
          03 WM-INI-CODIGO               PIC  9(04) VALUE 0.            00230000
          03 WM-FIN-CODIGO               PIC  9(04) VALUE 0.            00240000
          03 WM-DATO.                                                   00250000
             05 FILLER                   PIC  X(04) VALUE SPACES.       00260000
             05 WM-DATO-CODIGO           PIC  9(04) VALUE 0.            00270000
             05 FILLER                   PIC  X(70) VALUE SPACES.       00280000
          03 SM-SALIR                    PIC  9(01) VALUE 0.            00290000
             88 SM-SALIR-NO                   VALUE 0.                  00300000
             88 SM-SALIR-SI                   VALUE 1.                  00310000
