function [I_near] = Best_First_Selection_SST(x_rand, T, flag, delta_bn, V_active)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I_near = [];

iterator_to_compare = [];
if (flag == 0) %flow
    for i = V_active'
        if (Cprime(getstate(i, T)))
            iterator_to_compare = [iterator_to_compare, i];
        end
    end
elseif (flag == 1) %jump
    for i = V_active'
        if (Dprime(getstate(i, T)))
            iterator_to_compare = [iterator_to_compare, i];
        end
    end
end

if (isempty(iterator_to_compare))
    %     disp('No distance is calculated!');
    return;
end

iterator_to_compare_bn = [];
for i = iterator_to_compare
    if (abs(getstate(i, T) - x_rand) <= delta_bn)
        iterator_to_compare_bn = [iterator_to_compare_bn, i];
    end
end

if (isempty(iterator_to_compare_bn))
    I_near = nearest_neighbor(x_rand, iterator_to_compare, T);
    return;
else
    cost_set = getcostlist(iterator_to_compare_bn, T);
    [Mf, Id] = min(cost_set);
    I_near = iterator_to_compare(Id);
    return
end
    

% N = size(iterator_to_compare, 2);
% dist_vector = zeros(1, N);
% 
% for i = 1:N
%     if (flag == 0)
%         dist_vector(i) = dist_flow(T.get(iterator_to_compare(i)), x);
%     else
%         dist_vector(i) = dist_jump(T.get(iterator_to_compare(i)), x);
%     end
% end
% 
% [Mf, Id] = min(dist_vector);
% I_near = iterator_to_compare(Id);

end

