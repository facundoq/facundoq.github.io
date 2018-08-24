# Calcule el producto de los numeros de la tabla que sean menores a 7
# Guarde el resultado en la memoria

# slt => set less than  => poner 1 si es menor que
#slti => set less than  => poner 1 si es menor que un inmediato

#beqz => branch if equal zero => saltar si el registro es 0
#bnez => branch if NOT equal zero => saltar si el registro NO es 0

#beq => branch if equal  => saltar si son iguales
#bne => branch if NOT equal  => saltar si son distintos

.data
tabla: .word 20,11,5,32,4,99,1
producto: .word 0 # = 5*4*1 = 20

.code
daddi r2,r0,1 # en r2 guardamos el resultado
daddi r4,r0,7 # r4=7 pq la tabla tiene longitud 7
daddi r3,r0,0 # el desplazamiento en 0

loop:  ld r1,tabla(r3)
	   daddi r3,r3,8
	  
	  #preguntar si es menor que 7
	  #slti y slt
	   slti r9,r1,7 # r9 = 1 si r1<7 o r9=0 si r1 >= 7
	   beqz r9,seguir
	   dmul r2,r2,r1
seguir: daddi r4,r4,-1 # r4=r4-1
	   bnez r4,loop

sd r2,producto(r0)

halt