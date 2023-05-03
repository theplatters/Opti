function [x,f_val,g,exit_flag, iter, evals] = SteepestDescent (f, x0, phi_min,eps,itmax, typ_f,typ_x)

  if nargin < 7
    typ_x(1:size(x0,1)) = 10^-4;
   end

   if nargin < 6
    typ_f = 10^-4;
   end

   if nargin < 5
    itmax = 1000;
  end

  if nargin < 4
    eps = 10^-6;
  end

  if nargin < 3
    phi_min = -10^30;
  end

  xk = x0;
  [fk,gk,exit_flag] = f(x0);
  evals = 0;
  for iter = 1:itmax

    if max(abs(gk) .* typ_x / typ_f) <= eps
      x = xk;
      f_val = fk;
      g = gk;
      return
    end

    [xk,fk,gk,exit_flag,~,eval_temp] = LineSearch(f,xk,fk,gk,-gk,phi_min);
    typ_f = max(typ_f,abs(fk));
    typ_x = max(typ_x,abs(xk));
    evals = evals + eval_temp;
  end

      x = xk;
      f_val = fk;
      g = gk;
      exit_flag = 1;

end
