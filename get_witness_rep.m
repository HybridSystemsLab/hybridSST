function rep_id = get_witness_rep(i, S)
%GET_WITNESS_REP Summary of this function goes here
%   Detailed explanation goes here
content = S(i, :);
rep_id = content(1, end);
end

