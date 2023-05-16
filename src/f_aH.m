function [f_val, g, H] = f_aH(x)
    x1=x(1);
    x2=x(2);
    f_val = 0.5*(x1+x2)^2 + 0.05*(x1-x2)^2;
    g = [1.1*x1+0.9*x2;0.9*x1+1.1*x2];
    if nargout > 2
        H = [1.1,0.9;0.9,1.1];
    end
end