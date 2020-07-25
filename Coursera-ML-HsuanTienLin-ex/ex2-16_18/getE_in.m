function [minErrorRate,bestS,bestTheta] = getE_in(x,y)

thetaArray = getThetaArray(x);

minErrorRate = 1;
bestS = 0;
bestTheta = 0;

for i=1:length(thetaArray)   
    h = 1 * mySign(x - thetaArray(i));% s = 1
    rate = getErrorRate(y,h);
    if minErrorRate > rate
        minErrorRate = rate;
        bestS = 1;
        bestTheta = thetaArray(i);
    end
    
    h = -1 * mySign(x - thetaArray(i));% s = -1
    rate = getErrorRate(y,h);
    if minErrorRate > rate
        minErrorRate = rate;
        bestS = -1;
        bestTheta = thetaArray(i);
    end
end

end