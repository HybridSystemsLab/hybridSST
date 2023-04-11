function value = collisionregion3(x, u)
%COLLISIONREGION1 Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);
value = 0;
if (x1 <= 4.5 && x1 >= 0.5 && x2 >= 2.5 && x2<=2.6)
    value = 1;
end
end

