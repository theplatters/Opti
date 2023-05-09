    function [f_val, g, exit_flag] = f_a(x)
    exit_flag=0;
    x1=x(1);
    x2=x(2);
    f_val = 0.5*(x1+x2)^2 + 0.05*(x1-x2)^2;
    gradient = @(x,y)[1.1*x+0.9*y;0.9*x+1.1*y];
    g=gradient(x1,x2);
end