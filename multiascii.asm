1..model small
2..stack
3..data
4..code
5.   chr1  db ?
6.   chr2  db ?
7.   chr3  db ?
8.   r1    db ?
9.   r2    db ?
10.   ac    db 0
11..startup
12.   ;cls
13.   mov ah,00h     ;Function(Set video mode)
14.   mov al,03      ;Mode 80x25 8x8 16
15.   int 10h        ;Interruption Video
16. 
17.   mov ah,01h     ;Function(character read)
18.   int 21h        ;Interruption DOS functions
19.   sub al,30h     ;ajustamos valores
20.   mov chr1,al    ;[chr1].chr2 * chr3 = ac.r1.r2
21.   
22.   mov ah,01h     ;Function(character read)
23.   int 21h        ;Interruption DOS functions
24.   sub al,30h     ;Ajustamos valores
25.   mov chr2,al    ;chr1.[chr2] * chr3 = ac.r1.r2
26.   
27.   mov ah,02h     ;Function(character to send to standard output)
28.   mov dl,'*'     ;Character to show
29.   int 21h
30.   
31.   mov ah,01h     ;Function(Read character)
32.   int 21h        ;Interruption DOS Functions
33.   sub al,30h     ;Transform(0dec = 30hex)
34.   mov chr3,al    ;chr1.chr2 * [chr3] = ac.r1.r2
35.   
36.   mov ah,02h     ;Character to send to standar output
37.   mov dl,'='     ;
38.   int 21h        ;Interruption DOS functions
39.   
40.   ;Realizamos operación
41.   
42.   mov al,chr3    ;al = chr3
43.   mov bl,chr2    ;bl = chr2
44.   mul bl         ;AL = chr3*chr2 (BL*AL)
45.   mov Ah,0h      ;
46.   AAM            ;ASCII Adjusment
47.   mov ac,AH      ;ac = AH (Acarreo)
48.   mov r2,AL      ;r2 = AL       (Unidad del resultado)
49.   
50.   mov al,chr3    ;AL = chr3
51.   mov bl,chr1    ;BL = chr1
52.   mul bl         ;AL = chr1*chr3 (BL*AL)
53.   mov r1,al      ;r1 = AL       (Decena del resultado)
54.   mov bl,ac      ;BL = Acarreo anterior
55.   add r1,bl      ;r1 = r1+ac (r1 + Acarreo)
56.   mov ah,00h     ;
57.   mov al,r1      ;AL = r1 (Asignación para el ajust)
58.   AAM            ;ASCII Adjustment
59.   mov r1,al      ;r1 = AL
60.   mov ac,ah      ;ac = AH (Acarreo para la Centena del resultado)
61.   
62.   ;Mostramos resultado
63.   mov ah,02h     
64.   mov dl,ac
65.   add dl,30h
66.   int 21h        ;Mostramos ac (Centena)
67. 
68.   mov ah,02H
69.   mov dl,r1
70.   add dl,30h
71.   int 21h        ;Mostramos r1 (Decena)
72. 
73.   mov ah,02H
74.   mov dl,r2
75.   add dl,30h
76.   int 21h        ;Mostramos r2 (Unidad)
77..exit
78.end




