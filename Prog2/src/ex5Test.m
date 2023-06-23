%TEST INTERIORPOINT ALGORITHM

n = 10


[G,d,A,b] = testFunction(n+1);

x0 = ones(n,1);

alpha = 0.25;

mu0 = 0.01;

m = length(b);
n = length(x0);

sol = fsolve(@(cb) G*x0 + d - mu0 * cb(1:n)  - mu0 * sum(-A ./ (b + mu0 * cb(n+1:n+m) - A' * x0))',ones(n+m,1));

c = sol(1:n)
beta = sol(n+1:n+m)
