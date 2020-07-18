function pocketW =  pocket_pla(X,y,pocketW,W,iteration)

[rows,~] = size(X);
it = 1;

while it <= iteration
    result =  sign(X * W) ;
    result(result==0) = -1;%take sign(0) as -1
    if result == y
        break;
    end
    
    for index =1 : rows
        res = sign(X(index,:) * W);
        if res == 0
            res = -1;
        end
               
        if res ~= y(index)
            W = W + y(index,:) * X(index,:)';%amendment
            if errorRate(X,y,pocketW) > errorRate(X,y,W)
                pocketW = W;
            end
            it = it + 1;
        end
    end
end

end