function [S, V_active, V_inactive, E, T, I_new, I_map] = Prune_dominated_vertices(I_new, S, V_active, V_inactive, E, T, I_map)
%PRUNE_DOMINATED_VERTICES Summary of this function goes here
%   Detailed explanation goes here
I_s_new = nearest_witness(S, getstate(I_new, T));
I_v_peer = get_witness_rep(I_s_new, S);

if I_v_peer >= 1
    V_active(find(V_active) == I_v_peer) = [];
    V_inactive = [V_inactive; I_v_peer];
end

S(I_s_new, end) = I_new;
if I_v_peer >= 1
    while T.isleaf(I_v_peer) && Is_a_vertex_in_V(I_v_peer, V_inactive)
        I_v_parent = T.Parent(I_v_peer);
        T = T.removenode(I_v_peer);
        I_map(find(I_map(:, 2) == I_v_peer), :) = [];
        I_map(find(I_map(:, 2) > I_v_peer), 2) = I_map(find(I_map(:, 2) > I_v_peer), 2) - 1;
        V_inactive(find(V_inactive == I_v_peer)) = [];
        V_active(find(V_active > I_v_peer)) = V_active(find(V_active > I_v_peer)) - 1;
        S(find(S(:, end) > I_v_peer), end) = S(find(S(:, end) > I_v_peer), end) - 1;
        if I_new > I_v_peer
            I_new = I_new - 1;
        end
        I_v_peer = I_v_parent;
    end
end

