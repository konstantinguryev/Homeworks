%Problem 1%
X = [1,1.5,3,4,5,7,9,10];
Y1 = -2 + 0.5.*X;
Y2 = -2 + 0.5.*(X.^2);
plot(X, Y1)
hold on
plot (X, Y2)
legend ('Y1','Y2')
hold off
%Problem 2%
X = linspace(-10,20,200);
Y=((X(1)+X(200))*200)/2;
%Problem 3%
A=[2 4 6; 1 7 5; 3 12 4];
b = [-2;3;10];
C=A'*b;
D = inv(A'*A)*b;
E = A(1:3,1)'*b + A(1:3,2)'*b + A(1:3,3)'*b;
%E=b'*sum(A,2) //easier way 
A1 = A([1 3],:);
A1(:,3)=[];
F = A1;
x = inv(A)*b;
%Problem 4%
A=[2 4 6; 1 7 5; 3 12 4];
V = kron(eye(5),A);
%Problem 5%
L = sqrt(5).*randn(5,3) + 10;
for i = 1:1:5
    for j = 1:1:3
        if L(i,j)<10
            L(i,j)=0;
        else 
            L(i,j)=1;
        end
    end
end
%Problem 6%
M=csvread('D:\PennState\Empirical Methods\datahw1.csv');
Y=M(:,5);
X=[ones(size(M,1),1) M(:,3) M(:,4) M(:,6)];
n=size(M,1);
bh=inv(X'*X)*X'*Y;
% Calculating errors manually
eh=Y-X*bh; 
e=repmat(eh,1,4);
X1=X.*e;
V=X1'*X1; D=X'*X;
var=inv(D)*V*inv(D);
ster = sqrt(diag(var));
