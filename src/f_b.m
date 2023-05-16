function [f_val, g, exit_flag] = f_b(x)
    exit_flag=0;
    x1=x(1);
    x2=x(2);
    f_val = 100*(x2-x1^2)^2 + (1-x1)^2;
    g = [400*x1*(x1^2-x2) + 2*(x1-1); 200*(x2-x1^2)];
end