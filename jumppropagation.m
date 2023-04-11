function [x_new, psi_new] = jumppropagation(x_cur)
%FLOWPROPAGATION Summary of this function goes here
%   Detailed explanation goes here
global U_D;
global rule;
global options;
global TSPAN_g;
global JSPAN_g;

m = size(U_D, 2);
I = ceil(m*rand());
u = U_D(:, I);
rule = 1;
[t,j,x] = HyEQsolver( @(x) f(x, 0),@(x) g(x, u),@C,@D,...
    x_cur,TSPAN_g,JSPAN_g,rule,options,'ode23t');
phi_new = [t, j, x]';
n = size(phi_new, 2);
psi_new = [phi_new; ones(1, n)* U_D(I)];
x_new = phi_new(3:end, end);

end