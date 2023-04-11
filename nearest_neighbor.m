function [I_near] = nearest_neighbor(x_rand, iterator_to_compare, T)
%% flow: flag = 0; jump: flag = 1.
%% Find a nearest neighbor: I_near empty if no nearest neighbor is found.

N = size(iterator_to_compare, 2);
dist_vector = zeros(1, N);

for i = 1:N
    dist_vector(i) = dist(getstate(iterator_to_compare(i), T), x_rand);
end

[Mf, Id] = min(dist_vector);
I_near = iterator_to_compare(Id);

end

