function [flag, index] = Isintree(x_new, I, reachedset)
%ISINTREE Summary of this function goes here
%   Detailed explanation goes here
flag = 0; index = 0;

[flag1, idx] = isInreachedset(x_new, reachedset);

if (flag1 && idx ~= I)
        flag = 1;
        index = idx;
end
end

