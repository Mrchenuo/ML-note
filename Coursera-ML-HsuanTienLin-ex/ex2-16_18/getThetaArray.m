function thetaArray = getThetaArray(x)

datasize = length(x);
thetaArray = zeros(datasize-1,1);
for i=1:datasize-1
    thetaArray(i) = (x(i+1) + x(i))/2;%middle point
end
%first point and last point
thetaArray = [x(1)-1;thetaArray;x(datasize) + 1];

end