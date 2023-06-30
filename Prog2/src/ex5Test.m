%TEST INTERIORPOINT ALGORITHM
ines = @() disp("----------------------------------------------");

devi = 1;
alpha = 0.5;


for mu0 = [0.1,1,100]
    lines();
    msg = sprintf("mu0 = %d",mu0);
    disp(msg);
    lines();
for n = [9,99,999]
    lines();
    msg = sprintf("n = %d",n);
    disp(msg);
    lines();
    
    [G,d,A,b] = testFunction(n+1);
    
    x0 = ones(n,1);

    f = @(x) 1/2 * x' * G * x + d' * x;
    
    [x,lambda,exitflag, iter] = interiorpoint(x0,G,d,A,b,mu0,alpha,1000,devi);
    
    constraintViolation = max(abs(min(b - A'*x,0)));


    st = sprintf("after %d iterations",iter);
    if(exitflag == 0)
        disp("Converged to f(x) =")
        disp(f(x))

        if(n < 99)
            disp("at x =")
            disp(x)
        end
        disp(st);
        disp("With constraint violations: ")
        disp(constraintViolation)
    else
        disp("Not converged. f(x) = ")
        disp(f(x))
    end
end
end
