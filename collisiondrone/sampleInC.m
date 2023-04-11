function x_rand = sampleInC(N)
%SAMPLEINC Summary of this function goes here
%   Detailed explanation goes here
%% assume that the \closure(C) = [0, 25] * [-25, 30]
x_rand =  zeros(N);
while(1)
    x_rand(1) = 6*rand();
    x_rand(2) = 4*rand() + 1;
    x_rand(3) = 6*rand() - 3;
    x_rand(4) = 6*rand() - 3;
    x_rand(5) = 6*rand() - 3;
    x_rand(6) = 6*rand() - 3;
    if (Cprime(x_rand))
        break;
    end
end
end

