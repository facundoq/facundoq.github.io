# imprimir el numero 5 en pantalla como numero con signo
.data
dircontrol: .word 0x10000
dirdata: .word 0x10008

string: .ascii "holahola"
valores: .asciiz "chauchau"

.code

ld $t2,dircontrol($0)
ld $t3,dirdata($0)

daddi $t1,$0,string # mov T1, offset string

sd $t1,0($t3) # guardo la dir de STRING en DATA
daddi $t4, $0, 4
sd $t4,0($t2)# guardo el 4 en CONTROL para imprimir lo que está en data

halt
