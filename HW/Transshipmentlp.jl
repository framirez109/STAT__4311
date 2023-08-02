# assignmentLP.jl
# 4 women, 4 jobs

using JuMP, GLPK

m = Model(GLPK.Optimizer)

@variable(m, x14 >= 0) #BH
@variable(m, x15 >= 0) #BA
@variable(m, x24 >= 0) #IH
@variable(m, x25 >= 0) #IA
@variable(m, x34 >= 0) #CH
@variable(m, x35 >= 0) #CA
@variable(m, x46 >= 0) #HJ
@variable(m, x47 >= 0) #HK
@variable(m, x48 >= 0) #HP
@variable(m, x56 >= 0) #AJ
@variable(m, x57 >= 0) #AK
@variable(m, x58 >= 0) #AP


@objective(m, Min, 4000x14 + 7000x15 + 4500x24 + 6000x25 + 5000x34 + 4000x35 + 9000x46 + 6000x47 + 8000x48 + 7000x56 + 4000x57 + 6000x58)

@constraint(m, supply1, x14 + x15  == 100)
@constraint(m, supply2, x24 + x25  == 200)
@constraint(m, supply3, x34 + x35  == 150)
@constraint(m, holder1, x46 + x47 + x48 - x14 - x24 - x34 == 0)
@constraint(m, holder2, x56 + x57 + x58 - x15 - x25 - x35 == 0)
@constraint(m, demand1, x46 + x56 == 150)
@constraint(m, demand2, x47 + x57 == 150)
@constraint(m, demand3, x48 + x58 == 150)

print(m)

JuMP.optimize!(m)

println("Optimal Solution:")
println("x14 = ", JuMP.value(x14))
println("x15 = ", JuMP.value(x15))
println("x24 = ", JuMP.value(x24))
println("x25 = ", JuMP.value(x25))
println("x34 = ", JuMP.value(x34))
println("x35 = ", JuMP.value(x35))
println("x46 = ", JuMP.value(x46))
println("x47 = ", JuMP.value(x47))
println("x48 = ", JuMP.value(x48))
println("x56 = ", JuMP.value(x56))
println("x57 = ", JuMP.value(x57))
println("x58 = ", JuMP.value(x58))

println("Objective value: ", JuMP.objective_value(m))
