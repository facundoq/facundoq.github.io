.data 
n1: 	 .double 	9.13 
n2: 	 .double 	6.58 
res1:  .double 	0.0 
res2:  .double 	0.0 

.code 
L.D F1, n1(R0) 
L.D F2, n2(R0) 
MUL.D F3, F2, F1
ADD.D F2, F2, F1 
MUL.D F4, F2, F1 
S.D F3, res1(R0) 
S.D F4, res2(R0) 
HALT 
