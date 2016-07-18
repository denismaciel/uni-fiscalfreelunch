close all

test = zeros(250, 1);
gov = zeros(250, 1);

test(1) = 0
gov(1) = 0
	
for i = 2:250
	
test(i) = test(i-1) + liqmul.multiplier(i) * (liqmul.g(i+273) - liqmul.g(i-1+273));
gov(i) = gov(i-1) + liqmul.g(i+273) - liqmul.g(i-1+273);

end

figure;
plot(20*gov, test, 'linewidth', 3);
ylabel(gca,'Output','FontSize',16);
xlabel(gca,'Government Spending','FontSize',16)



k = zeros((length(test)-1), 1)
for i = 1:(length(test)-1)
	
k(i) = (test(i+1) - test(i))/(gov(i+1)/gov(i));

end
	
	
	
