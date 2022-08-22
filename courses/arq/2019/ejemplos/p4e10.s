; Calcule la suma de los valores del vector a
; Utilice el registro r1 como puntero para acceder a los elementos


.data
a: .word 15,3,12,2,5,41
.code

; r1 contiene la dirección de a
daddi r1,r0,a

daddi r2,r0,6; # elementos
daddi r3,r0,0; suma 
loop: ld r4,0(r1); cargo en r4 un elemento
      dadd r3,r3,r4; lo sumo a r3
	  daddi r1,r1,8; avanzar al siguiente elemento
      daddi r2,r2,-1; descuento 1 elemento
	  bnez r2,loop

halt
