
cant EQU 10

org 1000h
cadena db dup(10) 0

org 2000h

mov bx,offset cadena

mov cl,0
loop:cmp cl,cant
	 jz fin

	 int 6; leo un char
	 inc bx; muevo el puntero para el sig
	 
	 inc cl
	 jmp loop

fin: mov bx, offset cadena
     mov al, cant
	 int 7
     int 0
end