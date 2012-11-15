      *****************************************************************
      *                       IDENTIFICATION DIVISION                 *
      *****************************************************************
       IDENTIFICATION DIVISION.
      *****************************************************************
       PROGRAM-ID.   ZM9CHW79.
       AUTHOR.       CDA-INFORMATICA.
       DATE-WRITTEN. NOVIEMBRE 2012.
      *****************************************************************
      *                                                               *
      *                         " M.U.V. "                            *
      *                                                               *
      *                                                               *
      * OBJETIVO:       ALTA DE CARTA DE INSTRUCION DE CLIENTES.      *
      *                                                               *
      * OPCION:         "661"  C/DB2                                  *
      * TRANSACCION:    NRP1                                          *
      *                                                               *
      * RUTINAS:        ZM8CR009 (CENTRA TEXTOS)              AHR009  *
      *                 ZM9CR403 (OBTENER NOMBRE DE COMPANIA) VRB403O *
      *                 ZM9CR432 (TRANSFERENCIA-NAVEGACION-)  VRB432O *
      *                 ZM9RH468 (VALIDA AUT. DE USUARIO)     VRB468O *
      *                 ZM9CR489 (OBTIENE PROMOT USUARIO)     VRB489O *
      *                                                               *
      *****************************************************************
      *                       ENVIRONMENT DIVISION                    *
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-4381.
       OBJECT-COMPUTER. IBM-4381.
      *****************************************************************
      *                       DATA DIVISION                           *
      *****************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
      *----
      *    AREA DE TEMPORAL STORAGE
      *
       01 W000-ZM9CRX57.
          COPY ZMWCRX3C.
          05 ZM57-CARTAS.
             10 ZM57-CONTRATO          PIC  X(10).
             10 ZM57-ICUENTA           PIC  9(07).
             10 ZM57-GRUPO             PIC  X(01).
             10 ZM57-INSTRUMENTO       PIC  X(08).
             10 ZM57-IEMISORA          PIC  X(07).
             10 ZM57-ISERIE            PIC  X(08).
             10 ZM57-IPROCESO          PIC  X(01).
             10 ZM57-TOTAL             PIC  9(04).
             10 FILLER                 OCCURS 20.
                15 ZM57-REG            PIC  X(95).
      *
      *
       01 SWITCHES.
      *
          05 SW-FIN-ZMDT606            PIC  X(02)      VALUE SPACES.
             88 wss-88-FIN-ZMDT606                     VALUE 'SI'.
          05 SW-PRIMERO-RC             PIC  9(01)      VALUE 0.
             88 wss-88-PRIMERO-NO                      VALUE 0.
             88 wss-88-PRIMERO-SI                      VALUE 1.
      *
      *****************************************************************
      *                       IDENTIFICADOR INICIO WORKING-STORAGE    *
      *****************************************************************
       01  LT-INICIO-WS.
           05 LT-INICIO-W              PIC X(50)       VALUE
              '*** INICIO WORKING STORAGE (ZM9CHW79) ***'.

      *
      *****************************************************************
      * VARS.                                                         *
      *****************************************************************
       01 WS-COMPACTA.
          05 WSv-I                     PIC  9(04)      VALUE 0.
          05 WSv-SIZE                  PIC  9(04)      VALUE 0.
          05 WSv-STR                   PIC  X(200)     VALUE SPACES.
          05 WSv-AUX                   PIC  X(200)     VALUE SPACES.
       01 WSv-CONT                     PIC  9(03)      VALUE 0.
       01 WSv-ICUENTA                  PIC S9(7)V      VALUE 0
                                                      USAGE COMP-3.
       01 WSv-GRUPO                    PIC S9(1)V      VALUE 0
                                                      USAGE COMP-3.
       01 WSv-INSTRUMENTO              PIC  X(8)       VALUE ' '.
       01 WSv-IEMISORA                 PIC  X(7)       VALUE ' '.
       01 WSv-ISERIE                   PIC  X(8)       VALUE ' '.
       01 WSv-CANTIDAD                 PIC  9(02)V9999 VALUE 0.
       01 WSv-CANTIDAD1 REDEFINES WSv-CANTIDAD.
          05 WSv-ENTEROS               PIC  9(02).
          05 WSv-DECIMALES             PIC  V9999.
       01 WSv-IND                      PIC  9(04)      VALUE 0.
       01 WSv-IND3                     PIC  9(04)      VALUE 0.
       01 WSc-ATTRIB-BRT               PIC  X(01)      VALUE 'Z'.
      *
       01 W000-PROG                    PIC X(08)       VALUE 'ZM9CHW79'.
       01 W000-USUARIO                 PIC X(08)       VALUE SPACES.
       01 W000-RESP                    PIC S9(8)       VALUE 0 COMP.
       01 W000-OPC                     PIC X(03)       VALUE '661'.
       01 W000-TRANSID                 PIC X(04)       VALUE 'Z122'.
      *
       01 W0000-USUARIO                PIC X(08).
       01 W9510-MSG                    PIC X(74) VALUE SPACES.
       01 WS-ZEROES                    PIC ZZZ,ZZZ,ZZ9.
      *
       01 wsc-constantes.
      *-------------c o n s t a n t e s   n u m e r i c a s------------*
          05 wsc-cursor                pic s9(01)      value -1 comp.
          05 wsc-0                     pic  9(01)      value 0.
          05 wsc--1                    pic s9(01)      value -1.
          05 wsc-1                     pic  9(01)      value 1.
          05 wsc-2                     pic  9(01)      value 2.
          05 wsc-7                     pic  9(01)      value 7.
          05 wsc-9                     pic  9(01)      value 9.
          05 wsc-10                    pic  9(02)      value 10.
          05 wsc-20                    pic  9(02)      value 20.
          05 wsc-21                    pic  9(02)      value 21.
          05 wsc-25                    pic  9(02)      value 25.
          05 wsc-40                    pic  9(02)      value 40.
          05 wsc-61                    pic  9(02)      value 61.
          05 wsc-100                   pic  9(03)      value 100.
          05 wsc-112                   pic  9(03)      value 112.
          05 wsc-922                   pic  9(03)      value 922.
          05 wsc-2019                  pic  9(04)      value 2019.
          05 wsc-9999999               pic  9(07)      value 9999999.
      *-------------c o n s t a n t e s   alfanumericas---------*
          05 wsc-a-00                  pic  x(02)      value '00'.
          05 wsc-a-0                   pic  x(01)      value '0'.
          05 wsc-a                     pic  x(01)      value 'a'.
          05 wsc-b                     pic  x(01)      value 'b'.
          05 wsc-bcm                   pic  x(03)      value 'bcm'.
          05 wsc-nrp1                  pic  x(04)      value 'nrp1'.
          05 wsc-r                     pic  x(01)      value 'r'.
          05 wsc-zzzzzzzz              pic  z(08)      value 'zzzzzzzz'.
      *
      *****************************************************************
      *                       R U T I N A S                           *
      *****************************************************************
       01  wsc-RUTINAS.
           05 wsc-ZM9RH468             PIC X(08)       VALUE 'ZM9RH468'.
           05 wsc-ZM9CR489             PIC X(08)       VALUE 'ZM9CR489'.
           05 wsc-ZM9CRX57             PIC X(08)       VALUE 'ZM9CRX57'.
      *                  codigos de CICS
       01  CICS-RESP-CODE              PIC S9(08)      VALUE +0.
           88 CICS-NORMAL                              VALUE +00.
           88 CICS-NOTFND                              VALUE +13.
           88 CICS-DUPREC                              VALUE +14.
           88 CICS-INVREQ                              VALUE +16.
           88 CICS-NOSPACE                             VALUE +18.
           88 CICS-NOTOPEN                             VALUE +19.
           88 CICS-ENDFILE                             VALUE +20.
           88 CICS-LENGERR                             VALUE +22.
           88 CICS-QZERO                               VALUE +23.
           88 CICS-QBUSY                               VALUE +25.
           88 CICS-ITEMERR                             VALUE +26.
           88 CICS-PGMIDERR                            VALUE +27.
           88 CICS-ENDDATA                             VALUE +29.
           88 CICS-MAPFAIL                             VALUE +36.
           88 CICS-QIDERR                              VALUE +44.
           88 CICS-ENQBUSY                             VALUE +55.
           88 CICS-DISABLE                             VALUE +84.

      *
      *****************************************************************
      *                       REGISTRO COMUNICACION ENTRE COBCICS-CSP *
      *****************************************************************
           COPY ZMWCOM11.
           copy ZMWCLE99.
      *
           05  WC-ADICIONAL.
               10 WC-CODIGO            PIC  9(04)      VALUE 0.
               10 WC-COMANDO           PIC  X(010).
               10 WC-USUARIO           PIC  X(008).
      *
               10 WC-OPC               PIC  X(001).
               10 WC-NAUT              PIC  X(001).
      *
           05  WC-ADICIONA1.
      *        10 WC-HOJA              PIC  9(003).
               10 WC-IND               PIC  9(004)     VALUE 0.
               10 SW-MODIFICO-OK       PIC  X(02)      VALUE ' '.
                  88 MODIFICO-OK                       VALUE 'SI'.
               10 SW-SELECCION-OK      PIC  X(02)      VALUE ' '.
                  88 SELECCION-OK                      VALUE 'SI'.
               10 WC-ICUENTA           PIC  9(07)      VALUE 0.
               10 WC-NOMBRE            PIC  X(25)      VALUE ' '.
               10 WC-GRUPO             PIC  X(01)      VALUE ' '.
               10 WC-INSTRUMENTO       PIC  X(08)      VALUE ' '.
               10 WC-IEMISORA          PIC  X(07)      VALUE ' '.
               10 WC-ISERIE            PIC  X(08)      VALUE ' '.

      *****************************************************************
      *                       COPYS AREAS TRABAJO                     *
      *****************************************************************
      *                       IDENTIFICADORES DE ATENCION
           COPY DFHAID.
      *                       ESTANDAR DE ATRIBUTOS
           COPY DFHBMSCA.
      *
      *****************************************************************
      *                       INF. RUT. DE VALIDACION DE FECHAS
       01  ZMWSX090-REGISTRO.
           COPY ZMWSX090.
      *                       INF. RUT. TRANSFERENCIA ZM9CR432
       01  W432-ZMWSR432.
           COPY ZMWSR432.
      *                       INF. RUTINA CENTRA TEXTO ZM8CR009
       01  W009-ZMWSR009.
           COPY ZMWSR009.
      *                       RUT P/OBTENER NOMBRE CIA ZM9CR403
      *01  W010-ZMWSZ403.
      *    COPY ZMWSZ403.
      *
       01  W015-ZMWSR468.
           COPY ZMWSR468.
      *
       01  W020-ZMWSR469.
           COPY ZMWSR469.
      *
       01  W030-ZMWSR470.
           COPY ZMWSR470.
      *
       01  W040-ZMWSR489.
           COPY ZMWSR489.
      *
           COPY ZMWSG532.
      *
           COPY ZMWSC010.
      *
      *FECHAS VXT
           COPY ZMWSC011.
      *                       AREA PARA MENSAJES INTERNOS
           COPY ZMWSC012.
      *                       INF. USUARIO, FECHA Y HORA
           COPY ZMWSC013.
      *                       INF. FORMAT. CANT.
           COPY ZMWSC014.
      *
           COPY ZMWSC017.
      *                       INF. VARIABLES DEL MAPA 01
           copy ZMWMW79.
      *
      *****************************************************************
      *    TABLAS.
      *****************************************************************
      *
           EXEC SQL
              INCLUDE SQLCA
           END-EXEC.
      *
      *****************************************************************
      *    TABLA DE CUENTAS
      *****************************************************************
      *
           EXEC SQL
              INCLUDE ZCUENTA
           END-EXEC.
      *
      *****************************************************************
      *    TABLA DE PARAMETROS
      *****************************************************************
      *
           EXEC SQL
              INCLUDE ZPARAM
           END-EXEC.
      *
      *****************************************************************
      *    TABLA DE EMPRESA
      *****************************************************************
      *
           EXEC SQL
              INCLUDE ZEMPRESA
           END-EXEC.
      *
      *****************************************************************
      *    TABLA DE ORDENES
      *****************************************************************
      *
           EXEC SQL
              INCLUDE ZZMDT606
           END-EXEC.
      *
      *****************************************************************
      *    DECLARACION DE CURSORES
      *****************************************************************
      *
           EXEC SQL
              DECLARE C-ZMDT606 CURSOR FOR
              SELECT
                 A.ZM606_ICUENTA,
                 A.ZM606_PROMOT,
                 A.ZM606_GRUPO,
                 A.ZM606_INSTRUMENTO,
                 A.ZM606_ICONCEPT,
                 A.ZM606_IEMISORA,
                 A.ZM606_ISERIE,
                 B.NOMBRE,
                 B.NAPELL1,
                 B.NAPELL2,
                 B.IPROM,
                 B.ICCOSTO
                FROM ZMDT606 A, CUENTA B
              WHERE  (A.ZM606_ICUENTA     >= :WSv-ICUENTA
                 AND  A.ZM606_ICUENTA     <= :ZM606-ICUENTA)
                 AND (A.ZM606_GRUPO       >= :WSv-GRUPO
                 AND  A.ZM606_GRUPO       <= :ZM606-GRUPO)
                 AND (A.ZM606_INSTRUMENTO >= :WSv-INSTRUMENTO
                 AND  A.ZM606_INSTRUMENTO <= :ZM606-INSTRUMENTO)
                 AND (A.ZM606_IEMISORA    >= :WSv-IEMISORA
                 AND  A.ZM606_IEMISORA    <= :ZM606-IEMISORA)
                 AND (A.ZM606_ISERIE      >= :WSv-ISERIE
                 AND  A.ZM606_ISERIE      <= :ZM606-ISERIE)
                 AND  A.ZM606_ICUENTA      = B.ICUENTA
                 AND  A.ZM606_IEMPR        = :ZM606-IEMPR
                 AND  A.ZM606_SVIGEN       = wsc-a
                 ORDER BY A.ZM606_PROMOT,A.ZM606_ICUENTA,A.ZM606_GRUPO,
                 A.ZM606_INSTRUMENTO,A.ZM606_ICONCEPT,A.ZM606_IEMISORA,
                 A.ZM606_ISERIE
           END-EXEC.
      *
      *****************************************************************
      *  LINKAGE SECTION
      *****************************************************************
       LINKAGE SECTION.
      *
       01 DFHCOMMAREA.
          copy ZMWSXR99.

      *****************************************************************
      *                       PROCEDURE DIVISION                      *
      *****************************************************************
       PROCEDURE DIVISION.
      *
       000000-MAIN.
           PERFORM 100000-INICIO
           PERFORM 200000-PROCESO
           PERFORM 300000-TERMINA
           .
      *
      *****************************************************************
      *100000-INICIO                                                  *
      *INICIO DE LA RUTINA                                            *
      *****************************************************************
       100000-INICIO.
           EXEC CICS
               IGNORE CONDITION ERROR
           END-EXEC

           initialize ZM99-SALIDA

           MOVE wsc-nrp1                   TO ZM99-CODTRAN-SIG
           move WXR99-DAT-ENT              to WC-COMMAREA
           move wsc-a-00                   to ZM99-CODRET
           if ZM99-ESTADO equal to wsc-a-0
              PERFORM 100100-OBTENER-FECHAS-VXT
           else
              move zm99-tecla              to EIBAID
           end-if
           .
      *
      *****************************************************************
      *100100-OBTENER-FECHAS-VXT                                      *
      *****************************************************************
       100100-OBTENER-FECHAS-VXT.
           initialize WX-REG
                      WX-ITEM-1
           add wsc-1                       to WX-ITEM-1
           EXEC CICS
                READQ  TS QUEUE    (wsc-ZMVXT001)
                INTO               (WX-REG)
                LENGTH             (LENGTH OF WX-REG)
                ITEM               (WX-ITEM-1)
                RESP               (W000-RESP)
           END-EXEC

           IF EIBRESP EQUAL DFHRESP(NORMAL)
              MOVE WX-TFECHOY          TO WC-TFECHOY
              MOVE WX-TFECVN           TO WC-TFECVN
              MOVE WX-TDIASVN          TO WC-TDIASVN
              MOVE WX-TFEC48           TO WC-TFEC48
              MOVE WX-TDIAS48          TO WC-TDIAS48
              MOVE WX-TFEC72           TO WC-TFEC72
              MOVE WX-TDIAS72          TO WC-TDIAS72
              MOVE WX-TFEC96           TO WC-TFEC96
              MOVE WX-TDIAS96          TO WC-TDIAS96
           ELSE
              PERFORM 999999-ERROR-CICS
           END-IF.
      *
      *****************************************************************
      * PROCESA LOS DIFERENTES ESTADOS POR LOS QUE PASA EL PROGRAMA   *
      *****************************************************************
       200000-PROCESO.
      *
           EVALUATE WC-ESTADO
              WHEN 0
                 PERFORM 9300-USER-FECHA-HORA
      *
                 MOVE SPACES               TO WC-COMANDO
                 MOVE SPACES               TO SW-SELECCION-OK
                 MOVE SPACES               TO SW-MODIFICO-OK
                 MOVE FH-USUARIO           TO WC-USUARIO
      *          MOVE wsc-1                TO MHOJAO
      *          MOVE wsc-1                TO WC-HOJA
      *
                 PERFORM 9210-VALIDAR-AUTORIDAD
                 PERFORM 8000-LIMPIAR-PANTALL1
                 PERFORM 8000-LIMPIAR-PANTALL2
                 PERFORM 9520-ENVIAR-PANTALLA
              WHEN wsc-1
                 PERFORM 9600-ESTADO-CONTINUACION
              WHEN wsc-2
                 PERFORM 9700-ESTADO-CONFIRMACION
              WHEN OTHER
                 MOVE wsc-0                TO WC-ESTADO
                 PERFORM 9520-ENVIAR-PANTALLA
           END-EVALUATE.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9210-VALIDAR-AUTORIDAD.
      *
           INITIALIZE W040-ZMWSR489.
           MOVE WC-USUARIO                 TO NA-IUSUARIO.
      *
           EXEC CICS
               LINK PROGRAM     (wsc-ZM9CR489)
                    COMMAREA    (W040-ZMWSR489)
                    LENGTH (LENGTH OF W040-ZMWSR489)
                    RESP        (W000-RESP)
           END-EXEC.
      *
           IF NA-WCODRET = ZM-WCODRET
              PERFORM 9888-ABORTA-RETURN
           END-IF.
      *
           PERFORM 9500-VALIDA-CICS.
      *
           IF NA-WCODRET = wsc-0
              MOVE NA-NIVEL-AUTOR          TO WC-NAUT
              MOVE wsc-1                   TO WC-ESTADO
           ELSE
              MOVE wsc-112                 TO WM-CODIGO
              MOVE wsc-cursor              TO nrp1-MCONTRAL
           END-IF.
      *
           MOVE WC-USUARIO                 TO W000-USUARIO.
      *
      *****************************************************************
      * MUEVE DATOS DEL ENCABEZADO.                                   *
      *****************************************************************
       9221-PREPARAR-DATOS-ENCA.
      *
      *    MOVE WC-PGMID                   TO MPGMIDO.
      *    MOVE WC-EMPRESA                 TO MCIAO.
      *    MOVE WC-USUARIO                 TO MUSERO.
      *    MOVE FH-FECHA-10                TO MFECHAO.
      *    MOVE EIBTRMID                   TO MTERMO.
      *    MOVE FH-HORA                    TO MHORAO.
      *    MOVE WC-HOJA                    TO MHOJAO.
      *
           IF    WM-CODIGO = wsc-0 OR WM-CODIGO < wsc-0
              OR WM-CODIGO = wsc-100
              MOVE wsc-cursor              TO nrp1-MCONTRAL
           END-IF.
      *
      *****************************************************************
      * RECIBE PANTALLA PRIMERA                                       *
      *****************************************************************
       9310-RECIBIR-PANTALLA.
      *
      *    EXEC CICS RECEIVE
      *         MAP('ZMHW791')
      *         MAPSET('ZMHW791')
      *         RESP (W000-RESP)
      *    END-EXEC.
      *
           MOVE nrp1-MCOM                  TO WS-STRING-ENTRADA
           MOVE wsc-10                     TO WS-LONG-STRING
           PERFORM 9886-ALINEA-STRING-IZQ
           MOVE WS-STRING-SALIDA           TO nrp1-MCOM
                                              WC-COMANDO
      *
           IF W000-RESP = DFHRESP(MAPFAIL)
              MOVE wsc-cursor              TO nrp1-MCOML
              PERFORM 9520-ENVIAR-PANTALLA
           END-IF.
      *
      *****************************************************************
      * INICIALIZA PANTALLA                                           *
      *****************************************************************
       8000-LIMPIAR-PANTALL1.
      *
           MOVE SPACES                     TO nrp1-MCONTRA
                                              nrp1-MGRUPO
                                              nrp1-MEMISOR
                                              nrp1-MSERIE
                                              nrp1-MINSTR.
      *
           MOVE DFHBMFSE                   TO nrp1-MCONTRAa
                                              nrp1-MGRUPOa
                                              nrp1-MEMISORa
                                              nrp1-MSERIEa
                                              nrp1-MINSTRa.
      *
      *****************************************************************
      * INICIALIZA PANTALLA                                           *
      *****************************************************************
       8000-LIMPIAR-PANTALL2.
      *
           PERFORM VARYING WSv-IND FROM wsc-1 BY wsc-1
                                  UNTIL WSv-IND > wsc-10
           MOVE DFHBMASF                   TO NRP1-MSELECA(WSv-IND)
                                              NRP1-MCONTR (WSv-IND)
                                              NRP1-MNOMBRA(WSv-IND)
                                              NRP1-MGRUP1A(WSv-IND)
                                              NRP1-MINST1A(WSv-IND)
                                              NRP1-MEMISOA(WSv-IND)
                                              NRP1-MSERI1A(WSv-IND)
           MOVE SPACES                     TO NRP1-MSELEC (WSv-IND)
                                              NRP1-MCONTR (WSv-IND)
                                              NRP1-MNOMBR (WSv-IND)
                                              NRP1-MGRUP1 (WSv-IND)
                                              NRP1-MINST1 (WSv-IND)
                                              NRP1-MEMISO (WSv-IND)
                                              NRP1-MSERI1 (WSv-IND)
           END-PERFORM.
      *
      *****************************************************************
      * RECIBE PANTALLA PRIMERA                                       *
      *****************************************************************
       9510-RECIBE-PANTALLA.
      *
      *    EXEC CICS RECEIVE
      *         MAP('ZMHW791')
      *         MAPSET('ZMHW791')
      *         RESP (W000-RESP)
      *    END-EXEC.
      *
           MOVE nrp1-MCOM                  TO WS-STRING-ENTRADA
           MOVE wsc-10                     TO WS-LONG-STRING
           PERFORM 9886-ALINEA-STRING-IZQ
           MOVE WS-STRING-SALIDA           TO nrp1-MCOM WC-COMANDO
      *
           IF W000-RESP = DFHRESP(MAPFAIL)
              MOVE wsc-cursor              TO nrp1-MCOML
              PERFORM 9221-PREPARAR-DATOS-ENCA
              MOVE wsc-0                   TO WM-CODIGO
              MOVE 'FALLO PANTALLA '       TO W9510-MSG
              PERFORM 9520-ENVIAR-PANTALLA
           END-IF.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9520-ENVIAR-PANTALLA.
      *
           IF WM-CODIGO = wsc-0
              CONTINUE
           ELSE
              PERFORM 9200-MENSAJE-ERROR
              MOVE WM-MENSAJE              TO W9510-MSG
           END-IF.
      *
           IF WM-CODIGO = wsc-100 OR wsc-922 OR wsc-2019
              MOVE 'B) BORRAR'             TO nrp1-MSG1(wsc-1:wsc-9)
           END-IF.
      *
           IF SELECCION-OK
              MOVE wsc-B                   TO NRP1-MSELEC(WC-IND)
           END-IF.
      *
           PERFORM 9221-PREPARAR-DATOS-ENCA.
           MOVE W9510-MSG              TO nrp1-MSG2.
           MOVE WC-COMANDO             TO nrp1-MCOM.
      *    MOVE DFHBMFSE               TO MCOM1F.
      *
      *    EXEC CICS SEND
      *         MAP('ZMHW791')
      *         MAPSET('ZMHW791')
      *         CURSOR
      *         ERASE
      *    END-EXEC
      *
      *    PERFORM 9000-REINICIO.
      *
      *****************************************************************
      * PROCESA CONSULTA DE CUENTAS SOBREGIRADAS                      *
      *****************************************************************
       9600-ESTADO-CONTINUACION.
      *
           PERFORM 9510-RECIBE-PANTALLA.
      *
           EVALUATE EIBAID
              WHEN DFHENTER
                 PERFORM 9300-USER-FECHA-HORA
                 PERFORM 9613-VALIDAR-USUARIO
      *
                 IF WM-CODIGO = wsc-0
                    PERFORM 9614-VALIDAR-DATOS
                 END-IF
      *
                 IF WM-CODIGO = wsc-0
                    IF MODIFICO-OK
                       PERFORM 8000-LIMPIAR-PANTALL2
                       PERFORM 9620-CONSULTAR-CARTAS
      *
                       IF WM-CODIGO = wsc-0 AND WC-ESTADO = wsc-2
                          PERFORM 9622-PROTEGER-MAPA
                          MOVE 2019       TO WM-CODIGO
                          MOVE wsc-cursor  TO nrp1-MCOML
                       ELSE
                          PERFORM 9623-DESPROTEGER-MAPA
                       END-IF
      *
                    ELSE
                       IF SELECCION-OK
                          PERFORM 9622-PROTEGER-MAPA
                          MOVE 0105        TO WM-CODIGO
                          MOVE wsc-cursor  TO nrp1-MCOML
                       ELSE
                          PERFORM 9623-DESPROTEGER-MAPA
                          MOVE 922     TO WM-CODIGO
                          MOVE wsc-cursor  TO nrp1-MCOML
                       END-IF
                    END-IF
      *
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    PERFORM 9623-DESPROTEGER-MAPA
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF2
                 IF nrp1-MCOM NOT = SPACES
                    MOVE wsc-0             TO WC-ESTADO
                    MOVE nrp1-MCOM         TO MM-COMANDO
                    MOVE WC-WAPLIC         TO MM-WAPLIC
                    PERFORM 9900-TRANSFIERE
                    MOVE wsc-cursor        TO nrp1-MCOML
                    MOVE MM-CODIGO         TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109 TO WM-CODIGO
                    MOVE wsc-cursor        TO nrp1-MCOML
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF3
                 IF nrp1-MCOM = SPACES
                    MOVE WC-WAPLIC         TO MM-WAPLIC
                    MOVE SPACES            TO MM-COMANDO
                    MOVE 0                 TO WC-ESTADO
                    PERFORM 9900-TRANSFIERE
                    MOVE wsc-cursor        TO nrp1-MCOML
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109               TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    MOVE  wsc-0            TO nrp1-MCONTRAL
                    MOVE wsc-cursor        TO nrp1-MCOML
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF5
      *            MOVE wsc-1              TO WC-HOJA
                   MOVE SPACES             TO SW-MODIFICO-OK
                                              SW-SELECCION-OK
                   PERFORM 8000-LIMPIAR-PANTALL1
                   PERFORM 8000-LIMPIAR-PANTALL2
                   MOVE wsc-1              TO WC-ESTADO
                   MOVE SPACES             TO MM-COMANDO
                   MOVE WC-WAPLIC          TO MM-WAPLIC
                   PERFORM 9300-USER-FECHA-HORA
                   PERFORM 9221-PREPARAR-DATOS-ENCA
                   MOVE 100            TO WM-CODIGO
                   PERFORM 9520-ENVIAR-PANTALLA
              WHEN OTHER
                   MOVE 109                TO WM-CODIGO
                   MOVE wsc-cursor         TO nrp1-MCOML
                   PERFORM 9221-PREPARAR-DATOS-ENCA
                   MOVE wsc-0              TO nrp1-MCONTRAL
                   MOVE wsc-cursor         TO nrp1-MCOML
                   PERFORM 9520-ENVIAR-PANTALLA
           END-EVALUATE.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9613-VALIDAR-USUARIO.
      *
           INITIALIZE W015-ZMWSR468.
           MOVE FH-USUARIO                 TO UO-USUARIO.
           MOVE FH-HORA                    TO UO-HOPERA.
           MOVE WC-TFECHOY                 TO UO-FOPERA.
           MOVE 50040                      TO UO-IOPERA.
      *
           EXEC CICS
              LINK PROGRAM(wsc-ZM9RH468)
              COMMAREA    (UO-USUARIO-OPERACION)
              LENGTH      (LENGTH  OF UO-USUARIO-OPERACION)
           END-EXEC.
      *
           IF UO-WCODRET = wsc-0
              CONTINUE
           ELSE
              MOVE UO-WCODRET              TO WM-CODIGO
           END-IF.
      *
      *****************************************************************
      * VALIDA QUE LOS CAMPOS MODIFICADOS SEAN CONSISTENTES           *
      *****************************************************************
       9614-VALIDAR-DATOS.
      *
           PERFORM VARYING WSv-IND FROM wsc-1 BY wsc-1
                                  UNTIL WSv-IND > wsc-10 OR
                                                    SELECCION-OK
              IF NRP1-MSELEC(WSv-IND) = wsc-B
                 SET SELECCION-OK          TO TRUE
                 MOVE SPACES               TO nrp1-MCONTRA
                                              nrp1-MGRUPO
                                              nrp1-MEMISOR
                                              nrp1-MSERIE
                                              nrp1-MINSTR
                 MOVE wsc-2                TO WC-ESTADO
                 MOVE NRP1-MCONTR(WSv-IND) TO WC-ICUENTA
                 MOVE NRP1-MGRUP1(WSv-IND) TO WC-GRUPO
                 MOVE NRP1-MINST1(WSv-IND) TO WC-INSTRUMENTO
                 MOVE NRP1-MEMISO(WSv-IND) TO WC-IEMISORA
                 MOVE NRP1-MSERI1(WSv-IND) TO WC-ISERIE
                 MOVE WSv-IND              TO WC-IND
              END-IF
           END-PERFORM.
      *
           IF SELECCION-OK
              CONTINUE
           ELSE
              PERFORM 9615-VALIDAR-CANTIDADES
           END-IF.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9615-VALIDAR-CANTIDADES.
      *
           MOVE nrp1-MCONTRA               TO W9350-IMP-ALFA.
           MOVE WSC-7                      TO W9350-ENTEROS.
           MOVE WSC-0                      TO W9350-DECIMALES.
           MOVE spaces                     TO W9350-REDONDEO.
           PERFORM 9350-VALIDA-CANTIDAD.
      *
           IF W9350-MSGERROR = SPACES
              MOVE W9350-IMP-00DEC     TO ICUENTA OF DCLCUENTA
              IF ICUENTA OF DCLCUENTA > WSC-0
                 PERFORM 9616-BUSCAR-CUENTA
              END-IF
           ELSE
              IF W9350-CODIGO = wsc-0
                 MOVE 1475                 TO WM-CODIGO
                 MOVE 'ERROR EN DATO NUMERICO' TO nrp1-MSG1
                 MOVE wsc-cursor           TO nrp1-MCONTRAL
                 MOVE DFHRED               TO nrp1-MCONTRa
              END-IF
           END-IF.
      *
           MOVE nrp1-MGRUPO                TO W9350-IMP-ALFA
           MOVE wsc-1                      TO W9350-ENTEROS
           MOVE wsc-0                      TO W9350-DECIMALES
           MOVE spaces                     TO W9350-REDONDEO
           PERFORM 9350-VALIDA-CANTIDAD
      *
           IF W9350-MSGERROR = SPACES
              CONTINUE
           ELSE
              IF W9350-CODIGO = wsc-0
                 MOVE 1475             TO WM-CODIGO
                 MOVE 'ERROR EN DATO NUMERICO' TO nrp1-MSG1
                 MOVE wsc-cursor           TO nrp1-MGRUPOL
      *?????????          MOVE DFHRED           TO MGRUPOC
                 MOVE DFHRED           TO nrp1-MGRUPOa
              END-IF
           END-IF.
      *
           IF WM-CODIGO = wsc-0
              SET MODIFICO-OK          TO TRUE
           END-IF.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9616-BUSCAR-CUENTA.
      *
           EXEC SQL
              SELECT
                 NOMBRE,
                 NAPELL1,
                 NAPELL2,
                 IEMPR
              INTO
                :DCLCUENTA.NOMBRE,
                :DCLCUENTA.NAPELL1,
                :DCLCUENTA.NAPELL2,
                :DCLCUENTA.IEMPR
              FROM  CUENTA
              WHERE ICUENTA  = :DCLCUENTA.ICUENTA
           END-EXEC.
      *
           INITIALIZE AB-REG.
           MOVE W000-PROG             TO AB-WAPLIC.
           MOVE '9616-BUSCAR-CUENTA'  TO AB-WPROCESO.
           MOVE 'ERROR SELECT CUENTA' TO AB-WMENS1.
           PERFORM 9600-VALIDA-SQL.
      *
           IF SQLCODE = wsc-0
              MOVE NOMBRE  OF DCLCUENTA   TO WSv-STR
              MOVE NAPELL1 OF DCLCUENTA   TO WSv-STR(wsc-21:wsc-40)
              MOVE NAPELL2 OF DCLCUENTA   TO WSv-STR(wsc-61:wsc-20)
              PERFORM 9617-COMPACTAR-NOMBRE
              MOVE WSv-AUX                TO WC-NOMBRE
           ELSE
              MOVE 0018               TO WM-CODIGO
              MOVE 'SQLCODE 100 CUENTA'  TO nrp1-MSG1
              MOVE wsc-cursor              TO nrp1-MCONTRAL
              MOVE DFHRED             TO nrp1-MCONTRAa
           END-IF.
      *
      *****************************************************************
      *
      *****************************************************************
       9617-COMPACTAR-NOMBRE.
      *
           SET wss-88-PRIMERO-NO           TO TRUE
           MOVE spaces                     TO WSv-AUX
           MOVE wsc-0                      TO WSv-SIZE
           MOVE wsc-0                      TO WSv-I
      *
           PERFORM UNTIL WSv-I >= wsc-25
                      OR WSv-I >= LENGTH OF WSv-STR
              ADD wsc-1                    TO WSv-I
              IF wss-88-PRIMERO-SI OR (WSv-STR(WSv-I:wsc-1) NOT
                                                               = spaces)
                 ADD wsc-1                 TO WSv-SIZE
                 MOVE WSv-STR(WSv-I:wsc-1) TO WSv-AUX(WSv-SIZE:wsc-1)
                 IF WSv-STR(WSv-I:wsc-1) = spaces
                    SET wss-88-PRIMERO-NO  TO TRUE
                 ELSE
                    SET wss-88-PRIMERO-SI  TO TRUE
                 END-IF
              END-IF
           END-PERFORM.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9620-CONSULTAR-CARTAS.
      *
           PERFORM 96200-MOVER-PARAMS.
           PERFORM 96201-ABRIR-C-ZMDT606.
           PERFORM 96202-LEER-C-ZMDT606.
      *
           IF wss-88-FIN-ZMDT606
              IF WSv-IND = wsc-0
                 MOVE wsc-2                TO WC-ESTADO
              ELSE
                 MOVE 548              TO WM-CODIGO
                 MOVE wsc-cursor           TO nrp1-MCOML
              END-IF
           ELSE
              PERFORM 96203-PROCESAR-CARTAS VARYING WSv-IND
                                            FROM wsc-1 BY wsc-1
                                            UNTIL WSv-IND > wsc-10
                                            OR wss-88-FIN-ZMDT606
           END-IF.
      *
           PERFORM 96204-CERRAR-C-ZMDT606.
      *
      *****************************************************************
      *
      *****************************************************************
       96200-MOVER-PARAMS.
      *
           MOVE wsc-0                      TO WSv-IND.
      *
           IF nrp1-MCONTRA = SPACES OR wsc-0 OR LOW-VALUES
              MOVE wsc-0                   TO WSv-ICUENTA
              MOVE wsc-9999999             TO ZM606-ICUENTA
              MOVE wsc-1                   TO WSv-IND
           ELSE
              MOVE nrp1-MCONTRA            TO ZM606-ICUENTA
                                              WSv-ICUENTA
                                              WC-ICUENTA
           END-IF.
      *
           IF nrp1-MGRUPO = SPACES OR 0 OR LOW-VALUES
              MOVE wsc-0                   TO WSv-GRUPO
              MOVE wsc-9                   TO ZM606-GRUPO
              MOVE wsc-1                   TO WSv-IND
           ELSE
              MOVE nrp1-MGRUPO             TO ZM606-GRUPO
                                              WSv-GRUPO
                                              WC-GRUPO
           END-IF.
      *
           IF nrp1-MINSTR  = SPACES OR wsc-0 OR LOW-VALUES
              MOVE wsc-A                   TO WSv-INSTRUMENTO
              MOVE wsc-ZZZZZZZZ            TO ZM606-INSTRUMENTO
              MOVE wsc-1                   TO WSv-IND
           ELSE
              MOVE nrp1-MINSTR             TO ZM606-INSTRUMENTO
                                              WSv-INSTRUMENTO
                                              WC-INSTRUMENTO
           END-IF.
      *
           IF nrp1-MEMISOR = SPACES OR wsc-0 OR LOW-VALUES
              MOVE LOW-VALUES              TO WSv-IEMISORA
              MOVE HIGH-VALUES             TO ZM606-IEMISORA
              MOVE wsc-1                   TO WSv-IND
           ELSE
              MOVE nrp1-MEMISOR            TO ZM606-IEMISORA
                                              WSv-IEMISORA
                                              WC-IEMISORA
           END-IF.
      *
           IF nrp1-MSERIE  = SPACES OR wsc-0 OR LOW-VALUES
              MOVE LOW-VALUES              TO WSv-ISERIE
              MOVE HIGH-VALUES             TO ZM606-ISERIE
              MOVE wsc-1                   TO WSv-IND
           ELSE
              MOVE nrp1-MSERIE             TO ZM606-ISERIE
                                              WSv-ISERIE
                                              WC-ISERIE
           END-IF.
      *
           MOVE wsc-BCM                    TO ZM606-IEMPR.
      *
      *****************************************************************
      *
      *****************************************************************
       96201-ABRIR-C-ZMDT606.
      *
           EXEC SQL
              OPEN C-ZMDT606
           END-EXEC.
      *
           IF SQLCODE = wsc-0
              CONTINUE
           ELSE
              INITIALIZE AB-REG
              MOVE W000-PROG                TO AB-WAPLIC
              MOVE '96201-OPEN-C-ZMDT606'   TO AB-WPROCESO
              MOVE 'ERROR AL ABRIR CURSOR'  TO AB-WMENS1
              PERFORM 9600-VALIDA-SQL
           END-IF.
      *
      *****************************************************************
      *
      *****************************************************************
       96202-LEER-C-ZMDT606.
      *
           EXEC SQL
              FETCH C-ZMDT606
                INTO
                   :ZM606-ICUENTA,
                   :ZM606-PROMOT,
                   :ZM606-GRUPO,
                   :ZM606-INSTRUMENTO,
                   :ZM606-ICONCEPT,
                   :ZM606-IEMISORA,
                   :ZM606-ISERIE,
                   :DCLCUENTA.NOMBRE,
                   :DCLCUENTA.NAPELL1,
                   :DCLCUENTA.NAPELL2,
                   :DCLCUENTA.IPROM,
                   :DCLCUENTA.ICCOSTO
           END-EXEC.
      *
           EVALUATE SQLCODE
           WHEN wsc-0
              CONTINUE
           WHEN wsc-100
              SET wss-88-FIN-ZMDT606       TO TRUE
           WHEN OTHER
              INITIALIZE AB-REG
              MOVE W000-PROG               TO AB-WAPLIC
              MOVE '96202-LEER-C-ZMDT606'  TO AB-WPROCESO
              MOVE 'ERROR FETCH C-ZMDT606' TO AB-WMENS1
              PERFORM 9600-VALIDA-SQL
           END-EVALUATE.
      *
      *****************************************************************
      *
      *****************************************************************
       96203-PROCESAR-CARTAS.
      *
           MOVE ZM606-SVIGEN           TO NRP1-MSELEC(WSv-IND).
           MOVE ZM606-ICUENTA          TO NRP1-MCONTR(WSv-IND).
           MOVE NOMBRE  OF DCLCUENTA   TO WSv-STR
           MOVE NAPELL1 OF DCLCUENTA   TO WSv-STR(wsc-21:wsc-40)
           MOVE NAPELL2 OF DCLCUENTA   TO WSv-STR(wsc-61:wsc-20)
           PERFORM 9617-COMPACTAR-NOMBRE
           MOVE WSv-AUX                TO WC-NOMBRE
           MOVE WC-NOMBRE              TO NRP1-MNOMBR(WSv-IND).
           MOVE ZM606-GRUPO            TO NRP1-MGRUP1(WSv-IND).
           MOVE ZM606-INSTRUMENTO      TO NRP1-MINST1(WSv-IND).
           MOVE ZM606-IEMISORA         TO NRP1-MEMISO(WSv-IND).
           MOVE ZM606-ISERIE           TO NRP1-MSERI1(WSv-IND).
      *
           PERFORM 96202-LEER-C-ZMDT606.
      *
      *****************************************************************
      *
      *****************************************************************
       96204-CERRAR-C-ZMDT606.
      *
           EXEC SQL
              CLOSE C-ZMDT606
           END-EXEC.
      *
           IF SQLCODE = wsc-0
              CONTINUE
           ELSE
              INITIALIZE AB-REG
              MOVE W000-PROG                   TO AB-WAPLIC
              MOVE '96204-CERRAR-C-ZMDT606'    TO AB-WPROCESO
              MOVE 'ERROR AL CERRAR CURSOR'    TO AB-WMENS1
              PERFORM 9600-VALIDA-SQL
           END-IF.
      *
      *****************************************************************
      *
      *****************************************************************
       9622-PROTEGER-MAPA.
      *
           MOVE DFHBMASF                   TO nrp1-MCONTRAa
                                              nrp1-MGRUPOa
                                              nrp1-MEMISORa
                                              nrp1-MSERIEa
                                              nrp1-MINSTRa.
      *
           PERFORM VARYING WSv-IND FROM wsc-1 BY wsc-1
                                   UNTIL WSv-IND > wsc-10
              MOVE DFHBMASF                TO NRP1-MSELECA(WSv-IND)
              MOVE DFHTURQ                 TO NRP1-MSELECA(WSv-IND)
           END-PERFORM.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9623-DESPROTEGER-MAPA.
      *
           MOVE DFHBMFSE                   TO nrp1-MCONTRAa
                                              nrp1-MGRUPOa
                                              nrp1-MEMISORa
                                              nrp1-MSERIEa
                                              nrp1-MINSTRa.
      *
           PERFORM VARYING WSv-IND FROM wsc-1 BY wsc-1
                                   UNTIL WSv-IND > wsc-10
              IF  NRP1-MCONTR(WSv-IND) = SPACES OR LOW-VALUES
                 MOVE DFHBMASF             TO NRP1-MSELEC(WSv-IND)
              ELSE
                 MOVE DFHBMFSE             TO NRP1-MSELEC(WSv-IND)
              END-IF
           END-PERFORM.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9700-ESTADO-CONFIRMACION.
      *
           PERFORM 9510-RECIBE-PANTALLA.
      *
           EVALUATE EIBAID
              WHEN DFHPF2
                 IF nrp1-MCOM NOT = SPACES
                    MOVE wsc-0             TO WC-ESTADO
                    MOVE nrp1-MCOM         TO MM-COMANDO
                    MOVE WC-WAPLIC     TO MM-WAPLIC
                    PERFORM 9900-TRANSFIERE
                    MOVE wsc-cursor        TO nrp1-MCOMl
                    MOVE MM-CODIGO     TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109 TO WM-CODIGO
                    MOVE wsc-cursor        TO nrp1-MCOMl
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF3
                 IF nrp1-MCOM = SPACES
                    MOVE WC-WAPLIC         TO MM-WAPLIC
                    MOVE SPACES            TO MM-COMANDO
                    MOVE wsc-0             TO WC-ESTADO
                    PERFORM 9900-TRANSFIERE
                    MOVE wsc-cursor        TO nrp1-MCOMl
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109           TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    MOVE wsc-0             TO nrp1-MCONTRAL
                    MOVE wsc-cursor        TO nrp1-MCOMl
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF4
                 PERFORM 9710-PROCESAR-REGISTRO
                 MOVE SPACES               TO WC-COMANDO
                 PERFORM 9221-PREPARAR-DATOS-ENCA
                 PERFORM 9520-ENVIAR-PANTALLA
              WHEN OTHER
                 MOVE WC-WAPLIC TO MM-WAPLIC
                 MOVE SPACES               TO MM-COMANDO
                 MOVE wsc-0                TO WC-ESTADO
                 MOVE 'OPERACION CANCELADA' TO W9510-MSG
                 PERFORM 9622-PROTEGER-MAPA
                 PERFORM 9221-PREPARAR-DATOS-ENCA
                 MOVE wsc-cursor       TO nrp1-MCOMl
                 PERFORM 9520-ENVIAR-PANTALLA
           END-EVALUATE.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9710-PROCESAR-REGISTRO.
      *
           MOVE EIBTRMID                   TO ZMNN-S-TERMINAL.
           MOVE WC-USUARIO                 TO ZMNN-S-USERSIVA.
           MOVE WC-IEMPR                   TO ZMNN-S-IEMPR.
           MOVE WC-IPERFIL                 TO ZMNN-S-IPERFIL.
           MOVE WC-ISUCCASA                TO ZMNN-S-ISUCCASA.
           MOVE WC-IPROM                   TO ZMNN-S-IPROM.
           MOVE SPACES                     TO ZM57-CONTRATO
           MOVE WC-ICUENTA                 TO ZM57-ICUENTA
           MOVE WC-GRUPO                   TO ZM57-GRUPO
           MOVE WC-INSTRUMENTO             TO ZM57-INSTRUMENTO
           MOVE WC-IEMISORA                TO ZM57-IEMISORA
           MOVE WC-ISERIE                  TO ZM57-ISERIE
           MOVE wsc-0                      TO ZM57-TOTAL
      *
           IF SELECCION-OK
              MOVE wsc-B                   TO ZM57-IPROCESO
           ELSE
              MOVE wsc-R                   TO ZM57-IPROCESO
           END-IF.
      *
           PERFORM 9711-LLAMAR-ZM9CRX57.
      *
           MOVE wsc-0                      TO WC-ESTADO.
      *
           IF WM-CODIGO NOT = wsc-0 OR ZMNN-C-ERRORES > wsc-0
              IF SELECCION-OK
                 MOVE wsc--1               TO NRP1-MSELECL(WC-IND)
                 MOVE DFHRED               TO NRP1-MCONTA (WC-IND)
                 MOVE DFHRED               TO NRP1-MNOMBRA(WC-IND)
                 MOVE DFHRED               TO NRP1-MGRUP1A(WC-IND)
                 MOVE DFHRED               TO NRP1-MINST1A(WC-IND)
                 MOVE DFHRED               TO NRP1-MEMISOA(WC-IND)
                 MOVE DFHRED               TO NRP1-MSERI1A(WC-IND)
              ELSE
                 MOVE wsc-cursor           TO nrp1-MCOML
              END-IF
           ELSE
              MOVE 0              TO WM-CODIGO
              MOVE 'OPERACION EFECTUADA' TO W9510-MSG
              MOVE 1              TO W9350-CODIGO
              PERFORM 9622-PROTEGER-MAPA
           END-IF.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9711-LLAMAR-ZM9CRX57.
      *
           EXEC CICS
              LINK PROGRAM (wsc-ZM9CRX57)
                 COMMAREA  (W000-ZM9CRX57)
                 LENGTH    (LENGTH OF W000-ZM9CRX57)
                 RESP  (W000-RESP)
           END-EXEC.
      *
           PERFORM 9500-VALIDA-CICS.
      *
           IF ZMNN-C-ERRORES > wsc-0
              EVALUATE TRUE
                 WHEN ZMNN-C-CODSIVA(wsc-1) > wsc-0
                    PERFORM 9712-ERROR-APLICATIVO
                 WHEN ZMNN-C-CODSQL   < wsc-0 OR ZMNN-C-CODSQL > wsc-0
                    MOVE ZMNN-C-CODSQL     TO SQLCODE
                    MOVE ZMNN-C-MENSERR    TO SQLERRM
                    INITIALIZE AB-REG
                    MOVE 'ZM9CRX57'        TO AB-WAPLIC
                    MOVE 'INSERT ZMDT606      ' TO AB-WPROCESO
                    MOVE '9711-LLAMAR-ZM9CRX57' TO AB-WMENS1
                    PERFORM 9600-VALIDA-SQL
                 WHEN ZMNN-C-CODRESP1 > wsc-0
                    MOVE ZMNN-C-CODRESP1   TO EIBRESP
                    MOVE ZMNN-C-CODRESP2   TO EIBRESP2
                    MOVE ZMNN-C-CODFN      TO EIBFN
                    MOVE ZMNN-C-RESOURCE   TO EIBRSRCE
                    PERFORM 9500-VALIDA-CICS
                 WHEN OTHER
                    MOVE ZMNN-C-MSGSIVA(wsc-1)      TO nrp1-MSG1
                    MOVE 362               TO WM-CODIGO
              END-EVALUATE
           END-IF.
      *
      *****************************************************************
      *ERROR RUTINA ZM9CRX57 MENSAJE AJE A SIVA.                      *
      *****************************************************************
       9712-ERROR-APLICATIVO.
      *
           EVALUATE ZMNN-C-CODSIVA(wsc-1)
              WHEN 3006
                 MOVE 'LA EMISORA NO EXISTE'       TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 3012
                 MOVE 'ERROR AL EJECUTAR PROG'     TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 3017
                 MOVE 'ERROR ACCESO ENTORNO CICS ' TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 3018
                 MOVE 'ERROR ACCESO BASE DE DATOS' TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 3041
                 MOVE 'TECLEE R=REG O B=BAJA'      TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 3042
                 MOVE 'LA CARTA YA EXISTE'         TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 3043
                 MOVE 'LA EMISORA NO EXISTE'       TO nrp1-MSG1
                 MOVE 362                          TO WM-CODIGO
              WHEN 0010
                 MOVE 0                            TO WM-CODIGO
                 MOVE 'OPERACION EFECTUADA'        TO W9510-MSG
                 MOVE 1                            TO W9350-CODIGO
                 PERFORM 9622-PROTEGER-MAPA
              WHEN OTHER
                 MOVE 'ERROR ZM9CRX57 OPER CAN'    TO nrp1-MSG1
                 MOVE ZMNN-C-CODSIVA(1)            TO WM-CODIGO
           END-EVALUATE.
      *
      *****************************************************************
      *9000-INICIO                                                    *
      *****************************************************************
      *    EXEC SQL
      *        INCLUDE ZMWSCOM0
      *    END-EXEC.
           EXEC SQL
               INCLUDE ZMWSCOM1
           END-EXEC.
      *****************************************************************
      *9200-MENSAJE-ERROR                                             *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC002
           END-EXEC.
      *****************************************************************
      *9300-USER-FECHA-HORA                                           *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC003
           END-EXEC.
      *****************************************************************
      *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC015
           END-EXEC.
      *****************************************************************
      *9350-VALIDA-CANTIDAD                                           *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC016
           END-EXEC.
      *****************************************************************
      *300000-TERMINA                                                 *
      *****************************************************************
       300000-TERMINA.
           move ZM99-SALIDA                to WXR99-DAT-SAL
           EXEC CICS
                RETURN
           END-EXEC.
      *****************************************************************
      *9500-VALIDA-CICS                                               *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC005
           END-EXEC.
      *****************************************************************
      *9600-VALIDA-SQL                                                *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC006
           END-EXEC.
      *****************************************************************
      *9800-ABORTA                                                    *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC008
           END-EXEC.
      *****************************************************************
      *9900-TRANSFIERE                                                *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC009
           END-EXEC.
