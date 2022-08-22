# imprimir el numero 5 en pantalla como numero con signo
.data
dircontrol: .word 0x10000
dirdata: .word 0x10008

npf: .double 5.0

.code

ld $t2,dircontrol($0)
ld $t3,dirdata($0)

l.d f1,npf($0)

s.d f1,0($t3) # guardo 5 en DATA
daddi $t4, $0, 3
sd $t4,0($t2)# guardo el 2 en CONTROL para imprimir lo que está en data

halt
