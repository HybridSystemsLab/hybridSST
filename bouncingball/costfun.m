function out = costfun(psi_new)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
t = psi_new(1, :);
j = psi_new(2, :);
x = psi_new(3: 4, :);
u = psi_new(5, :);

N = size(t, 2);

out = 0;

for i = 1:(N - 1)
    if j(i) == j(i + 1)
        out = out + flowcost(x(:, i), u(:, i))*(t(1, i + 1) - t(1, i));
    else
        out = out + jumpcost(x(:, i), u(:, i));
    end
end


