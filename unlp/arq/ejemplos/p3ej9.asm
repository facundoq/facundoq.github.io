;escriba un programa que imprima el string "hola"
;a traves de la impresora utilizando el USART
; utilizando consulta de estado utilizando DTR


;
DIN EQU 60h
DOUT EQU 61h
CONTROL EQU 62h

org 1000h
dato db "hola"
fin db ?

org 2000h

; configurar el registro CONTROL del usart
mov al, 01010001b; 51h
out CONTROL,al

; imprimir
mov bx, offset dato
; espero que la impresora tenga busy=0
poll:in al, CONTROL
	 and al, 10000001b; 81h
	 cmp al, 10000001b; 81H
	 jnz poll
	 ; mando a imprimir el char
	 mov al, [bx]
	 out DOUT, al
	 ; paso al sig caracter
	 inc bx
	 cmp bx,offset fin
	 jnz poll
int 0
end






