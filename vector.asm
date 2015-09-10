org 100h

mov ah,09
mov dx,dir
int 21h

ret
mensaje DB "hola$"
dir EQU offset mensaje


