; Reemplazar con el valor 1 los elementos de a que sean mayores a 10
; Modificar directamente las posiciones de memoria existentes
; Es decir, al final del programa a debe tener los valores 1, 3, 1, 2, 5, 1


.data
a: .word 15,3,12,2,5,41
.code
daddi r1,r0,6; # de elementos 
daddi r3,r0,0; desplazamiento
daddi r5,r0,1; r5 siempre tiene el 1
loop:  ld r2,a(r3); cargo un el
	   slti r4,r2,11
	   bnez r4,seguir
	   ; era mayor, lo cambio por 1
	   sd r5,a(r3)
	   ; continuo con otro elemento
seguir:daddi r1,r1,-1
	   daddi r3,r3,8
	   bnez r1,loop
halt
