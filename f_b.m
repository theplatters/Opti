function [f_val, g, exit_flag] = f_b(x)
    exit_flag=0;
    x1=x(1);
    x2=x(2);
    f_val = 100*(x2-x1^2)^2 + (1-x1)^2;
    gradient = @(x,y)[400*x*(x^2-y)+2*(x-1);200*(y-x^2)];
    g=gradient(x1,x2);
end