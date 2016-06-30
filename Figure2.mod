//Figure2
//dynamic effects of the taste shock νt on the
//real interest rate rV, output gap xV, inflation piV, and government debt debtg

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


//SECOND SIMULATION
shocks;
var eps_gov;
periods 1:1;
values (0);
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
legend('both shocks', 'Taste shock only', 'Government Shock only'); //add legend
end

figure;
subplot(2,2,1)
plot(2:20, 400*irfs_gov1(11,2:20), 'g');hold on;
plot(2:20, 400*irfs_gov2(11,2:20), 'b--');hold on;
plot(2:20, 400*(irfs_gov1(11,2:20) - irfs_gov2(11,2:20)), 'r-.');
title('Real Interest Rate');
xlabel ('Quarters');
text('String','No Inflation Response','Units','normalized', ...
     'Position',[0.5 1.18],...
     'FontSize',14,'FontWeight','bold','HorizontalAlignment','center');

subplot(2,2,2)
plot(2:20, 100*irfs_gov1(1,2:20), 'g');hold on;
plot(2:20, 100*irfs_gov2(1,2:20), 'b--');hold on;
plot(2:20, 100*(irfs_gov1(1,2:20) - irfs_gov2(1,2:20)), 'r-.');
title('Output Gap');
xlabel ('Quarters');

subplot(2,2,3)
plot(2:20, 400*irfs_gov1(2,2:20), 'g');hold on;
plot(2:20, 400*irfs_gov2(2,2:20), 'b--');hold on;
plot(2:20, 400*(irfs_gov1(2,2:20) - irfs_gov2(2,2:20)), 'r-.');
title('Inflation');
xlabel ('Quarters');
legend('both shocks', 'Taste shock only', 'Government Shock only','location','SouthEast'); //add legend

subplot(2,2,4)
plot(25*debtg(1:40));
plot(2:20, 25*irfs_gov1(6,2:20), 'g');hold on;
plot(2:20, 25*irfs_gov2(6,2:20), 'b--');hold on;
plot(2:20, 25*(irfs_gov1(6,2:20) - irfs_gov2(6,2:20)), 'r-.');
title('Government Debt/GDP');
xlabel ('Quarters');

