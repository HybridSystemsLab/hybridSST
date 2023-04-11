function [T, I_new, edge_map, reachedset] = addnodeandedgetotree(T, I_near, x_new, psi_new, edge_map, reachedset, cost_new)
%ADDEDGETOGRAPH Summary of this function goes here
%   Detailed explanation goes here
    
    cost = cost_new + getcost(I_near, T);
    [T, I_new, edge_map, reachedset] = addnodetograph(T, I_near, x_new, cost, edge_map, reachedset);
    edge_map = addedgetograph(I_near,  I_new, edge_map, psi_new);
end

