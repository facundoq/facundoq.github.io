; Multiplicar por dos los elementos del vector a
; No se debe crear un vector nuevo.
; Modificar directamente las posiciones de memoria existentes
; Es decir, al final del programa a debe tener los valores 0, 2, 4, 6, y 8


.data
a: .word 0, 1, 2, 3, 4

.code
daddi r1,r0,2
daddi r3,r0,0
daddi r2,r0,5
loop: ld r4,a(r3)
      dmul r4,r4,r1
	  sd r4,a(r3)
	  daddi r3,r3,8
	  daddi r2,r2,-1
	  bnez r2,loop
halt
