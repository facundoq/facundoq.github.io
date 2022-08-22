; Completar el codigo para realizar el pasaje de parámetros a calculo
; dato1 debe pasarse por valor y registro
; dato2 debe pasarse por valor y registro
; result se devuelve por referencia por la pila

 org 1000h
 dato1 db 100
 dato2 db 200h
 result dw ?
  
 org 2000h
 mov bx,offset result
 push bx
 mov al,dato1
 mov cl,dato2
 call calculo
 pop bx
 
 ; dato1 valor pila
 ; dato2 referencia pila
 ; result se devuelve por valor por registro
 org 2000h
 mov al,dato1
 mov ah,0
 push ax
 mov ax,offset dato2
 push ax
 call calculo
 mov result,ax
 pop ax
 pop ax
 
 
 