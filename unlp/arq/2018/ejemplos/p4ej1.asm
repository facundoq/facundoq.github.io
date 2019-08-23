; Convertir el siguiente código Pascal al assembly del WinMIPS64
; var a,b,c: integer
; a:=5
; b:=15
; c:=0
; if a < b
;    c := 5


a: .word 10
b: .word 15
c: .word 0


	ld r1,a(r0); cargo el valor de a en r1
	ld r2,b(r0); cargo el valor de b en r1

	slti r3,r1,r2 ; comparo r1 < r2 y guardo el resultado en r3
	beqz r3,fin; si dio 0 (no era menor) salto a "fin" y no hago nada
	daddi r4,r0,5; cargo el valor 5 en r4
	sd r3,c(r0); guardo el valor de r4 en c
fin:halt
