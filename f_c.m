function [f_val, g, exit_flag] = f_c(x)
    x=x(:);
    exit_flag=0;
    f_val=0;
    g=0;
    n = length(x);
    for i=1:n
        if (x(i) <= 0)
            exit_flag=1;
            return
        end
    end
    
    f_val = sum((1:n)'.*x.*log(x)) + 1/sum(x);
    g=zeros(n,1);
    for i=1:n
        g(i)=i*(log(x(i))+1)-1/sum(x)^2;
    end
end