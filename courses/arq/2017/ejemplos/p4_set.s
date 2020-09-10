.data
temperatura: .word 25
peso: .word 0x25
title: .asciiz "hola como estas"
foo: .word 2
bar: .word 7
tabla: .word 2,4,6,1231283,10,12,14
hola: .word 28
hola2: .word32 28
hola3: .word16 28
hola4: .byte 28
#.word32,.word16,.byte

.text #o .code
#Registros: r0 a r31
#r0 SIEMPRE vale 0

#daddi r1,r0,5 # r1 = 5  = r0+5
#dadd r1,r0,r2 # r1 = r2 = r0+r2
#daddi r2,r0,3 # r2 = r0+3
#dadd r3,r1,r2
#and r4,r1,r2

#andi r5,r1,4
#dsub r6,r1,r2
#dmul r7,r1,r2

#dmul r1,r1,r2 # r1= r1*r2

#daddi r3,r0,4 # r3=4
#daddi r3,r3,1 # r3=r3+1

# LECTURA Y ESCRITURA DE LA MEMORIA

#ld r3,foo(r0)

#ld r4,0x20(r0)

#daddi r2,r0,0x20
#ld r5,16(r2)


#daddi r4,r0,25
#sd r4,foo(r0)

#daddi r3,r0,0x18
#ld r6,foo(r3) # accedo a 0x38

#daddi r3,r0,0

#ld r9,tabla(r3)
#daddi r3,r3,8

#ld r10,tabla(r3)
#daddi r3,r3,8

#ld r11,tabla(r3)
#daddi r3,r3,8

#loop_infinito: j loop_infinito  # j = jmp



beq r3,r4,iguales
beqz r3,es_cero
#
bne r3,r4,distintos
bnez r3,no_es_cero


daddi r3,r0,5
slti r2,r3,8 # r2 = 1 si r3<8, sino 0, como un CMP sin flags

daddi r4,r0,8
slt r2,r3,r4 # r2 = 1 si r3<r4, sino 0, como un CMP sin flags

halt
