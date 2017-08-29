 
org 1000h
cadena db "hola como estas"
terminacion db 0
cantidad dw 0

; cadena db 25,12,16,99,14,39,0


org 3000h ; concar recibe en bx la direccion de la cadena
          ; concar devuelve la cantidad en el registro cx
concar: push bx
        mov cx,0
  loop: cmp [bx],0
		jz fin
        inc bx
        inc cx
        jmp loop		
   fin: pop bx
        ret


org 2000h
mov ax, offset cadena
call concar
mov cantidad,cx


hlt
end