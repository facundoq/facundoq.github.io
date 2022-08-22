# imprimir el numero 5 en pantalla como sin signo
.data
dircontrol: .word 0x10000
dirdata: .word 0x10008


.code

ld $t2,dircontrol($0)
ld $t3,dirdata($0)

daddi $t1,$0,5

sd $t1,0($t3) # guardo 5 en DATA
daddi $t4, $0, 1
sd $t4,0($t2)# guardo el 1 en CONTROL para imprimir lo que está en data

halt
