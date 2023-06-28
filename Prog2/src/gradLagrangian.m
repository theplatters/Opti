function [l] = gradLagrangian(x,G,d,A,b,lambda)
%LAGRANGIAN Summary of this function goes here
%   Detailed explanation goes here
l = 1/2 * (G' + G) * x + d + A * lambda;

end

