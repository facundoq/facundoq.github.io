; Escriba un programa que permita controlar los LEDS con las llaves
; El programa termina si el usuario prende todas las llaves

PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

org 2000h
; configrar el PIO
; Configuro PB
mov al,0
out CB,al
; Configuro PA
mov al,11111111b
out CA,al


loop: in al, PA
	  out PB,al
	  cmp al, 11111111b
	  jnz loop
	  
int 0
end