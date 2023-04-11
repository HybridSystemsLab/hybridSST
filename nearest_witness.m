function i_s_new = nearest_witness(S, x_new)
    s_indices = size(S, 1);
    dist_list = zeros(s_indices, 1);
    for i = 1:s_indices
        dist_list(i) = norm(get_witness_state(i, S)' - x_new);
    end
    [M, i_s_new] = min(dist_list);
end