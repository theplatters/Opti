dfile1 = 'Test1.txt';
if exist(dfile1, 'file') ; delete(dfile1); end
diary(dfile1)
diary on

options1= optimset('LargeScale','off','GradObj','on','Display','off'); 
options2= optimset('LargeScale','on','GradObj','on','Hessian','off','Display','off');
options3= optimset('Algorithm','trust-region','LargeScale','on','GradObj','on','Hessian','on','Display','off');
options = [options1,options2,options3];

%(a)
disp("======================================================")  
disp("(A)")
disp("======================================================")  
for i=1:length(options)
    disp("Testing objective function f_a with options: ")
    disp(options(i));
    [x,f,~,out,g] = fminunc(@f_aH,[10,-3],options(i));
    disp("Calculated minimizer: ");
    x
    disp("Calculated Minimum value: " + f);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    disp(out);
    disp("======================================================")    
end


disp("======================================================")
disp("(B)")
disp("======================================================")
for i=1:length(options)
    disp("Testing objective function f_b with options: ")
    disp(options(i));
    
    [x,f,~,out,g] = fminunc(@f_bH,[-1,2],options(i));
    disp("Calculated minimizer: ");
    x
    disp("Calculated Minimum value: " + f);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
    disp(out)
    disp("======================================================")

end
    

disp("======================================================")
disp("C")
disp("======================================================")

for i=1:length(options)
    disp("Testing objective function f_c with options: ")
    disp(options(i));
    
    disp("======================================================")
    for j=1:3
        n=10^j;
        disp("Results for n= "+n);
        [x,f,~,out,g] = fminunc(@f_cH,5*ones(1,n),options(i));
        if j==1
            disp("Calculated minimizer: ");
            x
        end
        disp("Calculated Minimum value: " + f);
        disp("Norm of gradient at calculated Minimum: " + norm(g));
        disp(out)
        disp("====================================================")
    end
    
end

disp("====================================================")
disp("(D)")
disp("====================================================")
for i=1:length(options)
    disp("Testing objective function f_d with options: ")
    disp(options(i));
    
    disp("======================================================")
    for j=1:3
        n=10^j;
        disp("Results for n= "+n);
        [x,f,~,out,g] = fminunc(@f_dH,[zeros(1,n-1),10*n],options(i));
        if j==1
            disp("Calculated minimizer: ");
            x
        end
        disp("Calculated Minimum value: " + f);
        disp("Norm of gradient at calculated Minimum: " + norm(g));
        disp(out)
        disp("====================================================")
    end
    
end

diary off



