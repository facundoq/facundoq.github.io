
org 1000h
; variables here
b db 10010101b
n db 5

; recibe en al el byte a rotar a la izq
; recibe en ah la cantidad de veces a rotar a la izq
; devuelve en al el byte rotado
org 3000h
rotarizq:cmp ah,0
         jz fin
                 ; si no termino
                 add al,al
                 jnc saltear
                 inc al
 saltear:dec ah
         jmp rotarizq
     fin:ret

; recibe en cl el byte a rotar a la derecha
; recibe en ch la cantidad de veces a rotar a la derecha
; devuelve en cl el byte rotado
org 4000h
rotarder:mov ah,8
         sub ah,ch
         ; ah: la cant de rot izq
         mov al,cl
         call rotarizq
         mov cl,al
         ret

org 2000h
mov cl,b
mov ch,n
call rotarder
hlt
end
