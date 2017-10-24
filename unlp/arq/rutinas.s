;Escriba una subrutina que multiplique
; dos números.
; Recibe los parametros por registro en r1 y r2
;y devuelve el resultado en r3

.data
a: .word 5
b: .word 3
r: .word 0

.code

ld r1,a(r0)
ld r2,b(r0)
jal multiplicar
sd r3,r(r0)
halt

# multiplicar recibe en r1 y r2 los
# operandos y devuelve en r3 el res
multiplicar:daddi r3,r0,0
	   loop:dadd  r3,r3,r1
            daddi r2,r2,-1
			bnez  r2,loop
			jr r31
			
			
