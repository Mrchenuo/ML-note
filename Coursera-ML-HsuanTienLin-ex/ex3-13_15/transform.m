function Z = transform(X)

[rows,~] = size(X);
Z = [ones(rows,1),X(:,1),X(:,2),X(:,1) .* X(:,2),X(:,1) .^2,X(:,2) .^2];

end