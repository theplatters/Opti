function [f_val, g, exit_flag] = f_c(x)
    exit_flag=0;
    n = size(x,1);
    for i=1:n
        if (x(i) <= 0)
            exit_flag=1;
            return
        end
    end
    
    f_val = sum((1:n).*x.*log(x)) + 1/sum(x);
    g=zeros(n,1);
    for i=1:n
        g(i)=i*(log(x(i))+1);
    end
end