function [dxc,dlc] = corrector(G,A,x,lambda,mu,b,beta,c,d)
[n,m]=size(A);
v = b+mu*beta-A'*x;
M=[G,A;diag(lambda)*A',diag(v)];
m=[-(G*x+d+mu*c+A*lambda);mu*ones(m,1)-diag(lambda)*v];
r = M\m;
disp(r)
dxc = r(1:n);
dlc = r(n+1:end);
end
