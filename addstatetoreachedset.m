function reachedset = addstatetoreachedset(x, reachedset, I)
%ADDSTATETOREACHEDSET Summary of this function goes here
%   Detailed explanation goes here

N = size(x, 1);
hashkeys = hashfun(x);

reachedset_temp = reachedset;

reachedset_origin = reachedset_temp;

for i = 1: N - 1
    if (reachedset_temp.isKey(hashkeys(i)))
        reachedset_temp = reachedset_temp(hashkeys(i));
    else
        reachedset_temp(hashkeys(i)) = containers.Map('KeyType','double','ValueType','any');
        reachedset_temp = reachedset_temp(hashkeys(i));
    end
end

reachedset_temp(hashkeys(N)) = I;

reachedset = reachedset_origin;

end

