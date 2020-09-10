; hacer un programa que lea el valor de las llaves
; como una contraseña hasta que el usuario 
; la adivine

PA equ 30h
CA equ 32h

org 1000h
contra db 0f2h
correcto db "Ingreso al sistema"
fin db ?

;ca= 11111111
mov al, 0FFh
out CA,al

loop: in al,PA ; leo el valor actual de las llaves
	; comparo al con contra
	cmp al,contra
	jnz loop

mov bx, offset correcto
mov al, offset fin -offset correcto
int 7

hlt
end