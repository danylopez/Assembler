org 100h
    mov bx,dir1
    mov SI, dir2
suma:
    mov ax,[bx]
    mov dx,[SI]
    inc bx
    inc SI
    add ax,dx
    mov aux,bx
    mov bx,aux1
    mov [bx],ax
    inc bx
    mov aux1,bx
    mov bx,aux
    mov ax,[bx]
    mov dx,[SI]                             
    adc ax,dx
    mov bx,aux1
    mov [bx],ax
    inc bx
    mov ax,0
    adc ax,0
    mov [bx],ax
ret
var1 DW 0BB3Bh,06CF6h
var2 DW 0E8F9h,0E170h
dir1 EQU offset var1
dir2 EQU offset var2
var3 DB ?,?,?
aux1 DW offset var3
aux DW ? 