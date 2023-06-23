function [outputArg1,ou tputArg2] = interiorpoint(x ,mu, G, d, A, b,alpha)
%check if G is positive definite

sequence = [0.99 0.9 0.8 0.6 0.4 0.15 0.05]

m = length(b)
n = length(x)
if eig(G) <= 0

    ME = MException("Matrix G is not positive definite");
    throw(ME)
end


sol = fsolve(@(cb) G*x + d - mu * cb(1:n)  - mu * sum(-A ./ (b + mu * cb(n+1:n+m) - A' * x))',ones(n+m,1));

c = sol(1:n)
beta = sol(n+1:n+m)

lambda = mu ./ (b + beta * mu - A'*x)

while not convergent
   %compute delta_x_c delta_lambda_c
    
   x = x + delta_x_c;
   lambda = lambda + delta_lambda_c;

   %compute delta_x_p delta_lambda_p
    


   theta = sequence(1);
   x_theta = x + theta * delta_x_p;
   lambda_theta = lambda + theta * delta_lambda_p;
   mu_theta = (1-theta) * mu;
   i = 2;
   while ~(isInA(x_theta, lambda_theta, mu_theta,beta,G,d,A,b,c,alpha)
       if i < length(sequence)
           theta = sequence(i);
       else
           theta = theta / 10;
       end
       i = i+1;
       x_theta = x + theta * delta_x_p;
       lambda_theta = lambda + theta * delta_lambda_p;
       mu_theta = (1-theta) * mu;

   end
   
   x = x_theta; lambda = lambda_theta; mu = mu_theta;
end


end

