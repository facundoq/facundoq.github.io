; Generar un vector de 5 elementos, con los primeros 5 números pares (2, 4, 6, 8, 10)
; A partir de la variable pares


.data
pares: .word 0

.code

daddi r1,r0,2; r1 va atomar los valores 2, 4, 6..

daddi r2,r0,5; cant de loops
daddi r3,r0,0; desplazamiento
loop:sd r1,pares(r3)
	 daddi r1,r1,2; genero el nuevo par
	 daddi r3,r3,8; incremento r3 para apuntar al sig elem
	 daddi r2,r2,-1; descuento un elemento generado
	 bnez r2,loop

halt
