org 100h
    mov cl,local+2
    mov ch,0
    mov bx,dir
    mov dx,-1
    mov ah,0
aqui:
    inc dx
    dec cl    
ciclo:
    mov al,[bx]
    inc bx
    cmp ax,aux
    je  aqui   
    loop ciclo

ret
vector DB local DUP (5)
local EQU offset 5
dir EQU offset vector
aux EQU offset 5
