options1 = optimoptions('fminunc','GradObj','off');
options2 = optimset('GradObj','off');

f = @(x) x(1)+10*max(x(1)^2+2*x(2)^2-1,0);
x0=[1,1];
s1 = fminunc(f,x0,options1)
s2 = fminsearch(f,x0,options2)

e1 = norm(s1-[-1,0])
e2 = norm(s2-[-1,0])
