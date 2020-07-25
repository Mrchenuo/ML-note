function rate = errorRate(X,y,W)

[row,~] = size(X);
result =  sign(X * W) ;
result(result==0) = -1;%take sign(0) as -1
    
index = find(result ~= y);

rate = length(index)/row;

end