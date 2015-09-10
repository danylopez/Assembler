
; Programa que imprima en pantalla la fecha y hora al inicio de la ejecucion
; (en el formato siguiente: Martes 22 de noviembre de 2011 [enter] hora: 1:35 pm)

org 100h

mov ah, 2Ah     ;Se consigue la info y se guarda en las variables
int 21h
       
mov dia_se, al
mov anio, cx
mov mes, dh
mov dia, dl

mov ah, 2Ch
int 21h

mov horas, ch
mov min, cl     ;fin de conseguir info


mov ah, 09      ;se compara el dia de la semana que se consiguio al sacar la info
cmp dia_se, 0
je domingo      ;Teniendo en cuenta que 0=Domingo, 1=Lunes... 6=Sabado
cmp dia_se, 1   ;Se manda a llamar a la funcion dependiendo el dia
je lunes        ;Para que se imprima en pantalla
cmp dia_se, 2
je martes
cmp dia_se, 3
je miercoles
cmp dia_se, 4
je jueves
cmp dia_se, 5
je viernes
cmp dia_se, 6
je sabado


cont:           ;Se regresa aqui de la impresion del dia de la semana
mov cl, dia
mov n1, cl
call amm
mov ah, 09      ;Se imprime la palabra de
mov dx, offset de
int 21h 


cmp mes, 1      ;Se usa el mismo concepto del dia de la semana
je enero        ;Compara e imprime
cmp mes, 2
je febrero
cmp mes, 3
je marzo
cmp mes, 4
je abril
cmp mes, 5
je mayo
cmp mes, 6
je junio
cmp mes, 7
je julio
cmp mes, 8
je agosto
cmp mes, 9
je septiembre
cmp mes, 10
je octubre
cmp mes, 11
je noviembre
cmp mes, 12
je diciembre

cont2:          ;Se continua aqui despues de la impresion del mes

mov ah, 09      ;Se imprime la palabra de
mov dx, offset de
int 21h

mov ax, anio    ;Se usara la division Double Word (Ax, Dx) entre Word (mil)
mov dx, 0       ;Osease 2011/1000 para sacar el 2
div mil
or ax, 3030h    ;se consigue y se convierte en Ascii
mov ah, 02      ;Se imprime
mov num1, dx    ;Se rescata el sobrante osease 011 o 11 y se guarda en num1
mov dx, ax
int 21h

mov ax, num1    ;Se usa el mismo concepto para sacar el 0
div cien
or ax, 3030h
mov ah, 02
mov dx, ax
int 21h
                ;Ahora el 1 de las decenas
mov ax, num1
div diez
or ax, 3030h
mov dh, ah      
mov ah, 02
mov dl, al
int 21h
mov dl, dh      ;Ahora el de las unidades
int 21h


mov ah, 02
mov dl, 0ah     ;0ah salto de linea
int 21h
mov dl, 0dh     ;0ah salto de carro
int 21h

mov ah, 09      ;Se imprime la palabra hora
mov dx, offset hora
int 21h

cmp horas, 11   ;si es mayor salta a ajuste
jg ajuste 
 
cmp horas, 0    ;si es cero salta a ajuste 2
je ajuste2

am:             ;Se regresa del ajuste 2
mov al, horas
mov n1, al
call amm

mov dl, ':'     ;Se imprime :
int 21h
mov al, min
mov n1, al
call amm

mov ah, 09      ;Impresion de am
mov dx, offset meridiano
int 21h
jmp cont3       ;Salta para terminar la ejecucion
    
pm:             ;Se regresa del ajuste
mov al, horas
mov n1, al
call amm
mov dl, ':'
int 21h
mov al, horas
mov n1, al
call amm
mov ah, 09
mov dx, offset meridiano+3; +3 para que salte 3 espacion del vector e imprima pm
int 21h
        
cont3:

jmp fin        ;Salta a fin que es ret 
        
        
domingo:       ;Cada dia pertenece a un vector llamado nom
mov dx, offset nom
int 21h        ;Para acceder a los dias tenemos que saltarnos o sumar los espacios
jmp cont       ;Asi que Domingo tiene 7 letras + un espacion en Blanco + el signo de $= 9
lunes:  
mov dx, offset nom+9 ;Por eso aqui se suma 9 para q empiec en lunes
int 21h
jmp cont             ;y asi para todos los dias
martes: 
mov dx, offset nom+16
int 21h
jmp cont
miercoles:
mov dx, offset nom+24
int 21h
jmp cont
jueves: 
mov dx, offset nom+35
int 21h
jmp cont
viernes:
mov dx, offset nom+43
int 21h
jmp cont
sabado: 
mov dx, offset nom+52
int 21h
jmp cont


enero:              ;Mismo concepto que los dias pero este vector se llama nom2
mov dx, offset nom2
int 21h
jmp cont2
febrero:
mov dx, offset nom2+6
int 21h
jmp cont2
marzo:  
mov dx, offset nom2+14
int 21h
jmp cont2
abril:  
mov dx, offset nom2+20
int 21h
jmp cont2
mayo:   
mov dx, offset nom2+26
int 21h
jmp cont2
junio:  
mov dx, offset nom2+31
int 21h
jmp cont2
julio:   
mov dx, offset nom2+37
int 21h
jmp cont2
agosto:  
mov dx, offset nom2+43
int 21h
jmp cont2
septiembre:
mov dx, offset nom2+50
int 21h
jmp cont2
octubre:
mov dx, offset nom2+61
int 21h
jmp cont2
noviembre:
mov dx, offset nom2+69
int 21h
jmp cont2
diciembre:
mov dx, offset nom2+79
int 21h
jmp cont2

ajuste:
cmp horas, 12 ;si es 12 pm no le resta nada y regresa
je pm
sub horas, 12 ;Se resta 12 para conseguir el numero simple y regresa

jmp pm

ajuste2:
add horas, 12 ;si son las 00 hrs se suma 12
jmp am


amm:
mov al, n1
mov ah, 0
div diez
or ax, 3030h
mov n2, ah
mov ah, 02
mov dl, al
int 21h
mov dl, n2
int 21h

fin: ret ;fin del programa


dia_se DB ?  ;lo da numerico con 0=domingo
anio DW ?
mes DB ?
dia DB ?
horas DB ?
min DB ?
de DB " de $"
hora DB "Hora: $"
nom DB "Domingo $","Lunes $","Martes $","Miercoles $","Jueves $","Viernes $", "Sabado $"
nom2 DB "Enero$","Febrero$","Marzo$","Abril$","Mayo$","Junio$","Julio$","Agosto$","Septiembre$","Octubre$","Noviembre$","Diciembre$"
diez DB 10
cien DB 100
mil DW 1000
num1 DW ?
n1 DB ?
n2 DB ?
meridiano DB "am$","pm$"