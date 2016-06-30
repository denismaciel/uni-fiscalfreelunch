//Figure 3
//Impact of multiplier varies with the level of government spending,
//assuming the taste shock induces an eight quarter liquidity trrap


// government spending shock
shocks;
var eps_gov;
periods 1:1;
values (sig_gov);
end;
///eps_gov_0= 1/shrgy = 1/0.2 = 5

shocks;
var eps_con;
periods 1:1;
values(-sig_con); 
end;


A = zeros(11,42);	
@#define x = ["0","0.019474","0.038947","0.058421","0.077895","0.097368","0.11684","0.13632","0.15579","0.17526","0.19474","0.21421","0.23368","0.25316","0.27263","0.29211","0.31158","0.33105","0.35053","0.37"]

@#for sig_gov_val in x
	sig_gov = @{sig_gov_val};

	shocks;
	var eps_gov;
	periods 1:1;
	values (sig_gov);
	end;

	simul(periods=40);
	A = cat(3, A, oo_.endo_simul);
@#endfor

A = A(:,:,2:end);
	
liqduration = zeros(1,size(A,3));
for i = 1:size(A,3)
	x = sum(A(3, 1:end, i) == -ibar);
	liqduration(i) = x;	
end
	
x = [0,0.019474,0.038947,0.058421,0.077895,0.097368,0.11684,0.13632,0.15579,0.17526,...
	0.19474,0.21421,0.23368,0.25316,0.27263,0.29211,0.31158,0.33105,0.35053,0.37];

plot(x, liqduration) //get the amazing plot of the Stair...
