//Figure1a
//Negative Taste Shock and Fiscal Response

//Consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con);
end;


//Government spending shock
//FIRST SIMULATION  (Taste shock only)
shocks;
var eps_gov;
periods 1:1;
values (0);
end;
simul(periods=150);
//save irfs
irfs_gov0 = oo_.endo_simul;

//SECOND SIMULATION  (Government spending increase of 1%)
shocks;
var eps_gov;
periods 1:1;
values (sig_gov);
end;
simul(periods=150);
//save irfs
irfs_gov1 = oo_.endo_simul;

//THIRD SIMULATION   (Government spending increase of 2%)
shocks;
var eps_gov;
periods 1:1;
values (0.1);
end;
simul(periods=150);
//save irfs
irfs_gov2 = oo_.endo_simul;


//Plotting Figure 1a tu show the liquidity duration, iV, rpot & government spending increase of 1% and 2% of GDP
figure;
plot(2:16,400* irfs_gov0 (5, 2:16), 'b',  'linewidth',5);hold on;
plot(2:16,400* irfs_gov0 (3, 2:16), 'r-.', 'linewidth',7);hold on;
plot(2:16,400* irfs_gov1 (5, 2:16), 'g--','linewidth',5);hold on;
plot(2:16,400* irfs_gov2 (5, 2:16), 'k-.','linewidth',5);
title('Negative Taste Shock and Fiscal Response','fontweight','bold','FontSize',20);
set(gca,'fontsize',18);
set(gca,'Ylim',[-10,0]);
set(gca,'YTick',[-10:0]);
set(gca, 'YTickLabel', {'-10' ,'','','','','-5' ,'-i' ,'','','','0' });
set(gca,'Xlim',[1,12]);
set(gca,'XTick',[2:4:12]);
set(gca,'XTickLabel', {'0' ,'4' ,'8' ,'12' });
xlabel('Quarters');
legend(' Potential real rate (taste shock only)',' Nominal interest rate (taste shock only)', ' Pot real rate -1% g(t) increase',' Pot real rate -2% g(t) increase','location','SouthEast');

//Calculate liquidity trap duration
liqduration =  [sum(irfs_gov1(3,1:end) == -ibar) sum(irfs_gov2(3,1:end) == -ibar)]
