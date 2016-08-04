//Log-Linearized CGG Model
//All variables expressed in percent deviations from steady state

//stochastic simulation of negative shock to natural real rate

//Mathias Trabandt (mathias.trabandt@gmail.com)


//Endogenous variables
var 
piV xV RV rrstarV;

//Exogenous variables
varexo  
eps;

//Parameters
parameters 
beta phi xip rpi rx rho sig;


//Inialization of parameter values
beta  =0.99;  //Discount factor (=inverse nominal interest rate)
phi   =0.2;   //Inverse labor supply elasticity
xip   =0.75;  //Calvo parameter price stickiness
rpi   =1.5;   //Taylor rule: feedback on expected inflation
rx    =0.2;   //Taylor rule: feedback on output gap
rho   =0.9;   //AR(1) natural rate
sig   =.005;//Std natural rate


//model equations
model;

//Phillips curve
#kap=(1-beta*xip)*(1-xip)/xip*(1+phi);
piV=beta*piV(+1)+kap*xV;     
                                 
//IS equation
xV=xV(+1)-(RV-piV(+1)-rrstarV);

//Taylor rule
RV=max(log(beta),rpi*piV+rx*xV);

//Natural real interest rate
rrstarV=rho*rrstarV(-1)-eps;

end;


//calc. and check steady state
steady;

//check eigenvalues
check;

//Running the code for different values of xip

//xip=0.75 (set above)
//standard deviations of shocks
shocks;
var eps;
periods 1:1;
values(sig^2); 
end;
//stochastic simulation
simul(periods=40); 
//save irfs 
irfs_xip1 = oo_.endo_simul;


//Set different value for xip and run the model again
xip=0.3;
//standard deviations of shocks
shocks;
var eps;
periods 1:1;
values(sig^2); 
end;
//stochastic simulation
simul(periods=40); 
//save irfs 
irfs_xip2 = oo_.endo_simul;

//Plotting the IRFS for xip=0.75 and xip=0.3 in the same plot
figure;
//looping over all variables
for jj=1:1:4
subplot(2,2,jj);
plot(1:40, irfs_xip1(jj,1:40), 'k');hold on; 
plot(1:40, irfs_xip2(jj, 1:40), 'r--');
title(M_.endo_names(jj,:)); //Use variable names stored in M_.endo_names
legend('xip=0.75', 'xip=0.3'); //add legend
end





