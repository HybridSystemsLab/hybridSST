function x_rand = sampleInD(N)
%SAMPLEIND Summary of this function goes here
%   Detailed explanation goes here
%% assume that the D = {0} * [-25, 0]
x_rand =  zeros(N);
x_rand(1) = 0;
x_rand(2) = -25*rand();
end

