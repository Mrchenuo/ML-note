function y = addNoise(y,datasize,lambda)
%add noise,I'm going to invert the y-values of the datasize*lambda points
index = randperm(20,datasize*lambda);
y(index) = -1 * y(index);

end