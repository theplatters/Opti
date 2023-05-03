

function [x_new,f_new,g_new, exit_flag, alpha, evals] =
   LineSearch (f, x_old,f_old, g_old, p, phi_min, alpha_st)

tau =  tau1 = 0.1;
tau2 = 0.6;
xi1 = 1;
xi2 = 10;;
mu1 = 1/4;
mu2 = 0.9;
sigma = 0.91;
flag = true;
if nargin == 6
  alpha_st = 1;
end

alpha_l = 0
phi_l = f_old
dphi_l = dot(g_old,p)
exit_flag = 0
alpha_r = 0

alpha_tilde = 0;
evals = 0;
while abs(alpha_r - alpha_l) > 10* e^-15
  x_temp = x_old + alpha_st * p
  [f_temp, g_temp, exit_flag] = f(x_temp)
  eval = eval + 1;
  if exit_flag ~= 0
    alpha_r = alpha_st;
    alpha_st = alpha_l + tau1 * (alpha_r - alpha_l);
  else
    phi_hat = f_temp;

    if phi_hat < phi_min
      exit_flag = 2
      fprintf("Error, unbounded function")
      alpha = alpha_st;
      x_new = x_temp;
      f_new = f_temp;
      return
    endif

    if phi_hat > (f_old + mu1 * alpha_st * dphi_l)
      flag = false;
      alpha_r = alpha_st;
      length = alpha_r - alpha_l;
      c = (phi_hat - phi_l  - dphi_l*length)/ (length^2);
      alpha_tilde = alpha_l - dphi_l/(2*c);
      alpha_st = min(max(alpha_l + tau * length ,alpha_tilde),alpha_r - tau * length)
    else
      dphi_hat = dot(g_temp,p)
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
           alpha_l = alpha_st;
           phi_l=phi_hat;
           dphi_l = dphi_hat;
           alpha_st=alpha_tilde;

        end
      else
        alpha = alpha_st;
        x_new = x_old+alpha*p;
        [f_new,g_new,exit_flag] = f(x_new);
        evals = evals+1;
        return




end



endfunction
