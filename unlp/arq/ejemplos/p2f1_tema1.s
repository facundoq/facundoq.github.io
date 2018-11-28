.data
vector1: .word 15, 5, 7, 8 ,9, 10, 1 ,2 ,3 ,4 ,5, 6
mayor: .word 0
control: .word32 0x10000
data: .word32 0x10008
vector2: .word 0

.code

;cargo las direcciones de data y control
lwu $s0,control($0)
lwu $s1,data($0)

;leo el valor MAYOR
daddi $t0,$0,8; 8 es el codigo de leer num
sd $t0, 0($s0) ; mando el 8 a control
ld $s3, 0($s1); cargo el valor leido desde data en t1
sd $s3, mayor($0)

; genero el vector2
daddi $s4,$0,0 ; s4 es el indice del vector1
daddi $s5,$0,12; s5 tiene la cant de elementos restantes del vector1
daddi $s6,$0,0 ; s6 es el indice del vector2
daddi $s7,$0,0; s7 tiene la cant de elementos del vector2
loop: ld $s2, vector1($s4) ; cargo el valor del vector en t2
	  daddi $s4,$s4,8; avanzo al sig elemento
	  ;llamar a compara
	  dadd $a0,$0,$s3
	  dadd $a1,$0,$s2
	  jal compara
	  beqz $v0, fin
	  ; $v0=1, o sea es mayor, o sea agregamos a vector2
	  sd $s2,vector2($s6); agrego el valor en vector2
	  daddi $s6,$s6,8; avanzo en vector2
	  daddi $s7,$s7,1; cuento el valor agregado
  fin:daddi $s5,$s5,-1
	  bnez $s5,loop
	  
; muestro el vector2
daddi $a0,$0,vector2 ; direccion de vector2
ld $a0,vector2($0)
daddi $a1,$s7,0 ; $a1 := $s7, cant de elem de vector2
jal muestra
halt

; recibe dos valores en a0 y a1
; devuelve en v0 1 si a0<a1
compara: slt $v0,$a0,$a1
        jr $ra

muestra: ld $t0,0($a0); cargo un elem de vector2
		daddi $a0,$a0,8 ;paso al sig elemento
		;imprimir $t0
		sd $t0,0($s1); envio $t0 a data
		daddi $t1,$0,1
		sd $t1,0($s0); envio el codigo 1 a control
		; paso al sig elemento
		daddi $a1,$a1,-1
		bnez $a1,muestra
		jr $ra


