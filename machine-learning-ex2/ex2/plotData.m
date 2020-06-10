function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

%method 1
% m=size(X,1);
% 
% for i=1:m,
%     if y(i)>0,
%         plot(X(i,1),X(i,2),'k+','LineWidth',2,'MarkerSize',7);
%     else
%         plot(X(i,1),X(i,2),'yo','LineWidth',2,'MarkerFaceColor','y','MarkerSize',7);
%     end;
% end;

%method 2
pos=find(y==1); neg=find(y==0);

plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);
plot(X(neg,1),X(neg,2),'yo','LineWidth',2,'MarkerFaceColor','y','MarkerSize',7);




% =========================================================================



hold off;

end
