function [X,y] = randomData(datasize)

rng('shuffle');
a = -1;
b = 1;
X= (b-a) .* rand(datasize,2) + a;
y=mySign(power(X(:,1),2) + power(X(:,2),2) - 0.6);

end