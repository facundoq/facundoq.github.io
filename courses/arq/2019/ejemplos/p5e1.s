; intercambiar los valores de r1 y r2
; utilizando la pila

.code

daddi r1,r0,5
daddi r2,r0,3

# asumimos que r29 es nuestro SP
daddi r29,r0,0x400

#push r1
daddi r29,r29,-8
sd r1, 0(r29)
#push r2
daddi r29,r29,-8
sd r2, 0(r29)
#pop  r1
ld r1,0(r29)
daddi r29,r29,8
#pop  r2
ld r2,0(r29)
daddi r29,r29,8

#pop  rx
# ld rx,0(r29)
# daddi r29,r29,8
