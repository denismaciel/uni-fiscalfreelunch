//Log-Linearized CGG Model
//All variables expressed in percent deviations from steady state
//Technology AR(1) in level

//Mathias Trabandt (mathias.trabandt@gmail.com)




//Endogenous variables
var 
zV piV xV RV rrstarV muzV;

//Exogenous variables
varexo  
eps_z eps_R;

//Parameters
parameters 
beta phi xip rpi rx rhoz sigz sigR;


//Inialization of parameter values
beta  =0.99;  //Discount factor
phi   =0.2;   //Inverse labor supply elasticity
xip   =0.75;  //Calvo parameter price stickiness
rpi   =1.5;   //Taylor rule: feedback on expected inflation
rx    =0.2;   //Taylor rule: feedback on output gap
rhoz  =0.5;   //AR(1) technology
sigz  =1;     //Std of technology (in percent)
sigR  =1;     //Std of monetary policy shock (in percent)
 

//model equations
model(linear);

//Phillips curve
piV=beta*piV(+1)+(1-beta*xip)*(1-xip)/xip*(1+phi)*xV;     
                                 
//IS equation
xV=xV(+1)-(RV-piV(+1)-rrstarV);

//Taylor rule
RV=rpi*piV+rx*xV+eps_R;

//Natural real interest rate
rrstarV=muzV(+1);

//Technology growth
muzV=zV-zV(-1);

//Technology
zV=rhoz*zV(-1)+eps_z;
end;

//steady state values (trivial for log-lin. variables)
initval; 
zV=0; 
piV=0; 
xV=0; 
RV=0; 
rrstarV=0; 
muzV=0;
end;

//calc. and check steady state
steady;

//check eigenvalues
check;

//standard deviations of shocks
shocks;
var eps_z=sigz^2; 
var eps_R=sigR^2; 
end;


//stochastic simulation
stoch_simul(order=1,irf=10); 