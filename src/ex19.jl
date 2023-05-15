using IterTools, LinearAlgebra, ForwardDiff

struct OptimizationProblem
    f :: Function
    g :: Function
    hessian :: Function
    x0 :: Vector{Float64}
end

function newton(prob,eps = 10^-15,maxiter = 200)
    x = prob.x0
   
    for i in 1:maxiter
        
        xn = (prob.hessian(x) \ -prob.g(x)) + x
        if(norm(xn -x) < eps)
            return xn
        end
        x = xn
    end
    print("Reached MaxIter, solution is maybe not convergent")
    return x
end

#--------------------------------------------
f(x) = 16*x[1]^4 + 2*x[1]*x[2]+(1+x[2])^2

g(x) = [64*x[1]^3 + 2*x[2],2*x[1] + 2*(1+x[2])]

H(x) = [192*x[1]^2  2.0; 2.0 2]

x0 = [0.375,-1.25]
prob = OptimizationProblem(f,g,H,x0)

xks = [x0]
xk = newton(prob)

cond(prob.hessian(xk))

#------------------------

f(x) = norm(x)^3 - norm(x)^2 * log(norm(x))
g(x) = ForwardDiff.gradient(f,x)
H(x) = ForwardDiff.hessian(f,x)

x0 = [1,2,3,4,5]

prob = OptimizationProblem(f,g,H,x0)

xk = newton(prob,10^-15,1_000_000)
