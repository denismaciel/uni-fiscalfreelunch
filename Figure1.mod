//Figure1
//Negative Taste Shock and Fiscal Response

// consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con); 
end;


// government spending shock
// FIRST SIMULATION  (taste shock only)
shocks;
var eps_gov;
periods 1:1;
values (0);
end;
simul(periods=150);
//save irfs
irfs_gov0 = oo_.endo_simul;

//SECOND SIMULATION  (government spending increase of 1%)
shocks;
var eps_gov;
periods 1:1;
values (sig_gov);
end;
simul(periods=150);
//save irfs
irfs_gov1 = oo_.endo_simul;

//THIRD SIMULATION   (government spending increase of 2%)
shocks;
var eps_gov;
periods 1:1;
values (0.02);
end;
simul(periods=150);
//save irfs
irfs_gov2 = oo_.endo_simul;



// plot liquidity duration, iV, rpot
figure;
plot(2:10,400* irfs_gov0 (5, 2:10), 'b')  ;hold on;
plot(2:10,400* irfs_gov0 (3, 2:10), 'r--');hold on;
plot(2:10,400* irfs_gov1 (5, 2:10), 'g--');hold on;
plot(2:10,400* irfs_gov2 (5, 2:10), 'k-.');
title ('Negative Taste Shock and Fiscal Response');
xlabel('Quarters');

legend('Potential real rate (taste shock only)','Nominal interest rate (taste shock only)', 'Pot real rate -1 g(t) increase','Pot real interest rate -2 g(t) increase','location','SouthEast');

