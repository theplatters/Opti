f = @(x) norm(x)^3 - norm(x)^2 * log(norm(x));
g = @(x) x*(3*norm(x) - 2* log(norm(x)) - 1);
H = @(x) x' * x * (3/norm(x) - 2/norm(x)^2) + eye(length(x)) * (3*norm(x) - 2 * log(norm(x)) -1);

xk = [1,2,3,4,5]';
for i = 1:100000
    x = xk - H(xk) \ g(xk);
    norm(x);
    inv(H(xk))
    if norm(xk -x) < 10^-15
        break;
    end
    xk = x;
end

disp(xk)
