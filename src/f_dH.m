function [f_val, g, H] = f_dH(x)
    n = length(x);
    
    x=x(:);
    v=(1:n)';
    A=(1/(100*n))*eye(n)+hilb(n);
    xAx = x'*A*x;
    f_val = (xAx)^2-(x'*A*v)^2;

    if nargout > 1
        g = 4*xAx*(A*x)-2*(x'*A*v)*A*v; 
        if nargout >2
            H = 4*(2*A*x+(A*x)'+x'*A*x*A)-2*A*v*(A*v)';
        end
    end
    
end