//Figure2
//Immediate rise in government spending
//Dynamic effects of the taste shock νt on the...
//real interest rate rV, output gap xV, inflation piV, and government debt debtg


//FIRST SIMULATION(Both shocks)
//Government spending shock
shocks;
var eps_gov;
periods 1:1;
values (sig_gov);
end;

//Consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con);
end;

simul(periods=150);
//save irfs
irfs_gov1 = oo_.endo_simul;


//SECOND SIMULATION(Taste shock only)
//Government spending shock
shocks;
var eps_gov;
periods 1:1;
values (0);
end;

//Consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con);
end;

simul(periods=150);
//save irfs
irfs_gov2 = oo_.endo_simul;


///////////////////////////////////////////////////////////////////
//Plotting dynamic effects of the taste shock
figure;
//looping over all variables
for jj=1:1:11
subplot(6,2,jj);
plot(1:40, irfs_gov1(jj,1:40), 'g');hold on;
plot(1:40, irfs_gov2(jj, 1:40), 'b--');hold on;
plot(1:40, irfs_gov1(jj,1:40) - irfs_gov2(jj, 1:40), 'r-.');
title(M_.endo_names(jj,:)); //Use variable names stored in M_.endo_names
xlabel('Quarters');
legend('Both shocks', 'Taste shock only', 'Government only');
end
///////////////////////////////////////////////////////////////////


//Plotting Figure 2 to show the effects of fiscal policy in a liquidity trap
//Plotting Real Interest Rate
figure;
subplot(2,2,1)
plot(2:20, 400*irfs_gov1(11,2:20), 'g',   'linewidth',3);hold on;
plot(2:20, 400*irfs_gov2(11,2:20), 'b--', 'linewidth',3);hold on;
plot(2:20, 400*(irfs_gov1(11,2:20) - irfs_gov2(11,2:20)), 'r-.', 'linewidth',3);
title('Real Interest Rate', 'FontSize',18);
set(gca,'fontsize',14);
xlabel('Quarters');
// set(gca,'Ylim',[-5,10]);                                                                  //activate for '5 Quarter Price Contracts'
// set(gca,'YTick',[-5:5:10]);                                                               //activate for '5 Quarter Price Contracts'
// set(gca, 'YTickLabel', {'-5' ,'0' ,'5' ,'10' });                                          //activate for '5 Quarter Price Contracts'
set(gca,'Xlim',[1,20]);
set(gca,'XTick',[2:4:20]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16' });
text('String','No Inflation Response','Units','normalized', ...                             //change to 'xx Quarter Price Contracts'
     'Position',[1.15 1.15],...
     'FontSize',20,'FontWeight','bold','HorizontalAlignment','center');

//Plotting Output Gap
subplot(2,2,2)
plot(2:20, 100*irfs_gov1(1,2:20), 'g',  'linewidth',3);hold on;
plot(2:20, 100*irfs_gov2(1,2:20), 'b--','linewidth',3);hold on;
plot(2:20, 100*(irfs_gov1(1,2:20) - irfs_gov2(1,2:20)), 'r-.', 'linewidth',3);
title('Output Gap', 'FontSize',18);
set(gca,'fontsize',14);
// set(gca,'Ylim',[-10,5]);                                                                 //activate for '5 Quarter Price Contracts'
// set(gca,'YTick',[-10:5:5]);                                                              //activate for '5 Quarter Price Contracts'
// set(gca, 'YTickLabel', {'-10' ,'-5' ,'0' ,'5' })                                         //activate for '5 Quarter Price Contracts'
xlabel ('Quarters');
set(gca,'Xlim',[1,20]);
set(gca,'XTick',[2:4:20]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16' });


//Plotting Inflation
subplot(2,2,3)
plot(2:20, 400*irfs_gov1(2,2:20), 'g',   'linewidth',3);hold on;
plot(2:20, 400*irfs_gov2(2,2:20), 'b--', 'linewidth',3);hold on;
plot(2:20, 400*(irfs_gov1(2,2:20) - irfs_gov2(2,2:20)), 'r-.', 'linewidth',3);
title('Inflation','FontSize',18);
set(gca,'fontsize',14);
set(gca,'Ylim',[-25,5]);
set(gca,'YTick',[-25:5:5]);
set(gca, 'YTickLabel',  {'' ,'-20' ,'-15' ,'-10','-5' ,'0' ,'5' })
xlabel ('Quarters');
set(gca,'Xlim',[1,20]);
set(gca,'XTick',[2:4:20]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16' });
xlabel('Quarters');
legend('Both shocks', 'Taste shock only', 'Government only','location','SouthEast');

//Plotting Government Debt/GDP
subplot(2,2,4)
plot(25*debtg(1:40));
plot(2:20, 25*irfs_gov1(6,2:20), 'g',   'linewidth',3);hold on;
plot(2:20, 25*irfs_gov2(6,2:20), 'b--', 'linewidth',3);hold on;
plot(2:20, 25*(irfs_gov1(6,2:20) - irfs_gov2(6,2:20)), 'r-.', 'linewidth',3);
title('Government Debt/GDP', 'FontSize',18);
set(gca,'fontsize',14);
set(gca,'Ylim',[-1,10]);
set(gca,'YTick',[0:2:10]);
set(gca, 'YTickLabel', {'0' , '2' ,'4' ,'6' ,'8' ,'10' })
xlabel ('Quarters');
set(gca,'Xlim',[1,20]);
set(gca,'XTick',[2:4:20]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16' });


//Some additional calculations
//Calculate positive output of government spending shock on debt
gov_debt_govshk = irfs_gov1(6,1:20) - irfs_gov2(6,1:20)
gov_debt_govshk_duration = gov_debt_govshk < 0
sum (gov_debt_govshk_duration)

//Calculate liquidity trap duration
liqduration =  [sum(irfs_gov1(3,1:end) == -ibar) sum(irfs_gov2(3,1:end) == -ibar)]

//Calculate government spending multiplier
y1 = irfs_gov1(10,2);
g1 = irfs_gov1(8,2);
y2 = irfs_gov2(10,2);
g2 = irfs_gov2(8,2);

mul1 = (y1 - y2)/(g1 - g2) * 1/shrgy

//Calculate output gap response
x = 100*(irfs_gov1(1,2) - irfs_gov2(1,2))

//Calculate potential output response
ypot = 100*(irfs_gov1(4,2) - irfs_gov2(4,2))

mul = x + ypot

//Calculate (negativ) change in government debt after 4 Quartes due to government spending increase
debtgov= irfs_gov1(6,4) - irfs_gov2(6,4)
