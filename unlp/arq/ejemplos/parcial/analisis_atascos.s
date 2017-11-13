.data
tabla1: .word 15,11,24
tabla2: .word 0, 0, 0

.code
		daddi r1,r0,0
		daddi r2,r0,3
loop:   ld r3, tabla1(r1)
		daddi r3,r3,1
		sd r3, tabla2(r1)
		daddi r1,r1,8
		daddi r2,r2,-1
		bnez r2,loop
		halt
	
