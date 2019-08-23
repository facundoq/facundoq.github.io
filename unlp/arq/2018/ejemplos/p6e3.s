# Leer dos numeros enteros de teclado e imprimir la suma


.data
CONTROL: .word 0x10000
DATA:    .word 0x10008

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)

daddi $t0,$0,8

sd $t0,0($s0) # mando a control el codigo 8 (leer)
ld $t1,0($s1) # pongo en t1 el num leido

sd $t0,0($s0) # mando a control el codigo 8 (leer)
ld $t2,0($s1) # pongo en t1 el num leido

dadd $t3,$t1,$t2

# imprimo la suma (t3)
sd $t3, 0($s1)# pongo la suma en DATA
daddi $t0,$0,1
sd $t0,0($s0)# mando el codigo 8 a ctrl

halt
