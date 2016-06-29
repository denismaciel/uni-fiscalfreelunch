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
values (1);
end;
simul(periods=150);
//save irfs
irfs_gov1 = oo_.endo_simul;

//THIRD SIMULATION   (government spending increase of 2%)
shocks;
var eps_gov;
periods 1:1;
values (2);
end;
simul(periods=150);
//save irfs
irfs_gov2 = oo_.endo_simul;



// plot liquidity duration, iV, rpot
figure;
plot(1:40, irfs_gov0 (3,2)(1:40), 'r--');hold on;
//plot(1:40, irfs_gov1(5,2)(1:40), 'b'  );
//plot(1:40, irfs_gov1(jj, 1:40), 'k');hold on;
//plot(1:40, irfs_gov2(jj, 1:40), 'g');hold on;
title ('Negative Taste Shock and Fiscal Response');
xlabel('Quarters');

// legend(h2,'Potential real rate (taste shock only)','Nominal interest rate (taste shock only));
// h2 = plot(400*stor(2,:),stor(3,:));
//,['Pot real rate - ',num2str(govsize_vec(1)*100), '% g(t) increase',,'location','SouthEast']
