      *-----------------------------------------------------------------00010000
      *  * RG *         AREA PARA PASO DE PARAMETROS ENTRE LA RUTINA QUE00020000
      *                 PROPORCIONA NIVEL DE AUTORIDAD                  00030000
      *                                                                 00040000
      *                 (ZM9CR489)                                      00050000
      *                                                                 00060000
      *  REFERENCIAS    NINGUNA                                         00070000
      *                 JUN/02                                          00080000
      *                                                                 00090000
           02  NA-REG.                                                  00100000
           05  NA-IUSUARIO             PIC X(8).                        00110000
           05  NA-NIVEL-AUTOR          PIC X.                           00120000
           05  NA-NUM-PROM             PIC S9(9)        COMP.           00130000
           05  NA-PROMOTORES           OCCURS  500 TIMES                00140000
                                       INDEXED BY NA-I                  00150000
                                       PIC S9(4)       COMP-3.          00160000
           05  NA-WCODRET              PIC S9(9)        COMP.           00161000
      *-----------------------------------------------------------------00170000
