# Leer de teclado 10 números de punto flotante y almacenarlos en un vector.
# Luego de leidos los 10 números, calcular el producto de todos, convertir el resultado a entero, e imprimir el resultado en pantalla
# Utilizar una subrutina para la lectura, y otra para calcular el producto

.data 
#valores: .space 80 # 10 * 8 bytes
# o equivalente:
valores: .word 0,0,0,0,0,0,0,0,0,0
producto: .word 0
dircontrol: .word 0x10000
dirdata: .word 0x10008
.code
ld $s0,dircontrol($0)
ld $s1,dirdata($0)

daddi $a0,$0,valores # mov a0, offset valores
daddi $a1,$0,10
jal leer
#vuelvo a inicializar por si leer los cambia
daddi $a0,$0,valores # mov a0, offset valores
daddi $a1,$0,10
jal calcular
sd $v0,producto($0)

halt

# recibe la dir de memoria del vector en a0
# recibe la longitud del vector en a1
leer:  daddi $t0,$0,8
	loop: sd $t0,0($s0) # guardo el 8 en control
		  l.d f1,0($s1)
		 # COMPLETAR
		 ....
		 #COMPLETAR
		 daddi $a1,$a1,-1
		 bnez $a1, loop
	jr $ra

# recibe la dir de memoria del vector en a0
# recibe la longitud del vector en a1
# devuelve el producto en v0
calcular:
		   # COMPLETAR
		 ....
		 #COMPLETAR
		jr $ra