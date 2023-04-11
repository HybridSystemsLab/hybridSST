function x_rand = sampleInC(N)
%SAMPLEINC Summary of this function goes here
%   Detailed explanation goes here
%% assume that the \closure(C) = [0, 25] * [-25, 30]
x_rand =  zeros(N);
x_rand(1) = 15*rand() - 0.1;
x_rand(2) = 50*rand() - 25;
end

