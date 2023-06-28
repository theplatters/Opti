%TEST INTERIORPOINT ALGORITHM

n = 99;


[G,d,A,b] = testFunction(n+1);

x0 = ones(n,1);

alpha = 0.25;

mu0 = 0.1;

m = length(b);
n = length(x0);




