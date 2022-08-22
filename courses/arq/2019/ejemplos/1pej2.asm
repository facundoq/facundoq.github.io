 ; Pasar el valor de ax a cx
 ; de cx a dx
 ; de dx a ax

; Sin la pila 
 
 mov bx,ax
 mov ax,dx
 mov dx,cx
 mov cx,bx
 
 ; Con la pila
 
 push ax
 push cx
 push dx
 pop ax
 pop dx
 pop cx
 