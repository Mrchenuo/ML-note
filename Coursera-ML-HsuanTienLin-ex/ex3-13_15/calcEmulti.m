function E = calcEmulti(X,W,y)
    %N = length(y);
    %E = 1/N*sum(power( X * W - y,2));
    h = mySign(X * W');
    [~,cols] = size(h);
    E = zeros(cols,1);
    for i=1:cols
        E(i) = getErrorRate(y,h(:,i));
    end
end