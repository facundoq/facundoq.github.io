; Leer una contraseña codificada en las llaves
; Si es la correcta (11001010), imprimir "Acceso permitido"
; Si no, imprimir "Acceso denegado"

; Los leds están conectados al puerto PB

PA equ 30h
CA equ 32h

org 1000h
contra db 11001010b
mensaje_permitido db "Acceso permitido"
fin1 db ?
mensaje_denegado db "Acceso denegado"
fin2 db ?

org 2000h
			mov al,11111111b
			out CA,al

			in al,PA

			cmp contra,al

			jz permitido
			mov bx, offset mensaje_denegado
			mov al, offset fin2-offset mensaje_denegado
			int 7
			jmp fin
permitido: mov bx, offset mensaje_permitido
           mov al, offset fin1-offset mensaje_permitido
		   int 7


fin: hlt
end