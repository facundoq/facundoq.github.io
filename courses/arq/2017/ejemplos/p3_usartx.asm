; imprimir una cadena de caracteres en la impresora
; a traves del USART con el protocolo XON/XOFF

DIN equ 60h
DOUT equ 61h
CTRL equ 62h
XON equ 11h

org 1000h
cadena db "hola como estas"
fin db ?

org 2000h 

mov bx,offset cadena
mov cl, offset fin - offset cadena

mov al, 01010001b
out CTRL, al

loop: in al, CTRL
     and al, 00000001b
	 jz loop
	 
	 ; ya podemos mandar el caracter
	 mov al,[bx]
	 out DOUT,al
	 
	 inc bx
	 dec cl
	 jz terminar
	 
	 in al, CTRL
     and al, 00000010b
	 jz loop
	 
wait_xoff :	   in al,DIN
				   cmp al,XON
				   jz loop 

wait_xrdy:      in al, CTRL
                   and al, 00000010b
                   jz wait_xrdy
                   jmp wait_xoff
                   
terminar: hlt
end
