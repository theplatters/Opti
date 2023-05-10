function [f_val, g, exit_flag] = f_a(x)
    exit_flag=0;
    x1=x(1);
    x2=x(2);
    f_val = 0.5*(x1+x2)^2 + 0.05*(x1-x2)^2;
    g = [1.1*x1 + 0.9*x2; 0.9*x1 + 1.1*x2];
end