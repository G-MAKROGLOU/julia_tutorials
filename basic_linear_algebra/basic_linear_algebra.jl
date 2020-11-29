A = rand(1:4, 3,3)

B = A # pass by reference
C = copy(A) #pass by value

x = ones(3)
b = A*x

#A' is the conjugate transpose of A
println(A) #this prints A normally
println(A') # this prints A columnwise

Asym = A + A' #creation of symetric array
println(Asym)
Apd = A'A # multiplication of A with its conjucate A'
println(Apd)

A\b # backslash allows us to solve a linear system Ax = b