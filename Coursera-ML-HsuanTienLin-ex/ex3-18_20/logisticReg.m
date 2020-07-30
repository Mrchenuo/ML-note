function W = logisticReg(X,y,W,ita,iterations)
[rows,cols] = size(X);
grad = zeros(rows,cols);

for j=1:iterations
    %method 1,slower
    %     for i=1:rows
    %         grad(i,:) = (sigmoid(-y(i)*X(i,:)*W)) * (-y(i)*X(i,:));
    %     end
    %     W = W -(ita*sum(grad,1)/rows)';
    
    %method 2,faster
    grad = (sigmoid(-y .* (X*W))) .* (-y .* X);
    W = W -(ita*sum(grad,1)/rows)';
end


end