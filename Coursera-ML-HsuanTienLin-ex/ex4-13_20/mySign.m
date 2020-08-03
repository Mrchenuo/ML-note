function y = mySign(X)

y = sign(X);
y(y==0)=-1;% if the corresponding element of x = 0,y = -1

end