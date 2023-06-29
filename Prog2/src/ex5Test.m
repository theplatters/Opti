%TEST INTERIORPOINT ALGORITHM
ines = @() disp("----------------------------------------------");


for n = [9,99,999]
lines();
msg = sprintf("n = %d",n);
disp(msg);
lines();
n = 9;


    [G,d,A,b] = testFunction(n+1);

    x0 = ones(n,1);

    alpha = 0.25;

    mu0 = 0.1;

    m = length(b);
    n = length(x0);

    [x,lambda,exitflag, iter] = interiorpoint(x0,mu0,G,d,A,b,alpha);
    x2 = fmincon(@(x) 0.5 *x' * G * x + d'*x,x0,A',b);
   
    st = sprintf("after %d iterations",iter);
    st2 = sprintf("difference from solution found with fmincon: %d",max(abs(x - x2)));
    if(exitflag == 0)
        disp("Converged to")
        disp(x)
        disp(st);
        disp(st2)
    else
        disp("Not converged")
        disp(x)
    end

end
