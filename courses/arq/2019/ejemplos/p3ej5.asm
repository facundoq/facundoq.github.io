; Imprimir un string en la impresora a través del handshake en modo consulta  de estado o polling

; Registros del Handshake
;40h DATO     XXXXXXXX; aqui escribo los chars 
;41h ESTADO   IXXXXXSB
;	I: bit para activar (1) o desactivar (0) las ints del handshake
;	S: Strobe (pero no lo vamos a usar)
;	B: Busy (lo podemos leer, solo en polling)

DATO equ 40h
ESTADO equ 41h

org 1000h
mensaje db "hola"

org 2000h
; configurar el handshake en modo polling
; poner el bit 7 de ESTADO en 1
in al,ESTADO
and al, 7Fh ; IXXXXXSB and 0111 1111 => 0XXXXXXSB
out estado,al

mov bx, offset mensaje
mov cl, 4

loop: nop
	poll:in al, ESTADO
		 and al, 1;0000 0001 and IXXXXXSB => 0000 000B
		 jnz poll
	 ;mando char a imprimir
	 mov al,[bx]
	 out DATO,al
	 ; NO mando la señal de strobe (HAND)
	 ; avanzo al sig char
	 inc bx
	 dec cl
	 jnz loop
hlt
end