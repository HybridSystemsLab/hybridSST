function [T, I_new, edge_map, reachedset] = addnodetograph(T, I, x_new, cost, edge_map, reachedset)
%ADDNODETOGRAPH Summary of this function goes here
%   Detailed explanation goes here
    [T, I_new] = T.addnode(I, [x_new; cost]);
    reachedset = addstatetoreachedset(x_new, reachedset, I_new);
    edge_map(I_new) = containers.Map('KeyType','double','ValueType','any');
end

