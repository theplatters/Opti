dfile1 = 'Test2.txt';
if exist(dfile1, 'file') ; delete(dfile1); end
diary(dfile1)
diary on
% 
% options1 = optimset('LargeScale','off','GradObj','on'); 
% options2 = optimset('LargeScale','on','GradObj','on','Hessian','off');
% options3 = optimset('LargeScale','on','GradObj','on','Hessian','on');
% options = [options1,options2,options3];
% 
% %(a)
% disp("===================================================================")
% disp("(A)")
% disp("===================================================================")
% for i=1:length(options)
%     disp("Testing objective function f_a with options: ")
%     disp(options(i));
%     
%     s_a = fminsearch(@f_a,[10,-3],options(i));
%     disp("Calculated minimizer: ");
%     s_a
%     [fm,g] = f_a(s_a);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
% end
% 
% 
% disp("===================================================================")
% disp("(B)")
% disp("===================================================================")
% for i=1:length(options)
%     disp("Testing objective function f_b with options: ")
%     disp(options(i));
%     
%     s_b = fminsearch(@f_b,[-1,2],options(i));
%     disp("Calculated minimizer: ");
%     s_b
%     
%     [fm,g] = f_b(s_b);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
% end
%     
% 
% disp("===================================================================")
% disp("C")
% disp("===================================================================")
% 
% for i=1:length(options)
%     disp("Testing objective function f_c with options: ")
%     disp(options(i));
%     
%     s_c1 = fminsearch(@f_c,5*ones(1,10),options(i));
%     disp("Calculated minimizer: ");
%     s_c1
%     [fm,g] = f_c(s_c1);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
%     
%     s_c2 = fminsearch(@f_c,5*ones(1,100),options(i));
%     [fm,g] = f_c(s_c2);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
%     
%     s_c3 = fminsearch(@f_c,5*ones(1,1000),options(i));
%     [fm,g] = f_c(s_c3);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
% end
% 
% 
% 
% disp("===================================================================")
% disp("(D)")
% disp("===================================================================")
% 
% for i=1:length(options)
%     disp("Testing objective function f_d with options: ")
%     disp(options(i));
%     
%     disp("===================================================================")
%   
%     s_d1 = fminsearch(@f_d,[zeros(1,9),10],options(i));
%     disp("Calculated minimizer: ") 
%     s_d1
%     
%     [fm,g] = f_d(s_d1);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
%     
%     disp("===================================================================")
%     
%     s_d2 = fminsearch(@f_d,[zeros(1,99),100],options(i));
%     [fm,g] = f_d(s_d2);
%     disp("Calculated Minimum value: " + fm);
%     disp("Norm of gradient at calculated Minimum: " + norm(g));
%     
%     disp("===================================================================")
% %     
% %     s_d3 = fminsearch(@f_d,[zeros(1,999),1000],options(i));
% %     [fm,g] = f_d(s_d3);
% %     disp("Calculated Minimum value: " + fm);
% %     disp("Norm of gradient at calculated Minimum: " + norm(g));
%     
%     disp("===================================================================")
% end

disp("===================================================================")
disp("(A)")
disp("===================================================================")

s_a = fminsearch(@f_a,[10,-3]);
disp("Calculated minimizer: ");
s_a
[fm,g] = f_a(s_a);
disp("Calculated Minimum value: " + fm);
disp("Norm of gradient at calculated Minimum: " + norm(g));
disp("===================================================================")


disp("===================================================================")
disp("(B)")
disp("===================================================================")
s_b = fminsearch(@f_b,[-1,2]);
disp("Calculated minimizer: ");
s_b

[fm,g] = f_b(s_b);
disp("Calculated Minimum value: " + fm);
disp("Norm of gradient at calculated Minimum: " + norm(g));

disp("===================================================================")
disp("(C)")
disp("===================================================================")
for i=1:2
    s_c1 = fminsearch(@f_c,5*ones(1,10^i));
    disp("Calculated minimizer: ");
    s_c1
    [fm,g] = f_c(s_c1);
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
end

disp("===================================================================")
disp("(D)")
disp("===================================================================")
for i=1:2
    s_d1 = fminsearch(@f_d,[zeros(1,10^i-1),10^i]);
    disp("Calculated minimizer: ") 
    s_d1

    [fm,g] = f_d(s_d1);
    disp("Calculated Minimum value: " + fm);
    disp("Norm of gradient at calculated Minimum: " + norm(g));
end




diary off



