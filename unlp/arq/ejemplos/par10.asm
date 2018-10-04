; Hacer un programa que genere este patron de leds:
; 00000001
; 00000010
;...
; 10000000
; 01000000
;..
; 00000001

CONT EQU 10h
COMP EQU 11h

EOI EQU 20h
IMR EQU 21h
INT1 EQU 25h

PB EQU 31h
CB EQU 33h

derecha EQU 0
izquierda EQU 1
org 1000h
direccion db izquierda


; recibe en al un byte y lo rota a la izquierda 1 vez
org 3000h
rotar_izq: add al,al
           adc al,0
		   ret
; recibe en al un byte y lo rota a la derecha 1 vez	
org 3200h	   
rotar_der:    mov ah,7
		loop: call rotar_izq
		      dec ah
			  jnz loop
			  ret
;recibe en al el estado de las luces y actualiza la dirección
org 3600h
actualizar_direccion: cmp direccion,izquierda
					jnz seguir
					cmp al, 10000000b
					jnz seguir
					mov direccion,derecha
					jmp fin_act
			seguir: cmp direccion,derecha
					jnz fin_act
					cmp al, 00000001b
					jnz fin_act
					mov direccion,izquierda
		 fin_act:   ret
org 3700h
moverme:  cmp direccion, izquierda
		  jz ir_izquierda
		  call rotar_der
		   jmp fin
ir_izquierda:call rotar_izq
			fin: ret
org 3500h	   
atencion_timer:; cont = 0 p resetear timer
				mov al,0
				out CONT,al
				; leo el estado
				in al,PB
				; actualizar el estado
				call actualizar_direccion
				call moverme
		
				; mandar el nuevo estado de luces
             fin:out PB,al
               mov al,20h
			   out EOI,al
			   iret
org 40 ; 28h
dir_atencion_timer dw atencion_timer; 3500h

org 2000h
; configurar el PIO
mov al,0
out CB,al
; inicializo las luces en 00000001
mov al,1
out PB,al
; configuro el PIC
cli
; imr
mov al,11111101b
out IMR,al
; INT1
mov al,10 ; Elegimos el 10 como indice del vector
out INT1,al
; CONT=0
mov al,0
out cont,al
; COMP=1 (una sola vez)
mov al,1
out comp,al
sti

