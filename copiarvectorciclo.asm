
org  100h	; set location counter to 100h

    MOV ch,0
    MOV cl,4
ciclo:
    MOV bx,dir1
    ADD bl,var
    MOV ax,[bx]
    MOV bx,dir2
    ADD bl,cl
    MOV [bx],ax
    inc var
loop ciclo
     

ret
var DB 1
vector1 DB 1,2,3,4,5
dir1 EQU OFFSET vector1
vector2 DB 5 (?)
dir2 EQU OFFSET vector2
