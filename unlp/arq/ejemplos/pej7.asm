 hand equ 40h
 
 org 1000h
 msj db " ingresar texto (maximo 10 caracteres)"
 fin db ?
 car10 db ?
 
 org 2000h
 ; imprime el string msj
 mov bx, offset msj
 mov al, offset fin-offset msj
 int 7
 mov ah, 10
 mov bx, offset car10
 ingre: int 6
       cmp byte ptr [bx], 0Dh
	   jz seguir
	   inc bx
	   dec ah
	   jnz ingre
	   
seguir: in al, hand+1
		and al, 7Fh;0111 1111 ;COMPLETAR
		out hand+1,al
		
		mov bx, offset car10
		mov cl,10 ; COMPLETAR
		sub cl,ah; cl tiene la cant de caracteres leidos
		
poll:   in  al, hand+1
		and al,1; 0000 0001 and IxxxxxSB = 0000000B
		jnz poll
		mov al, [bx]
		out hand,al ;COMPLETAR
		inc bx
		dec cl
		jnz poll
int 0
end