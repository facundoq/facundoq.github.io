; Multiplicar dos numeros almacenados en la memoria y guardar el resultado en otra variable en la memoria

org 1000h
num1 dw 5
num2 dw 3
res dw ?

org 2000h
mov ax,0
mov cx,num2

loop: add ax,num1
      dec cx
	  jnz loop
mov res,ax
hlt
end

