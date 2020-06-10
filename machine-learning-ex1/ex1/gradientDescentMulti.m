function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
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
    %       of the cost function (computeCostMulti) and gradient here.
    %
    
%     theta= theta - alpha * 1.0/m * X' * (X * theta - y);


    tmp = theta;
    feature_dim = length(X(1,:));
    for i = 1: feature_dim
        k = 1;
        sum = 0;
      
        while( k <= m )
            sum = sum + ((theta)' * (X(k,:))' - y(k)) * X(k, i);
            k = k + 1;
        end
        tmp(i) = tmp(i) - alpha * sum / m;
    end
    
    theta = tmp;



    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
