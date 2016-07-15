load mul_file.mat;
load pbalance_file.mat;
load x_file.mat

shrgy = 0.2

figure;
subplot(1,1,1)
plot((1/shrgy)*x(1:length(mul_various)), mul_various(:,:,1), 'g --'); hold on;
plot((1/shrgy)*x(1:length(mul_various)), mul_various(:,:,2), 'b'); 
plot((1/shrgy)*x(1:length(mul_various)), mul_various(:,:,3), 'r -'); 
xlabel('% Change in Govt Spend (Share of GDP)')
ylabel('Government Spending Multiplier');
hold off;



figure;
subplot(1,1,1)
plot((1/shrgy)*x(1:length(pbalance_various)), pbalance_various(:,:,1), 'g --'); hold on;
plot((1/shrgy)*x(1:length(pbalance_various)), pbalance_various(:,:,2), 'b'); 
plot((1/shrgy)*x(1:length(pbalance_various)), pbalance_various(:,:,3), 'r -'); 
xlabel('% Change in Govt Spend (Share of GDP)')
ylabel('Government Debt to Actual GDP');
hold off;
