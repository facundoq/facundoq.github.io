llamar a la subrutina CALCULO pasando DATO1 y DATO2 por valor y RESULT como parametro por referencia a través de registros

org 1000h
dato1 db 100
dato2 dw 200
result db ?

org 20000h
mov al, dato1
mov bx,dato2
mov cx, offset result
call CALCULO
