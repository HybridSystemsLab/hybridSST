function [flag, idx] = isInreachedset(x, reachedset)
%ISINREACHEDSET Summary of this function goes here
%   Detailed explanation goes here

flag = 1; idx = 0;

N = size(x, 1);
hashkeys = hashfun(x);

reachedset_temp = reachedset;

for i = 1: N
    if (reachedset_temp.isKey(hashkeys(i)))
        reachedset_temp = reachedset_temp(hashkeys(i));
    else
        flag = 0;
        break;
    end
end

if (flag == 1)
    idx = reachedset_temp;
end

end

