 #5 En qué consiste el forwarding
 # a) En que los resultados de las operaciones están antes disponibles de la etapa WB
 # b) Las instrucciones no deben siempre esperar en ID a los operandos
 
 #4  ¿Pq el código genera un atasco estructural? (forwarding habilitado)
 # Pq tanto add como s.d intentan acceder a la etapa MEM al mismo tiempo
 .data
 s: .double 0
 m: .double 0
 
 .code
 add.d f14,f2,f8
 mul.d f16,f2,f8
 s.d f14, s(r0)
 s.d f16, m(r0)
 halt
