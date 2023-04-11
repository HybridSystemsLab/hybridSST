function [x_new, psi_new, cost_new] = new_state(I_near, T, flag)

if (flag == 0) %flow
    [x_new, psi_new] = flowpropagation(getstate(I_near, T));
else % jump
    [x_new, psi_new] = jumppropagation(getstate(I_near, T));
end
cost_new = getcost(I_near, T) + costfunctional(psi_new);

if (checkanyunsafe(psi_new, size(x_new, 1)))
    x_new = [];
    psi_new = [];
    cost_new = [];
end

end