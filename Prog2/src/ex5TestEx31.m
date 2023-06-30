lines = @() disp("-------------------------------------");

alpha = 0.25;    

tic

for e = [0.1, 1, 100]
    lines()
    msg = sprintf("Deviation parameter = %d",e);
    disp(msg)
    lines()
    for mu0 = [100,1,0.5,0.1]
    lines()
    msg = sprintf("mu0 = %d",mu0);
    disp(msg)
    lines()

    G= zeros(4);
    d = [-5;-2;5;2];
    
    A=transpose([4,0,-2,1;-4,0,2,-1;-3,2,-1,-3;-3,0,0,-1;-1,0,0,0;0,-1,0,0;0,0,0,-1]);
    b=[1;-1;-1;-1;0;0;0];
    
    x0 = [0;0;0;1];
    

    
    [x,l,exitflag,iter] = interiorpoint(x0,G,d,A,b,mu0,alpha,100,e);
    
    disp("Output violations:")
    
    outputViolations = max(abs(min(b - A'*x,0)));
   
    
    st = sprintf("after %d iterations",iter);
    if(exitflag == 0)
        disp("Converged to")
        disp(x)
        disp("With function value")
        disp(d'*x)
        disp(st);
        disp("With maximum output violation of")
        disp(outputViolations)
    else
        disp("Not converged")
        disp(x)
    end
    end
end
toc