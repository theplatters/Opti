function [f_val, g, H] = f_cH(x)
    n = length(x);
    if min(x)<=0
        f_val = 10^30; %dummy values
        g = ones(n,1); %dummy values
        H = zeros(n);
        return
    end
    
    x=x(:); %transform to column vector
    %(1:n)', x, log(x) column vectors
    f_val = sum((1:n)'.*x.*log(x)) + 1/sum(x);
    g = zeros(n,1); %column vector
    for i=1:n
        g(i) = i*(reallog(x(i))+1) - 1/sum(x)^2;
    end
    if nargout > 2
        h = 2/sum(x)^3;
        H = h*ones(n,n) + diag((1:n)'./x,0);
    end
end