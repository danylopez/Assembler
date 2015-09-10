
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 
    mov al,var1 
    mov ah,0
    mov bl,var2 
    mov bh,0
    add ax,bx
    aaa
    or ax,3030h
    mov res,al 
    mov vaux,ah

    mov al,var1+1
    mov ah,0
    mov bl,var2+1
    mov bh,0
    add al,vaux
    add ax,bx
    aaa
    or ax,3030h
    mov res+1,al
    mov res+2,ah

ret
    var1 DB 37h,38h
    var2 DB 33h,36h
    res DB ?,?,?
    vaux DB ?