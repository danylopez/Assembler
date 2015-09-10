org 100h

MOV bx,dir1
MOV ah,[bx]
inc bx
MOV al,[bx]
MOV bx,dir2
MOV cl,[bx]
AND ah,0Fh
AND al, 0Fh
AND cl,0Fh
AND ch,0Fh
AAD 
DIV cx
MOV bx,dir4
MOV [bx],al
or [bx],30h
MOV bx,dir3
MOV [bx],dl
or [bx],30h


ret 


var1 DB  DUP 32h,39h   
dir1 EQU OFFSET var1
var2 DB 7
dir2 EQU OFFSET var2 
residuo DB ?
dir3 EQU OFFSET residuo
resultado DB ?         
dir4 EQU OFFSET resultado