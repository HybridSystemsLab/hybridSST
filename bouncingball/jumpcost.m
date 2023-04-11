function out = jumpcost(x, u)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
v = x(2, 1);
xplus = g(x, u);
vplus = xplus(2, 1);
lambda = 0.8;
out = 1/2 * (vplus^(2) - (lambda * v)^(2));% assuming unit mass.

end

