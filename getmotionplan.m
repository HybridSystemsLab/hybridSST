function solution = getmotionplan(T, I_new, edge_map, I_map)
%PLOTSOLUTION Summary of this function goes here
%   Detailed explanation goes here
solution = [];
if I_new ~= 1
    P = findpath(T, 1, I_new);
    endpoint1 = P(1);
    endpoint2 = P(2);
    state1 = getstate(endpoint1, T);
    state2 = getstate(endpoint2, T);
    plot([state1(1), state2(1)], [state1(2), state2(2), ''])
    for i = 2: (size(P, 2) -1 )
        endpoint1 = P(i);
        endpoint2 = P(i + 1);
        solutionthispart = getsolutionpair(edge_map ,endpoint1, endpoint2);
        solutionthispart(1,:) = solution(1, end) + solutionthispart(1,:);
        solutionthispart(2,:) = solution(2, end) + solutionthispart(2,:);
        solution = [solution, solutionthispart];
    end
%     figure(1);
%     plot(solution(3, :), solution(4, :),'r-', 'LineWidth', 2);
    % title(['After ' mat2str(k) ' of ' mat2str(K) ' samples, hybrid rrt finds the solutions starting from ' mat2str(x0) ' to ' mat2str(xf)])
end

end

