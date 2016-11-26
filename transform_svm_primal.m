function [Q,p,A,b] = transform_svm_primal(C,X,y)

% If the vector given to the quadratic problem is [w1,...,wd,z1,...,zn]'

[d,n] = size(X)

Q = diag([ones(1,d), zeros(1,n)]);

p = [zeros(1,d), C*ones(1,n)]';

b = -[ones(n,1); zeros(n,1)];

A = -[(repmat(y,1,d)'.*X)',diag(ones(1,n)); zeros(n,d), diag(ones(1,n))];