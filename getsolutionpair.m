function solution = getsolutionpair(map ,ID1, ID2)
%GETSOLUTIONPAIR Summary of this function goes here
%   Detailed explanation goes here
solutionmapfromID1 = map(ID1);
solution = solutionmapfromID1(ID2);
end

