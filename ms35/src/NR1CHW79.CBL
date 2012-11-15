      *****************************************************************
      *                       IDENTIFICATION DIVISION                 *
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
      *****************************************************************
       PROGRAM-ID.   NR1CHW79.
       AUTHOR.       AZERTIA (F.V.C.).
       DATE-WRITTEN. NOVIEMBRE 2006.
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
             10 ZM57-CONTRATO            PIC  X(10).
             10 ZM57-ICUENTA             PIC  9(07).
             10 ZM57-GRUPO               PIC  X(01).
             10 ZM57-INSTRUMENTO         PIC  X(08).
             10 ZM57-IEMISORA            PIC  X(07).
             10 ZM57-ISERIE              PIC  X(08).
             10 ZM57-IPROCESO            PIC  X(01).
             10 ZM57-TOTAL               PIC  9(04).
             10 FILLER                OCCURS 20.
                15 ZM57-REG              PIC  X(95).
      *
      *
       01 SWITCHES.
      *
          05 SW-FIN-ZMDT606              PIC X(02) VALUE SPACES.
             88 FIN-ZMDT606                         VALUE 'SI'.
          05 SW-PRIMERO-RC               PIC  9(01) VALUE 0.
             88 PRIMERO-NO                   VALUE 0.
             88 PRIMERO-SI                   VALUE 1.
      *
      *****************************************************************
      *                       IDENTIFICADOR INICIO WORKING-STORAGE    *
      *****************************************************************
       01  LT-INICIO-WS.
           05 LT-INICIO-W                PIC X(50) VALUE
              '*** INICIO WORKING STORAGE (NR1CHW79) ***'.

      *
      *****************************************************************
      * VARS.                                                         *
      *****************************************************************
       01 WS-COMPACTA.
          05 WS-I                      PIC  9(04) VALUE 0.
          05 WS-SIZE                   PIC  9(04) VALUE 0.
          05 WS-STR                    PIC  X(200) VALUE SPACES.
          05 WS-AUX                    PIC  X(200) VALUE SPACES.
       01 WS-CONT                      PIC  9(03)  VALUE 0.
       01 WS-ICUENTA                   PIC S9(7)V USAGE COMP-3 VALUE 0.
       01 WS-GRUPO                     PIC S9(1)V USAGE COMP-3 VALUE 0.
       01 WS-INSTRUMENTO               PIC X(8) VALUE ' '.
       01 WS-IEMISORA                  PIC X(7) VALUE ' '.
       01 WS-ISERIE                    PIC X(8) VALUE ' '.
       01 WS-CANTIDAD                  PIC  9(02)V9999 VALUE 0.
       01 WS-CANTIDAD1 REDEFINES WS-CANTIDAD.
          05 WS-ENTEROS                PIC  9(02).
          05 WS-DECIMALES              PIC  V9999.
       01 WS-IND                       PIC  9(04)  VALUE 0.
       01 WS-IND3                      PIC  9(04)  VALUE 0.
       01 WS-ATTRIB-BRT                PIC  X(01)  VALUE 'Z'.
      *
       01 W000-PROG                    PIC X(08) VALUE 'NR1CHW79'.
       01 W000-USUARIO                 PIC X(08) VALUE SPACES.
       01 W000-RESP                    PIC S9(8) COMP VALUE 0.
       01 W000-OPC                     PIC X(03) VALUE '661'.
       01 W000-TRANSID                 PIC X(04) VALUE 'Z122'.
      *
       01 W0000-USUARIO                PIC X(08).
       01 W9510-MSG                    PIC X(74) VALUE SPACES.
       01 WS-ZEROES                    PIC ZZZ,ZZZ,ZZ9.
      *
      *****************************************************************
      *                       REGISTRO COMUNICACION ENTRE COBCICS-CSP *
      *****************************************************************
           COPY NRWCOM11.
      *
           05  WC-ADICIONAL.
               10 WC-CODIGO            PIC 9(04) VALUE 0.
               10 WC-COMANDO           PIC X(010).
               10 WC-USUARIO           PIC X(008).
      *
               10 WC-OPC               PIC X(001).
               10 WC-NAUT              PIC X(001).
      *
           05  WC-ADICIONA1.
               10 WC-HOJA              PIC 9(003).
               10 WC-IND               PIC 9(004) VALUE 0.
               10 SW-MODIFICO-OK       PIC X(02) VALUE ' '.
                  88 MODIFICO-OK                 VALUE 'SI'.
               10 SW-SELECCION-OK       PIC X(02) VALUE ' '.
                  88 SELECCION-OK                 VALUE 'SI'.
               10 WC-ICUENTA           PIC 9(07) VALUE 0.
               10 WC-NOMBRE            PIC X(25) VALUE ' '.
               10 WC-GRUPO             PIC X(01) VALUE ' '.
               10 WC-INSTRUMENTO       PIC X(08) VALUE ' '.
               10 WC-IEMISORA          PIC X(07) VALUE ' '.
               10 WC-ISERIE            PIC X(08) VALUE ' '.
      *
      *****************************************************************
      *                       R U T I N A S                           *
      *****************************************************************
       01  RUT-RUTINAS.
           05 RUT-ZM9RH468             PIC X(08) VALUE 'ZM9RH468'.
           05 RUT-ZM9CR489             PIC X(08) VALUE 'ZM9CR489'.
           05 RUT-ZM9CRX57             PIC X(08) VALUE 'ZM9CRX57'.
      *
       01  CICS-RESP-CODE              PIC S9(08)      VALUE +0.
           88 CICS-NORMAL              VALUE +00.
           88 CICS-NOTFND              VALUE +13.
           88 CICS-DUPREC              VALUE +14.
           88 CICS-INVREQ              VALUE +16.
           88 CICS-NOSPACE             VALUE +18.
           88 CICS-NOTOPEN             VALUE +19.
           88 CICS-ENDFILE             VALUE +20.
           88 CICS-LENGERR             VALUE +22.
           88 CICS-QZERO               VALUE +23.
           88 CICS-QBUSY               VALUE +25.
           88 CICS-ITEMERR             VALUE +26.
           88 CICS-PGMIDERR            VALUE +27.
           88 CICS-ENDDATA             VALUE +29.
           88 CICS-MAPFAIL             VALUE +36.
           88 CICS-QIDERR              VALUE +44.
           88 CICS-ENQBUSY             VALUE +55.
           88 CICS-DISABLE             VALUE +84.

      *****************************************************************
      *                       COPYS AREAS TRABAJO                     *
      *****************************************************************
      *                       IDENTIFICADORES DE ATENCION
           COPY DFHAID.
      *                       ESTANDAR DE ATRIBUTOS
           COPY DFHBMSCA.
      *                       INF. VARIABLES DEL MAPA 01
           COPY ZMHW791.
       01  MAPA-1 REDEFINES ZMHW791I.
           05 FILLER                   PIC X(218).
           05 LINEA                    OCCURS 10 TIMES.
              10 MSELECL               COMP  PIC  S9(4).
              10 MSELECF               PIC X(01).
              10 MSELECC               PIC X(01).
              10 MSELECP               PIC X(01).
              10 MSELECH               PIC X(01).
              10 MSELECV               PIC X(01).
              10 MSELEC                PIC X(01).
              10 MCONTRL               COMP  PIC  S9(4).
              10 MCONTRF               PIC X(01).
              10 MCONTRC               PIC X(01).
              10 MCONTRP               PIC X(01).
              10 MCONTRH               PIC X(01).
              10 MCONTRV               PIC X(01).
              10 MCONTR                PIC X(07).
              10 MNOMBRL               COMP  PIC  S9(4).
              10 MNOMBRF               PIC X(01).
              10 MNOMBRC               PIC X(01).
              10 MNOMBRP               PIC X(01).
              10 MNOMBRH               PIC X(01).
              10 MNOMBRV               PIC X(01).
              10 MNOMBR                PIC X(25).
              10 MGRUP1L               COMP  PIC  S9(4).
              10 MGRUP1F               PIC X(01).
              10 MGRUP1C               PIC X(01).
              10 MGRUP1P               PIC X(01).
              10 MGRUP1H               PIC X(01).
              10 MGRUP1V               PIC X(01).
              10 MGRUP1                PIC X(01).
              10 MINST1L               COMP  PIC  S9(4).
              10 MINST1F               PIC X(01).
              10 MINST1C               PIC X(01).
              10 MINST1P               PIC X(01).
              10 MINST1H               PIC X(01).
              10 MINST1V               PIC X(01).
              10 MINST1                PIC X(08).
              10 MEMISOL               COMP  PIC  S9(4).
              10 MEMISOF               PIC X(01).
              10 MEMISOC               PIC X(01).
              10 MEMISOP               PIC X(01).
              10 MEMISOH               PIC X(01).
              10 MEMISOV               PIC X(01).
              10 MEMISO                PIC X(07).
              10 MSERI1L               COMP  PIC  S9(4).
              10 MSERI1F               PIC X(01).
              10 MSERI1C               PIC X(01).
              10 MSERI1P               PIC X(01).
              10 MSERI1H               PIC X(01).
              10 MSERI1V               PIC X(01).
              10 MSERI1                PIC X(08).
           05 MCOM1L                   COMP  PIC  S9(4).
           05 MCOM1F                   PIC X(01).
           05 MCOM1C                   PIC X(01).
           05 MCOM1P                   PIC X(01).
           05 MCOM1H                   PIC X(01).
           05 MCOM1V                   PIC X(01).
           05 MCOM1                    PIC X(10).
           05 FILLER                   PIC X(88).
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
       01  W010-ZMWSZ403.
           COPY ZMWSZ403.
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
      *
      ******************************************************************
      *    TABLAS.
      ******************************************************************
      *
           EXEC SQL
              INCLUDE SQLCA
           END-EXEC.
      *
      ******************************************************************
      *    TABLA DE CUENTAS
      ******************************************************************
      *
           EXEC SQL
              INCLUDE ZCUENTA
           END-EXEC.
      *
      ******************************************************************
      *    TABLA DE PARAMETROS
      ******************************************************************
      *
           EXEC SQL
              INCLUDE ZPARAM
           END-EXEC.
      *
      ******************************************************************
      *    TABLA DE EMPRESA
      ******************************************************************
      *
           EXEC SQL
              INCLUDE ZEMPRESA
           END-EXEC.
      *
      ******************************************************************
      *    TABLA DE ORDENES
      ******************************************************************
      *
           EXEC SQL
              INCLUDE ZZMDT606
           END-EXEC.
      *
      ******************************************************************
      *    DECLARACION DE CURSORES
      ******************************************************************
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
              WHERE  (A.ZM606_ICUENTA     >= :WS-ICUENTA
                 AND  A.ZM606_ICUENTA     <= :ZM606-ICUENTA)
                 AND (A.ZM606_GRUPO       >= :WS-GRUPO
                 AND  A.ZM606_GRUPO       <= :ZM606-GRUPO)
                 AND (A.ZM606_INSTRUMENTO >= :WS-INSTRUMENTO
                 AND  A.ZM606_INSTRUMENTO <= :ZM606-INSTRUMENTO)
                 AND (A.ZM606_IEMISORA    >= :WS-IEMISORA
                 AND  A.ZM606_IEMISORA    <= :ZM606-IEMISORA)
                 AND (A.ZM606_ISERIE      >= :WS-ISERIE
                 AND  A.ZM606_ISERIE      <= :ZM606-ISERIE)
                 AND  A.ZM606_ICUENTA      = B.ICUENTA
                 AND  A.ZM606_IEMPR        = :ZM606-IEMPR
                 AND  A.ZM606_SVIGEN       = 'A'
                 ORDER BY A.ZM606_PROMOT,A.ZM606_ICUENTA,A.ZM606_GRUPO,
                 A.ZM606_INSTRUMENTO,A.ZM606_ICONCEPT,A.ZM606_IEMISORA,
                 A.ZM606_ISERIE
           END-EXEC.
      *
      ******************************************************************
      *  LINKAGE SECTION                                               *
      ******************************************************************
       LINKAGE SECTION.
      *
       01  DFHCOMMAREA.
           05 L000-COMMAREA            PIC X(19287).

      *****************************************************************
      *                       PROCEDURE DIVISION                      *
      *****************************************************************
       PROCEDURE DIVISION.
      *
           PERFORM 9000-INICIO.
           PERFORM 9200-PROCESO.
           PERFORM 9400-RETURN.
      *
      *****************************************************************
      * PROCESA LOS DIFERENTES ESTADOS POR LOS QUE PASA EL PROGRAMA   *
      *****************************************************************
       9200-PROCESO.
      *
           EVALUATE WC-ESTADO
              WHEN 0
                 PERFORM 9300-USER-FECHA-HORA
      *
                 MOVE SPACES              TO WC-COMANDO
                 MOVE SPACES              TO SW-SELECCION-OK
                 MOVE SPACES              TO SW-MODIFICO-OK
                 MOVE FH-USUARIO          TO WC-USUARIO
                 MOVE 1                   TO MHOJAO
                 MOVE 1                   TO WC-HOJA
      *
                 PERFORM 9210-VALIDAR-AUTORIDAD
                 PERFORM 8000-LIMPIAR-PANTALL1
                 PERFORM 8000-LIMPIAR-PANTALL2
      *          PERFORM 9220-ENVIAR-PANTALLA
                 PERFORM 9520-ENVIAR-PANTALLA
              WHEN 1
                 PERFORM 9600-ESTADO-CONTINUACION
              WHEN 2
                 PERFORM 9700-ESTADO-CONFIRMACION
              WHEN OTHER
                 MOVE 0                   TO WC-ESTADO
      *          PERFORM 9220-ENVIAR-PANTALLA
                 PERFORM 9520-ENVIAR-PANTALLA
           END-EVALUATE.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9210-VALIDAR-AUTORIDAD.
      *
           INITIALIZE W040-ZMWSR489.
           MOVE WC-USUARIO             TO NA-IUSUARIO.
      *
           EXEC CICS
               LINK PROGRAM     (RUT-ZM9CR489)
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
           IF NA-WCODRET = 0
              MOVE NA-NIVEL-AUTOR   TO WC-NAUT
              MOVE 1                TO WC-ESTADO
           ELSE
              MOVE 112              TO WM-CODIGO
              MOVE -1               TO MCONTRAL
           END-IF.
      *
           MOVE WC-USUARIO          TO W000-USUARIO.
      *
      *****************************************************************
      * ENVIA PANTALLA DE CONSULTA                                    *
      *****************************************************************
      *9220-ENVIAR-PANTALLA.
      *
      *    IF WM-CODIGO = 0
      *       CONTINUE
      *    ELSE
      *       PERFORM 9200-MENSAJE-ERROR
      *       MOVE WM-MENSAJE          TO W9510-MSG
      *    END-IF.
      *
      *    IF WM-CODIGO = 100 OR 922 OR 2019
      *       MOVE 'B) BORRAR'         TO MSG1O(1:9)
      *    END-IF.
      *
      *    MOVE DFHBMASF               TO MSG0F.
      *    MOVE W9510-MSG              TO MSG2O.
      *    MOVE WC-COMANDO             TO MCOMO.
      *    MOVE DFHBMFSE               TO MCOM1F.
      *
      *    PERFORM 9221-PREPARAR-DATOS-ENCA.
      *
      *    EXEC CICS SEND
      *         MAP('ZMHW791')
      *         MAPSET('ZMHW791')
      *         CURSOR
      *         ERASE
      *    END-EXEC.
      *
      *    PERFORM 9000-REINICIO.
      *
      *****************************************************************
      * MUEVE DATOS DEL ENCABEZADO.                                   *
      *****************************************************************
       9221-PREPARAR-DATOS-ENCA.
      *
           MOVE WC-PGMID               TO MPGMIDO.
           MOVE WC-EMPRESA             TO MCIAO.
           MOVE WC-USUARIO             TO MUSERO.
           MOVE FH-FECHA-10            TO MFECHAO.
           MOVE EIBTRMID               TO MTERMO.
           MOVE FH-HORA                TO MHORAO.
           MOVE WC-HOJA                TO MHOJAO.
      *
           IF WM-CODIGO = 0 OR WM-CODIGO < 0 OR WM-CODIGO = 100
              MOVE -1                  TO MCONTRAL
           END-IF.
      *
      *****************************************************************
      * RECIBE PANTALLA PRIMERA                                       *
      *****************************************************************
       9310-RECIBIR-PANTALLA.
      *
           EXEC CICS RECEIVE
                MAP('ZMHW791')
                MAPSET('ZMHW791')
                RESP (W000-RESP)
           END-EXEC.
      *
           MOVE MCOMI                       TO WS-STRING-ENTRADA
           MOVE 10                          TO WS-LONG-STRING
           PERFORM 9886-ALINEA-STRING-IZQ
           MOVE WS-STRING-SALIDA            TO MCOMI MCOMO WC-COMANDO
      *
           IF W000-RESP = DFHRESP(MAPFAIL)
              MOVE -1                  TO MCOML
              PERFORM 9520-ENVIAR-PANTALLA
           END-IF.
      *
      *****************************************************************
      * INICIALIZA PANTALLA                                           *
      *****************************************************************
       8000-LIMPIAR-PANTALL1.
      *
           MOVE SPACES                TO MCONTRAO
                                         MGRUPOO
                                         MEMISORO
                                         MSERIEO
                                         MINSTRO.
      *
           MOVE DFHBMFSE              TO MCONTRAF
                                         MGRUPOF
                                         MEMISORF
                                         MSERIEF
                                         MINSTRF.
      *
      *****************************************************************
      * INICIALIZA PANTALLA                                           *
      *****************************************************************
       8000-LIMPIAR-PANTALL2.
      *
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND > 10
              MOVE DFHBMASF           TO MSELECF(WS-IND)
                                         MCONTRF(WS-IND)
                                         MNOMBRF(WS-IND)
                                         MGRUP1F(WS-IND)
                                         MINST1F(WS-IND)
                                         MEMISOF(WS-IND)
                                         MSERI1F(WS-IND)
              MOVE SPACES             TO MSELEC (WS-IND)
                                         MCONTR (WS-IND)
                                         MNOMBR (WS-IND)
                                         MGRUP1 (WS-IND)
                                         MINST1 (WS-IND)
                                         MEMISO (WS-IND)
                                         MSERI1 (WS-IND)
           END-PERFORM.
      *
      *    MOVE DFHBMASF              TO MSG0F.
      *
      *****************************************************************
      * RECIBE PANTALLA PRIMERA                                       *
      *****************************************************************
       9510-RECIBE-PANTALLA.
      *
           EXEC CICS RECEIVE
                MAP('ZMHW791')
                MAPSET('ZMHW791')
                RESP (W000-RESP)
           END-EXEC.
      *
           MOVE MCOMI                       TO WS-STRING-ENTRADA
           MOVE 10                          TO WS-LONG-STRING
           PERFORM 9886-ALINEA-STRING-IZQ
           MOVE WS-STRING-SALIDA            TO MCOMI MCOMO WC-COMANDO
      *
           IF W000-RESP = DFHRESP(MAPFAIL)
              MOVE -1                  TO MCOML
              PERFORM 9221-PREPARAR-DATOS-ENCA
              MOVE 0                   TO WM-CODIGO
              MOVE 'FALLO PANTALLA '   TO W9510-MSG
              PERFORM 9520-ENVIAR-PANTALLA
           END-IF.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9520-ENVIAR-PANTALLA.
      *
           IF WM-CODIGO = 0
              CONTINUE
           ELSE
              PERFORM 9200-MENSAJE-ERROR
              MOVE WM-MENSAJE          TO W9510-MSG
           END-IF.
      *
           IF WM-CODIGO = 100 OR 922 OR 2019
              MOVE 'B) BORRAR'         TO MSG1O(1:9)
           END-IF.
      *
           IF SELECCION-OK
              MOVE 'B'                 TO MSELEC(WC-IND)
           END-IF.
      *
           PERFORM 9221-PREPARAR-DATOS-ENCA.
      *    MOVE DFHBMASF               TO MSG0F.
           MOVE W9510-MSG              TO MSG2O.
           MOVE WC-COMANDO             TO MCOMO.
           MOVE DFHBMFSE               TO MCOM1F.
      *
           EXEC CICS SEND
                MAP('ZMHW791')
                MAPSET('ZMHW791')
                CURSOR
                ERASE
           END-EXEC
      *
           PERFORM 9000-REINICIO.
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
                 IF WM-CODIGO = 0
                    PERFORM 9614-VALIDAR-DATOS
                 END-IF
      *
                 IF WM-CODIGO = 0
                    IF MODIFICO-OK
                       PERFORM 8000-LIMPIAR-PANTALL2
                       PERFORM 9620-CONSULTAR-CARTAS
      *
                       IF WM-CODIGO = 0 AND WC-ESTADO = 2
                          PERFORM 9622-PROTEGER-MAPA
                          MOVE 2019       TO WM-CODIGO
                          MOVE -1         TO MCOML
                       ELSE
                          PERFORM 9623-DESPROTEGER-MAPA
                       END-IF
      *
                    ELSE
                       IF SELECCION-OK
                          PERFORM 9622-PROTEGER-MAPA
                          MOVE 0105       TO WM-CODIGO
                          MOVE -1         TO MCOML
                       ELSE
                          PERFORM 9623-DESPROTEGER-MAPA
                          MOVE 922     TO WM-CODIGO
                          MOVE -1      TO MCOML
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
                 IF MCOMI NOT = SPACES
                    MOVE 0             TO WC-ESTADO
                    MOVE MCOMO         TO MM-COMANDO
                    MOVE WC-WAPLIC     TO MM-WAPLIC
                    PERFORM 9900-TRANSFIERE
                    MOVE -1            TO MCOML
                    MOVE MM-CODIGO     TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109 TO WM-CODIGO
                    MOVE -1            TO MCOML
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF3
                 IF MCOMI = SPACES
                    MOVE WC-WAPLIC     TO MM-WAPLIC
                    MOVE SPACES        TO MM-COMANDO
                    MOVE 0             TO WC-ESTADO
                    PERFORM 9900-TRANSFIERE
                    MOVE -1            TO MCOML
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109           TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    MOVE  0            TO MCONTRAL
                    MOVE -1            TO MCOML
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF5
                   MOVE 1              TO WC-HOJA
                   MOVE SPACES         TO SW-MODIFICO-OK
                                          SW-SELECCION-OK
                   PERFORM 8000-LIMPIAR-PANTALL1
                   PERFORM 8000-LIMPIAR-PANTALL2
                   MOVE 1              TO WC-ESTADO
                   MOVE SPACES         TO MM-COMANDO
                   MOVE WC-WAPLIC      TO MM-WAPLIC
                   PERFORM 9300-USER-FECHA-HORA
                   PERFORM 9221-PREPARAR-DATOS-ENCA
                   MOVE 100            TO WM-CODIGO
                   PERFORM 9520-ENVIAR-PANTALLA
              WHEN OTHER
                   MOVE 109            TO WM-CODIGO
                   MOVE -1             TO MCOML
                   PERFORM 9221-PREPARAR-DATOS-ENCA
                   MOVE 0              TO MCONTRAL
                   MOVE -1             TO MCOML
                   PERFORM 9520-ENVIAR-PANTALLA
           END-EVALUATE.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9613-VALIDAR-USUARIO.
      *
           INITIALIZE W015-ZMWSR468.
           MOVE FH-USUARIO             TO UO-USUARIO.
           MOVE FH-HORA                TO UO-HOPERA.
           MOVE WC-TFECHOY             TO UO-FOPERA.
           MOVE 50040                  TO UO-IOPERA.
      *
           EXEC CICS
              LINK PROGRAM(RUT-ZM9RH468)
              COMMAREA    (UO-USUARIO-OPERACION)
              LENGTH      (LENGTH  OF UO-USUARIO-OPERACION)
           END-EXEC.
      *
           IF UO-WCODRET = 0
              CONTINUE
           ELSE
              MOVE UO-WCODRET             TO WM-CODIGO
           END-IF.
      *
      *****************************************************************
      * VALIDA QUE LOS CAMPOS MODIFICADOS SEAN CONSISTENTES           *
      *****************************************************************
       9614-VALIDAR-DATOS.
      *
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND > 10 OR
                                                    SELECCION-OK
              IF MSELEC(WS-IND) = 'B'
                 SET SELECCION-OK    TO TRUE
                 MOVE SPACES         TO MCONTRAO
                                        MGRUPOO
                                        MEMISORO
                                        MSERIEO
                                        MINSTRO
                 MOVE 2              TO WC-ESTADO
                 MOVE MCONTR(WS-IND) TO WC-ICUENTA
                 MOVE MGRUP1(WS-IND) TO WC-GRUPO
                 MOVE MINST1(WS-IND) TO WC-INSTRUMENTO
                 MOVE MEMISO(WS-IND) TO WC-IEMISORA
                 MOVE MSERI1(WS-IND) TO WC-ISERIE
                 MOVE WS-IND         TO WC-IND
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
           MOVE MCONTRAO               TO W9350-IMP-ALFA.
           MOVE 07                     TO W9350-ENTEROS.
           MOVE 0                      TO W9350-DECIMALES.
           MOVE ' '                    TO W9350-REDONDEO.
           PERFORM 9350-VALIDA-CANTIDAD.
      *
           IF W9350-MSGERROR = SPACES
              MOVE W9350-IMP-00DEC     TO ICUENTA OF DCLCUENTA
              IF ICUENTA OF DCLCUENTA > 0
                 PERFORM 9616-BUSCAR-CUENTA
              END-IF
           ELSE
              IF W9350-CODIGO = 0
                 MOVE 1475             TO WM-CODIGO
                 MOVE 'ERROR EN DATO NUMERICO' TO MSG1O
                 MOVE -1               TO MCONTRAL
                 MOVE DFHRED           TO MCONTRAC
              END-IF
           END-IF.
      *
           MOVE MGRUPOO                TO W9350-IMP-ALFA
           MOVE 1                      TO W9350-ENTEROS
           MOVE 0                      TO W9350-DECIMALES
           MOVE ' '                    TO W9350-REDONDEO
           PERFORM 9350-VALIDA-CANTIDAD
      *
           IF W9350-MSGERROR = SPACES
              CONTINUE
           ELSE
              IF W9350-CODIGO = 0
                 MOVE 1475             TO WM-CODIGO
                 MOVE 'ERROR EN DATO NUMERICO' TO MSG1O
                 MOVE -1               TO MGRUPOL
                 MOVE DFHRED           TO MGRUPOC
              END-IF
           END-IF.
      *
           IF WM-CODIGO = 0
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
           IF SQLCODE = 0
              MOVE NOMBRE  OF DCLCUENTA   TO WS-STR
              MOVE NAPELL1 OF DCLCUENTA   TO WS-STR(21:40)
              MOVE NAPELL2 OF DCLCUENTA   TO WS-STR(61:20)
              PERFORM 9617-COMPACTAR-NOMBRE
              MOVE WS-AUX                 TO WC-NOMBRE
           ELSE
              MOVE 0018               TO WM-CODIGO
              MOVE 'SQLCODE 100 CUENTA'  TO MSG1O
              MOVE -1                 TO MCONTRAL
              MOVE DFHRED             TO MCONTRAC
           END-IF.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
       9617-COMPACTAR-NOMBRE.
      *
           SET PRIMERO-NO               TO TRUE
           MOVE ' '                           TO WS-AUX
           MOVE 0                             TO WS-SIZE
           MOVE 0                             TO WS-I
      *
           PERFORM UNTIL WS-I >= 25
                      OR WS-I >= LENGTH OF WS-STR
              ADD 1                           TO WS-I
              IF PRIMERO-SI OR (WS-STR(WS-I:1) NOT = ' ')
                 ADD 1                        TO WS-SIZE
                 MOVE WS-STR(WS-I:1)          TO WS-AUX(WS-SIZE:1)
                 IF WS-STR(WS-I:1) = ' '
                    SET PRIMERO-NO            TO TRUE
                 ELSE
                    SET PRIMERO-SI            TO TRUE
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
           IF FIN-ZMDT606
              IF WS-IND = 0
                 MOVE 2                TO WC-ESTADO
              ELSE
                 MOVE 548              TO WM-CODIGO
                 MOVE -1               TO MCOML
              END-IF
           ELSE
              PERFORM 96203-PROCESAR-CARTAS VARYING WS-IND FROM 1 BY 1
                                      UNTIL WS-IND > 10 OR FIN-ZMDT606
           END-IF.
      *
           PERFORM 96204-CERRAR-C-ZMDT606.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
       96200-MOVER-PARAMS.
      *
           MOVE 0                      TO WS-IND.
      *
           IF MCONTRAO = SPACES OR 0 OR LOW-VALUES
              MOVE 0                   TO WS-ICUENTA
              MOVE 9999999             TO ZM606-ICUENTA
              MOVE 1                   TO WS-IND
           ELSE
              MOVE MCONTRAO            TO ZM606-ICUENTA
                                          WS-ICUENTA
                                          WC-ICUENTA
           END-IF.
      *
           IF MGRUPOO = SPACES OR 0 OR LOW-VALUES
              MOVE 0                   TO WS-GRUPO
              MOVE 9                   TO ZM606-GRUPO
              MOVE 1                   TO WS-IND
           ELSE
              MOVE MGRUPOO             TO ZM606-GRUPO
                                          WS-GRUPO
                                          WC-GRUPO
           END-IF.
      *
           IF MINSTRO  = SPACES OR 0 OR LOW-VALUES
              MOVE 'A'                 TO WS-INSTRUMENTO
              MOVE 'ZZZZZZZZ'          TO ZM606-INSTRUMENTO
              MOVE 1                   TO WS-IND
           ELSE
              MOVE MINSTRO             TO ZM606-INSTRUMENTO
                                          WS-INSTRUMENTO
                                          WC-INSTRUMENTO
           END-IF.
      *
           IF MEMISORO = SPACES OR 0 OR LOW-VALUES
              MOVE LOW-VALUES          TO WS-IEMISORA
              MOVE HIGH-VALUES         TO ZM606-IEMISORA
              MOVE 1                   TO WS-IND
           ELSE
              MOVE MEMISORO            TO ZM606-IEMISORA
                                          WS-IEMISORA
                                          WC-IEMISORA
           END-IF.
      *
           IF MSERIEO  = SPACES OR 0 OR LOW-VALUES
              MOVE LOW-VALUES          TO WS-ISERIE
              MOVE HIGH-VALUES         TO ZM606-ISERIE
              MOVE 1                   TO WS-IND
           ELSE
              MOVE MSERIEO             TO ZM606-ISERIE
                                          WS-ISERIE
                                          WC-ISERIE
           END-IF.
      *
           MOVE 'BCM'                  TO ZM606-IEMPR.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
       96201-ABRIR-C-ZMDT606.
      *
           EXEC SQL
              OPEN C-ZMDT606
           END-EXEC.
      *
           IF SQLCODE = 0
              CONTINUE
           ELSE
              INITIALIZE AB-REG
              MOVE W000-PROG                TO AB-WAPLIC
              MOVE '96201-OPEN-C-ZMDT606'   TO AB-WPROCESO
              MOVE 'ERROR AL ABRIR CURSOR'  TO AB-WMENS1
              PERFORM 9600-VALIDA-SQL
           END-IF.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
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
           WHEN 0
              CONTINUE
           WHEN 100
              SET FIN-ZMDT606                 TO TRUE
           WHEN OTHER
              INITIALIZE AB-REG
              MOVE W000-PROG                   TO AB-WAPLIC
              MOVE '96202-LEER-C-ZMDT606'      TO AB-WPROCESO
              MOVE 'ERROR FETCH C-ZMDT606'     TO AB-WMENS1
              PERFORM 9600-VALIDA-SQL
           END-EVALUATE.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
       96203-PROCESAR-CARTAS.
      *
           MOVE ZM606-SVIGEN           TO MSELEC(WS-IND).
           MOVE ZM606-ICUENTA          TO MCONTR(WS-IND).
           MOVE NOMBRE  OF DCLCUENTA   TO WS-STR
           MOVE NAPELL1 OF DCLCUENTA   TO WS-STR(21:40)
           MOVE NAPELL2 OF DCLCUENTA   TO WS-STR(61:20)
           PERFORM 9617-COMPACTAR-NOMBRE
           MOVE WS-AUX                 TO WC-NOMBRE
           MOVE WC-NOMBRE              TO MNOMBR(WS-IND).
           MOVE ZM606-GRUPO            TO MGRUP1(WS-IND).
           MOVE ZM606-INSTRUMENTO      TO MINST1(WS-IND).
           MOVE ZM606-IEMISORA         TO MEMISO(WS-IND).
           MOVE ZM606-ISERIE           TO MSERI1(WS-IND).
      *
           PERFORM 96202-LEER-C-ZMDT606.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
       96204-CERRAR-C-ZMDT606.
      *
           EXEC SQL
              CLOSE C-ZMDT606
           END-EXEC.
      *
           IF SQLCODE = 0
              CONTINUE
           ELSE
              INITIALIZE AB-REG
              MOVE W000-PROG                   TO AB-WAPLIC
              MOVE '96204-CERRAR-C-ZMDT606'    TO AB-WPROCESO
              MOVE 'ERROR AL CERRAR CURSOR'    TO AB-WMENS1
              PERFORM 9600-VALIDA-SQL
           END-IF.
      *
      ******************************************************************
      *                                                                *
      ******************************************************************
       9622-PROTEGER-MAPA.
      *
           MOVE DFHBMASF              TO MCONTRAF
                                         MGRUPOF
                                         MEMISORF
                                         MSERIEF
                                         MINSTRF.
      *
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND > 10
              MOVE DFHBMASF           TO MSELECF(WS-IND)
              MOVE DFHTURQ            TO MSELECC(WS-IND)
           END-PERFORM.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9623-DESPROTEGER-MAPA.
      *
           MOVE DFHBMFSE              TO MCONTRAF
                                         MGRUPOF
                                         MEMISORF
                                         MSERIEF
                                         MINSTRF.
      *
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND > 10
              IF MCONTR(WS-IND) = SPACES OR LOW-VALUES
                 MOVE DFHBMASF        TO MSELECF(WS-IND)
              ELSE
                 MOVE DFHBMFSE        TO MSELECF(WS-IND)
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
                 IF MCOMI NOT = SPACES
                    MOVE 0             TO WC-ESTADO
                    MOVE MCOMO         TO MM-COMANDO
                    MOVE WC-WAPLIC     TO MM-WAPLIC
                    PERFORM 9900-TRANSFIERE
                    MOVE -1            TO MCOML
                    MOVE MM-CODIGO     TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109 TO WM-CODIGO
                    MOVE -1            TO MCOML
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF3
                 IF MCOMI = SPACES
                    MOVE WC-WAPLIC     TO MM-WAPLIC
                    MOVE SPACES        TO MM-COMANDO
                    MOVE 0             TO WC-ESTADO
                    PERFORM 9900-TRANSFIERE
                    MOVE -1            TO MCOML
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    PERFORM 9520-ENVIAR-PANTALLA
                 ELSE
                    MOVE 109           TO WM-CODIGO
                    PERFORM 9221-PREPARAR-DATOS-ENCA
                    MOVE  0            TO MCONTRAL
                    MOVE -1            TO MCOML
                    PERFORM 9520-ENVIAR-PANTALLA
                 END-IF
              WHEN DFHPF4
                 PERFORM 9710-PROCESAR-REGISTRO
                 MOVE SPACES           TO WC-COMANDO
                 PERFORM 9221-PREPARAR-DATOS-ENCA
                 PERFORM 9520-ENVIAR-PANTALLA
              WHEN OTHER
                 MOVE WC-WAPLIC TO MM-WAPLIC
                 MOVE SPACES           TO MM-COMANDO
                 MOVE 0                TO WC-ESTADO
                 MOVE 'OPERACION CANCELADA' TO W9510-MSG
                 PERFORM 9622-PROTEGER-MAPA
                 PERFORM 9221-PREPARAR-DATOS-ENCA
                 MOVE -1               TO MCOML
                 PERFORM 9520-ENVIAR-PANTALLA
           END-EVALUATE.
      *
      *****************************************************************
      *                                                               *
      *****************************************************************
       9710-PROCESAR-REGISTRO.
      *
           MOVE EIBTRMID            TO ZMNN-S-TERMINAL.
           MOVE WC-USUARIO          TO ZMNN-S-USERSIVA.
           MOVE WC-IEMPR            TO ZMNN-S-IEMPR.
           MOVE WC-IPERFIL          TO ZMNN-S-IPERFIL.
           MOVE WC-ISUCCASA         TO ZMNN-S-ISUCCASA.
           MOVE WC-IPROM            TO ZMNN-S-IPROM.
           MOVE SPACES              TO ZM57-CONTRATO
           MOVE WC-ICUENTA          TO ZM57-ICUENTA
           MOVE WC-GRUPO            TO ZM57-GRUPO
           MOVE WC-INSTRUMENTO      TO ZM57-INSTRUMENTO
           MOVE WC-IEMISORA         TO ZM57-IEMISORA
           MOVE WC-ISERIE           TO ZM57-ISERIE
           MOVE 0                   TO ZM57-TOTAL
      *
           IF SELECCION-OK
              MOVE 'B'              TO ZM57-IPROCESO
           ELSE
              MOVE 'R'              TO ZM57-IPROCESO
           END-IF.
      *
           PERFORM 9711-LLAMAR-ZM9CRX57.
      *
           MOVE 0                 TO WC-ESTADO.
      *
           IF WM-CODIGO NOT = 0 OR ZMNN-C-ERRORES > 0
              IF SELECCION-OK
                 MOVE -1          TO MSELECL(WC-IND)
                 MOVE DFHRED      TO MCONTRF(WC-IND)
                 MOVE DFHRED      TO MNOMBRF(WC-IND)
                 MOVE DFHRED      TO MGRUP1F(WC-IND)
                 MOVE DFHRED      TO MINST1F(WC-IND)
                 MOVE DFHRED      TO MEMISOF(WC-IND)
                 MOVE DFHRED      TO MSERI1F(WC-IND)
              ELSE
                 MOVE -1          TO MCOML
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
              LINK PROGRAM (RUT-ZM9CRX57)
                 COMMAREA  (W000-ZM9CRX57)
                 LENGTH    (LENGTH OF W000-ZM9CRX57)
                 RESP  (W000-RESP)
           END-EXEC.
      *
           PERFORM 9500-VALIDA-CICS.
      *
           IF ZMNN-C-ERRORES > 0
              EVALUATE TRUE
                 WHEN ZMNN-C-CODSIVA(1) > 0
                    PERFORM 9712-ERROR-APLICATIVO
                 WHEN ZMNN-C-CODSQL   < 0 OR ZMNN-C-CODSQL > 0
                    MOVE ZMNN-C-CODSQL          TO SQLCODE
                    MOVE ZMNN-C-MENSERR         TO SQLERRM
                    INITIALIZE AB-REG
                    MOVE 'ZM9CRX57'             TO AB-WAPLIC
                    MOVE 'INSERT ZMDT606      ' TO AB-WPROCESO
                    MOVE '9711-LLAMAR-ZM9CRX57' TO AB-WMENS1
                    PERFORM 9600-VALIDA-SQL
                 WHEN ZMNN-C-CODRESP1 > 0
                    MOVE ZMNN-C-CODRESP1        TO EIBRESP
                    MOVE ZMNN-C-CODRESP2        TO EIBRESP2
                    MOVE ZMNN-C-CODFN           TO EIBFN
                    MOVE ZMNN-C-RESOURCE        TO EIBRSRCE
                    PERFORM 9500-VALIDA-CICS
                 WHEN OTHER
                    MOVE ZMNN-C-MSGSIVA(1)      TO MSG1O
                    MOVE 362                    TO WM-CODIGO
              END-EVALUATE
           END-IF.
      *
      *****************************************************************
      *ERROR RUTINA ZM9CRX57 MENSAJE AJE A SIVA.                      *
      *****************************************************************
       9712-ERROR-APLICATIVO.
      *
           EVALUATE ZMNN-C-CODSIVA(1)
              WHEN 3006
      *          MOVE ZMNN-C-MENSERR               TO MSG0O
                 MOVE 'LA EMISORA NO EXISTE'       TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 3012
                 MOVE 'ERROR AL EJECUTAR PROG'     TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 3017
                 MOVE 'ERROR ACCESO ENTORNO CICS ' TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 3018
                 MOVE 'ERROR ACCESO BASE DE DATOS' TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 3041
      *          MOVE ZMNN-C-MENSERR               TO MSG0O
                 MOVE 'TECLEE R=REG O B=BAJA'      TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 3042
      *          MOVE ZMNN-C-MENSERR               TO MSG0O
                 MOVE 'LA CARTA YA EXISTE'         TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 3043
      *          MOVE ZMNN-C-MENSERR               TO MSG0O
                 MOVE 'LA EMISORA NO EXISTE'       TO MSG1O
                 MOVE 362                          TO WM-CODIGO
              WHEN 0010
                 MOVE 0                            TO WM-CODIGO
                 MOVE 'OPERACION EFECTUADA'        TO W9510-MSG
                 MOVE 1                            TO W9350-CODIGO
                 PERFORM 9622-PROTEGER-MAPA
              WHEN OTHER
      *          MOVE ZMNN-C-CODSIVA(1)            TO MSG0O
                 MOVE 'ERROR ZM9CRX57 OPER CAN'    TO MSG1O
                 MOVE ZMNN-C-CODSIVA(1)            TO WM-CODIGO
           END-EVALUATE.
      *
      *****************************************************************
      *9000-INICIO                                                    *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSCOM0
           END-EXEC.
      *****************************************************************
      *9300-NOMBRE-EMPRESA                                            *
      *****************************************************************
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
      *9400-RETURN                                                    *
      *****************************************************************
           EXEC SQL
               INCLUDE ZMWSC004
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
