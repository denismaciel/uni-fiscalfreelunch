// Erceg and Lind�(2014): Is there a fiscal free lunch in a liquidity trap?
// Denis Maciel and Tobias M�ller
// Standard log-linarized version of the New Keynesian model with zero lower bound

// Compute responses analytically for small NK model
// Monetary policy follow Taylor rule after exit
// Makes restrictive assumption that govt spending and taste shocks are AR1



// List endogenous variables
var
xV piV iV ypotV rpotV debtg conshk govshk lumptax yV rV;


// List exogenous shock(s)
varexo
eps_con eps_gov;


// List structural parameters and assign values
parameters
beta alpha sigma chi shrgy nuc xip rho
gam_xgap gam_pi phi_tax thetap sigma_hat phi_mc kappap rbar taxsub sig_con sig_gov pibar ibar;



///////////////////////////////////////////////////7
// Initialize Parameters

beta    =  0.995  ;        // discount factor
alpha   =  0.3    ;        // capital share, so (1-alpha) = labor share
sigma   =  1      ;        // intertemporal elasticity of substitution in consumption
chi     =  2.5    ;        // inverse of Frisch elasticity of labor supply

shrgy   =  0.2    ;        // government share of steady-state output
nuc     =  0.01   ;        // scale parameter on the consumption taste shock

xip     =  0.8   ;        // Calvo price parameter - stickiness and contract duration: 5 quarter duration
//xip  =   1      ;        // No inflation responses
//xip  =   0.8    ;        // 5 quarter mean duration of price contracts
//xip  =   0.75   ;        // 4 quarter mean duration of price contracts
//xip  =   0.667  ;        // 3 quarter mean duration of price contracts
//xip  =   0      ;        // flexible prices

gam_xgap=  1000   ;        // coefficient on output gap: Taylor rule feedback on output gap (Werte aus anderem Model Jesper 1000/ standard value 0.2)
gam_pi  =  1000   ;        // coefficient on inflation: Taylor rule feedback on expected inflation (Werte aus anderem Model Jesper 1000/standard value 1.5)

rho     =  0.1    ;        // AR(1) natural rate (preference and government shock)

phi_tax =  0.01   ;        // tax rule parameter

thetap  =  0.7    ;        // steady-state labor share - (1-alpha) capital share

sig_con =  30    ;        // Std of consumption taste shock
sig_gov =  0.01      ;        // Std of government spending shock


rbar = (1/beta) -1  ;      // steady state real interest rate

//maxoperator ZLB
pibar = 1.005;
ibar = (pibar/beta) - 1;    //nominal nominal interest rate - duration of the liquidity trap depends solely on how lon rpotV remains below -ibar

//sigma_hat
sigma_hat = sigma*(1-shrgy)*(1-nuc);            // sensitivity of the output gap to the real interest rate

//phi_mc
phi_mc= (chi/(1-alpha) + 1/sigma_hat) + (alpha/(1-alpha));

//phi_mc = lam_mrs+lam_mpl;
//lam_mrs = chi/(1-alpha) + 1/sigma_hat;        // slope of MRS schedule (how supply real wage varies with output -
                                                // Fish elasticity of labor supply - interest sensitivity of aggregate demand
//lam_mpl = alpha/(1-alpha);                    // slope of MPL schedule (how demand real wage varies with output in abs value)
                                                // labor share of production

//kappap
kappap = ((1-xip)*(1-beta*xip)/xip)*phi_mc;  // Calvo-Yun contract structure - set kappap close to zero to keep inflation konstant

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
rpotV= 1/sigma_hat * (1 - 1/(phi_mc*sigma_hat)) * ( shrgy*(govshk-govshk(+1)) + (1-shrgy)*nuc*(conshk-conshk(+1)) );


//government budget constraint
debtg=(1+rbar)*debtg(-1)+shrgy*govshk-taxsub*thetap*(yV+phi_mc*xV)-lumptax;


//lump-sum tax (adjusts according to the reaction function)
lumptax= phi_tax*debtg(-1);


//output yV
yV=xV+ypotV;

// real interest rate rV
rV=iV-piV(+1);


// shock processes
conshk= (1-rho)*conshk(-1)+eps_con;
govshk= (1-rho)*govshk(-1)+eps_gov;


end;
///////////////////////////////////////////////////////


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


@#include "Figure1.mod"

//@#include  "Figure2.mod"

//@#include "Figure3.mod"

//@#include "govmultiplier.mod"
