
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov bx,dir
    mov cx,[bx]
    add bx,aux
    add cx,[bx]
    add bx,aux
    add cx,[bx]
    add bx,aux
    mov [bx],cx

ret
    vector DB 1,2,3,4,5
    vector2 DB ?,?,?,?,?
    dir EQU offset vector
    dir2 EQU offset vector2
    aux DW ?  
    aux2 DW ?



