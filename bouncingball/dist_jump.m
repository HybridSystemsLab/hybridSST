function dist = dist_jump(x1, x2)
%DIST_JUMP Summary of this function goes here
%   Detailed explanation goes here
global U_D;
U_D_max = max(U_D);
U_D_min = min(U_D);

x_min = g(x1, U_D_min);
x_max = g(x1, U_D_max);

if (x2 >= x_min(2) & x2 <= x_max(2))
    dist = 0;
else
    if (x2 <= g(x1, U_D_min))
        dist = norm(g(x1, U_D_min) - x2);
    else
        dist = norm(g(x1, U_D_max) - x2);
    end
end

end

