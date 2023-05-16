fprintf('===================== (a) =================\n');
%minimum should be at (0,0), f(min) should be 0
x0 = [10, -3];
tic
[x, fval, exitflag, output] = fminsearch(@f_aH, x0);
toc
if exitflag == 0
    fprintf('Iterations or function evaluations exceeded options.')
    return
end
fprintf('\nSolution found at: [ ');
fprintf(' %g ',x);
fprintf(' ]\nFunction value: %.8f\n\n', fval);
output

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('===================== (b) =================\n');
%minimum should be at (1,1), f(min) should be 0
x0 = [-1, 2];
tic
[x, fval, exitflag, output] = fminsearch(@f_bH, x0);
toc
if exitflag == 0
    fprintf('Iterations or function evaluations exceeded options.')
    return
end
fprintf('\nSolution found at: [ ');
fprintf(' %g ',x);
fprintf(' ]\nFunction value: %.8f\n\n', fval);
output

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options = optimset('MaxFunEvals', 1000000, 'MaxIter', 1000000);
fprintf('===================== (c) =================\n');
for i = 1:3
    fprintf('SIZE: n = 10^%i\n',i);
    x0 = 5*ones(10^i, 1);
    tic
    [x, fval, exitflag, output] = fminsearch(@f_cH, x0, options);
    toc
    if exitflag == 0
        fprintf('Iterations or function evaluations exceeded options.')
        return
    end
    if i < 3
        fprintf('\nSolution found at: [\n');
        fprintf('%g\n',x);
        fprintf(']');
    end
    fprintf('\nFunction value: %.8f\n', fval);
    output
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options = optimset('MaxFunEvals', 1000000, 'MaxIter', 1000000);
fprintf('===================== (d) =================\n');
for i = 1:3
    fprintf('SIZE: n = 10^%i\n',i);
    x0 = [zeros(1,10^i-1),10^(i+1)];
    tic
    [x, fval, exitflag, output] = fminsearch(@f_dH, x0, options);
    toc
    if exitflag == 0
        fprintf('Iterations or function evaluations exceeded options.')
        return
    end
    if i == 1
        fprintf('\nSolution found at: [\n');
        fprintf('%g\n',x);
        fprintf(']');
    end
    fprintf('\nFunction value: %.8f\n', fval);
    output
end