//Figure2
//dynamic effects of the taste shock νt on the
//real interest rate rV, output gap xV, inflation piV, and government debt debtg

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
//stochastic simulation
simul(periods=150); 
//save irfs 
irfs_xip1 = oo_.endo_simul;



//SECOND SIMULATION
shocks;
var eps_gov;
periods 1:1;
values (1.5);
end;
///eps_gov_0= 1/shrgy = 1/0.2 = 5
//stochastic simulation
simul(periods=150);
//save irfs
irfs_xip2 = oo_.endo_simul;



//Plotting the IRFS for xip=1 and xip=0.8 in the same plot
figure;
//looping over all variables
for jj=1:1:11
subplot(6,2,jj);
plot(1:40, irfs_xip1(jj,1:40), 'k');hold on;
plot(1:40, irfs_xip2(jj, 1:40), 'r--');hold on;
plot(1:40, irfs_xip1(jj,1:40) - irfs_xip2(jj, 1:40), 'b--');
title(M_.endo_names(jj,:)); //Use variable names stored in M_.endo_names
legend('both shocks', 'Taste shock only', 'Government Shock only'); //add legend
end