%TEST INTERIORPOINT ALGORITHM
ines = @() disp("----------------------------------------------");


for n = [9,99,999]
    lines();
    msg = sprintf("n = %d",n);
    disp(msg);
    lines();
    
    [G,d,A,b] = testFunction(n+1);
    
    x0 = ones(n,1);
    
    alpha = 0.25;
    
    mu0 = 0.1;
    f = @(x) 1/2 * x' * G * x + d' * x;
    
    [x,lambda,exitflag, iter] = interiorpoint(x0,mu0,G,d,A,b,alpha);
    x2 = fmincon(@(x) 0.5 *x' * G * x + d'*x,x0,A',b);
    
    st = sprintf("after %d iterations",iter);
    st2 = sprintf("difference from solution found with fmincon: %d",abs(f(x) - f(x2)));
    if(exitflag == 0)
        disp("Converged to f(x) =")
        disp(f(x))

        if(n <= 99)
            disp("at x =")
            disp(x)
        end
        disp(st);
        disp(st2)
    else
        disp("Not converged. f(x) = ")
        disp(f(x))
    end
end
