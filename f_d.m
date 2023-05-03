function [f_val, g, exit_flag] = f_d(x)
    x=x(:); %x als spaltenvektor
    exit_flag=0;
    n = length(x);
    
    v=(1:n)';
    A=(1/(100*n))*eye(n)+hilb(n);
    xAx = x'*A*x;
    f_val = (xAx)^2-(x'*A*v)^2;
    g = 4*xAx*A*x;
end