function [x,y] = randomData(datasize)
%Produces datasize x in the range (-1, 1),add using mySign.m get
%the corresponding y

rng('shuffle');
a = -1;
b = 1;
x = (b-a).*rand(datasize,1) + a;
y=mySign(x);

end