function plotinprocess(T, V_active, V_inactive, S)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure(1)
grid on
for i = 1:size(V_active, 1)
    state = getstate(V_active(i), T);
    plot(state(1), state(2), 'r*', 'DisplayName', 'Active vertex');
    legend('AutoUpdate', 'off');
    hold on
end
% legend('AutoUpdate', 'on');
% for i = 1:size(V_inactive, 1)
%     state = getstate(V_inactive(i), T);
%     plot(state(1), state(2), 'b+', 'DisplayName', 'Inactive vertex');
%     legend('AutoUpdate', 'off');
% end
% hold off

% figure(2)
legend('AutoUpdate', 'on');
for i = 1:size(S, 1)
    state = get_witness_state(i, S);
    plot(state(1), state(2), 'ks', 'DisplayName', 'Witness');
    legend('AutoUpdate', 'off');
    hold on
end
xlim([0, 6]);
ylim([0, 5]);

hold off



