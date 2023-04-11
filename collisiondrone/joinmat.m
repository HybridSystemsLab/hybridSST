function out = joinmat(mat1,mat2)
%JOIN Summary of this function goes here
%   Detailed explanation goes here
[m1, n1] = size(mat1);
[m2, n2] = size(mat2);

out = zeros(m1*m2, n1 + n2);

for i = 1:m1
   for j = 1:m2
      out((i - 1)*m2 + j, :) = [mat1(i, :), mat2(j, :)]; 
   end
end

end

