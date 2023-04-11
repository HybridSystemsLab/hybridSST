function [value] = Xf(x)
%XF Summary of this function goes here
%   Detailed explanation goes here
global xf;
value = 0;
if (norm(x(1:2) - xf(1:2)) < 0.2)
    value = 1;
end
end

