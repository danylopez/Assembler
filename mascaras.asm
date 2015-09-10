name "mycode"   ; output file name (max 8 chars for DOS compatibility)

org  100h
    
MOV BX, dir   
MOV SI, dir2    
MOV cl, 4
MOV ch,0
ciclo:
 AND [bx],00001111b
 inc bx     
loop ciclo

MOV CL,3
MOV BX, dir
empaquetado:
MOV DX,dir2
ADD DL, aux 
MOV SI, DX
DEC aux
MOV AX, [BX]        
XCHG Al,AH
MOV [SI],AX
INC BX
loop empaquetado

MOV CL, 4
MOV DX, 0
MOV aux,DL
MOV SI,dir2
desempacado:
MOV BX,dir3
ADD Bl,aux
INC aux
MOV DL,[SI]
OR  DL,00110000b
MOV [BX],DX
INC SI   
loop desempacado    	

fin:
ret

aux db 2
var DD 31363338h 
dir EQU OFFSET var
var2 DB 4 DUP(?)
dir2 EQU OFFSET var2  
var3 DB 4 DUP(?)
dir3 EQU OFFSET var3