function [x, lambda,iter] = interiorpoint(x ,mu, G, d, A, b,alpha)
%Constraints are the colums of A

sequence = [0.99 0.9 0.8 0.6 0.4 0.15 0.05, 0.01];

m = length(b);
n = length(x);

if eig(G) <= 0
    ME = MException("Matrix G is not positive definite");
    throw(ME);
end



beta = (A' * x - b) / mu + 1e10;

c  = (- 0.5 * (G' + G) * x - d   + mu * sum((1 ./ (b + mu * beta - A' * x))' .* A,2)) / mu;

lambda = mu ./ (b + beta * mu - A'*x);



iter = 1;
while norm(lambda) <= 10^20 && iter <= 1000

   if all(abs(gradLagrangian(x,G,d,A,b,lambda)) <= 10e-8)
       disp(mu)
        return
   end
   %compute delta_x_c delta_lambda_c

   [delta_x_c,delta_lambda_c] = corrector(G,A,x,lambda,mu,b,beta,c,d);
    
   x = x + delta_x_c;
   lambda = lambda + delta_lambda_c;

   %compute delta_x_p delta_lambda_p
    
   [delta_x_p,delta_lambda_p] = predictor(G,A,x,lambda,mu,b,beta,c);

   theta = sequence(1);
   x_theta = x + theta * delta_x_p;
   lambda_theta = lambda + theta * delta_lambda_p;
   mu_theta = (1-theta) * mu;
   i = 2;
   while ~isInVa(x_theta, lambda_theta, mu_theta,beta,G,d,A,b,c,alpha)
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
   iter = iter+1;
   
end

ME = MException("Maximum iterations reached, or lambda too big");
throw(ME);

end

