function step =  pla2(X,y,W,n)
if (nargin<4)
        n = 1;
end
    
isFinished = 0;
step = 0;
[row,~] = size(X);

while ~isFinished
    result =  sign(X * W) ;
    result(result==0) = -1;%take sign(0) as -1
    if result == y
        isFinished = true;
    end

%     correctNum  = 0; %continue correct num
    
    for i = 1:row
        res = sign(X(i,:) * W);
        if res == 0
            res = -1;
        end
        
        if res ~= y(i)
            W = W + n * y(i,:) * X(i,:)';%amendment
            step = step + 1;
%         else 
%             correctNum = correctNum + 1;
        end
    end
    
%     if correctNum == row 
%         isFinished = true;
%     end
end

end