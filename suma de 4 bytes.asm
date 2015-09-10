name "mycode"   ; output file name (max 8 chars for DOS compatibility)

org  100h	

MOV bx,dir1
MOV ax,[bx]
MOV bx,dir2
MOV cx,[bx]
add ax,cx
MOV bx,dir1
inc bx
inc bx
MOV cx,[bx]
MOV bx,dir2
inc bx
inc bx
MOV dx,[bx]
adc cx,dx
MOV bx,dir3
MOV [bx],ah
inc bx
MOV [bx],al
inc bx
MOV [bx],ch
inc bx
MOV [bx],cl
inc bx
adc [bx],0



ret

var1 DD 13i99
dir1 EQU OFFSET var1
var2 DD 294506
dir2 EQU OFFSET var2
var3 DB 5 DUP ?,?,?,?,0
dir3 EQU OFFSET var3