; mostrar de a una las letras de "hola"
; mostrar una letra c/ vez que se presiona f10
; cuando se mostraron las 4 terminar

		org 3000h
imprimir:mov al,1
		 int 7
		 inc bx
		 dec cantidad
		 mov al,20h
		 out EOI,al
		iret

org 40
asd dw imprimir

org 1000h
cadena db "hola"
cantidad db 4

EOI equ 20h
IMR equ 21h
INT0 equ 24h

org 2000h

cli
mov bx,offset cadena
mov al,11111110b
out IMR,al
mov al,10
out INT0,al
sti

loop: cmp cantidad,0
      jnz loop
	  hlt
end