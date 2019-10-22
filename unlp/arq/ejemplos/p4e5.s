; Calcular el valor máximo entre a y b
; Almacenar el resultado en la variable max
; Si bien en este caso a y b tienen valores que conocemos
; asuma que no los conocemos y utilice un slt para compararlos.


.data
a: .word 150
b: .word 40
max: .word 0

.code
		ld r1,a(r0)
		ld r2,b(r0)

		slt r4,r1,r2; r4 = 1 si r1<r2 y 0 dlc
		beqz r4,escero
		dadd r3,r2,r0; r3=r2
		j fin
escero: dadd r3,r1,r0; r3=r1
fin:	sd r3,max(r0) ;maximo en r3

halt
