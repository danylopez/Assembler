name "mycode"   ; output file name (max 8 chars for DOS compatibility)

org  100h

MOV al,var1
AND al,0fh
MOV ah,var2
AND ah,0fh
MUL ah   
AAM
OR ax,3030h
MOV bx,offset var3
MOV [bx],ax


ret
 
var1 DB 35h
var2 DB 38h 
var3 DW 0