function [l] = gradLagrangian(x,G,d,A,lambda)
%gradient of lagrangian
l = 1/2 * (G' + G) * x + d + A * lambda;
end

