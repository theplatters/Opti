function [dxp,dlp] = predictor(G,A,x,lambda,mu,b,beta,c)
[n,~]=size(A);
M=[G,A;diag(lambda)*A',diag(b+mu*beta-A'*x)];
m=[mu*c;-diag(lambda)*(b-A'*x)];
r = M\m;
disp(r)
dxp = r(1:n);
dlp = r(n+1:end);
end

