
.data
dircontrol: .word 0x10000
dirdata: .word 0x10008

caracteres: .space 10 
carAContar: .ascii "a"

.code
ld $s0,dircontrol($0)
ld $s1,dirdata($0)

# 1) leer caracteres
daddi $a0,$0,caracteres# mov $a0, offset caracters
daddi $a1,$0,10
jal leer

# 2) contar las a
daddi $a0,$0,caracteres# mov $a0, offset caracters
daddi $a1,$0,10
lbu $a2,carAContar($0)
jal contar
# $v0 ya tiene la cantidad

# 3) imprimir la cantidad
sd $v0, 0 ($s1) # guardo la cant en data
daddi $t0,$0,1 
sd $t0,0($s0)# mando a imprimir

halt

# recibe en 
# a0 la direccion donde guardar los car
# a1 la cantidad a leer
leer: daddi $t0,$0,9
loop: sd $t0,0($s0) # leo un car
      lbu $t1,0($s1) # t1 tiene el car
	  sb $t1, 0($a0) # mov [bx], $t1
	  daddi $a0,$a0, 1 # 
	  daddi $a1,$a1, -1
      bnez $a1, loop
	jr $ra

# recibe en 
# a0 la direccion donde guardar los car
# a1 la cantidad a leer
# a2 el caracter a contar
# devuelve 
# la cantidad en $v0
contar: daddi $v0,$0,0
loop:  lbu $t0,0($a0)
       bne $t0,$a2,seguir
	   daddi $v0,$v0,1
seguir:daddi $a1,$a1, -1
	   daddi $a0,$a0,1
       bnez $a1, loop
	   jr $ra