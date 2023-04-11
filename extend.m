function [T, I_new, output_flag, edge_matrix, reachedset, S, x_new, psi_new, V_active, V_inactive, I_map] = extend(T, x_rand, edge_matrix, reachedset, flag_fg, S, delta_bn, delta_s, V_active, V_inactive, I_map)
%% flow: flag_fg = 0; jump: flag_fg = 1.
% Inputs:
% T: RRT;
% I_new: the index of the new vertex (0 if no vertex is added);
% flag: 1 if a vertex is added, 0 if no vertex is added;
% edge_matrix: the updated edge map;
% reachedset: the updated reached set.

% Outputs:
% flag: 0 if trapped; 1 if reached; 2 if advanced.

% global plotflag;
I_new = 0;
x_new = [];
psi_new = [];
output_flag = 0;

I_near = Best_First_Selection_SST(x_rand, T, flag_fg, delta_bn, V_active);
if (isempty(I_near))
    return;
end

if (Cprime(getstate(I_near, T)) && ~Dprime(getstate(I_near, T)))
    [x_new, psi_new, cost_new] = new_state(I_near, T, 0);
end
if (Dprime(getstate(I_near, T)) && ~Cprime(getstate(I_near, T)))
    [x_new, psi_new, cost_new] = new_state(I_near, T, 1);
end
if (Dprime(getstate(I_near, T)) && Cprime(getstate(I_near, T)))
    pr = rand;
    if (pr < 0.5)
        [x_new, psi_new, cost_new] = new_state(I_near, T, 0);
    else
        [x_new, psi_new, cost_new] = new_state(I_near, T, 1);
    end
end

if ~isempty(x_new)
    [flag_best, S] = Is_vertex_locally_the_best(x_new, cost_new, S, delta_s, T);
    if flag_best
        [T, I_new, edge_matrix, reachedset] = addnodeandedgetotree(T, I_near, x_new, psi_new, edge_matrix, reachedset, cost_new);
        I_map = [I_map; [I_new, I_new]];
        V_active = [V_active; I_new];
        %     if(1)
        %         plotsearchtreeatgrowing(psi_new, x, T.get(I_near), x_new);
        %     end
        [S, V_active, V_inactive, edge_matrix, T, I_new, I_map] = Prune_dominated_vertices(I_new, S, V_active, V_inactive, edge_matrix, T, I_map);
        if (norm(x_new - x_rand) < 0.3)
            output_flag = 1;
            return;
        else
            output_flag = 2;
            return
        end
    end
end
end

