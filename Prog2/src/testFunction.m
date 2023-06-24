function [G,d,A,b] = testFunction(N)
n = N - 1;
e = ones(n,1);
G = N^2 * spdiags([-e, 2*e, -e],-1:1,n,n);


d = 3 * ones(n,1);

A = -eye(n);

b1 = 0.1 * ones(floor(N/3),1);
b2 =  -0.2 * ones(floor(N/3),1);
b3 = 0.05 * ones(N- 2 * length(b1) - 1,1);



b = [b1; b2; b3];

end

