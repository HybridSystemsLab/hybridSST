function edge_matrix = addedgetograph(I,  I_new, edge_matrix, psi_new)
%ADDEDGETOGRAPH Summary of this function goes here
%   Detailed explanation goes here
    hashtablefromI = edge_matrix(I);
    hashtablefromI(I_new) = psi_new;
    edge_matrix(I) = hashtablefromI;
end

