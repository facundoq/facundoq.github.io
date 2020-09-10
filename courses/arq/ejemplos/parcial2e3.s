# 1) Calcular valor de r1 al final del programa

# A) Con delay slot desactivado => 8*2=16
# B) Con delay slot activado    => 8*2*2*2*2*2=256
# 2) Como cambiarías el programa para que funcione SIN delay slot? 
#    => Intercambiando el bnez y el dsll
    

.data
a: .byte 8
b: .byte 5

.code
lb r1, a(r0)
lb r2, b(r0)
loop: daddi r2,r2,-1
	  bnez r2,loop
	  dsll r1,r1,1
	  halt
	  
	  
