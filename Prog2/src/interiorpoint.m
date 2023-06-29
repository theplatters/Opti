function [x, lambda,exitflag,iter] = interiorpoint(x ,mu, G, d, A, b,alpha,maxiter)
%Constraints are the colums of A

if(nargin < 8)
    maxiter = 1000;
end

sequence = [0.99 0.9 0.8 0.6 0.4 0.15 0.05, 0.01];

m = length(b);
n = length(x);

if eig(G) < 0
    disp("Matrix G is not positive definite");
    exitflag = 1;
    return;
end



beta = (A' * x - b) / mu + 0.1;

c  = (- 0.5 * (G' + G) * x - d  - mu * sum((1 ./ (b + mu * beta - A' * x))' .* A,2)) / mu;

lambda = mu ./ (b + beta * mu - A'*x);



iter = 1;
while norm(lambda) <= 10^20 && iter <= maxiter

   if all(abs(gradLagrangian(x,G,d,A,b,lambda)) <= 10e-8)
       exitflag = 0;
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

      if( i >= 30)
        disp("theta is too small, no solution found");
        exitflag = 1;
        return;
      end
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

disp("Maximum iterations reached, or lambda too big");
exitflag = 1;
end

