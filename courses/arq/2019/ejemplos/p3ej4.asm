
; Escribir un programa que escriba el string "hola" en la impresora utilizando el PIO

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h
mensaje db "hola"


org 3000h
strobe0: ;PONER STROBE EN 0 
		in al,PA
		; poner el bit 2 de al en 0
		and al, 0FDh ; 1111 1101 
		out PA,al
		ret

org 3500h
strobe1: ;PONER STROBE EN 1 
		in al,PA
		; poner el bit 2 de al en 1
		or al,2 ; 0000 0010b
		out PA,al
		ret
		
org 2000h

;CB = 0000 0000 (todo salida)
mov al,0
out CB,al
; CA = XXXX XX01 
;(6 ni idea, 1 salida, 1 entrada)
; 6 nada, STROBE, BUSY
mov al,01h; 0000 0001
out CA,al

;PONER STROBE EN 0 
call strobe0

mov bx, offset mensaje
mov cl, 4 ; cant caracteres o long mensaje

loop:
	; 1)  ESPERAR A QUE BUSY = 0
	poll:in al,PA ; traigo el byte de control
		; aislo el bit de busy
		and al,1; 0000 0001
		CMP al, 0; podria sacar esta linea
		jnz poll
	;  Escribo el caracter en PB
	mov al,[bx]
	out PB,al
	inc bx; apunto al sig caracter

	call strobe1
	call strobe0
	
	dec  cl ; un car menos
	jnz loop

hlt
end
