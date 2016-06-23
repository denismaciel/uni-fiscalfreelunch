// example 1 from Collard's guide to Dynare
var y, c, k, a, h, b;
varexo e,u;

parameters beta, rho, beta, alpha, delta, theta, psi, tau;

alpha = 0.36;
rho   = 0.95;
tau   = 0.025;
beta  = 0.99;
delta = 0.025;
psi   = 0;
theta = 2.95;

phi   = 0.1;

model;
c*theta*h^(1+psi)=(1-alpha)*y;
k = beta*(((exp(b)*c)/(exp(b(+1))*c(+1)))
    *(exp(b(+1))*alpha*y(+1)+(1-delta)*k));
y = exp(a)*(k(-1)^alpha)*(h^(1-alpha));
k = exp(b)*(y-c)+(1-delta)*k(-1);
a = rho*a(-1)+tau*b(-1) + e;
b = tau*a(-1)+rho*b(-1) + u;
end;

initval;
y = 1.08068253095672;
c = 0.80359242014163;
h = 0.29175631001732;
k = 5;
a = 0;
b = 0;
e = 0;
u = 0;
end;

shocks;
var e; stderr 0.009;
var u; stderr 0.009;
var e, u = phi*0.009*0.009;
end;

// computing IRFs for 3 values of psi:
psi_values = [0 0.5 1];
// storing number of cases in n
n = length(psi_values);
// making multidimensional space to store the IRFs
// dim 1: period;        dim 2: endogenous var
// dim 3: exogenous var; dim 4: parameter value index
z = zeros(40,endo_nbr,exo_nbr,n);

for i=1:n;
    psi = psi_values(i);
//  linear approximation, no graph or results are displayed
    stoch_simul(order=1,nograph,noprint);
    for j=1:exo_nbr;
      for k=1:endo_nbr;
        z(:,k,j,i) = evalin('base',[deblank(lgy_(k,:)) '_' deblank(lgx_(j,:))]);
      end;
    end;	 
end;

// using Matlab graph commands to plot 
// the three IRFs on the same plot
for j=1:exo_nbr;
  exo_varname = deblank(lgx_(j,:));
  figure('name',['Shock to ' exo_varname]);
  for k=1:endo_nbr;
    subplot(2,3,k);
    plot(squeeze(z(:,k,j,:)));
    legend(num2str(psi_values'));
    title(deblank(lgy_(k,:)));
  end;
end; 

// printing the results for the last case
stoch_simul(order=1,print,graph);