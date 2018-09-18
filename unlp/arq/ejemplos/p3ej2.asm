; Hacer un contador con los leds
; Los leds empiezan en 0000000
; cada 1 segundo, aumentan 1
; 00000001
; 00000010

CB equ 33h
PB equ 31h

CONT equ
COMP equ 
IMR equ
INT1 equ 
EOI equ 

org 32
dir_contar dw contar

org 2000h
; Configurar CB  como para que PB sea todo de salida (00000000)
mov al,0
out CB,al
; indice de interrupcion del timer = 8
cli
; Configrar PIC
;configuro el imr
mov al, 11111101b
out IMR,al
; configuro el registro int1 del PIC
mov al, 8
out INT1,al

;Configurar el timer
;Configuro el CONT
mov al, 0
out CONT,al
;configuro el COMP
mov al, 1
out COMP,al
sti 
; apago todas las luces
mov al,0
out PB,al

loop: in al, PB
	  cmp al,FFh; 255 11111111b
      jnz loop

int 0


org 3000h
contar:  in al,PB ;imcremento PB
         inc al
		 out PB,al
		; reseteo el CONT a 0
		mov al,0
		out cont,al

		mov al,20h
		out EOI,al
		iret
end