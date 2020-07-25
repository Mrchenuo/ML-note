function rate = getErrorRate(y,h)
datasize = length(y);
index = find(h ~= y);
rate = length(index)/datasize;
end