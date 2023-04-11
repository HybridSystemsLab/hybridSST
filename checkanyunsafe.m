function value = checkanyunsafe(psi, dim_state)
%CHECKSAFETY Summary of this function goes here
%   Detailed explanation goes here
m = size(psi, 2);
value = 0;
for i = 1: m
   x = psi(3:(3 + dim_state - 1), i);
   u = psi((3 + dim_state):end, i);
   output = Xu(x, u);
   if output == 1
       value = 1;
       break;
   end
end


end

