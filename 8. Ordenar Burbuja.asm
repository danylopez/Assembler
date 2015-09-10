max equ 10
org 100h  
   mov di,offset vector
   mov cl,0
   mov ch,0
ciclo1:
       mov bx,offset vector
       add bl,ch
       add bl,1 
       mov cl,0
ciclo2:
       mov dl,[di]    
       cmp [bx],dl
       jae salto
       mov dh,[bx]
       mov [di],dh
       mov [bx],dl
salto:
       inc bl
       inc cl
       cmp cl,max
       jb ciclo2
       inc di
       inc ch
       cmp ch, max-1
       jb ciclo1
ret

   vector db max dup (?)