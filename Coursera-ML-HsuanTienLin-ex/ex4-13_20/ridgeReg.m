function W = ridgeReg(X,y,lambda)
%linear regression with regularized

[rows,cols] = size(X);
I = eye(cols);
W = (X' * X + lambda * I) \ X' *y;

end