llamar a la subrutina CALCULO pasando DATO1 y por valor a través de la pila, DATO 2 por valor a tra´ves de registros y RESULT como parametro por referencia a través de registros

org 1000h
dato1 dw 100
dato2 dw 200
result db ?

org 20000h
mov ax, dato1
push ax
mov bx,dato2
mov cx, offset result
call CALCULO
