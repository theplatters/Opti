function [isIn] = isInVa(x,lambda,mu,beta,G,d,A,b,c,alpha)
%ISINVA Summary of this function goes here
%   Detailed explanation goes here
m = length(lambda);

isIn = false;

v = b + mu * beta - A' * x;
w = G * x + d + mu * c + A * lambda;
s = sum((lambda .* (v) ./ mu - 1) .^ 2):


if  v > 0 && w == 0 && lambda > 0  && mu > 0 && s <= alpha^2
    isIn = true;
end

end

