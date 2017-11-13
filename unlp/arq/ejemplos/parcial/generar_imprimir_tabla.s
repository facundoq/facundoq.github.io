# Dado un vector tabla1 con 10 valores flotantes almacenados en la memoria
# 
# Hacer una subrutina para generar un vector tabla2 con aquellos elementos de tabla 1 mayores a un valor ingresado por teclado.
# Hacer una subrutina que imprima los elementos de tabla2

# Hacer el programa principal que llame a ambas subrutinas


.data
dir_data: .word32 0x10008
dir_control: .word32 0x10000

tabla1: .double 12.5,17,24,-55,38.5,5,1,3,6,9
n: .word 10
tabla2: .double 0



.code
#cargo las direcciones de data y control
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

# 1) Leer el minimo
daddi $t0,$0,8
sd $t0,0($s0)
l.d f0,0($s1)

# 2) generar tabla2
mfc1 $a0,f0         #copio a a0 el valor del minimo
daddi $a1,$0,tabla1 # a0 = dir de tabla 1
ld    $a2,n($0)     # tabla 1 tiene 10 elementos
daddi $a3,$0,tabla2 # a3 = dir de tabla 2

jal generar_tabla #devuelve elementos de tabla2 en v0

# 3) imprimir tabla2
dadd $a0,$0,$v0# elementos de tabla2
daddi $a1,$0,tabla2 # a1 = dir de tabla 2
jal imprimir_tabla

halt

generar_tabla: mtc1 $a0,f1 # ponemos en f1 el minimo
               daddi $v0,$0,0 # v0 tienen la cant de elem de tabla2
		loop:  l.d  f2,0($a1) # leo un valor de tabla1
			   
			   c.lt.d f1,f2 #FP=1 si f1<f2
			   bc1f no_cargar # si FP=0 (o sea, f1>=f2) no lo cargo
			   #copio a tabla2 el valor de f2
			   s.d f2,0($a3)
			   daddi $a3,$a3,8 #avanzamos en la tabla2
			   daddi $v0,$v0,1 #contamos un elemento mas de tabla2
			   
	no_cargar: daddi $a2,$a2,-1 # nos queda un elemento menos
			   daddi $a1,$a1,8 #avanzo al siguiente elemento de tabla1
			   bnez  $a2,loop
               jr $ra
			   
imprimir_tabla: nop
        asdasd: l.d f0,0($a1) # leo un valor de la tabla
				s.d f0,0($s1) # lo mando a data
				daddi $t3,$0,3
				sd $t3,0($s0) # envio el codigo 3 a control
				daddi $a0,$a0,-1
				daddi $a1,$a1,8
				bnez  $a0,asdasd
			    jr $ra