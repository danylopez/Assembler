org 100h
    mov ax,var1
    mov bx,var1+2
    mov cx,var2
    mov res,cx
    mov cx,var2+2
    mov res+2,cx
    add res,ax
    adc res+2,bx
    adc res1,0
 ret
   var1 dw  0BB3Bh,06CF6h
   var2 dw  0E8F9h,0E170h
   res  dw  dup(0)
   res1  dw  dup(0)