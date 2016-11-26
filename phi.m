
function [result] = phi(v1,Q,p)
 
result = v1'*Q*v1/2+p'*v1;