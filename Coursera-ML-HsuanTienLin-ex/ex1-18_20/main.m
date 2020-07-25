%% Initialization
clear ; close all; clc

%% Load Data
data_train = load('hw1_18_train.txt');
data_test = load('hw1_18_test.txt');

[rows,cols] = size(data_train);
[rows_test,cols_test] = size(data_test);

X = data_train(:,1:cols-1); 
y = data_train(:,cols);
X = [ones(rows,1),X];% add x_0 = 1 to  X 

X_test = data_test(:,1:cols_test-1); 
y_test = data_test(:,cols_test);
X_test = [ones(rows_test,1),X_test];% add x_0 = 1 to  X 


%% ============ Part 1:18_Pocket Algorithm ============
trainRate = zeros(2000,1);
testRate = zeros(2000,1);
for i=1:2000
    W = zeros(size(X,2),1);
    pocketW = zeros(size(X,2),1);

    index = randperm(rows);
    X = X(index,:); 
    y = y(index,:);
 
    pocketW = pocket_pla(X,y,pocketW,W,50);
    trainRate(i,:) = errorRate(X,y,pocketW);
    testRate(i,:) = errorRate(X_test,y_test,pocketW);
    fprintf('index %d,train error rate:%d,test error rate:%d\n',i,trainRate(i,:),testRate(i,:));
end
fprintf('average test error rate:%d\n',mean(testRate));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2:19_20 ============
%第19题，将pocket_pla函数返回值pocketW改成W
%第20题，pocket_pla函数中的iteration参数由50改成100
%两题的errorRate都与19题在同一量级
