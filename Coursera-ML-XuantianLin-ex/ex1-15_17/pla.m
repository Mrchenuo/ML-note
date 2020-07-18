function step =  pla(X,y,W)
isFinished = 0;
step = 0;
while ~isFinished
    result =  sign(X * W) ;
    result(result==0) = -1;%take sign(0) as -1
    if result == y
        isFinished = true;
    else
        index = find(result ~= y); % the index that result != y
        i = randperm(size(index,1),1);%random select a point
        W = W + y(index(i),:) * X(index(i),:)';
        step = step + 1;
    end
end
end