load mul_file.mat;
load pbalance_file.mat;
load x_file.mat

shrgy = 0.2

figure;
subplot(1,1,1)
plot(x(1:length(mul_various)), mul_various(:,:,1), 'g --', 'linewidth',5); hold on;
plot(x(1:length(mul_various)), mul_various(:,:,2), 'b',    'linewidth',5);
plot(x(1:length(mul_various)), mul_various(:,:,3), 'r -.',  'linewidth',5);
title('Alternative Price Contract Durations','fontweight','bold','FontSize',18)
legend('10 qtr contracts','5 qtr contracts','4 qtr contracts','location','NorthEast','linewidth',5 );
ylabel(gca,'Government Spending Multiplier','FontSize',16);
xlabel(gca,'% Change in Govt Spend (Share of GDP)','FontSize',16)
set(gca,'Xlim',[-0.55,0.55]);
set(gca,'XTick',[-0.5:0.25:0.5]);
set(gca,'XTickLabel','-10 |-5 |0 |5 |10');
hold off;

figure;
subplot(1,1,1)
plot(x(1:length(pbalance_various)), pbalance_various(:,:,1), 'g --', 'linewidth',5); hold on;
plot(x(1:length(pbalance_various)), pbalance_various(:,:,2), 'b',    'linewidth',5);
plot(x(1:length(pbalance_various)), pbalance_various(:,:,3), 'r -.',  'linewidth',5);
title('Alternative Price Contract Durations','fontweight','bold','FontSize',18)
legend('10 qtr contracts','5 qtr contracts','4 qtr contracts','location','SouthEast');
ylabel(gca,'Government Debt to Actual GDP','FontSize',16);
xlabel(gca,'% Change in Govt Spend (Share of GDP)','FontSize',16)
set(gca,'Xlim',[-0.55,0.55]);
set(gca,'XTick',[-0.5:0.25:0.5]);
set(gca,'XTickLabel','-10 |-5 |0 |5 |10');
hold off;
xlabel('% Change in Govt Spend (Share of GDP)')
ylabel('Government Debt to Actual GDP');
hold off;


figure;
plot(x(1:length(pbalance_various)), pbalance_various(:,:,1), 'b', 'linewidth',5);
title('No Inflation Response','fontweight','bold','FontSize',18)
ylabel(gca,'Government Debt to Actual GDP','FontSize',16);
// set(gca,'Ylim',[0,1]);
// set(gca,'YTick',[0:0.2:1]);
xlabel(gca,'% Change in Govt Spend (Share of GDP)','FontSize',16)
set(gca,'Xlim',[-0.55,0.55]);
set(gca,'XTick',[-0.5:0.25:0.5]);
set(gca,'XTickLabel','-10 |-5 |0 |5 |10');
hold off;
