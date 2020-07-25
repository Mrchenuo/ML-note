%% Initialization
clear ; close all; clc

%% ============ Part 1:17_18_decision stump algorithm  ============
datasize = 20;
noiseRate = 0.2;
avgE_in = 0;
avgE_out = 0;

for i=1:1000
    %get data
    [x,y] = randomData(datasize);
    y = addNoise(y,datasize,noiseRate);
    [x,y] = sortData(x,y);%sort data according to x from small to big
    [minErrorRate,bestS,bestTheta] = getE_in(x,y);
    
    fprintf('time %d, E_in = %f,bestS = %d,bestTheta = %f\n',i,minErrorRate,bestS,bestTheta);
    avgE_in = avgE_in + minErrorRate;
    avgE_out = avgE_out + 0.5 + 0.3 * bestS * (abs(bestTheta) - 1);%18
    
end
avgE_in = avgE_in/ 1000;
avgE_out = avgE_out/1000;
fprintf('avgE_in = %f,avgE_out= %f\n',avgE_in,avgE_out);