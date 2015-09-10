org 100h

mov ah,02h
mov cx,00
mov bx,dir

inicio:
    mov dl,[bx]
    int 21h
    inc bx
    inc cx
    cmp cx,4
    jb inicio

ret
mensaje DB "hola"
dir EQU offset mensaje
