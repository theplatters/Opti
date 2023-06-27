using LinearAlgebra;

A = I(5)

nullspace(A)

function  qp(G,A,b,x,A₀)
    Zk  = nullspace(A₀)

    while true

        g = (0.5 * (G'+ G) * x + d)

        p = Z'*G*Z \ -Z' * g
        s = Z * G
        α = min()
    end
end