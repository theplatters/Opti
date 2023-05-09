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
## @deftypefn {} {@var{retval} =} display (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Franz Scharnreitner <franz@fedora>
## Created: 2023-05-09

function retval = displayVals (x_val, f_val,g_val,iter,evals)
    if length(x_val) < 11
        fprintf("Minimum computed at: ");
        x_val


 end

    disp("Minimum at function f value: ");
    f_val

    disp("norm of gradient: ");
    no = norm(g_val);
    no

    fprintf("with %d iterations and %d function evals \n",iter,evals);


end
