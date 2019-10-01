; Calcule la suma de los valores del vector a
; Utilice el registro r1 como puntero para acceder a los elementos


.data
a: .word 15,3,12,2,5,41
.code

; r1 contiene la dirección de a
daddi r1,r0,a


halt
