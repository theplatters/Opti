function [f_val, g, exit_flag] = f_c(x)
    exit_flag=0;
    n = length(x);
    if min(x)<=0
        f_val = 69;
        g = 420*ones(n,1);
        disp("Function evaluation at invalid input, function value set to dummy, abort computation")
        exit_flag = 1;
        return
    end
    
    f_val = sum((1:n).*x.*reallog(x)) + 1/sum(x);
    g=zeros(n,1);
    for i=1:n
        g(i)=i*(reallog(x(i))+1)-1/sum(x)^2;
    end
end