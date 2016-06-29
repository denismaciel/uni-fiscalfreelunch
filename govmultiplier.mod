// consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con); 
end;


// government spending shock
// FIRST SIMULATION
shocks;
var eps_gov;
periods 1:1;
values (0);
end;
simul(periods=150); 
//save irfs
irfs1 = oo_.endo_simul;


//SECOND SIMULATION
shocks;
var eps_gov;
periods 1:1;
values (0.03);
end;
simul(periods=150);
//save irfs
irfs2 = oo_.endo_simul;


//THIRD SIMULATION
shocks;
var eps_gov;
periods 1:1;
values (0.2);
end;
simul(periods=150);
//save irfs
irfs3 = oo_.endo_simul;


//FOURTH SIMULATION
shocks;
var eps_gov;
periods 1:1;
values (0.22);
end;
simul(periods=150);
//save irfs
irfs4 = oo_.endo_simul;




//Plotting the IRFS
figure;
//looping over all variables
for jj=1:1:11
subplot(6,2,jj);
plot(1:20, irfs1(jj,1:20), 'k');hold on;
plot(1:20, irfs2(jj, 1:20), 'r--');hold on;
plot(1:20, irfs3(jj, 1:20), 'b-');
plot(1:20, irfs4(jj, 1:20), 'g');hold on;
title(M_.endo_names(jj,:)); //Use variable names stored in M_.endo_names
legend('Taste shock only', 'Small gov spending shock', 'Big gov spending shock', 'Slightly Bigger'); //add legend
end
	
// Check if the Liquidity Trap have the desired durations in the four simulations
liqduration =  [sum(irfs1(3,1:end) == -ibar) sum(irfs2(3,1:end) == -ibar)  ...
		  sum(irfs3(3,1:end) == -ibar) sum(irfs4(3,1:end) == -ibar) ]

	// Name of Variables that appear in irfs(1-3)
	//
	// xV
	// piV
	// iV
	// ypotV
	// rpotV
	// debtg
	// conshk
	// govshk
	// lumptax
	// yV
	// rV
	
//Get output and consumption deviations from STST for each model
y1 = irfs1(10,2);
g1 = irfs1(8,2);
y2 = irfs2(10,2); 
g2 = irfs2(8,2);
y3 = irfs3(10,2);
g3 = irfs3(8,2);
y4 = irfs4(10,2);
g4 = irfs4(8,2);

mul1 = (y2 - y1)/(g2 - g1) * shrgy

//mul15 = (y3 - y1)/(g3 - g1) * shrgy

mul2 = (y4 - y3)/(g4- g2) * shrgy

