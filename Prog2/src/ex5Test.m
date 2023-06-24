%TEST INTERIORPOINT ALGORITHM

n = 10


[G,d,A,b] = testFunction(n+1);

x0 = ones(n,1);

alpha = 0.25;

mu0 = 0.1;

m = length(b);
n = length(x0);

sol = fsolve(@(cb) G*x0 + d + mu0 * cb(1:n)  + mu0 * sum(1 ./ (b + mu0 * cb(n+1:end) - A' * x0) .* A,2),zeros(n+m,1));

c = sol(1:n)
beta = sol(n+1:n+m)

sol = fmincon(@(x) x'*G*x + d'*x,x0,A,b)


