# Cambiar el programa para que funcione SIN delay slot
# 1) Calcular el CPI. Forwarding habilitado. BTB y DS deshabilitados

# 
# instrucciones = 18
# atascos RAW = 1
# atascos BTS = 4
# ciclos = 4 + instrucciones + raw +bts = 4 + 18 + 4 + 1 = 27
# CPI = 27/18 = 1.5

.data
a: .byte 8
b: .byte 5

.code
lb r1, a(r0)
lb r2, b(r0)
loop: daddi r2,r2,-1
	  dsll r1,r1,1
	  bnez r2,loop
halt
	  

