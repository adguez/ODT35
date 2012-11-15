      *-----------------------------------------------------------------00010000
      *    DEFINICION DEL REGISTRO DE LA TABLA CUENTA                   00020000
      *-----------------------------------------------------------------00030000
           02  REG-DCLCUENTA.                                           00040000
               10 SVIGEN          PIC X(1).                             00050000
               10 ICTAGLO         PIC S9999999V USAGE COMP-3.           00060000
               10 ICUENTA         PIC S9999999V USAGE COMP-3.           00070000
               10 ITIPOCTA        PIC X(1).                             00080000
               10 IPERJUR         PIC X(2).                             00090000
               10 IRFC            PIC X(13).                            00100000
               10 ITASAFIS        PIC X(1).                             00110000
               10 INACIO          PIC X(2).                             00120000
               10 IPROM           PIC S9999V USAGE COMP-3.              00130000
               10 ICCOSTO         PIC S99999V USAGE COMP-3.             00140000
               10 IUSUARIO        PIC X(8).                             00150000
               10 IPROGRAM        PIC X(8).                             00160000
               10 FALTA           PIC X(10).                            00170000
               10 FALTAANT        PIC X(10).                            00180000
               10 FBAJA           PIC X(10).                            00190000
               10 FULTCAMB        PIC X(10).                            00200000
               10 FULTMOV         PIC X(10).                            00210000
               10 IENVDOC         PIC S99V USAGE COMP-3.                00220000
               10 NPROF           PIC X(5).                             00230000
               10 NABREV          PIC X(25).                            00240000
               10 NOMBRE          PIC X(20).                            00250000
               10 NAPELL1         PIC X(40).                            00260000
               10 NAPELL2         PIC X(20).                            00270000
               10 DCALLE          PIC X(25).                            00280000
               10 DCOLON          PIC X(25).                            00290000
               10 DPOBLA          PIC X(30).                            00300000
               10 IPOS            PIC S99999V USAGE COMP-3.             00310000
               10 DESTADO         PIC X(25).                            00320000
               10 DCALLEP         PIC X(25).                            00330000
               10 DCOLONP         PIC X(25).                            00340000
               10 DPOBLAP         PIC X(30).                            00350000
               10 IPOSP           PIC S99999V USAGE COMP-3.             00360000
               10 DESTADOP        PIC X(25).                            00370000
               10 ITEL1           PIC S9999999V USAGE COMP-3.           00380000
               10 IEXT1           PIC S9999V USAGE COMP-3.              00390000
               10 ITEL2           PIC S9999999V USAGE COMP-3.           00400000
               10 IEXT2           PIC S9999V USAGE COMP-3.              00410000
               10 ICAPTA          PIC X(1).                             00420000
               10 IFIRMA          PIC X(1).                             00430000
               10 IRUTA           PIC X(3).                             00440000
               10 SCOMPNAC        PIC X(1).                             00450000
               10 SDOCUM          PIC X(1).                             00460000
               10 SLIQUID         PIC X(1).                             00470000
               10 SOPER12         PIC X(1).                             00480000
               10 PCOMCTA         PIC S9V9999 USAGE COMP-3.             00490000
               10 MABOANO         PIC S9999999999999V99 USAGE COMP-3.   00500000
               10 MABOMES         PIC S9999999999999V99 USAGE COMP-3.   00510000
               10 MCGOANO         PIC S9999999999999V99 USAGE COMP-3.   00520000
               10 MCGOMES         PIC S9999999999999V99 USAGE COMP-3.   00530000
               10 MCARACT         PIC S9999999999999V99 USAGE COMP-3.   00540000
               10 MCARIMES        PIC S9999999999999V99 USAGE COMP-3.   00550000
               10 APREFMAR        PIC S9999V99999 USAGE COMP-3.         00560000
               10 FDEBEDES        PIC X(10).                            00570000
               10 XSEG            PIC X(5).                             00580000
               10 IEMICHE         PIC X(1).                             00590000
               10 IESTRATO        PIC X(3).                             00600000
               10 ISUCCASA        PIC X(3).                             00610000
               10 IZONECO         PIC X(3).                             00620000
               10 IESTMIG         PIC X(1).                             00630000
               10 STARFIR         PIC X(1).                             00640000
               10 SCONFIR         PIC X(1).                             00650000
               10 SCANDADO        PIC X(1).                             00660000
               10 ISUBCLAS        PIC X(3).                             00670000
               10 PCOMCTA1        PIC S9V9999 USAGE COMP-3.             00680000
               10 PCOMCTA2        PIC S9V9999 USAGE COMP-3.             00690000
               10 PCOMCTA3        PIC S9V9999 USAGE COMP-3.             00700000
               10 PCOMCTA4        PIC S9V9999 USAGE COMP-3.             00710000
               10 SIMPRESO        PIC X(1).                             00720000
               10 SACTCON         PIC X(1).                             00730000
               10 SPODERES        PIC X(1).                             00740000
               10 ICANDAD1        PIC S9V USAGE COMP-3.                 00750000
               10 ICANDAD2        PIC S9V USAGE COMP-3.                 00760000
               10 ICLACTO         PIC S9V USAGE COMP-3.                 00770000
               10 INSTENV         PIC S9V USAGE COMP-3.                 00780000
               10 SREPASAM        PIC X(1).                             00790000
               10 IAPLIDER        PIC S9V USAGE COMP-3.                 00800000
               10 FSIST           PIC X(26).                            00810000
               10 ITERM           PIC X(8).                             00820000
               10 IESTCON         PIC X(3).                             00830000
               10 STIPOIN         PIC X(1).                             00840000
               10 CIMPRESO        PIC S99V USAGE COMP-3.                00850000
               10 ISERSP          PIC X(1).                             00860000
               10 ICODAREA        PIC S999999V USAGE COMP-3.            00870000
               10 MLINCRB         PIC S9999999999999V99 USAGE COMP-3.   00880000
               10 CEXINDEV        PIC X(9).                             00890000
               10 PCUSTOD         PIC S9V9999 USAGE COMP-3.             00900000
               10 IREPRCAS        PIC S9999999V USAGE COMP-3.           00910000
               10 IEMPR           PIC X(3).                             00920000
      *-----------------------------------------------------------------00930000
