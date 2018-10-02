;Escriba un programa que imprima en pantalla "Debo estudiar para el parcial de arquitectura" una vez por segundo durante 30 segundos.

;Si se presiona la tecla F10 debe pausarse la impresión, y reanudarse si se vuelve a presionar.


EOI EQU 20h
IMR EQU 21h
INT0 equ 24h
INT1 equ 25h

CONT equ 10h
COMP equ 11h

id_f10 equ 11
id_timer equ 15

org 44
dir_rutina_f10 dw rutina_f10

org 60
dir_rutina_timer dw rutina_timer

org 1000h
mensaje db "Debo estudiar para el parcial de arquitectura"
fin db ?
segundos db 30
fin_impresion db 0
pausa db 0


org 2000h
cli
; configuro PIC
mov al,11111100b
out IMR,al
mov al,id_f10
out INT0,al
mov al,id_timer
out INT1,al
; configuro TIMER
mov al,0
out cont,al
mov al,1
out comp,al
sti

loop: cmp fin_impresion,0
      jnz loop
int 0


org 3000h
rutina_timer:;pongo cont en 0
			 mov al,0
			 out CONT,al
			 ; si pausa=1, me salteo todo
			 cmp pausa,0
			 jnz seguir
			 ; imprimir el mensaje
			 mov bx, offset mensaje
			 mov al,offset fin-offset mensaje
			 int 7
			 
			 ; decrementos segundos
			 dec segundos
			 cmp segundos, 0
			 jnz seguir
			 mov fin_impresion,1; cancelo impresion
	   seguir:mov al,20h
		     out EOI,al
		     iret

org 3500h
rutina_f10:not pausa; invierto pausa entre 000000000 y 11111111
		   mov al,20h
		   out EOI,al
		   iret

