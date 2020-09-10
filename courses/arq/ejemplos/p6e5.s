# imprimir el numero 5 en pantalla como numero con signo
.data
dircontrol: .word 0x10000
dirdata: .word 0x10008

.code

ld $t2,dircontrol($0)
ld $t3,dirdata($0)

daddi $t1,$0,8
sd $t1,0($t2) # mando la orden de leer un numero (codigo 8)


ld $t4,0($t3) # cargo el numero (8 bytes) desde DATA


halt
