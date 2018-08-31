org 1000h
n1 dw 4
n2 dw 3
res dw ?

org 2000h
mov dx,n1
push dx
mov dx,n2
push dx
mov dx, offset res
push dx
call sumar
pop bx
pop bx
pop bx
hlt

org 3000h
sumar:mov bx, sp 
      add bx, 4
      mov ax,[bx]
      add bx, 2 
      mov cx,[bx]
      
      add ax,cx
      
      sub bx,4
      mov dx,[bx]
      mov bx,dx
      mov [bx],ax
      ;mov [dx],ax MAL
      ;mov res,ax MAL
      ret

end
