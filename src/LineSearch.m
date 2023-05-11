function [x_new,f_new,g_new, exit_flag, alpha, eval] = LineSearch (f, x_old, f_old, g_old, p, phi_min, alpha_st)
    %Linesearch algorithm with Wolfe-Powell Condition (Algorithm 4.2)
    
    %Setting of parameters as described in the scriptum 
    tau =  0.1;
    tau1 = 0.1;
    tau2 = 0.6;
    xi1 = 1;
    xi2 = 10;
    mu1 = 0.01;
    mu2 = 0.9;
    sigma = 0.9; %sigma greater than mu1
    
    %if only 6 arguments are given
    if nargin == 6
      alpha_st = 1;
    end
    
    alpha_l = 0;
    phi_l = f_old;  %phi_l=phi(0)
    x_old=x_old(:); % x_old always considered as column vector 
    dphi_l = dot(g_old,p);
    exit_flag = 0;
    flag = true;  % means that alpha_r is infinity
    alpha_r = 10^30; %alpha_r should be very large
    
    alpha_tilde = 0; %initialization of alpha_tilde
    eval = 0; %number of evaluations needed
    
    while abs(alpha_r - alpha_l) > 10^(-15)
        %evaluation of function, gradient and exit_flag 
        x_temp = x_old + alpha_st * p;
        [f_temp, g_temp, exit_flag] = f(x_temp);
        eval = eval + 1;
        
        %function could not be evaluated (alpha_hat not in omega_prime)
        if exit_flag ~= 0      
            alpha_r = alpha_st;
            alpha_st = alpha_l + tau1 * (alpha_r - alpha_l);  
            
        %function could be evaluated (alpha_hat in omega_prime)   
        else
            phi_hat = f_temp;
            
            %if function smaller that phi_min, function is declared as
            %unbounded
            if phi_hat < phi_min
                exit_flag = 2; % output is not minimum
                fprintf("Error, unbounded function")
                alpha = alpha_st;
                x_new = x_temp;
                f_new = f_temp;
                return
            end
            %setting alpha_r and calculating alpha_st
            if phi_hat > (f_old + mu1 * alpha_st * dphi_l)
                flag = false; %alpha_r is not infinity 
                alpha_r = alpha_st;
                length = alpha_r - alpha_l;
                c = (phi_hat - phi_l  - dphi_l*length)/ (length^2);
                alpha_tilde = alpha_l - dphi_l/(2*c);
                alpha_st = min(max(alpha_l + tau * length ,alpha_tilde),alpha_r - tau * length);
                
            else
                dphi_hat = dot(g_temp,p); %derivative of phi_hat 
                %calculating alpha_tilde
                if dphi_hat < sigma * dphi_l
                    if flag
                        if dphi_l/dphi_hat > (1 + xi2)/xi2
                            alpha_tilde = alpha_st + (alpha_st - alpha_l) * max(dphi_hat/(dphi_l - dphi_hat),xi1);
                        else
                            alpha_tilde = alpha_st + xi2 * (alpha_st - alpha_l);
                        end
                    else
                        if dphi_l/dphi_hat>1+(alpha_st-alpha_l)/(tau2*(alpha_r-alpha_st))
                            alpha_tilde = alpha_st+max((alpha_st-alpha_l)*dphi_hat/(dphi_l-dphi_hat),tau1*(alpha_r-alpha_st));
                        else
                            alpha_tilde=alpha_st+tau2*(alpha_r-alpha_st);
                        end
                    end
                % setting alpha_l, phi_l, derivative of phi_l and alpha_st    
                alpha_l = alpha_st;
                phi_l=phi_hat;
                dphi_l = dphi_hat;
                alpha_st=alpha_tilde;
                
                %returning from algorithm
                else
                    alpha = alpha_st;
                    x_new = x_old+alpha*p;
                    [f_new,g_new,exit_flag] = f(x_new);
                    eval = eval+1;
                    return
                end
            end
        end
    end
    % final return (if there was no return before)
    alpha = alpha_st;
    x_new = x_old+alpha*p;
    [f_new,g_new,exit_flag] = f(x_new);
    eval = eval+1;
    end