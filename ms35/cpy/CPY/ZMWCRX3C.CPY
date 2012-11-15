      *----                                                             00010000
      * ZMWCRX3C                            27/ABR/2004 - 27/ABR/2004   00020000
      *                                                                 00030000
      * COPY DE PARAMETROS COMUNES A FUNCIONES DE MUV PARA TF           00040000
      * CON LOS CAMPOS DE CODIGOS Y SEGURIDAD EXCLUSIVAMENTE            00050000
      *----                                                             00080000
          05 ZMNN-FIJA.                                                 00090000
             10 ZMNN-CODIGOS.                                           00100000
                15 ZMNN-C-ERRORES           PIC  9(02).                 00110000
                15 FILLER                OCCURS 5.                      00120000
                   20 ZMNN-C-CODIGO.                                    00130000
                      25 ZMNN-C-PRECODE     PIC  X(03).                 00140000
                      25 ZMNN-C-CODSIVA     PIC  9(04).                 00150000
                   20 ZMNN-C-MSGSIVA        PIC  X(65).                 00160000
                15 FILLER-414.                                          00170000
                   20 ZMNN-C-PROG           PIC  X(08).                 00180000
                   20 ZMNN-C-CODSQL         PIC S9(08) COMP.            00190000
                   20 ZMNN-C-MENSERR        PIC  X(65).                 00200000
                   20 ZMNN-C-CODRESP1       PIC S9(08) COMP.            00210000
                   20 ZMNN-C-CODRESP2       PIC S9(08) COMP.            00220000
                   20 ZMNN-C-CODFN          PIC  X(02).                 00230000
                   20 ZMNN-C-RESOURCE       PIC  X(08).                 00240000
                   20 ZMNN-C-COMMIT         PIC  X(01).                 00250000
                   20 ZMNN-C-PROCESO        PIC  X(30).                 00260000
                   20 ZMNN-C-CAMPO       OCCURS 6.                      00270000
                      25 ZMNN-C-LLAVE       PIC  X(08).                 00280000
                      25 ZMNN-C-CAMPOA      PIC  X(40).                 00290000
                      25 FILLER       REDEFINES ZMNN-C-CAMPOA.          00300000
                         30 ZMNN-C-CAMPON   PIC  Z(17)9-.               00310000
                         30 FILLER          PIC  X(21).                 00320000
                15 FILLER-780               PIC  X(04).                 00330000
             10 ZMNN-SEGURIDAD.                                         00340000
                15 ZMNN-S-DEBUG             PIC  9(01).                 00350000
                15 ZMNN-S-USERTF            PIC  X(08).                 00360000
                15 ZMNN-S-USERSIVA          PIC  X(08).                 00370000
                15 ZMNN-S-IEMPR             PIC  X(03).                 00380000
                15 ZMNN-S-IPERFIL           PIC  X(08).                 00390000
                15 ZMNN-S-ISUCCASA          PIC  X(03).                 00400000
                15 ZMNN-S-ICCOSTO           PIC  9(05).                 00410000
                15 ZMNN-S-IPROM             PIC  9(04).                 00420000
                15 ZMNN-S-SALCANCE          PIC  X(01).                 00430000
                15 ZMNN-S-SALCANCA          PIC  X(01).                 00440000
                15 ZMNN-S-SALCANPR          PIC  X(01).                 00450000
                15 ZMNN-S-ICTASIS           PIC  X(04).                 00460000
                15 ZMNN-S-NAPELL1           PIC  X(40).                 00470000
                15 ZMNN-S-NAPELL2           PIC  X(20).                 00480000
                15 ZMNN-S-NOMBRE            PIC  X(20).                 00490000
                15 FILLER-130               PIC  X(03).                 00500000
                15 ZMNN-S-TERMINAL          PIC  X(04).                 00510000
      *----                                                             00570000
