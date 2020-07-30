function W = logisticReg_SGD(X,y,W,ita,iterations)
[rows,cols] = size(X);

n = 1;
for j=1:iterations
    grad = (sigmoid(-y(n) .* (X(n,:)*W))) .* (-y(n) .* X(n,:));
    W = W -(ita*grad)';
    
%     cycle  n = 1, 2, ..., N, 1, 2,бн,N,1,2,бн.
    if n==rows 
        n = 1;
    else 
        n = n+1;
    end
end


end