function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

% [row,col]=size(X);
% fprintf('size of X:%d,%d\n',row,col);
% [row,col]=size(y);
% fprintf('size of y:%d,%d\n',row,col);
% [row,col]=size(theta);
% fprintf('size of theta:%d,%d\n',row,col);

h = sigmoid(X*theta);

%method 1
% cost = zeros(m,1);
% for i=1:m
%     cost(i)=-y(i) * log(h(i))-(1-y(i))*log(1-h(i));
% end
% 
% 
% J=1.0/m * sum(cost) +  lambda/(2*m) * theta(2:size(theta))'*theta(2:size(theta));

%method 2 
% J = (-y' * log(h) - (1-y)' * log(1-h))/m + lambda/(2*m) * theta' * theta;
% don't need to penalize theta0,because x0 always = 1 
J = (-y' * log(h) - (1-y)' * log(1-h))/m + lambda/(2*m) * theta(2:size(theta))'*theta(2:size(theta));

grad(1) = 1.0/m * sum(X(:,1)'*(h-y));

n = length(theta);
for i=2:n
    grad(i) = 1.0/m * sum(X(:,i)'*(h-y)) + lambda/m * theta(i);
end


% =============================================================

end
