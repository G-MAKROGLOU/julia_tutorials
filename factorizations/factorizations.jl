using Random
using LinearAlgebra


A = randn(3,3)

# display(A)

l, u, p = lu(A) #perform an LU factorization on a Matrix and return the matrices l, u and a permutation vector perform

#pivoting is on by default so we can't assume A = LU
display(l)
display(u)
display(p)

#so
#the two above are equal
display(norm(l*u - A))
display(norm(l*u - A[p, :]))
