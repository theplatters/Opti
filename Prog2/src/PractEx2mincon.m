N = [5,10,100]; %n >= 4 (!)

for i=1:3
    %function definition
    AM = ones(N(i)) + diag(1./(N(i):-1:1).^2);
    fun = @(x) 0.5*(x'*AM*x)^2 + dot((1:N(i))',x(1:N(i)));
    
    %equality constraints
    A = [ones(1,N(i)-1),0; -ones(1,N(i)-1),0];
    b = [20; 1];
    
    %no inequality constraints
    Aeq=[];
    beq=[];
    
    %upper/lower bound for x(2)
    lb = -Inf*ones(N(i),1);
    ub =  Inf*ones(N(i),1);
    lb(2) = 0;
    ub(2) = 3;
    
    x0 = zeros(N(i),1); %column vector
    %x0 = [0,1,1,1,1]'; %alterntative starting point for n=5
    
    nonlcon = @con;
    
    if i == 3
        options=optimoptions('fmincon','MaxFunctionEvaluations',30000);
    end
    [x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
    output

    fprintf('Solution at x = \n');
    disp(x);
    fprintf('Function value: \n');
    disp(fval);
end    

function [c,ceq] = con(x)
    n = length(x);
    c = x(4) - x(2)*x(3);
    ceq = dot(x(1:n-2),x(1:n-2))-x(n-1)^2-x(n);
end