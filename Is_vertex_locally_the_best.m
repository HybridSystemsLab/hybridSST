function [output, S] = Is_vertex_locally_the_best(x_new, cost_new, S, delta_s, T)
%IS_VERTEX_LOCALLY_THE_BEST Summary of this function goes here
%   Detailed explanation goes here
I_s_new = nearest_witness(S, x_new);
if norm(get_witness_state(I_s_new, S)' - x_new) > delta_s
    s_new = [x_new', 0];
    S = [S; s_new];
    I_s_new = size(S, 1);
end
if get_witness_rep(I_s_new, S) < 1 || cost_new < getcost(get_witness_rep(I_s_new, S), T)
    output = true;
else
    output = false;
end


end

