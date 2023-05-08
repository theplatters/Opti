using IterTools, LinearAlgebra

struct OptimizationProblem
    f :: Function
    g :: Function
    hessian :: Function
    x0 :: Vector{Float64}
end

function oneStep(xk,p,α)
    return xk + α * p
end

function steepestDescent!(xks,prob :: OptimizationProblem)
    xk = prob.x0
    for i in 1:10
        gk = prob.g(xk);
        Gk = prob.hessian(xk)
        α  = - (gk' * -gk)/(-gk'*Gk* -gk)

        xk = oneStep(xk,-gk,α)
        push!(xks,xk)
    end
    return xk
end


f(x) = 16*x[1]^4 + 2*x[1]*x[2]+(1+x[2])^2

g(x) = [64*x[1]^3 + 2*x[2],2*x[1] + 2*(1+x[2])]

H(x) = [192*x[1]^2  2.0; 2.0 2*x[2]]
x0 = [0.375,-1.25]
prob = OptimizationProblem(f,g,H,x0)

xks = [x0]
xk = steepestDescent!(xks,prob)

fks = map(f,xks)
gsk = map(g,xks)

fbar = -0.58244517

ratio(fk1,fk) = abs((fk1-fbar)/(fk-fbar))

imap(ratio,fks[2:end],fks[1:end-1]) |> collect

κ= cond(H(last(xks)))

1 - (4 * κ)/(1+κ)^2