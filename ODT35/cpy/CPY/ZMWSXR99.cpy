000100******************************************************************00010000
000200*                                                                *00020000
000300*                   A  R  E  A     C  O  M  U  N                 *00030000
000400*                  -------------------------                     *00040000
000500*  OBJETIVO: LOS PROGRAMAS DEL SIVA LLAMADOS DESDE PU, USAN ESTE *00050000
000600*            COPY, PARA ENVIAR SUS DATOS EN BLOQUE.              *00060000
000700*                                                                *00070000
000800******************************************************************00080000
000900     02  WXR99-DATOS.                                             00090000
001000         05  WXR99-DAT-ENT        PIC X(3000).                    00100000
001100         05  WXR99-DAT-SAL        PIC X(4000).                    00110000
001200*                                                                 00120000
001300     02  WXR99-RESPUESTA.                                         00130000
001400         05  WXR99-CODIGOS-RETORNO.                               00140000
001500             10  WXR99-CODRET           PIC  X(02).               00150000
001600             10  WXR99-SQLCODE          PIC S9(09) COMP.          00160000
001700             10  WXR99-SQLERRM.                                   00170000
001800                 15  WXR99-SQLERRM-LON  PIC S9(04) COMP.          00180000
001900                 15  WXR99-SQLERRM-DATA PIC  X(70).               00190000
002000             10  WXR99-TABLENAME        PIC  X(16).               00200000
002100             10  WXR99-REFERENCIA       PIC  X(20).               00210000
002200             10  WXR99-FILLER-R.                                  00220000
002300                 15  WXR99-CODERR       PIC X(07).                00230000
002400                 15  WXR99-DET-ERR      PIC X(27).                00240000
002500                                                                  00250000
