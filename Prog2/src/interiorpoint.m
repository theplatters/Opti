function [x, lambda,exitflag,iter] = interiorpoint(x , G, d, A, b,mu,alpha,maxiter,devi)
%Implementation of interior point algorithm for solving quadratic problems 
%min 1/2*x'*G'x+d'x
%subject to a_i'*x<=b_i  the constraints are the colums of A

%deviation to make a strong < instead of a <=
if(nargin < 9)
    devi = 1;
end

%maximal number of iterations
if(nargin < 8)
    maxiter = 1000;
end

%alpha for the neighborhood v_alpha
if(nargin < 7)
    alpha = 0.25;
end

%mu for QP(mu) 
if(nargin < 6)
    mu = 0.1;
end

%sequence for choice of theta values
sequence = [0.99 0.9 0.8 0.6 0.4 0.15 0.05, 0.01]; %afterwards division by 10

%checking if matrix G is positive definite
if eig(G) < 0
    exitflag = 1; %Matrix G is not positive definite
    return;
end

%
%Solving Problem stated in a) 
% Transforming inequality constraint to (A'*x-b)/mu<beta
% Adding deviation term tu get equality
beta = (A' * x - b) / mu + devi;
%calculating c by transforming the Kuhn-Tucker condition 
c  = (- 0.5 * (G' + G) * x - d  - mu * sum((1 ./ (b + mu * beta - A' * x))' .* A,2)) / mu;
%setting lambda
lambda = mu ./ (b + beta * mu - A'*x);


iter = 1;
while norm(lambda) <= 10^20 && iter <= maxiter   %QP is infeasible or max iterations are reached 
   %further stopping criteria: we are close to a solution
   %                           Gradient of Lagrangian is small 
   if all(abs(gradLagrangian(x,G,d,A,b,lambda)) <= 10e-8)
       %a solution is found
       exitflag = 0;
        return
   end
   %Corrector step: compute delta_x_c delta_lambda_c
   [delta_x_c,delta_lambda_c] = corrector(G,A,x,lambda,mu,b,beta,c,d);
    
   x = x + delta_x_c;
   lambda = lambda + delta_lambda_c;

   %compute delta_x_p delta_lambda_p
    
   %Predictor step: compute delat_x_p, delta_lambda_p
   [delta_x_p,delta_lambda_p] = predictor(G,A,x,lambda,mu,b,beta,c);

   theta = sequence(1);
   x_theta = x + theta * delta_x_p;
   lambda_theta = lambda + theta * delta_lambda_p;
   mu_theta = (1-theta) * mu;
   
   %computing theta_p
   i = 2;
   %checking if chosen values are in neighborhood v_alpha of central path
   while ~isInVa(x_theta, lambda_theta, mu_theta,beta,G,d,A,b,c,alpha)
      %Stopping criteria, if theta is too small  
      if( i >= 30)
        disp("theta is too small, no solution found");
        exitflag = 2;
        return;
      end
      
       if i < length(sequence)
           theta = sequence(i);
       else
           theta = theta / 10; %extending sequence for theta
       end
       i = i+1;
       
       x_theta = x + theta * delta_x_p;
       lambda_theta = lambda + theta * delta_lambda_p;
       mu_theta = (1-theta) * mu;

   end
   
   x = x_theta; lambda = lambda_theta; mu = mu_theta;
   iter = iter+1;
   
end

%Maximum iterations reached or lambda too big
exitflag = 3;