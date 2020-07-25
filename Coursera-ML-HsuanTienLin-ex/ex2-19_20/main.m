%% Initialization
clear ; close all; clc
%% Load data
data_train = load('hw2_train.txt');
data_test = load('hw2_test.txt');

[rows,cols] = size(data_train);
[rows_test,cols_test] = size(data_test);

X = data_train(:,1:cols-1); 
y = data_train(:,cols);
[~,dim] = size(X);

X_test = data_test(:,1:cols_test-1); 
y_test = data_test(:,cols_test);
[~,dim_test] = size(X);

%% ============ Part 1:19_20_decision stump algorithm with  multi-dimensional data============
minminErrorRate = 1;
bestofbestS = 0;
bestofbestTheta = 0;
bestDim = 0;
for i = 1 : dim
    [curx,cury] = sortData(X(:,i),y);%sort data according to x from small to big
    [minErrorRate,bestS,bestTheta] = getE_in(curx,cury);
    fprintf('Dim = %d,E_in = %f,bestS = %d,bestTheta = %f\n',...
                i,minErrorRate,bestS,bestTheta);
            
    if minErrorRate < minminErrorRate
        minminErrorRate = minErrorRate;
        bestofbestS = bestS;
        bestofbestTheta = bestTheta;
        bestDim = i;
    end
end

fprintf('bestDim = %d,E_in = %f,bestofbestS = %d,bestofbestTheta = %f\n',...
                bestDim,minminErrorRate,bestofbestS,bestofbestTheta);
            
%calculate E_out
[cur_x_test,cur_y_test] = sortData(X_test(:,bestDim),y_test);%sort data according to x from small to big
h = bestofbestS * mySign(cur_x_test - bestofbestTheta);
rate = getErrorRate(cur_y_test,h); 
fprintf('E_out = %f\n',rate);


