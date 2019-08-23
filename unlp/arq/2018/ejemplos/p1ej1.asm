;Escribir un programa para multiplicar dos números

org 1000h
n1 dw 4
n2 dw 3
res dw ?


org 2000h
mov dx,n1
mov cx,n2
mov ax,0

loop:dec cx; sub cx,1
	 add ax,dx
	 cmp cx, 0
     jnz loop

mov res,ax
hlt
end
