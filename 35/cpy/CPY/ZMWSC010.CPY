      *----                                                             00010000
      * ZMWSC010 : REGISTRO CON VARIABLES GENERALES EN PROGRAMA         00020000
      *            INICIO Y VARIOS                                      00030000
      *                                                                 00040000
      *----                                                             00050000
       01  WR-STARTCODE                PIC  X(02) VALUE SPACES.         00060000
       01  WR-STARTCODE-SD             PIC  X(02) VALUE 'SD'.           00070000
      *----                                                             00080000
       01  ZM-WCODRET                  PIC S9(09) COMP VALUE 888888.    00090000
      *----                                                             00100000
      *    VARIABLES GENERALES PARA BORRADO DE QUEUE'S                  00110000
       01  ZM-QUEUE.                                                    00120000
           05 ZM-TERMID                PIC X(04).                       00130000
           05 ZM-TRANSID               PIC X(03).                       00140000
           05 ZM-CONSEC                PIC 9.                           00150000
       01  ZM-IND-Q                    PIC S9(4) COMP.                  00160000
      *----                                                             00170000
       01  MM-CODIGO                   PIC  9(04) VALUE 0.              00180000
      *----                                                             00190000
       01  WI-LENGTH                   PIC S9(04) COMP VALUE 0.         00200000
      *----                                                             00210000
       01  WE-COMP                     PIC S9(04) COMP VALUE 0.         00220000
       01  WE-COMP-R             REDEFINES WE-COMP.                     00230000
           03 WE-COMP-1                PIC  X(01).                      00240000
           03 WE-COMP-2                PIC  X(01).                      00250000
      *----                                                             00260000
       01  wsc-RUTINAS.                                                 00270000
           05 wsc-ZM8CR009             PIC  X(08) VALUE 'ZM8CR009'.     00280000
           05 wsc-ZM9CR403             PIC  X(08) VALUE 'ZM9CR403'.     00290000
           05 wsc-ZM9CR432             PIC  X(08) VALUE 'ZM9CR432'.     00300000
