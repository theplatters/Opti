dfile1 = 'Test1.txt';
if exist(dfile1, 'file') ; delete(dfile1); end
diary(dfile1)
diary on

options1= optimset('LargeScale','off','GradObj','on'); 
options2= optimset('LargeScale','on','GradObj','on','Hessian','off');
options3= optimset('Algorithm','trust-region','LargeScale','on','GradObj','on','Hessian','on');
options = [options1,options2,options3];

%(a)
disp("===========================================")
disp("(A)")
disp("===========================================")
for i=1:length(options)
    disp("Testing objective function f_a with options: ")
    disp(options(i));
    
    s_a = fminunc(@f_aH,[10,-3],options(i));
    disp("Calculated minimizer: ");
    s_a
    [fm,g] = f_aH(s_a);
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    disp("===========================================")    
end


disp("===========================================")
disp("(B)")
disp("===========================================")
for i=1:length(options)
    disp("Testing objective function f_b with options: ")
    disp(options(i));
    
    s_b = fminunc(@f_bH,[-1,2],options(i));
    disp("Calculated minimizer: ");
    s_b
    
    [fm,g] = f_bH(s_b);
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    disp("===========================================")

end
    

disp("===========================================")
disp("C")
disp("===========================================")

for i=1:length(options)
    disp("Testing objective function f_c with options: ")
    disp(options(i));
    
    disp("===========================================") 
    disp("Results for n=10")
    s_c1 = fminunc(@f_cH,5*ones(1,10),options(i));
    
    disp("Calculated minimizer: ");
    s_c1
    [fm,g] = f_cH(s_c1);
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    
    disp("===========================================")
    disp("Results for n=100")
    s_c2 = fminunc(@f_cH,5*ones(1,100),options(i));
    [fm,g] = f_cH(s_c2);
    
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    
    disp("===========================================")
    disp("Results for n=1000")
    s_c3 = fminunc(@f_cH,5*ones(1,1000),options(i));
    [fm,g] = f_cH(s_c3);
    
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
end



disp("===========================================")
disp("(D)")
disp("===========================================")

for i=1:length(options)
    disp("Testing objective function f_d with options: ")
    disp(options(i));
    
    disp("===========================================")
    disp("Results for n=10")
    s_d1 = fminunc(@f_dH,[zeros(1,9),100],options(i));
    disp("Calculated minimizer: ") 
    s_d1
    
    [fm,g] = f_dH(s_d1);
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    
    disp("===========================================")
    disp("Results for n=100")
    s_d2 = fminunc(@f_dH,[zeros(1,99),1000],options(i));
    [fm,g] = f_dH(s_d2);
    
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    
    disp("===========================================")
    disp("Results for n=1000")
    s_d3 = fminunc(@f_dH,[zeros(1,999),10000],options(i));
    [fm,g] = f_dH(s_d3);
    
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
end


diary off



