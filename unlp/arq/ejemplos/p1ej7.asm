

codigoX EQU 24h
 
org 1000h
cadena db "hola como estas"
terminacion db 0
caracter db "o"

cantidad dw 0

; cadena db 25,12,16,99,14,39,0

; 7FFA DR_L
; 7FFB DR_H
; 7FFC CARACTER_L
; 7FFD CARACTER_H
; 7FFE DIR CADENA_L
; 7FFF DIR CADENA_H
; 8000


org 3000h ; concar recibe a través de la pila la dirección
          ; y el caracter a buscar
          ; concar devuelve la cantidad en el registro cx
concar: mov bx,sp
		; traigo el caracter de la pila
		add bx,2
		mov al,[bx]
		; traigo la direccion de la cadena de la pila
		add bx,2
		mov dx,[bx]; en dx pongo la direccion de la cadena
		mov bx,dx; la paso a bx para usar los []
		; contar
        mov cx,0
  loop: cmp [bx],0 ; while [bx]<>0
		jz fin
        ; if [bx]==al => inc cx
		cmp [bx],al
		jnz seguir
		inc cx
		mov [bx], codigoX
seguir: inc bx
        jmp loop		
   fin: 
        ret


org 2000h
mov ax, offset cadena
push ax
mov al, caracter
mov ah, 0
push ax
call concar
pop ax
pop ax
mov cantidad,cx


hlt
end