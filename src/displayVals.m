function retval = displayVals (x_val, f_val,g_val,iter,evals)
    if length(x_val) < 11
        fprintf("Minimum computed at: ");
        x_val


 end

    disp("Minimum at function f value: ");
    f_val

    disp("Norm of gradient: ");
    no = norm(g_val);
    no

    fprintf("with %d iterations and %d function evals \n",iter,evals);


end
