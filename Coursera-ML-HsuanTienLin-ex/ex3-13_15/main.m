%% Initialization
clear ; close all; clc


%% ============ Part 1:Q13_Linear Regression without transformation============
% avgE_in = 0;
% datasize = 1000;
% noiseRatio = 0.1;
% repeatNum = 1000;
% for i=1:repeatNum
%     [X,y] = randomData(datasize);
%     y = addNoise(y,datasize,noiseRatio);
%     W = linearReg(X,y);
%     avgE_in = avgE_in + calcEmulti(X,W,y);
%     fprintf('num:%d,avgE_in = %f\n',i,avgE_in/i);
% end
%
% avgE_in = avgE_in/ repeatNum;
% fprintf('avgE_in = %f\n',avgE_in);%0.483917

%% ============ Part 2:Q14-15_Linear Regression with transformation and E_out============
avgE_in = 0;
avgE_out = 0;
datasize = 1000;
noiseRatio = 0.1;
repeatNum = 1000;
totalW = 0;
for i=1:repeatNum
    [X_test,y_test] = randomData(datasize);
    y_test = addNoise(y_test,datasize,noiseRatio);
    Z_test = transform(X_test);
    
    [X,y] = randomData(datasize);
    y = addNoise(y,datasize,noiseRatio);
    Z = transform(X);
    W = linearReg(Z,y);
    totalW = totalW + W;
    avgE_in = avgE_in + calcEmulti(Z,W,y);
    avgE_out = avgE_out + calcEmulti(Z_test,W,y_test);
    fprintf('num:%d,avgE_in = %f,avgE_out = %f\n',i,avgE_in/i,avgE_out/i);
end

avgE_in = avgE_in / repeatNum;
fprintf('avgE_in = %f,avgE_out = %f\n',avgE_in,avgE_out/i);%0.123970,0.126145
disp(totalW/repeatNum);
% -0.9928 0.0005 0.0014 -0.0014 1.5597 1.5539
