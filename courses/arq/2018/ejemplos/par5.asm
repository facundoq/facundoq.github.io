Antes de invocar a CALCULO, tenemos:
sp=80 00h
ax=70 ffh
bx= 0f 22h
cx=ab cdh

calculo: push ax
		pop cx
		xor cl,bh
		push bx
		pop ax
		call otra_sub
		push cx
		ret
		
		