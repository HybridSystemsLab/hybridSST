%% store the results
current_time = datestr(datetime('now'));
dir = ['data/success-' loadfilepath current_time];
mkdir(dir);
save([dir '/data.mat']);

%% plot initial/final state/environment
figure(1);
hold on
grid on
q1 = plot(x0(1), x0(2),'cs', 'MarkerSize', 10, 'LineWidth', 3, 'DisplayName','Initial state');
q2 = plot(xf(1), xf(2),'ms', 'MarkerSize', 10, 'LineWidth', 3, 'DisplayName','Final state');
rectangle('Position',[0,1,0.5,2],'FaceColor','b','EdgeColor','none')
rectangle('Position',[0.5,1,4,0.5],'FaceColor','b','EdgeColor','none')
rectangle('Position',[0.5,2.5,4,0.5],'FaceColor','b','EdgeColor','none')

%% plot search tree
q3 = plotcurrentsearchtree(T, edge_map);

%% plot motion plan
% q4 = plot(motionplan(3, :), motionplan(4, :),'r-', 'LineWidth', 2, 'DisplayName','Motion plan');
q4 = plotmotionplan(T, I_new, edge_map, I_map);
legend([q1 q2 q3 q4], 'fontname','Times New Roman', 'Location', 'best')
xlabel('$x_{1}$', 'Interpreter', 'latex');
ylabel('$x_{2}$', 'Interpreter', 'latex');


xlim([0, 6])
ylim([0, 6])
set(gca,'fontname','Times New Roman','fontsize', 24)
box on
saveas(gcf,[dir '/planfigure.fig']);
