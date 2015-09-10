programa que multiplica 2 ariables de 1 digito ascii y los guarda en otra variable
org 100h
    
    mov al,var1
    mov ah,var2
    and ah,0fh
    and al,0fh
    mul ah
    aam
    or ax,3030h
    mov res,ax 
    ret
    var1 db 35h
    var2 db 38h
    res dw 0h


