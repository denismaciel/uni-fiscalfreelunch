//Figure1b
//Liquidity Trap Duration and Potential Real Rate


// consumption taste shock
shocks;
var eps_con;
periods 1:1;
values(-sig_con);
end;


// government spending shock
// FIRST SIMULATION  (government spending increase of 1%)

shocks;
var eps_gov;
periods 1:1;
values (sig_gov);
end;
simul(periods=150);
//save irfs
irfs_gov1 = oo_.endo_simul;

//calculate liquidity trap duration
liqduration =  sum(irfs_gov1(3,1:end) == -ibar)


// plot liquidity duration, rpot
figure;
plot(liqduration, rpot)
title('liquidity Trap Duration and Potential Real Interest Rate','FontSize',14)
set(gca,'Ylim',[0,15]);
set(gca,'YTick',[0:5:15]);
set(gca, 'YTickLabel', '0 |5 |10 |15 ')
set(gca,'XTick',[-14:2:0]);
set(gca,'XTickLabel','-14|-12|-10|-8|-6|-4|-2|0');
xlabel('Potential Real Interest Rate','FontSize',12);
