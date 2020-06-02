function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    %method 1
%     Inner=(X*theta - y);
%     tmp1 = theta(1) - alpha * 1.0/m * sum(transpose(Inner)*X(:,1));
%     tmp2 = theta(2) - alpha * 1.0/m * sum(Inner.*X(:,2));
%     
%     theta(1)=tmp1;
%     theta(2)=tmp2;
    
    %method 2
    Inner=(X*theta - y);
    tmp_theta=[]
    for it = 1:size(theta),
        tmp_theta= theta - alpha * 1.0/m * transpose(X)*Inner;
    end;
    theta=tmp_theta;
        





    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
