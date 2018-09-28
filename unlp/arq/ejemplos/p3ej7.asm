;escriba un programa que imprima el string "hola"
;a traves de la impresora utilizando el HANDSHAKE
; utilizando consulta de estado


;
DATO   EQU 40h
ESTADO EQU 41h

org 1000h
dato db "hola"
fin db ?

org 2000h

; configurar el bit INT del HAND
in al,ESTADO
and al, 01111111b
out ESTADO,al
; imprimir
mov bx, offset dato
; espero que la impresora tenga busy=0
poll:in al, ESTADO
	 and al,1
	 jnz poll
	 ; mando a imprimir el char
	 mov al, [bx]
	 out DATO, al
	 ; paso al sig caracter
	 inc bx
	 cmp bx,offset fin
	 jnz poll
int 0
end






