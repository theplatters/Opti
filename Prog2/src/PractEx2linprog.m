format long;
f = [-5 -2 5 2];
A = [-3 2 -1 -3; -3 0 0 -1];
b = [-1; -1];
Aeq = [4 0 -2 1];
beq = 1;
lb = [0 0 -Inf 0];
ub = [];

% DUAL-SIMPLEX
fprintf('===========================\n');
fprintf('Dual-simplex algorithm: \n');

options = optimoptions('linprog','Algorithm','dual-simplex');

[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,ub,options);

output

fprintf('Solution at x = \n');
disp(x);
fprintf('Function value: \n');
disp(fval);

fprintf('Lagrange multiplicators: \n');
disp([lambda.eqlin;lambda.ineqlin]);

%INTERIOR-POINT
fprintf('===========================\n');
fprintf('Interior-point algorithm: \n');

options = optimoptions('linprog','Algorithm','interior-point');

[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,ub,options);

output

fprintf('Solution at x = \n');
disp(x);
fprintf('Function value: \n');
disp(fval);

fprintf('Lagrange multiplicators: \n');
disp([lambda.eqlin;lambda.ineqlin]);