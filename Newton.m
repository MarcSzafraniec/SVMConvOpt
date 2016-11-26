function [x_new,gap] = Newton(t,x,f,grad,hess)

h = hess(x,t);
g = grad(x,t);

alpha = 1/4;
beta = 1/2;

nstep = -inv(h)*g;

v = .1;

while sum(x+v*nstep < 0) ~= 0
    
    v = beta*v;
    
end

while f(x+v*nstep,t) >= f(x,t) + alpha*v*g'*nstep
    
    v = beta*v;
    
end

x_new = x + v*nstep;

gap = -g'*nstep/2;