using BenchmarkTools


# ≈ \approx => alias for the isapprox() function
a = rand(10^7)
println(sum(a))

julia_bench = @benchmark sum(a)
println(julia_bench)