name "mycode"   ; output file name (max 8 chars for DOS compatibility)

org  100h

FILD var
FILD var1
FIADD 

ret	

var DD  3464
var1 DD 6890
var2 DD ?
;var1 DW 52 384
;var2 DD 1 365 834 
;var3 DB 06Bh,047h,0A9h,0E4h, 4 DUP (0)
;var4 DB 15h,91h, 29h,36h,38h, 5 DUP(0)
;var5 DD 40B00000h



