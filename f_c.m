function [f_val, g, exit_flag] = f_c(x)
    exit_flag=0;
    n = length(x);
    if min(x)<=0
        f_val = 69; %dummy values
        g = 420*ones(n,1); %dummy values
        exit_flag = 1;
        return
    end
    
    x=x(:); %transform to column vector
    %(1:n)', x, log(x) column vectors
    f_val = sum((1:n)'.*x.*log(x)) + 1/sum(x);
    g = zeros(n,1); %column vector
    for i=1:n
        g(i)=i*(log(x(i))+1) - 1/sum(x)^2;
    end    
end