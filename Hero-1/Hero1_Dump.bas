100 REM                 HERO-1 MEMORY DUMP
110 REM                     By Joe Rowe
120 REM
130 REM  This program creates a formatted memory dump of the specified
140 REM  range of HERO-1 memory addresses on a terminal connected to
150 REM  the robot's serial port.  It requires that the robot have
160 REM  HERO-1 BASIC, memory expansion with at least 8K ram, and the
170 REM  serial port.  The program formats a dump with sixteen bytes
180 REM  per line in hexadecimal format (4 bytes per column) with
190 REM  ASCII character representation of displayable characters in
200 REM  another column.  The format is designed for screens capable
210 REM  of displaying 80 characters per line.  Any terminal or micro-
220 REM  computer with terminal emulation software can be used.  The
230 REM  baud rate used is not critical in this program.
240 REM
250 REM  These REM statements may be omitted when the program is
260 REM  entered into the robot to conserve memory.  This program
270 REM  is in the public domain and may be used or modified as you
280 REM  see fit.
290 REM
300 PRINT "Please enter starting address on the robots keypad."
310 DPRINT "$Fr"
320 S=0: E=0
330 FOR I = 0 TO 3
340 S = S + ((16 ^ (3 - I)) * KEYIN)
350 NEXT I
360 PRINT "Please enter ending address on the robots keypad."
370 DPRINT "$To"
380 FOR I = 0 TO 3
390 E = E + ((16 ^ (3 - I)) * KEYIN)
400 NEXT I
410 PRINT: PRINT TAB(24); "HERO-1 MEMORY DUMP": PRINT
420 FOR J = S TO E STEP 16
430 X = J: L = 4
440 GOSUB 650
450 PRINT " - ";
460 L=2
470 FOR K=0 TO 12 STEP 4
480 FOR I=0 TO 3
490 X = PEEK(J + K + I)
500 GOSUB 650
510 NEXT I
520 PRINT " ";
530 NEXT K
540 PRINT "  *";
550 FOR K = 0 TO 15
560 X = PEEK(J + K)
570 GOSUB 710
580 NEXT K
590 PRINT "*"
600 NEXT J
605 PRINT
610 INPUT "Enter 0 to END or 1 to display more memory" I
620 IF I = 0 THEN GOTO 760
630 IF I = 1 THEN GOTO 300
640 GOTO 610
650 FOR M = (L - 1) TO 0 STEP -1
660 V = (X / (16 ^ M))
670 X = X - (V * (16 ^ M))
680 IF V < 10 THEN PRINT CHR(48 + V);: ELSE PRINT CHR(55 + V);
690 NEXT M
700 RETURN
710 IF X >= 32 THEN 740
720 PRINT ".";
730 GOTO 750
740 IF X > 127 THEN PRINT ".";: ELSE PRINT CHR(X);
750 RETURN
760 DPRINT "$"
770 END
,16448,16448,16448
16511,16448,16448,16448
16448,16448