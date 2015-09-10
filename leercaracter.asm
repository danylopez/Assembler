org 100h

mov ah,09         
mov bx,dir
mov dx,[bx]
int 21h
mov ah,01
int 21h
mov caracter,al
mov ah,02
mov dl,0ah
int 21h
mov dl,caracter
int 21h

ret
caracter DB ?
dir1 EQU offset caracter
msj DB "Coloca un caracter$"
dir EQU offset msj