function state = getstate(I, T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
content = T.get(I);
state = content(1: (end - 1), 1);
end

