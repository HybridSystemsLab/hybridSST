function q = plotcurrentsearchtree(T, edgemap)
iterator = T.depthfirstiterator;
iterator = iterator(2:end);
i = iterator(1);
parent = T.getparent(i);
% psi = getsolutionpair(edgemap, parent, i);
% phi = psi(3:(end - 1), :);
state1 = getstate(parent, T);
state2 = getstate(i, T);
q = plot([state1(1), state2(1)], [state1(2), state2(2)], 'k-', 'DisplayName', 'Search tree');

for i = iterator(2:end)
    parent = T.getparent(i);
    state1 = getstate(parent, T);
    state2 = getstate(i, T);
    plot([state1(1), state2(1)], [state1(2), state2(2)], 'k-');
end
end
