%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

data = load('hw1_15_train.txt');
[row,col] = size(data);
X = data(:,1:col-1); y = data(:,col);
X = [ones(row,1),X];% add x_0 = 1 to  X 
W = zeros(size(X,2),1);

%% ============ Part 1:15_PLA ============
step = pla2(X,y,W);
fprintf('total step:%d\n',step);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2:16_PLA by visiting examples in fixed, pre-determined random cycles ============
steps = zeros(2000,1);
for i=1:2000
    index = randperm(row);
    X = X(index,:); y = y(index,:);
 
    step(i,1) = pla2(X,y,W);
    fprintf('index %d,steps:%d\n',i,step(i,1));
end
fprintf('average steps:%d\n',mean(step));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 3:17_PLA by w = w+ n*X*y ============

steps = zeros(2000,1);
for i=1:2000
    index = randperm(row);
    X = X(index,:); y = y(index,:);
    n=0.5;
    step(i,1) = pla2(X,y,W,n);
    fprintf('index %d,steps:%d\n',i,step(i,1));
end
fprintf('average steps:%d\n',mean(step));

fprintf('Program paused. Press enter to continue.\n');
pause;