function [x_new, psi_new] = flowpropagation(x_cur)
%FLOWPROPAGATION Summary of this function goes here
%   Detailed explanation goes here
global U_C;
global rule;
global options;
global TSPAN_f;
global JSPAN_f;
global Tm;

m = size(U_C, 2);
I = ceil(m*rand());
u = U_C(:, I);
u_m = size(u, 1);
rule = 2;
TSPAN_f_rand = [0, Tm*rand];
[t,j,x] = HyEQsolver( @(x) f(x, u),@(x) g(x, 0),@C,@D,...
    x_cur,TSPAN_f_rand,JSPAN_f,rule,options,'ode23t');
if (j(end, 1) == 1)
    t = t(1:(end - 1), :);
    j = j(1:(end - 1), :);
    x = x(1:(end - 1), :);
end
N = size(x, 1);
N_t = N;
for i = N:-1:1
    if C(x(i, :), u)
        N_t = i;
        break;
    end
end
if (N_t ~= N)
    t = t(1:N_t, :);
    j = j(1:N_t, :);
    x = x(1:N_t, :);
end

phi_new = [t, j, x]';
n = size(phi_new, 2);
psi_new = [phi_new; ones(u_m, n).* u];
x_new = phi_new(3:end, end);
end


