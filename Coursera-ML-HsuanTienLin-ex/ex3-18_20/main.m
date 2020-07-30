%% Initialization
clear ; close all; clc

%% Load Data
data_train = load('hw3_train.txt');
data_test = load('hw3_test.txt');

[rows,cols] = size(data_train);
[rows_test,cols_test] = size(data_test);

X = data_train(:,1:cols-1); 
y = data_train(:,cols);
X = [ones(rows,1),X];% add x_0 = 1 to  X 

X_test = data_test(:,1:cols_test-1); 
y_test = data_test(:,cols_test);
X_test = [ones(rows_test,1),X_test];% add x_0 = 1 to  X 


%% ============ Part 1:Q18 logisitc regression with gradient descent============
% ita = 0.001;
% iterations = 2000;
% W = zeros(size(X,2),1);
% W = logisticReg(X,y,W,ita,iterations);
% E_out = getErrorRate(y_test,mySign(X_test*W));
% fprintf('E_out = %f\n',E_out);%0.475000
% disp(W);
% W = [0.0187841650158987;-0.0126059477464548;0.0408486161069278;-0.0326631675244727;0.0150233424262406;
%     -0.0366743734273622;0.0125593353638366;0.0481506497008377;-0.0220641899797574;0.0247960514587859;
%     0.0689928424613264;0.0193719013366831;-0.0198854947126416;-0.00870489707805671;0.0460586293463679;
%     0.0579338158449528;0.0612179954017342;-0.0472039108188801;0.0607037517966268;-0.0161090653613741;
%     -0.0348460740657514]

%% ============ Part 2:Q19 logisitc regression with gradient descent============
% change ita  = 0.01;
% E_out = 0.197
%W = [-0.00385379195863600;-0.189145641482980;0.266259078755051;-0.353565929390871;0.0408877601223856;
% -0.379429599011511;0.0198278322321424;0.333915273221340;-0.263867535391247;0.134893282821597;
% 0.491419104853825;0.0872610687489513;-0.255377282990421;-0.162917973507655;0.300736777902843;
% 0.400149536347939;0.432188082677136;-0.462279678571158;0.432301933409134;-0.207863723758692;
% -0.369363370103648]

%% ============ Part 3:Q20 logisitc regression with stochastic gradient descent============
ita = 0.001;
iterations = 2000;
W = zeros(size(X,2),1);
W = logisticReg_SGD(X,y,W,ita,iterations);
E_out = getErrorRate(y_test,mySign(X_test*W));
fprintf('E_out = %f\n',E_out);%E_out = 0.473000
disp(W);
