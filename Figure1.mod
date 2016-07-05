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
values (0.1);
end;
simul(periods=150);
//save irfs
irfs_gov2 = oo_.endo_simul;



// plot liquidity duration, iV, rpot
figure;
plot(2:16,400* irfs_gov0 (5, 2:16), 'b')  ;hold on;
plot(2:16,400* irfs_gov0 (3, 2:16), 'r--');hold on;
plot(2:16,400* irfs_gov1 (5, 2:16), 'g--');hold on;
plot(2:16,400* irfs_gov2 (5, 2:16), 'k-.');
title('Negative Taste Shock and Fiscal Response','FontSize',14)
set(gca,'Ylim',[-10,0]);
set(gca,'YTick',[-10:0]);
set(gca, 'YTickLabel', '-10 | | | | |-5 |-i | | | |0 ')
set(gca,'XTick',[1:4:20]);
set(gca,'XTickLabel','0|4|8|12|16');
xlabel('Quarters','FontSize',12);
legend('Potential real rate (taste shock only)','Nominal interest rate (taste shock only)', 'Pot real rate -1% g(t) increase','Pot real interest rate -2% g(t) increase','location','SouthEast');


//calculate liquidity trap duration
liqduration =  [sum(irfs_gov1(3,1:end) == -ibar) sum(irfs_gov2(3,1:end) == -ibar)]
