name "mycode"   ; output file name (max 8 chars for DOS compatibility)

org  100h	; set location counter to 100h

MOV bx,dir
MOV ax,[bx]
MOV bx,dir2
MOV [bx],ax
MOV bx, dir+1
MOV ax,[bx]
MOV bx,dir2+1
MOV [bx],ax
MOV bx, dir+2
MOV ax,[bx]
MOV bx,dir2+2
MOV [bx],ax
MOV bx, dir+3
MOV ax,[bx]
MOV bx,dir2+3
MOV [bx],ax
MOV bx, dir+4
MOV ax,[bx]
MOV bx,dir2+4
MOV [bx],ax



ret

vector1 DB 5 DUP 1,2,3,4,5
dir EQU OFFSET vector1
vector2 DB 5 DUP 1,2,3,4,5
dir2 EQU OFFSET vector2