function costlist = getcostlist(iterators, T)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
m = size(iterators, 2);
costlist = zeros(1, m);
for i = 1:m
    costlist(1, i) = getcost(iterators(1, i), T);
end

