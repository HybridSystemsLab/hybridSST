function value = Xu(x, u)
%XU Summary of this function goes here
%   Detailed explanation goes here

x1 = x(1);
x2 = x(2);
value = 0;
if (x1 <= 4.4 && x1 >= 0 && x2 >= 1.1 && x2<=1.4)
    value = 1;
    return;
end

if (x1 <= 0.4 && x1 >= 0 && x2 >= 1.1 && x2<=2.9)
    value = 1;
    return
end

if (x1 <= 4.4 && x1 >= 0 && x2 >= 2.6 && x2<=2.9)
    value = 1;
    return;
end

end

