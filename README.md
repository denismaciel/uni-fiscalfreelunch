## Erceg and Linde(2014): Is there a fiscal free lunch in a liquidity trap?
### Denis Maciel and Tobias Mueller -   August 22, 2016



````
The document provides a short explanation on how to run the Dynare Code to replicate the results of Erceg and Linde (2014). The code was run with Dynare 4.03 and MATLAB_R2015b for Mac.
````


It is important to unzip Zip file and save the all the six Mod-Files into the same directory. The model is written in the "nk_baby_model.mod" file.

#### To get Figure 1 a) of the original paper:
1.  Turn on the Calvo Parameter xip = 0.8
2.  Turn on Taylor rule coefficient on output gap gam_xgap=  66.15
3.  Comment line 158 of the code: “@#include "Figure1a.mod" in
4.  Run the command dynare nk_baby_model.mod in Matlab

#### To get Figure 1 b) of the original paper:
1.  Turn on the Calvo Parameter xip = 0.8
2.  Turn on Taylor rule coefficient on output gap gam_xgap=  66.15
3.  Comment line 160 of the code: “@#include "Figure1b.mod" in
4.  Run the command dynare nk_baby_model.mod in Matlab

#### To get Figure 1 b) “Scatter plot”:
1.  Turn on the Calvo Parameter xip = 0.8
2.  Turn on Taylor rule coefficient on output gap gam_xgap=  66.15
3.  Change line 50 of the file “Figure1b.mod” from  plot(..) to scatter(..)
4.  Comment line 160 of the code: “@#include "Figure1b.mod" in
5.  Run the command dynare nk_baby_model.mod in Matlab

#### To get Figure 2) “No Inflation Response” of the original paper:
1.  Turn on the Calvo Parameter xip = 1
2.  Turn on Taylor rule coefficient on output gap gam_xgap=  15
3.  Comment line 162 of the code: “@#include "Figure2.mod" in
4.  Run the command dynare nk_baby_model.mod in Matlab

#### To get Figure 2) “5 Quarter Price Contracts” of the original paper:
1.  Turn on the Calvo Parameter xip = 0.8
2.  Turn on Taylor rule coefficient on output gap gam_xgap=  66.15
3.  Comment line 73-75 and 90-92 of the file “Figure2.mod” in to get the correct y-axis values
4.  Change headline in line 79 of the “Figure2.mod” file from “No Inflation Response” to  “5 Quarter Price Contracts”
5.  Comment line 162 of the code: “@#include "Figure2.mod" in
6.  Run the command dynare nk_baby_model.mod in Matlab


#### To get Figure 3) “Spending multipliers and government debt responses in a simple New Keynesian model” of the original paper:
1.  Turn on Taylor rule coefficient on output gap gam_xgap=  66.15
2.  Comment line 162 of the code: “@#include "Figure3.mod" in
3.  You need to run the model four times. Each time with a different value for xip (the Calvo parameter):
  - xip = 1
  - xip = 0.9
  - xip = 0.8
  - xip = 0.75
4.  Run the command dynare nk_baby_model.mod in Matlab one time for each value of xip.
5.  After simulating the model four time, copy and paste the whole content of the file “Figure 3 Plotting” into Matlab console and press enter.
