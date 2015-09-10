name "mycode"   ; output file name (max 8 chars for DOS compatibility)

org  100h

ciclo:
    MOV bx,dir1         ;pone en bx el principio de bx
    add bX,var1   ;le suma lo de la variable para posicionarla en el lugar de BX 
    MOV cX, var2  ;numero de veces a hacer el ciclo interno   
    MOV ch,0      ; inicializa la parte alta  
    cmp var1,10    ;pregunta si llego al final del vector 
    JE fin
    ciclo_interno:     
        CMP cl,0       ;pregunta si ya termino de recorrer el ciclo interno
        JE ajustar      ;salta para dar otros valores al ciclo externo
        MOV si,dir1    ;mueve a si la posicion 0 del vec1
        add si,aux     ;le suma el valor la posicion en el ciclo interno
        MOV ax,[SI]   ; le asigna a ax el valor de esa posicion
        MOV AH,0      ;limpia la parte alta
        CMP [BX],al   ;compara la posicion del ciclo externo con la del interno
        JNBE cambio   ;si es mayor salta
        inc aux       ;sino incrementa a la siguiente posicion
        loop ciclo_interno

ajustar:
  inc var1     ;pone la siguiente posicion a comparar con todos los demas
  MOV dx,var1 ;a dx mueve el valor 
  inc dx      ;incrementa el valor  que es var1+1 para la posicion en el ciclo interno
  dec var2    ;se decrementa para indicar que el ciclo interno sera menor # de veces
  mov aux,dx  ;lo pasa a aux
  JMP ciclo   ;regresa al ciclo externo

cambio:
 XCHG [bx],al   ;cambia los valores y lo mueve al vector
 MOV [si],al    ; mueve un valor de si   a el vector
 inc aux        ;incrementa para la posicion siguiente en el vector
 dec cl         ;decrementa cl indicando un ciclo
 JMP ciclo_interno       

fin:             ;termina el programa
ret

var1 DW 0
var2 DW 10
aux DW 1
vector1 DB 5,3,4,1,2,6,0,3,8,2,5
dir1 EQU offset vector1