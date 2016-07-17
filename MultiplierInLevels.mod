close all

test = zeros(500, 1);
gov = zeros(500, 1);

test(1) = 1
gov(1) = 0
for i = 2:500
	
test(i) = test(i-1) + liqmul.multiplier(i) * (liqmul.g(i) - liqmul.g(i-1));
gov(i) = gov(i-1) + liqmul.g(i) - liqmul.g(i-1)


end
	
plot(gov, test)