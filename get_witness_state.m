function state = get_witness_state(i, S)
%GET_WITNESS_STATE Summary of this function goes here
%   Detailed explanation goes here
content = S(i, :);
state = content(1, 1: (end - 1));
end

