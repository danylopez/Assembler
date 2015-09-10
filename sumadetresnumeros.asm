
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov al,uno
    mov ah,0
    add ax,dos
    mov bl,tres
    mov bh,0
    add ax,bx
    mov res,ax

ret
    uno DB 1
    dos DW 2
    tres DB 3
    res DW ?



