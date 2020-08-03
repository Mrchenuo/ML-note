%% Initialization
clear ; close all; clc
%% Load data
data_train = load('hw4_train.txt');
data_test = load('hw4_test.txt');

[rows,cols] = size(data_train);
[rows_test,cols_test] = size(data_test);

X = data_train(:,1:cols-1);
X = [ones(size(X,1),1) X];
y = data_train(:,cols);

X_test = data_test(:,1:cols_test-1);
X_test = [ones(size(X_test,1),1) X_test];
y_test = data_test(:,cols_test);

%% ============ Part 1:13_regularized linear regression============
% lambda = 10;
% W = ridgeReg(X,y,lambda);
% E_in = getErrorRate(y,mySign(X*W));
% E_out = getErrorRate(y_test,mySign(X_test*W));
% fprintf('E_in = %f,E_out = %f\n',E_in,E_out);%E_in = 5.000000e-02,E_out = 4.500000e-02

%% ============ Part 2:14-15_select lambda============
% index = (-10:2);
% lambdaArray = 10 .^ index;
% for i=1:length(lambdaArray)
%     W = ridgeReg(X,y,lambdaArray(i));
%     E_in = getErrorRate(y,mySign(X*W));
%     E_out = getErrorRate(y_test,mySign(X_test*W));
%     fprintf('labmda = %e,E_in = %f,E_out = %f\n',lambdaArray(i),E_in,E_out);
% end

%% ============ Part 3:16-17_validation============
% index = (-10:2);
% lambdaArray = 10 .^ index;
%
% X_train = X((1:120),:);
% y_train = y(1:120,:);
%
% X_val = X((121:200),:);
% y_val = y((121:200),:);
%
% for i=1:length(lambdaArray)
%     W = ridgeReg(X_train,y_train,lambdaArray(i));
%     E_train = getErrorRate(y_train,mySign(X_train*W));
%     E_val = getErrorRate(y_val,mySign(X_val*W));
%     E_out = getErrorRate(y_test,mySign(X_test*W));
%     fprintf('labmda = %e,E_train = %f,E_val = %f,E_out = %f\n',lambdaArray(i),E_train,E_val,E_out);
% end

%% ============ Part 1:18_g(lambda)============
% lambda = 10^0;
% W = ridgeReg(X,y,lambda);
% E_in = getErrorRate(y,mySign(X*W));
% E_out = getErrorRate(y_test,mySign(X_test*W));
% fprintf('E_in = %f,E_out = %f\n',E_in,E_out);%E_in = 0.035000,E_out = 0.020000

%% ============ Part 3:19-20_five-folds============
index = (-10:2);
lambdaArray = 10 .^ index;

k = 5;
per = rows / k;
indices = zeros(rows,1);
for i = 1:k
    indices(per*(i-1)+1:per*i) = i;%k-fold in order
end
E_cvList = zeros(length(lambdaArray),1);
for i=1:length(lambdaArray)
    %     indices = crossvalind('Kfold',data_train(1:M,N),v);%random k-fold
    
    E_cv = 0;
    for j = 1:k
        val_indices = (indices == j);
        train_indices = ~val_indices;
        
        X_cv = X(val_indices,:);
        y_cv = y(val_indices,:);
        X_train = X(train_indices,:);
        y_train = y(train_indices,:);
        
        Wreg = ridgeReg(X_train,y_train,lambdaArray(i));
        %         E_train = getErrorRate(y_train,mySign(X_train*Wreg));
        E_cv = E_cv + getErrorRate(y_cv,mySign(X_cv*Wreg));
        %         E_out = getErrorRate(y_test,mySign(X_test*Wreg));
        %         fprintf('labmda = %e,E_train = %f,E_val = %f,E_out = %f\n',lambdaArray(i),E_train,E_cv,E_out);
    end
    E_cvList(i) = E_cv;
    fprintf('labmda = %e,E_cv = %f\n',lambdaArray(i),E_cv/k);
end
E_cvList = E_cvList/k;
[min,I] = min(E_cvList);
fprintf('optimal labmda = %e,min E_cv = %f\n',lambdaArray(I),min);

Wlin = ridgeReg(X,y,lambdaArray(I));
E_in = getErrorRate(y,mySign(X*Wlin));
E_out = getErrorRate(y_test,mySign(X_test*Wlin));
fprintf('E_in = %f,E_out = %f\n',E_in,E_out);