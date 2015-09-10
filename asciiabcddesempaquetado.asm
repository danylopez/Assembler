org 100h
    mov [si],dir+4
    mov [di],dir2+2
ciclo:
    mov ax,[si]
    xchg ah,al
    shl al,cl
    mov [di],ah
    dec si
    dec si
    dec di
    dec dx
    jnz ciclo
ret
ascii DB '057836'
dir EQU OFFSET ascii
bcd DB '000'
dir2 EQU OFFSET bcd