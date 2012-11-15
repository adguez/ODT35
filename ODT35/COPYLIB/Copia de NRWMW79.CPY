      *----------------------------------------------------------------*
      * COPY           : NRWMW79                                       *
      * APLICACION     : REGISTRO DE CARTA DE INSTRUCCION DE CLIENTES  *
      *                  PARA COLOCACION                               *
      * DESCRIPCION    : COPY PARA MANEJO DEL FORMATO QM DE ENTRADA Y  *
      *                  MAPA NRWMW79                                  *
      * AUTHOR         : CDA-INFORMATICA (XMGY083)                     *
      * FECHA          : 12 NOVIEMBRE 2012                             *
      *----------------------------------------------------------------*
      *----------------------------------------------------------------*
      *          L O G    D E    M O D I F I C A C I O N E S           *
      *----------------------------------------------------------------*
      *                                                                *
      *    MARCA      AUTOR    FECHA   DESCRIPCION                     *
      * -----------  -------  -------  ------------------------------- *
      * FS-0.0.0-00  XXXXXXX  DDMMMAA  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX *
      *----------------------------------------------------------------*
      *----------------------------------------------------------------*
      *
       01 NRP1-NRWMW79.
          05 NRP1-FILLER                 PIC  X(12).
          05 NRP1-MCONTRAL               PIC  S9(04)   COMP.
          05 NRP1-MCONTRAA               PIC  X(01).
          05 NRP1-MCONTRA                PIC  X(07).
          05 NRP1-MEMISORL               PIC S9(04)    COMP.
          05 NRP1-MEMISORA               PIC  X(01).
          05 NRP1-MEMISOR                PIC  X(07).
          05 NRP1-MGRUPOL                PIC S9(04)    COMP.
          05 NRP1-MGRUPOA                PIC  X(01).
          05 NRP1-MGRUPO                 PIC  X(01).
          05 NRP1-MSERIEL                PIC S9(04)    COMP.
          05 NRP1-MSERIEA                PIC  X(01).
          05 NRP1-MSERIE                 PIC  X(08).
          05 NRP1-MINSTRL                PIC S9(04)    COMP.
          05 NRP1-MINSTRA                PIC  X(01).
          05 NRP1-MINSTR                 PIC  X(08).
          05 NRP1-MSELE01L               PIC S9(04)    COMP.
          05 NRP1-MSELE01A               PIC  X(01).
          05 NRP1-MSELE01                PIC  X(01).
          05 NRP1-MCONT01L               PIC S9(04)    COMP.
          05 NRP1-MCONT01A               PIC  X(01).
          05 NRP1-MCONT01                PIC  X(07).
          05 NRP1-MNOMB01L               PIC S9(04)    COMP.
          05 NRP1-MNOMB01A               PIC  X(01).
          05 NRP1-MNOMB01                PIC  X(25).
          05 NRP1-MGRUP01L               PIC S9(04)    COMP.
          05 NRP1-MGRUP01A               PIC  X(01).
          05 NRP1-MGRUP01                PIC  X(01).
          05 NRP1-MINST01L               PIC S9(04)    COMP.
          05 NRP1-MINST01A               PIC  X(01).
          05 NRP1-MINST01                PIC  X(08).
          05 NRP1-MEMIS01L               PIC S9(04)    COMP.
          05 NRP1-MEMIS01A               PIC  X(01).
          05 NRP1-MEMIS01                PIC  X(07).
          05 NRP1-MSERI01L               PIC S9(04)    COMP.
          05 NRP1-MSERI01A               PIC  X(01).
          05 NRP1-MSERI01                PIC  x(08).
          05 NRP1-MSELE02L               PIC S9(04)    COMP.
          05 NRP1-MSELE02A               PIC  X(01).
          05 NRP1-MSELE02                PIC  X(01).
          05 NRP1-MCONT02L               PIC S9(04)    COMP.
          05 NRP1-MCONT02A               PIC  X(01).
          05 NRP1-MCONT02                PIC  X(07).
          05 NRP1-MNOMB02L               PIC S9(04)    COMP.
          05 NRP1-MNOMB02A               PIC  X(01).
          05 NRP1-MNOMB02                PIC  X(25).
          05 NRP1-MGRUP02L               PIC S9(04)    COMP.
          05 NRP1-MGRUP02A               PIC  X(01).
          05 NRP1-MGRUP02                PIC  X(01).
          05 NRP1-MINST02L               PIC S9(04)    COMP.
          05 NRP1-MINST02A               PIC  X(01).
          05 NRP1-MINST02                PIC  X(08).
          05 NRP1-MEMIS02L               PIC S9(04)    COMP.
          05 NRP1-MEMIS02A               PIC  X(01).
          05 NRP1-MEMIS02                PIC  X(07).
          05 NRP1-MSERI02L               PIC S9(04)    COMP.
          05 NRP1-MSERI02A               PIC  X(01).
          05 NRP1-MSERI02                PIC  X(08).
          05 NRP1-MSELE03L               PIC S9(04)    COMP.
          05 NRP1-MSELE03A               PIC  X(01).
          05 NRP1-MSELE03                PIC  X(01).
          05 NRP1-MCONT03L               PIC S9(04)    COMP.
          05 NRP1-MCONT03A               PIC  X(01).
          05 NRP1-MCONT03                PIC  X(07).
          05 NRP1-MNOMB03L               PIC S9(04)    COMP.
          05 NRP1-MNOMB03A               PIC  X(01).
          05 NRP1-MNOMB03                PIC  X(25).
          05 NRP1-MGRUP03L               PIC S9(04)    COMP.
          05 NRP1-MGRUP03A               PIC  X(01).
          05 NRP1-MGRUP03                PIC  X(01).
          05 NRP1-MINST03L               PIC S9(04)    COMP.
          05 NRP1-MINST03A               PIC  X(01).
          05 NRP1-MINST03                PIC  X(08).
          05 NRP1-MEMIS03L               PIC S9(04)    COMP.
          05 NRP1-MEMIS03A               PIC  X(01).
          05 NRP1-MEMIS03                PIC  X(07).
          05 NRP1-MSERI03L               PIC S9(04)    COMP.
          05 NRP1-MSERI03A               PIC  X(01).
          05 NRP1-MSERI03                PIC  X(08).
          05 NRP1-MSELE04L               PIC S9(04)    COMP.
          05 NRP1-MSELE04A               PIC  X(01).
          05 NRP1-MSELE04                PIC  X(01).
          05 NRP1-MCONT04L               PIC S9(04)    COMP.
          05 NRP1-MCONT04A               PIC  X(01).
          05 NRP1-MCONT04                PIC  X(07).
          05 NRP1-MNOMB04L               PIC S9(04)    COMP.
          05 NRP1-MNOMB04A               PIC  X(01).
          05 NRP1-MNOMB04                PIC  X(25).
          05 NRP1-MGRUP04L               PIC S9(04)    COMP.
          05 NRP1-MGRUP04A               PIC  X(01).
          05 NRP1-MGRUP04                PIC  X(01).
          05 NRP1-MINST04L               PIC S9(04)    COMP.
          05 NRP1-MINST04A               PIC  X(01).
          05 NRP1-MINST04                PIC  X(08).
          05 NRP1-MEMIS04L               PIC S9(04)    COMP.
          05 NRP1-MEMIS04A               PIC  X(01).
          05 NRP1-MEMIS04                PIC  X(07).
          05 NRP1-MSERI04L               PIC S9(04)    COMP.
          05 NRP1-MSERI04A               PIC  X(01).
          05 NRP1-MSERI04                PIC  X(08).
          05 NRP1-MSELE05L               PIC S9(04)    COMP.
          05 NRP1-MSELE05A               PIC  X(01).
          05 NRP1-MSELE05                PIC  X(01).
          05 NRP1-MCONT05L               PIC S9(04)    COMP.
          05 NRP1-MCONT05A               PIC  X(01).
          05 NRP1-MCONT05                PIC  X(07).
          05 NRP1-MNOMB05L               PIC S9(04)    COMP.
          05 NRP1-MNOMB05A               PIC  X(01).
          05 NRP1-MNOMB05                PIC  X(25).
          05 NRP1-MGRUP05L               PIC S9(04)    COMP.
          05 NRP1-MGRUP05A               PIC  X(01).
          05 NRP1-MGRUP05                PIC  X(01).
          05 NRP1-MINST05L               PIC S9(04)    COMP.
          05 NRP1-MINST05A               PIC  X(01).
          05 NRP1-MINST05                PIC  X(08).
          05 NRP1-MEMIS05L               PIC S9(04)    COMP.
          05 NRP1-MEMIS05A               PIC  X(01).
          05 NRP1-MEMIS05                PIC  X(07).
          05 NRP1-MSERI05L               PIC S9(04)    COMP.
          05 NRP1-MSERI05A               PIC  X(01).
          05 NRP1-MSERI05                PIC  X(08).
          05 NRP1-MSELE06L               PIC S9(04)    COMP.
          05 NRP1-MSELE06A               PIC  X(01).
          05 NRP1-MSELE06                PIC  X(01).
          05 NRP1-MCONT06L               PIC S9(04)    COMP.
          05 NRP1-MCONT06A               PIC  X(01).
          05 NRP1-MCONT06                PIC  X(07).
          05 NRP1-MNOMB06L               PIC S9(04)    COMP.
          05 NRP1-MNOMB06A               PIC  X(01).
          05 NRP1-MNOMB06                PIC  X(25).
          05 NRP1-MGRUP06L               PIC S9(04)    COMP.
          05 NRP1-MGRUP06A               PIC  X(01).
          05 NRP1-MGRUP06                PIC  X(01).
          05 NRP1-MINST06L               PIC S9(04)    COMP.
          05 NRP1-MINST06A               PIC  X(01).
          05 NRP1-MINST06                PIC  X(08).
          05 NRP1-MEMIS06L               PIC S9(04)    COMP.
          05 NRP1-MEMIS06A               PIC  X(01).
          05 NRP1-MEMIS06                PIC  X(07).
          05 NRP1-MSERI06L               PIC S9(04)    COMP.
          05 NRP1-MSERI06A               PIC  X(01).
          05 NRP1-MSERI06                PIC  X(08).
          05 NRP1-MSELE07L               PIC S9(04)    COMP.
          05 NRP1-MSELE07A               PIC  X(01).
          05 NRP1-MSELE07                PIC  X(01).
          05 NRP1-MCONT07L               PIC S9(04)    COMP.
          05 NRP1-MCONT07A               PIC  X(01).
          05 NRP1-MCONT07                PIC  X(07).
          05 NRP1-MNOMB07L               PIC S9(04)    COMP.
          05 NRP1-MNOMB07A               PIC  X(01).
          05 NRP1-MNOMB07                PIC  X(25).
          05 NRP1-MGRUP07L               PIC S9(04)    COMP.
          05 NRP1-MGRUP07A               PIC  X(01).
          05 NRP1-MGRUP07                PIC  X(01).
          05 NRP1-MINST07L               PIC S9(04)    COMP.
          05 NRP1-MINST07A               PIC  X(01).
          05 NRP1-MINST07                PIC  X(08).
          05 NRP1-MEMIS07L               PIC S9(04)    COMP.
          05 NRP1-MEMIS07A               PIC  X(01).
          05 NRP1-MEMIS07                PIC  X(07).
          05 NRP1-MSERI07L               PIC S9(04)    COMP.
          05 NRP1-MSERI07A               PIC  X(01).
          05 NRP1-MSERI07                PIC  X(08).
          05 NRP1-MSELE08L               PIC S9(04)    COMP.
          05 NRP1-MSELE08A               PIC  X(01).
          05 NRP1-MSELE08                PIC  X(01).
          05 NRP1-MCONT08L               PIC S9(04)    COMP.
          05 NRP1-MCONT08A               PIC  X(01).
          05 NRP1-MCONT08                PIC  X(07).
          05 NRP1-MNOMB08L               PIC S9(04)    COMP.
          05 NRP1-MNOMB08A               PIC  X(01).
          05 NRP1-MNOMB08                PIC  X(25).
          05 NRP1-MGRUP08L               PIC S9(04)    COMP.
          05 NRP1-MGRUP08A               PIC  X(01).
          05 NRP1-MGRUP08                PIC  X(01).
          05 NRP1-MINST08L               PIC S9(04)    COMP.
          05 NRP1-MINST08A               PIC  X(01).
          05 NRP1-MINST08                PIC  X(08).
          05 NRP1-MEMIS08L               PIC S9(04)    COMP.
          05 NRP1-MEMIS08A               PIC  X(01).
          05 NRP1-MEMIS08                PIC  X(07).
          05 NRP1-MSERI08L               PIC S9(04)    COMP.
          05 NRP1-MSERI08A               PIC  X(01).
          05 NRP1-MSERI08                PIC  X(08).
          05 NRP1-MSELE09L               PIC S9(04)    COMP.
          05 NRP1-MSELE09A               PIC  X(01).
          05 NRP1-MSELE09                PIC  X(01).
          05 NRP1-MCONT09L               PIC S9(04)    COMP.
          05 NRP1-MCONT09A               PIC  X(01).
          05 NRP1-MCONT09                PIC  X(07).
          05 NRP1-MNOMB09L               PIC S9(04)    COMP.
          05 NRP1-MNOMB09A               PIC  X(01).
          05 NRP1-MNOMB09                PIC  X(25).
          05 NRP1-MGRUP09L               PIC S9(04)    COMP.
          05 NRP1-MGRUP09A               PIC  X(01).
          05 NRP1-MGRUP09                PIC  X(01).
          05 NRP1-MINST09L               PIC S9(04)    COMP.
          05 NRP1-MINST09A               PIC  X(01).
          05 NRP1-MINST09                PIC  X(08).
          05 NRP1-MEMIS09L               PIC S9(04)    COMP.
          05 NRP1-MEMIS09A               PIC  X(01).
          05 NRP1-MEMIS09                PIC  X(07).
          05 NRP1-MSERI09L               PIC S9(04)    COMP.
          05 NRP1-MSERI09A               PIC  X(01).
          05 NRP1-MSERI09                PIC  X(08).
          05 NRP1-MSELE10L               PIC S9(04)    COMP.
          05 NRP1-MSELE10A               PIC  X(01).
          05 NRP1-MSELE10                PIC  X(01).
          05 NRP1-MCONT10L               PIC S9(04)    COMP.
          05 NRP1-MCONT10A               PIC  X(01).
          05 NRP1-MCONT10                PIC  X(07).
          05 NRP1-MNOMB10L               PIC S9(04)    COMP.
          05 NRP1-MNOMB10A               PIC  X(01).
          05 NRP1-MNOMB10                PIC  X(25).
          05 NRP1-MGRUP10L               PIC S9(04)    COMP.
          05 NRP1-MGRUP10A               PIC  X(01).
          05 NRP1-MGRUP10                PIC  X(01).
          05 NRP1-MINST10L               PIC S9(04)    COMP.
          05 NRP1-MINST10A               PIC  X(01).
          05 NRP1-MINST10                PIC  X(08).
          05 NRP1-MEMIS10L               PIC S9(04)    COMP.
          05 NRP1-MEMIS10A               PIC  X(01).
          05 NRP1-MEMIS10                PIC  X(07).
          05 NRP1-MSERI10L               PIC S9(04)    COMP.
          05 NRP1-MSERI10A               PIC  X(01).
          05 NRP1-MSERI10                PIC  X(08).
          05 NRP1-MCOML                  PIC S9(04)    COMP.
          05 NRP1-MCOMA                  PIC  X(01).
          05 NRP1-MCOM                   PIC  X(10).
          05 NRP1-MSG1L                  PIC S9(04)    COMP.
          05 NRP1-MSG1A                  PIC  X(01).
          05 NRP1-MSG1                   PIC  X(55).
          05 NRP1-MSG2L                  PIC S9(04)    COMP.
          05 NRP1-MSG2A                  PIC  X(01).
          05 NRP1-MSG2                   PIC  X(74).

