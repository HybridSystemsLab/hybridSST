clear all
clc

K = 10;

ts = zeros(1, K);
Ts = zeros(1, K);

for i = 1:K 
    [t, T] = rrt();
    ts(i) = t;
    Ts(i) = size(T.Node, 1);
end

t_mean = mean(ts)