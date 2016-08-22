load mul_file.mat;
load pbalance_file.mat;
load x_file.mat

shrgy = 0.2


% Figure 3 'Government Spending Mutliplier with Alternative Price Contract Durations'
figure;
subplot(1,1,1)
plot(x(1:length(mul_various)), mul_various(:,:,2), 'g --', 'linewidth',5); hold on;
plot(x(1:length(mul_various)), mul_various(:,:,3), 'b',    'linewidth',5);
plot(x(1:length(mul_various)), mul_various(:,:,4), 'r -.',  'linewidth',5);
title('Alternative Price Contract Durations','fontweight','bold','FontSize',20)
set(gca,'fontsize',18);
ylabel(gca,'Government Spending Multiplier');
set(gca,'Xlim',[-0.55,0.55]);
set(gca,'XTick',[-0.5:0.25:0.5]);
set(gca,'XTickLabel', {'-10' ,'-5' ,'0' ,'5' ,'10' });
xlabel(gca,'% Change in Govt Spend (Share of GDP)')
legend('10 qtr contracts','5 qtr contracts','4 qtr contracts','location','NorthEast');
hold off;

% Figure 3 'Government Debt to Actual GDP No Inflation Response'
figure;
plot(x(1:length(pbalance_various)), pbalance_various(:,:,1), 'b', 'linewidth',5);
title('No Inflation Response','fontweight','bold','FontSize',20)
set(gca,'fontsize',18);
set(gca,'Ylim',[0,1]);
set(gca,'YTick',[0:0.2:1]);
ylabel(gca,'Government Debt to Actual GDP');
set(gca,'Xlim',[0,0.55]);
set(gca,'XTick',[0:0.1:0.5]);
set(gca,'XTickLabel', {'0' , '2' ,'4' ,'6' ,'8' ,'10' });
xlabel(gca,'% Change in Govt Spend (Share of GDP)')
hold off;

% Figure 3 'Government Debt to Acutal GDP with Alternative Price Contract Durations'
figure;
subplot(1,1,1)
plot(x(1:length(pbalance_various)), pbalance_various(:,:,2), 'g --', 'linewidth',5); hold on;
plot(x(1:length(pbalance_various)), pbalance_various(:,:,3), 'b',    'linewidth',5);
plot(x(1:length(pbalance_various)), pbalance_various(:,:,4), 'r -.',  'linewidth',5);
title('Alternative Price Contract Durations','fontweight','bold','FontSize',20)
set(gca,'fontsize',18);
set(gca,'Ylim',[-1,0.5]);
set(gca,'YTick',[-1:0.5:0.5]);
ylabel(gca,'Government Debt to Actual GDP');
set(gca,'Xlim',[0,0.55]);
set(gca,'XTick',[0:0.1:0.5]);
set(gca,'XTickLabel', {'0' , '2' ,'4' ,'6' ,'8' ,'10' });
xlabel(gca,'% Change in Govt Spend (Share of GDP)')
legend('10 qtr contracts','5 qtr contracts','4 qtr contracts','location','SouthEast');
hold off;
