function cost = costfunctional(psi)
%COSTFUNCTIONAL Summary of this function goes here
%   Detailed explanation goes here
t = psi(1, :);
j = psi(2, :);

cost = t(end) + j(end);

end

