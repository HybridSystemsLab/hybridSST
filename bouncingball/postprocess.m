%% store the results
current_time = datestr(datetime('now'));
dir = ['data/success-' loadfilepath current_time];
mkdir(dir);
save([dir '/data.mat']);

%% plot initial/final state
figure(1);
grid on
q1 = plot(x0(1), x0(2),'cs', 'MarkerSize', 10, 'DisplayName','Initial state');
hold on
q2 = plot(xf(1), xf(2),'ms', 'MarkerSize', 10, 'DisplayName','Final state');

%% plot search tree
q3 = plotcurrentsearchtree(T, edge_map);

%% plot motion plan
q4 = plotmotionplan(T, I_new, edge_map, I_map);
legend([q1 q2 q3 q4], 'fontname','Times New Roman')
xlabel('$x_{1}$', 'Interpreter', 'latex');
ylabel('$x_{2}$', 'Interpreter', 'latex');

plotinprocess(T, V_active, V_inactive, S)

xlim([-2.5, 30])
ylim([-25, 25])
set(gca,'fontname','Times New Roman','fontsize', 24)
box on
saveas(gcf,[dir '/planfigure.fig']);
