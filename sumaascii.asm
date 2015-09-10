org 100h 
    mov dl,30h
    mov dh,30h
    mov ax,var1
    add ax,var2 
    aaa
    xchg ah,al
    aaa
    xchg al,ah
    or ax,dx
    mov vect,al
    mov vect+1,ah
    adc vect+2,0
    ret
    var1 dw 3838h
    var2 dw 3633h
    vect db 3 dup(0)


