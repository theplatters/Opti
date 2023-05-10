function [f_val, g, H] = f_cH(x)
    n = length(x);
    if min(x) <= 0
        f_val = 10^30;
        g = 420*ones(n,1);
        %disp("Function evaluation at invalid input, function value set to dummy, abort computation")
        return
    end
    
    f_val = sum((1:n).*x.*reallog(x)) + 1/sum(x);
    g=zeros(n,1);
    for i=1:n
        g(i)=i*(reallog(x(i))+1)-1/sum(x)^2;
    end
    h = 2/(sum(x))^3;
    H = h*ones(n,n)+diag((1:n)./x',0);
end