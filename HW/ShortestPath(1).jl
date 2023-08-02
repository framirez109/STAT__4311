# ShortestPath.jl: Shortest Path problem as an BIP

using JuMP, GLPK

m = Model(GLPK.Optimizer)

@variable(m, x12, Bin)
@variable(m, x13, Bin)
@variable(m, x14, Bin)
@variable(m, x24, Bin)
@variable(m, x34, Bin)
@variable(m, x35, Bin)
@variable(m, x45, Bin)

@objective(m, Min, 3x12 + 5x13 + 9x14 + 4x24 + 4x34 + 5x35 + 2x45)

@constraint(m, node1source, x12 + x13 + x14 == 1)
@constraint(m, node2, x12 - x24 == 0)
@constraint(m, node3, x13 - x34 - x35 == 0)
@constraint(m, node4, x14 + x24 + x34 - x45 == 0)
@constraint(m, node5sink, x35 + x45 == 1)

print(m)

JuMP.optimize!(m)

println("Optimal Solution:")
println("x12 = ", JuMP.value(x12))
println("x13 = ", JuMP.value(x13))
println("x14 = ", JuMP.value(x14))
println("x24 = ", JuMP.value(x24))
println("x34 = ", JuMP.value(x34))
println("x35 = ", JuMP.value(x35))
println("x45 = ", JuMP.value(x45))
println("Objective value: ", JuMP.objective_value(m))
