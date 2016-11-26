 function [X,y] = generate_data(n)
 
%rng default  % For reproducibility
A = normrnd(2,1,[n,2]);


B = normrnd(-1,2,[n,2]);

X = cat(1, A, B)';


%figure
%plot(X(:,1),X(:,2),'+')

y = [ones(1,n),-ones(1,n)]';