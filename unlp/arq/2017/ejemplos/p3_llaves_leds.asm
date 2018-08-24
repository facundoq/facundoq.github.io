; Leer un patrón de bits de las llaves
; y en base a eso prender los leds


PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h


org 2000h
			mov al,11111111b
			out CA,al
			
			mov al,00000000b
			out CB,al

	loop:	in al,PA
			out PB,al
			jmp loop

end
