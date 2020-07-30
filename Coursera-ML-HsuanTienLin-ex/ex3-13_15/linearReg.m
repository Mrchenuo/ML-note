function W = linearReg(X,y)
    %W = inv(X' * X) * X' * y;
    W = (pinv(X) * y)';
end