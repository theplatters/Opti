## Copyright (C) 2023 Franz Scharnreitner
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} SteepestDescent (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Franz Scharnreitner <franz@fedora>
## Created: 2023-04-27

function [x,f_val,g,exit_flag, iter, evals] = SteepestDescent (f, x0, phi_min,eps,itmax, typ_f,typ_x)

  if nargin < 7
    typ_x(1:size(x0,1)) = 1*e^-4
   end

   if nargin < 6
    typ_f = 1*e^-4;
   end

   if nargin < 5
    itmax = 1000;
  end

  if nargin < 4
    eps = 1*e^-6;
  end

  if nargin < 3
    phi_min = -1*e^30;
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
      exit_flag = 1

end
