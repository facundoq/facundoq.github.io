; imprimir una cadena de caracteres en la impresora
; a traves del USART con el protocolo DTR

DIN equ 60h
DOUT equ 61h
CTRL equ 62h

org 1000h
cadena db "hola como estas"
fin db ?

org 2000h   ; configuracion de CA y CB

mov bx,offset cadena
mov cl, offset fin - offset cadena

mov al, 01010001b
out CTRL, al

loop: in al, CTRL
     and al, 10000001b
	 cmp al, 10000001b
	 jnz loop
	 
	 ; ya podemos mandar el caracter
	 mov al,[bx]
	 out DOUT,al
	 
	 inc bx
	 dec cl
	 jnz loop

	 
hlt
end
