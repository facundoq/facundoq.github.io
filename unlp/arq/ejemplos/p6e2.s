; Escribir un programa que imprima "Hola" en pantalla

.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
mensaje: .asciiz "hola"

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)

# en data la dir del string
daddi $t1,$0,mensaje
sd $t1,0($s1)

# en control = 4 (imprimir string)
daddi $t1,$0,4
sd $t1, 0($s0)
halt
