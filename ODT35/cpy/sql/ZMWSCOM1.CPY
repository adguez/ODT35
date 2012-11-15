      *----                                                             00010000
      * ZMWSCOM1 : OBTIENE FECHAS VALOR HOY,NORMAL, 24, 48, 72 Y 96 HRS.00020000
      *            LAYOUT DE REFERENCIA ZMWSC011 (WX-REG)               00030000
      *                                                                 00040000
      * EJEMPLO  : PERFORM A 9100-OBTENER-FECHAS-VXT                    00050000
      *            MOVE WX-TFECHOY   TO FEVENTO  OF DCLCTLPROC          00060000
      *----                                                             00070000
       9100-OBTENER-FECHAS-VXT.                                         00080000
      *----                                                             00090000
           INITIALIZE                     WX-REG                        00100000
           PERFORM 9110-LEE-VXT001                                      00110000
                                                                        00120000
           PERFORM 9500-VALIDA-CICS.                                    00130000
                                                                        00140000
      *----                                                             00150000
       9110-LEE-VXT001.                                                 00160000
      *----                                                             00170000
           MOVE 1                      TO WX-ITEM-1                     00180000
                                                                        00190000
           EXEC CICS                                                    00200000
                READQ  TS QUEUE    ('ZMVXT001')                         00210000
                INTO               (WX-REG)                             00220000
                LENGTH             (LENGTH OF WX-REG)                   00230000
                ITEM               (WX-ITEM-1)                          00240000
                RESP               (W000-RESP)                          00250000
           END-EXEC.                                                    00260000
      *----                                                             00270000
