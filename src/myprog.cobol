000000* --------------------------------
000000*    MON PREMIER PROGRAMME COBOL
000000* --------------------------------
000000 IDENTIFICATION DIVISION.
000000     PROGRAM-ID. MON-PROGRAMME.
000000* 
000000 ENVIRONMENT DIVISION.
000000     INPUT-OUTPUT SECTION.
000000         FILE-CONTROL.
000000         SELECT DONNEES ASSIGN TO 'data-input.txt'
000000         ORGANIZATION IS LINE SEQUENTIAL.
000000         SELECT SORTIE ASSIGN TO 'data-output.txt'
000000         ORGANIZATION IS LINE SEQUENTIAL.
000000* 
000000 DATA DIVISION.
000000
000000 FILE SECTION.
000000     FD DONNEES.
000000         01 FS-DONNEES.
000000         05 FS-DONNEES-ID    PIC X(3).
000000         05 FS-DONNEES-NAME  PIC X(14).
000000         05 FS-DONNEES-PRICE PIC 9(18).
000000     FD SORTIE.
000000         01 FS-SORTIE.
000000         05 FS-SORTIE-ID    PIC X(3).
000000         05 FS-SORTIE-NAME  PIC X(14).
000000         05 FS-SORTIE-PRICE PIC 9(18).
000000
000000 WORKING-STORAGE SECTION.
000000           01 WS-DONNEES.
000000           05 WS-DONNEES-ID    PIC X(3).
000000           05 WS-DONNEES-NAME  PIC X(14).
000000           05 WS-DONNEES-PRICE PIC 9(18).
000000           01 WS-EOF PIC A(1).
000000           01 WS-NOMBRE1 PIC 9(3).
000000* 
000000 PROCEDURE DIVISION.
000000 000-MAIN-PROCEDURE.
000000*    INSTRUCTION TEST 
000000     INITIALIZE WS-NOMBRE1.
000000         PERFORM 10 TIMES
000000             COMPUTE WS-NOMBRE1 = WS-NOMBRE1 + 1
000000         END-PERFORM.
000000*    LECTURE DU FICHIER
000000         OPEN INPUT DONNEES.
000000         OPEN EXTEND SORTIE.
000000             DISPLAY "AFFICHAGE DE DONNEES.TXT".
000000             DISPLAY SPACE.
000000             PERFORM UNTIL WS-EOF='Y'
000000                 READ DONNEES INTO WS-DONNEES
000000                     AT END MOVE 'Y' TO WS-EOF
000000                     NOT AT END
000000                     DISPLAY WS-DONNEES
000000                     MOVE WS-DONNEES TO FS-SORTIE
000000                     WRITE FS-SORTIE END-WRITE
000000                 END-READ
000000             END-PERFORM.
000000         CLOSE SORTIE.
000000         CLOSE DONNEES.
000000     STOP RUN.
