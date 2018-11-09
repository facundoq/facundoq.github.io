# Leer un string de 10 caracteres
# imprimirlo


.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
max: .word 10
mensaje: .ascii 0

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)

daddi $t0,$0,9 # t0 tiene el codigo 9
daddi $t3,$0,0 # t3 = dir de mensaje
ld $t4,max($0) # t4 = cant car a leer

loop: sd $t0,0($s0)# leo un caracter
	lbu $t1,0($s1) # t1 tiene el car
	sb $t1,mensaje($t3)
	daddi $t3,$t3,1
	daddi $t4,$t4,-1
	bnez $t4,loop

daddi $t1,$0,0
sb $t1,mensaje($t3) # pongo un 0 al final del string

daddi $t1,$0,mensaje
sd $t1,0($s1)
daddi $t2,$0,4
sd $t2,0($s0)

halt
