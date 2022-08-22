; Imprimir un string en la impresora a través del handshake en modo interrupciones

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
restantes db 4

org 3000h
imprimir: mov al, [bx]
		  out DATO,al
		  inc bx
		  dec restantes
		  
		  mov al,20h
		  out EOI,al
		  iret


; 3) Poner la dirección de la subrutina IMPRIMIR en el vector de interrupciones en el indice 4 (direccion 16)
org 16
dir_imprimir dw imprimir	  

		  
org 2000h

sti
; configurar el handshake en modo interrupciones
; poner el bit 7 de ESTADO en 1
in al,ESTADO
or al, 80h ; IXXXXXSB or 1000 0000 => 1XXXXXXSB
out estado,al


; configurar el PIC
; 0) Elegir el ID de interrupciones = 4
; 1) Configurar el IMR = 1111 1011
mov al, 0FBh ;1111 1011
out IMR,al

; 2) Configurar el registro INT2 (donde se conecta el HS): INT2 = 4
mov al, 4 
out INT2,al

; inicializo el puntero al mensaje
mov bx,offset mensaje
cli

; esperar se termine de imprimir
loop: cmp restantes,0
	  jnz loop
hlt
end