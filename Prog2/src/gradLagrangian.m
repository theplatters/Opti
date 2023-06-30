function [l] = gradLagrangian(x,G,d,A,b,lambda)
%gradient of lagrangian
l = 1/2 * (G' + G) * x + d + A * lambda;
end

