# ShelbyShelving.jl: Shelby Shelving problem as an IP

using JuMP, GLPK

m = Model(GLPK.Optimizer)

@variable(m, 0 <= A <= 1900, Int)
@variable(m, 0 <= B <= 1400, Int)

@objective(m, Max, 16A + 66B)

@constraint(m, stamping, 0.3A + 0.3B <= 800)
@constraint(m, forming, 0.25A + 0.5B <= 800)

print(m)

JuMP.optimize!(m)

println("Optimal Solution:")
println("A = ", JuMP.value(A))
println("B = ", JuMP.value(B))
println("Objective value: ", JuMP.objective_value(m))
