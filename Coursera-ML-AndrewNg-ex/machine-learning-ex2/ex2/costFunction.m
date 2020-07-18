function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
% [row,col]=size(X);
% fprintf("size of X:%d,%d\n",row,col);
% [row,col]=size(y);
% fprintf("size of y:%d,%d\n",row,col);
% [row,col]=size(theta);
% fprintf("size of theta:%d,%d\n",row,col);

h=sigmoid(X * theta);
% [row,col]=size(h);
% fprintf("size of h:%d,%d\n",row,col);
cost = zeros(size(theta));
for i=1:m
    cost(i) = -y(i)*log(h(i))-(1-y(i))*log(1-h(i));
end

J=1.0/m * sum(cost);

grad = 1.0/m * X' * (h - y);







% =============================================================

end
