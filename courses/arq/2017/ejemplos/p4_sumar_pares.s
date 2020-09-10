# Defina una tabla con los primeros 4 numeros pares y calcule su suma.
# Guarde el resutlado en la memoria

.data
tabla: .word 2,4,6,8
suma: .word 0

.code
daddi r2,r0,0 #dadd r2,r0,r0
daddi r4,r0,4 # r4=4 pq la tabla tiene longitud 4
daddi r3,r0,0

loop: ld r1,tabla(r3)
	dadd r2,r2,r1 # r2=r2+r1
    daddi r3,r3,8
	daddi r4,r4,-1 # r4=r4-1
	bnez r4,loop
sd r2,suma(r0)
halt