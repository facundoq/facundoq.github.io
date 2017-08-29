
org 1000h
a db ?
b db ?

org 2000h
mov bx, offset a
int 6
mov bx, offset b
int 6

mov bx,offset a
mov al,1
int 7

mov bx,offset b
;mov al,1
int 7

int 0 ;hlt
end