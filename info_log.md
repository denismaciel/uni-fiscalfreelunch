**Curren version**: nkm_neu_tobias
__ 


## Consultation Session
2. How to calculate the fiscal multiplier? 
3. Why do we have ackward values for new steady state? Why do we need such a huge shock to make the IFRS move? DONE
1. How to implement flex price scenario? xip = 0
1. Why doesn't Flora's code work with our model? FUCK OFF
4. Taylor rule parameters OK 

- calculate and plot "dynamic" multiplier 

overview
what we have done


## To-do's

- Überprüfen der Gleichungen und Standardwerte OK

- Include equation for spending multiplier
- Find out the 8-quarter liquidity trap values (shock value)

- Grafiken erstellen für unterschiedliche Werte für xip, conshk, govshk, gamm    //Tipp: Codes von Jesper anschauen, dort Figure 1,2 & 3

- Anpassen von kappap um Wert xip=0 zuzulassen  (multiply with xip)

- Logliniarizieren von Model


### How to get the code a plot with two values of xip

1. Run the dynare file and in the end save the results by pasting the following code into MATLAB:

```js 
oo_1 = oo_

save simul1 oo_1
```

2. Change the value of the variable in the source code, save and run it again. Then, paste the following into MATLAB

```
load simul1

%%Plotting the IRFS for xip=1 and xip=0.8 in the same plot
figure;

for jj=1:1:11
subplot(6,2,jj);
plot(1:40, oo_1.endo_simul(jj,1:40), 'k');hold on;
plot(1:40, oo_.endo_simul(jj, 1:40), 'r--');
title(M_.endo_names(jj,:)); 
legend('xip = 1', 'xip = 0.8');
end
```


## Value Setting

``` js
gam_xgap [0.2 - 1000]
gam_pi  [1.5 - 1000]

xip [ 0, 0.8, 1]

sig_con  			//  arbitrarly high

sig_gov = 1/shrgy  // different value
```

## Log 

### nkm_govmultiplier.mod
Created this file to simulate different government responses

- Set sig_con to 15 to get a ten-period liquidity trap
- We simulate the model four times with four different values for government shock
- What we can check with this model?
	- That when the duration of the liquidity trap is shorter, the multiplier is smaller and vice-versa.
	- That multiplier is constant as long we increase spending but DO NOT shorten the liquidity trap duration
- To check the first result:
	- set the values of shock in such a way that the LT of the first and second simulations have the same duration and that the third and fouth have equal duration but shorter than the first and second.
	- compare `mul1` and `mul2` and see that  the simulations with shorter duration of the liquidity trap display a smaller multiplier,
-  To check the second result:
	- set the values of shock in such a way that the first, second and third simulations have the same duration.
	- compare `mul1` and `mul15` and see that they have the same value.  

- My suggestion of value
```js 
//First Result
0.00
0.03
0.2
0.22


//Second Result: within the LT multplier is constant
0.00
0.03
0.035

//Fourth value does not play a role for this result

```

Denis:
### 2016-06-24
Problem: Different values of xip is not affecting the simulation
Did not work:

1. Changed the parameters of Taylor Rule to "normal" (0.2 and 1.5). Why: Maybe the inflation was not responding because CB was too aggressive.

2. Maybe the code of the second simulation was not work. But it is. I tested changing the value of sig_con and and it had clear effects on the simulation.

Worked: If you change the values of xip from 1 to 0.2 in the beginning of the code, inflation varies. The problem seems to be with the two simulations inside the same code. 

In fact, the problem is with second simulation within the code. I simulated the model with two different values of alpha and it had no effects on the results. It seems that you can only change the __size__ of the shock for the double simulation to work. 


It works only with sig_con because the only code that is rerun in the double simulation is the following:


``` js
//Set different value for xip and run the model again
sig_con=1000;
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
```




