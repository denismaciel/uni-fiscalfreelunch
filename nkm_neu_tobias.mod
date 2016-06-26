// Erceg and Lindé(2014): Is there a fiscal free lunch in a liquidity trap?
// Denis Maciel and Tobias Müller
// standard log-linarized version of the New Keynesian model with zero lower bound

// Compute responses analytically for small NK model 
// monetary policy follow Taylor rule after exit
// makes restrictive assumption that govt spending and taste shocks are AR1



// List endogenous variables
var
xV piV iV ypotV rpotV debtg conshk govshk lumptax yV rV;


// List exogenous shock(s)
varexo
eps_con eps_gov;


// List structural parameters and assign values
parameters
beta alpha sigma chi shrgy nuc xip rho 
gam_xgap gam_pi phi_tax thetap sigma_hat phi_mc kappap rbar taxsub sig_con pibar ibar;



///////////////////////////////////////////////////7
// Initialize Parameters

beta    =  0.995  ;        // discount factor
alpha   =  0.3    ;        // capital share, so (1-alpha) = labor share
sigma   =  1      ;        // intertemporal elasticity of substitution in consumption
chi     =  2.5    ;        // inverse of Frisch elasticity of labor supply

shrgy   =  0.2    ;        // government share of steady-state output
nuc     =  0.01   ;        // scale parameter on the consumption taste shock

xip    =  1       ;          // Calvo price parameter - stickiness and contract duration: 5 quarter duration
//xip  =  1       ;        // Calvo price parameter - stickiness and contract duration: No inflation responses
//xip  =  0       ;        // Calvo price parameter - stickiness and contract duration: flexible prices

gam_xgap=  1000   ;        // coefficient on output gap: Taylor rule feedback on output gap (Werte aus anderem Model Jesper 1000/ standard value 0.2)
gam_pi  =  1000   ;        // coefficient on inflation: Taylor rule feedback on expected inflation (Werte aus anderem Model Jesper 1000/standard value 1.5)

rho     =  0.1    ;        // AR(1) natural rate (preference and government shock)

phi_tax =  0.01   ;        // tax rule parameter

thetap  =  0.7    ;        // steady-state labor share - (1-alpha) capital share

sig_con =  10000  ;         // Std of consumption taste shock(in percent?)  random value

rbar = (1/beta) -1  ;      // steady state real interest rate

//maxoperator ZLB
pibar = 1.005;
ibar = (pibar/beta) - 1;    //nominal nominal interest rate - duration of the liquidity trap depends solely on how lon rpotV remains below -ibar

//sigma_hat
sigma_hat = sigma*(1-shrgy)*(1-nuc);            // sensitivity of the output gap to the real interest rate
                                              

//phi_mc
//phi_mc = lam_mrs+lam_mpl;
phi_mc= (chi/(1-alpha) + 1/sigma_hat) + (alpha/(1-alpha));

//lam_mrs = chi/(1-alpha) + 1/sigma_hat;        // slope of MRS schedule (how supply real wage varies with output -
                                                // Fish elasticity of labor supply - interest sensitivity of aggregate demand
//lam_mpl = alpha/(1-alpha);                    // slope of MPL schedule (how demand real wage varies with output in abs value)
                                                // labor share of production



//kappap
kappap = ((1-xip)*(1-beta*xip)/xip)*phi_mc;  // Calvo-Yun contract structure - set kappap close to zero to keep inflation konstant
//kappap*xip = (1-xip)*(1-beta*xip)*phi_mc    // multiply with xip to set psis=0 and get model with flexible prices


//financing government spending
taxsub= shrgy/thetap;




///////////////////////////////////////////////////////
// Write down system of equilibrium equations
model;

//New Keynesian IS equation
xV= xV(+1)- sigma_hat*(iV-piV(+1) - rpotV);


//Phillips curve
piV= beta*piV(+1)+kappap*xV;


//Taylor rule
iV= max(-ibar,gam_pi*piV+gam_xgap*xV);   //Taylor rule subject to zero lower bound


//Potential output
ypotV= (1/phi_mc*sigma_hat)*(shrgy*govshk+(1-shrgy)*nuc*conshk);


//Natural real interest rate
rpotV= (1/sigma_hat)*(1 - (1/(phi_mc*sigma_hat))*(shrgy*(govshk-govshk(+1))+(1-shrgy)*nuc*(conshk-conshk(+1))));


//government budget constraint
debtg=(1+rbar)*debtg(-1)+shrgy*govshk-taxsub*thetap*(yV+phi_mc*xV)-lumptax;


//lump-sum tax (adjusts according to the reaction function)
lumptax= phi_tax*debtg(-1);


//output yV
yV=xV+ypotV;

// real interest rate rV
rV=4*iV-piV(+1);


// shock processes
conshk= (1-rho)*conshk(-1)+eps_con;
govshk= (1-rho)*govshk(-1)+eps_gov;


end;
///////////////////////////////////////////////////////

//exogenous evolution of g(t) and v(t)
//rho_g1 = 0;
//rho_g2 = .1;
//rho_v2 = .1;
//rho_c2 = rho_v2;
//shrgy = 0.2;



//if chi=2.5 and sigma =1, then this value gives a duration of the liquidity
//trap of 8 quarters for xip=0.8


// Assign analytical steady state values as initial values
initval;
xV=0;
piV=0;      
iV=0	;       
ypotV=0;
rpotV=0;
debtg=0;
lumptax=0;
yV=0;
conshk=0;
govshk=0;
end;


// calculate analytical steady state values of endog. variables
steady ;

// Check stability conditions 
check;


// // government spending shock
// shocks;
// var eps_gov;
// periods 1:1;
// values (1/shrgy);
// end;
// ///eps_gov_0= 1/shrgy = 1/0.2 = 5
//
// //xip=1 (set above)
// //standard deviations of shocks


shocks;
var eps_con;
periods 1:1;
values(sig_con); 
end;
//stochastic simulation
simul(periods=40); 
//save irfs 
irfs_xip1 = oo_.endo_simul;


//Set different value for xip and run the model again
sig_con = 50000;
//standard deviations of shocks
shocks;
var eps_con;
periods 1:1;
values(sig_con); 
end;
//stochastic simulation
simul(periods=40); 
//save irfs 
irfs_xip2 = oo_.endo_simul;



//Plotting the IRFS for xip=1 and xip=0.8 in the same plot
figure;
//looping over all variables
for jj=1:1:11
subplot(6,2,jj);
plot(1:40, irfs_xip1(jj,1:40), 'k');hold on; 
plot(1:40, irfs_xip2(jj, 1:40), 'r--');
title(M_.endo_names(jj,:)); //Use variable names stored in M_.endo_names
legend('sig.con1', 'sig.con2'); //add legend
end

// figure;
// for ii=1:1:11
// 	subplot(6,2,ii)
// 	plot(1:20, oo_.endo_simul(ii,1:20));
// title(M_.endo_names(ii));
// end

// //plot variables
// figure;
// subplot(2,2,1)
// plot(govshk(1:20));
// title('govshk');
