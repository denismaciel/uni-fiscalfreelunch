//Figure2
//Immediate rise in government spending
//Dynamic effects of the taste shock νt on the...
//real interest rate rV, output gap xV, inflation piV, and government debt debtg


//FIRST SIMULATION(Both shocks)
// government spending shock
shocks;
var eps_gov;
periods 1:1;
values (sig_gov);
end;

// consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con);
end;

simul(periods=150);
//save irfs
irfs_gov1 = oo_.endo_simul;


//SECOND SIMULATION(Taste shock only)
//government spending shock
shocks;
var eps_gov;
periods 1:1;
values (0);
end;

// consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con);
end;

simul(periods=150);
//save irfs
irfs_gov2 = oo_.endo_simul;



//Plotting dynamic effects of the taste shock νt
figure;
//looping over all variables
for jj=1:1:11
subplot(6,2,jj);
plot(1:40, irfs_gov1(jj,1:40), 'g');hold on;
plot(1:40, irfs_gov2(jj, 1:40), 'b--');hold on;
plot(1:40, irfs_gov1(jj,1:40) - irfs_gov2(jj, 1:40), 'r-.');
title(M_.endo_names(jj,:)); //Use variable names stored in M_.endo_names
xlabel('Quarters');
legend('Both shocks', 'Taste shock only', 'Government Shock only'); //add legend
end

figure;
subplot(2,2,1)
plot(2:20, 400*irfs_gov1(11,2:20), 'g');hold on;
plot(2:20, 400*irfs_gov2(11,2:20), 'b--');hold on;
plot(2:20, 400*(irfs_gov1(11,2:20) - irfs_gov2(11,2:20)), 'r-.');
title('Real Interest Rate', 'FontSize',14);
xlabel ('Quarters');
set(gca,'XTick',[1:4:20])
set(gca,'XTickLabel','0|4|8|12|16')
xlabel('Quarters','FontSize',12)
text('String','No Inflation Response','Units','normalized', ...
     'Position',[1.15 1.18],...
     'FontSize',14,'FontWeight','bold','HorizontalAlignment','center');

subplot(2,2,2)
plot(2:20, 100*irfs_gov1(1,2:20), 'g');hold on;
plot(2:20, 100*irfs_gov2(1,2:20), 'b--');hold on;
plot(2:20, 100*(irfs_gov1(1,2:20) - irfs_gov2(1,2:20)), 'r-.');
title('Output Gap', 'FontSize',14);
xlabel ('Quarters');
set(gca,'XTick',[1:4:20])
set(gca,'XTickLabel','0|4|8|12|16')
xlabel('Quarters','FontSize',12)

subplot(2,2,3)
plot(2:20, 400*irfs_gov1(2,2:20), 'g');hold on;
plot(2:20, 400*irfs_gov2(2,2:20), 'b--');hold on;
plot(2:20, 400*(irfs_gov1(2,2:20) - irfs_gov2(2,2:20)), 'r-.');
title('Inflation','FontSize',14);
xlabel ('Quarters');
set(gca,'XTick',[1:4:20])
set(gca,'XTickLabel','0|4|8|12|16')
xlabel('Quarters','FontSize',12)
legend('Both shocks', 'Taste shock only', 'Government shock only','location','SouthEast'); //add legend

subplot(2,2,4)
plot(25*debtg(1:40));
plot(2:20, 25*irfs_gov1(6,2:20), 'g');hold on;
plot(2:20, 25*irfs_gov2(6,2:20), 'b--');hold on;
plot(2:20, 25*(irfs_gov1(6,2:20) - irfs_gov2(6,2:20)), 'r-.');
title('Government Debt/GDP', 'FontSize',14);
set(gca,'Ylim',[-1,10]);
set(gca,'YTick',[0:10]);
set(gca, 'YTickLabel', '0 | |2 | |4 | |6 | |8 | |10 ')
xlabel ('Quarters');
set(gca,'XTick',[1:4:20])
set(gca,'XTickLabel','0|4|8|12|16')
xlabel('Quarters','FontSize',12)

//calculate positive output of government spending shock on debt
gov_debt_govshk = irfs_gov1(6,1:20) - irfs_gov2(6,1:20)
gov_debt_govshk_duration = gov_debt_govshk < 0
sum (gov_debt_govshk_duration)

//calculate liquidity trap duration
liqduration =  [sum(irfs_gov1(3,1:end) == -ibar) sum(irfs_gov2(3,1:end) == -ibar)]

//calculate government spending multiplier
y1 = irfs_gov1(10,2);
g1 = irfs_gov1(8,2);
y2 = irfs_gov2(10,2);
g2 = irfs_gov2(8,2);

mul1 = (y1 - y2)/(g1 - g2) * 1/shrgy

//calculate output gap response
x = 100*(irfs_gov1(1,2) - irfs_gov2(1,2))

//calculate potential output response
ypot = 100*(irfs_gov1(4,2) - irfs_gov2(4,2))

mul = x + ypot
