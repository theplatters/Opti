function [outputArg1,ou tputArg2] = interiorpoint(x0 ,mu0, G, d, A, b,alpha)
%check if G is positive definite

sequence = [0.99 0.9 0.8 0.6 0.4 0.15 0.05]

m = length(mu0)
if eig(G) < 0

    ME = MException("Matrix G is not positive definite");
    throw(ME)
end


cb = fsolve(@(cb) G*x0 + d - mu0 * cb(1)  - mu0 * sum(-A ./ (b + mu_0 * cb(2:m+1) - A' * x0)),[1 ones(1,m)]);
c = cb(1);
beta = cb(2:m+1);


while not convergent
   %compute delta_x_c delta_lambda_c
    
   x = x+ delta_x_c;
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

