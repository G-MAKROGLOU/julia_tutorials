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

Alu = lu(A)
println(Alu.P)
println(Alu.L)
println(Alu.U)

#solve the linear system using either the original matrix or the factorization matrix
A\b
Alu\b 

#calculate the determinant of A using A or the factorization object
det(A) ≈ det(Alu)

#qr factorization
Aqr = qr(A)
println(Aqr.Q)
println(Aqr.R)

#The eigendecomposition 
Asym = A + A'
println(Asym)
AsymEig = eigen(Asym)

println(AsymEig.values)
println(AsymEig.vectors)

#take the inverse of the eigen object
println(inv(AsymEig) * Asym)

#singular value decomposition
Asvd = svd(A[:, 1:2])
println(Asvd)
println(Asvd\b)


#types for matrices with special structures
# Triangular
# Tridiagonal
# Symmetric
# Diagonal
# Hermitian
# SymTridiagonal

Diagonal(diag(A))
Diagonal(A)
LowerTriangular(A)
Symmetric(Asym)
SymTridiagonal(diag(Asym), diag(Asym, 1))

n = 1000;
B = randn(n, n)
Asym1 = B + B'
Asym2 = copy(Asym1); Asym2[1,2] += 5eps()
println("Is Asym1 symmetric? ", issymmetric(Asym1))
println("Is Asym2 symmetric? ", issymmetric(Asym2))

# this shows how long it takes for this function to calculate the eigen values and vectors of 
# the asymmetric matrix Asym1
@time eigvals(Asym1)
#similar to above => here julia doesn't know that Asym1 is Symmetric and so it takes longer
@time eigvals(Asym2)
#this reduces the time because we specify that Asym2 is symmetric
@time eigvals(Symmetric(Asym2))


m = 1_000_000
C = SymTridiagonal(randn(m), randn(m-1))
@time eigmax(C)

#Generic Linear Linear
rand(1:10, 3,3) * rand(1:10, 3,3)

#convert a matrix of random integers to a matrix of rational numbers 
Ar = convert(Matrix{Rational{BigInt}}, rand(1:10,3,3)) / 10
t = ones(Int, 3)
f = Ar*x #this also stores rational numbers
Ar\f #this also store rational numbers

lu(Ar) # again all rational numbers
#double forward slash is for rational numbers (fractions)
λ1, λ2, λ3 = 1//1, 1//2, 1//4
v1, v2, v3 = [1,0,0], [1,1,0], [1,1,1]
v, Λ = [v1, v2, v3], Diagonal([λ1, λ2, λ3])
D = v*Λ/v #D stores only rational numbers