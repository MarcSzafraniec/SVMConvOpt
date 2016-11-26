function [Q,p,A,b] = transform_svm_dual(C,X,y)

% If the vector given to the quadratic problem is [lambda1,...,lambdan]'

[d,n] = size(X);

i = 1:n;
j = 1:n;

Q = [(y(i)'*y(j)).*(X(:,i)'*X(:,j))];

p = -[ones(1,n)]';

b = [zeros(n,1); C*ones(n,1)];

A = [diag(-ones(1,n)); diag(ones(1,n))];