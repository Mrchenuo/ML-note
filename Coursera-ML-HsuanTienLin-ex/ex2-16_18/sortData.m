function [x,y] = sortData(x,y)

tmp = [x,y];
tmp = sortrows(tmp,1);

x = tmp(:,1);
y = tmp(:,2);
end