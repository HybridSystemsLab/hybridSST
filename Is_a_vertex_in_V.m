function output = Is_a_vertex_in_V(I_v, V)
%IS_A_VERTEX_IN_V Summary of this function goes here
%   Detailed explanation goes here
 output = true;
 if isempty(find(V == I_v))
     output = false;
 end
end

