function cost = getcost(I, T)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
content = T.get(I);
cost = content(end, 1);
end

