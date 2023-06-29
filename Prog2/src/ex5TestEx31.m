G= zeros(4);
d = [-5;-2;5;2];

A=transpose([4,0,-2,1;-4,0,2,-1;-3,2,-1,-3;-3,0,0,-1;-1,0,0,0;0,-1,0,0;0,0,0,-1]);
b=[1;-1;-1;-1;0;0;0];

x0 = [0;0;0;1]

alpha = 0.25;

mu0 = 0.5;

[x,l,exitflag,iter] = interiorpoint(x0,mu0,G,d,A,b,alpha);

disp("Output violations:")

outputViolations = max(abs(min(b - A'*x,0)))

x2 = fmincon(@(x) d' * x,x0,A',b);

st = sprintf("after %d iterations",iter);
st2 = sprintf("difference from solution found with fmincon: %d",max(abs(x - x2)));
if(exitflag == 0)
    disp("Converged to")
    disp(x)
    disp(st);
    disp(st2)
    disp("With maximum outpuz Violation of")
    disp(outputViolations)
else
    disp("Not converged")
    disp(x)
end