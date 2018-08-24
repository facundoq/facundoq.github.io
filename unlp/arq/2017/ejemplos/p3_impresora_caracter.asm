PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h


org 1000h
c db "a"


org 2000h
			mov al,11111101b ; o 00000001b o 1 o 1h
			out CA,al
			
			mov al,00000000b
			out CB,al
			
			; esperar a que busy == 0
poll_busy:	in al,PA
			and al,00000001b
			jnz poll_busy
			; enviar caracter
			mov al,c
			out PB,al
			; mandar señal de strobe
			;manda un 0
			in al,PA
			and al,11111101b
			out PA, al
			
			; mandar un 1
			in al,PA
			or al,00000010b
			out PA, al


end