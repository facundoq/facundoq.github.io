;Escriba un programa que implemente el juego "El cofre del tesoro"
  
El programa al principio muestra el mensaje "Adivina la combinacion, tenes 90 segundos".

;Luego, controlar el estado de los interruptores hasta que 
;1) Se ingresa la combinación secreta, y se debe mostrar el mensaje "$$$$$"
;2) Pasan 90, segundos y el usuario no adivino se muestra el mensaje "nunca lo adivinaras"

;La comunicacion con las llaves se hace a través del PIO


PA equ 30h
CA equ 32h

EOI equ 20h
IMR equ 21h
INT1 equ 25h

org 1000h
inicial db "Adivina la combinacion, tenes 90 segundos"
acierto db "$$$$$"
fallo db "nunca lo adivinaras"
clave db 0F2h
perdio db 0

org 20
dir_fallar dw 3000h 

org 3000h
fallar: mov bx,offset fallo
		mov al, offset clave - offset fallo
		int 7
		mov perdio,1
		mov al,20h
		out EOI, al
		iret
		
org 2000h
cli
; muestro el mensaje inicial
mov bx,offset inicial
mov al, offset acierto - offset inicial
int 7

;configurar PA poniendo CA = 1111 1111
mov al, 0FFh
out CA,al

; configurar el pic

;0) elegir ID = 5
;1) Configrar el IMR
mov al, 0FDh; 1111 1101
out IMR,al
; 2) Configurar el registro INT1
mov al, 5
out INT1,al

; Configuro el COMP
mov al,90
out COMP,al

mov al,0
out CONT,al

sti

loop: in al, PA
	cmp perdio,1
	jz fin
	cmp al,clave
	jnz loop

; imprimo mensaje de acierto
mov bx,offset acierto
mov al, offset fallo - offset acierto
int 7

fin:int 0; equivalente al hlt
	end

