function [x_sol,x_seq] = barr_method(Q,p,A,b,x_0,mu,tol)

x_sol = x_0;
t = .5;


%while phi(x_sol,Q,p) - phi(x_sol,Q,p) <= tol
while length(x_sol)/t > tol
    
    [x_seq] = centering_step(Q,p,A,b,x_sol,t,tol);
    x_sol = x_seq(:,end);
    t = mu*t;
    
end

