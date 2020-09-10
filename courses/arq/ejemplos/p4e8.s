; Generar un nuevo vector a partir de b 
; que tenga los mismos valores que a pero incrementados en 2
; Es decir, b debe tener: 3, 4, 5, 6, 7

.data
a: .word 1, 2, 3, 4, 5
b: .word 0
.code
daddi r1,r0,5; cant de elementos
daddi r3,r0,0; desplazamiento

loop:ld r2,a(r3); cargo el elemento
     daddi r2,r2,2; lo incremento
	 sd r2,b(r3); lo guardo
	 daddi r3,r3,8; paso al sig elemento
	 daddi r1,r1,-1
	 bnez r1,loop
halt
