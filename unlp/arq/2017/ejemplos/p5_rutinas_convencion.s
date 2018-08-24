;Escriba una subrutina que multiplique
; dos números.
; Recibe los parametros por registro en r1 y r2
;y devuelve el resultado en r3

.data
a: .word 5
b: .word 3
r: .word 0

.code

ld $a0,a(r0)
ld $a1,b(r0)
jal multiplicar
sd $v0,r(r0)
halt

# multiplicar recibe en r1 y r2 los
# operandos y devuelve en r3 el res
multiplicar: daddi $t0,r0,0
	   loop: dadd  $t0,$t0,$a0
             daddi $a1,$a1,-1
			 bnez  $a1,loop
			 dadd $v0,$0,$t0
			 jr $ra
			
			
