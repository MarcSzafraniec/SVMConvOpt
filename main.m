
C = 3

[X2,y2] = generate_data(2);
X2 = [X2;ones(1,length(X2))];

[Q,p,A,b] = transform_svm_dual(C,X2,y2);

[d,n] = size(X2)

x = C*.5*ones(length(Q),1);

%x = [C*.5*ones(d,1); ones(n,1)];

[x_sol,x_seq] = barr_method(Q,p,A,b,x,100,.5);

%plot(x_seq)

figure(5);
gscatter(X2(1,:),X2(2,:),y2,'br','xo')
title('Graph of points with original labels')    

figure(6);
correctly_labeled = (x_sol(1:d)'*X2 >0)*2-1 == y2';
gscatter(X2(1,:),X2(2,:),correctly_labeled.*y2','bgr','xox')
title('Graph of points with correctly predicted labels') 
sprintf('Precision: %d%%',100*sum(correctly_labeled)/length(y2))  

[X3,y3] = generate_data(100);
X3 = [X3;ones(1,length(X3))];

figure(7);
gscatter(X3(1,:),X3(2,:),(x_sol(1:d)'*X3 > 0)*2-1,'br','xo')
title('Graph of new points with predicted labels')

figure(8);
correctly_labeled = (x_sol(1:d)'*X3 >0)*2-1 == y3';
gscatter(X3(1,:),X3(2,:),correctly_labeled.*y3','bgr','xox')
title('Graph of new points with correctly predicted labels') 
sprintf('Precision: %d%%',100*sum(correctly_labeled)/length(y3))


