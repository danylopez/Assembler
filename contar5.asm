org 100h
	mov ch,0  ; inicializa la parte alta de cx
	mov cl,5  ; se pone el valorpara el ciclo
ciclo:			; etiqueta para el loop
	mov ax,dir  ; se mueve a ax la direccion del vector
	add al,cl  ;  se le suma a la direccion el valor de cl (comenzara en la ultima posicion del vector)
	mov bx,ax ; se mueve el valor a bx
	cmp [bx], 5    ; compara el contenido de la direccion del vector con un cinco
	JE incrementar;  ; si es igual a 5  va a la sub rutina inc, que incrementa el contador
loop ciclo               ; se va a la etiqueta ciclo

incrementar:
	add contador,1  ; incrementa en 1 el contador 	
 
ret

contador db 0
vector db 5 dub 1,2,3,4,5   ;se declara el vector y tamaño
dir EQU offset vector  ; la direccion del vector






