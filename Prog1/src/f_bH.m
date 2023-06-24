function [f_val, g, H] = f_bH(x)
    x1=x(1);
    x2=x(2);
    f_val = 100*(x2-x1^2)^2 + (1-x1)^2;
    g = [400*x1*(x1^2-x2) + 2*(x1-1); 200*(x2-x1^2)];
    if nargout > 2
        H = [1200*x1^2 - 400*x2 + 2, -400*x1; -400*x1, 200];
    end
end