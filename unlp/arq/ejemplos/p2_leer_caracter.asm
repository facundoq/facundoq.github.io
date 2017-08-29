; leer dos caracteres y guardarlos en las variables a y b
org 1000h
a db ?
b db ?

org 2000h
mov bx, offset a
int 6
mov bx, offset b
int 6

int 0 ;hlt
end
