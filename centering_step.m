function [x_seq] = centering_step(Q,p,A,b,x,t,tol)

x_seq = [];
ngap = [];
obj = [];
lphi = [];

gap = tol+1;

function [result] = f(x,t)
      result = fg(t,x,Q,p,A,b);
end

function [result] = grad(x,t)
      result = gradg(t,x,Q,p,A,b);
end

function [result] = hess(x,t)
      result = hessg(t,x,Q,p,A,b);
end

while gap > tol

    [x_new,gap] = Newton(t,x,@f,@grad,@hess);
    x_seq = [x_seq, x_new];
    obj = [obj, f(x_new,t)];
    lphi = [lphi,phi(x_new,Q,p)];
    
    x = x_new;
    %gap
    f(x,t)
    
    ngap = [ngap,gap];
    
    figure(1);
    plot(log10(1:length(obj)),ngap)
    title('Graph of gap')    
    xlabel('log10 of number of steps') % x-axis label
    ylabel('Gap') % y-axis label
    figure(2);
    plot(ngap(max(1,end-20+1):end),'-+')
    title('Graph of last 20 points of gap')
    figure(3);
    plot(log10(1:length(obj)),real(obj))
    title('Graph of objective function')
    xlabel('log10 of number of steps') % x-axis label
    ylabel('Objective function') % y-axis label
    figure(4);
    plot(log10(1:length(obj)),log10(real(lphi)))
    title('Graph of log10 of the objective function')
    xlabel('log10 of number of steps') % x-axis label
    ylabel('Objective function') % y-axis label

end
end

function [result] = fg(t,v1,Q,p,A,b)

i = 1:length(b);
result = t*phi(v1,Q,p) - sum(log((b(i)-A(i,:)*v1)));

end


function [result] = gradg(t,v1,Q,p,A,b)

result = t*(v1'*Q+p');
for i = 1:length(b);
 result = result +  A(i,:)/(b(i)-A(i,:)*v1);
end

result = result';

end


function [result] = hessg(t,v1,Q,p,A,b)

result = t*Q;

for i = 1:length(b);
 result = result +  A(i,:)*A(i,:)'/((b(i)-A(i,:)*v1)^2);
end

result = result + eye(length(result))*0.01;

end