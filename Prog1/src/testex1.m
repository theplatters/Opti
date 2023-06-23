diary test1.txt
diary on
disp("Funktion f_a test")

[x_val,f_val,g_val,~,iter,evals] = SteepestDescent(@f_a,[10,-3]);
displayVals(x_val,f_val,g_val,iter,evals);

disp("----------------------------------")

disp("Funktion f_b test")

[x_val,f_val,g_val,~,iter,evals]= SteepestDescent(@f_b,[-1,2],-10^30,10^-6,5000);
    displayVals(x_val,f_val,g_val,iter,evals);

disp("----------------------------------")

disp("Funktion f_c test");
for j = [10 100 1000]
    fprintf("For n = %d \n",j);
    x0 = 5 * ones(1,j);
    [x_val,f_val,g_val,~,iter,evals] = SteepestDescent(@f_c,x0,-10^30,10^-9,10000);
    displayVals(x_val,f_val,g_val,iter,evals);

end


disp("----------------------------------")

disp("Funktion f_d test");

for j = [10 100 1000]
    fprintf("For n = %d \n",j);
    x0 = zeros(j,1);
    x0(j) = 10*j;
    [x_val,f_val,g_val,~,iter,evals] = SteepestDescent(@f_d,x0,-10^30,10^-6,10000);
    displayVals(x_val,f_val,g_val,iter,evals);

end

disp("----------------------------------")


diary off



