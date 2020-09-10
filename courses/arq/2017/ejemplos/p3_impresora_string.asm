PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h


org 1000h
cadena db "hola como estas"
fin db ?

org 2000h   ; configuracion de CA y CB
			mov al,11111101b ; o 00000001b o 1 o 1h
			out CA,al
			
			mov al,00000000b
			out CB,al
			
			;iniciar el bit de strobe en 0
			in al,PA
			and al,11111101b
			out PA, al
			
			mov bx, offset cadena			
			mov cl,offset fin-offset cadena
			
			; esperar a que busy == 0
poll_busy:	in al,PA
			and al,00000001b
			jnz poll_busy
			
			; enviar caracter
			mov al,[bx]
			out PB,al
			inc bx
			
			; mandar señal de strobe
			; mandar un 1
			in al,PA
			or al,00000010b
			out PA, al
			;manda un 0
			in al,PA
			and al,11111101b
			out PA, al
			
			dec cl
			jnz poll_busy
hlt
end