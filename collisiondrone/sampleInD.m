function x_rand = sampleInD(N)
%SAMPLEIND Summary of this function goes here
%   Detailed explanation goes here
%% assume that the D = {0} * [-25, 0]
x_rand =  zeros(N);

while(1)
    x_rand(1) = 4*rand() + 2;
    x_rand(2) = 4*rand() + 1;
    x_rand(3) = 6*rand() - 3;
    x_rand(4) = 6*rand() - 3;
    x_rand(5) = 6*rand() - 3;
    x_rand(6) = 6*rand() - 3;
    if (Dprime(x_rand))
        break;
    end
end
end

