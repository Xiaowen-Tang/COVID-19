//set Panel stata
xtset ID Year
//generate new variables
gen DailyVaccination = ln(Administered_Daily+1)
gen NC = log10(Daily new cases+1)
gen ND = log10(Daily new deaths+1)
gen SLPh= SLP/100
gen STPh= STP/100
//generate lag variables
gen l1TEMPC = l1.TEMPC
gen l2TEMPC = l2.TEMPC
gen l3TEMPC = l3.TEMPC
gen l4TEMPC = l4.TEMPC
gen l5TEMPC = l5.TEMPC
gen l6TEMPC = l6.TEMPC
gen l7TEMPC = l7.TEMPC
gen l8TEMPC = l8.TEMPC
gen l9TEMPC = l9.TEMPC
gen l10TEMPC = l10.TEMPC
gen l11TEMPC = l11.TEMPC
gen l12TEMPC = l12.TEMPC
gen l13TEMPC = l13.TEMPC
gen l14TEMPC = l14.TEMPC
gen l1TEMPDEWPC = l1.TEMPDEWPC
gen l2TEMPDEWPC = l2.TEMPDEWPC
gen l3TEMPDEWPC = l3.TEMPDEWPC
gen l4TEMPDEWPC = l4.TEMPDEWPC
gen l5TEMPDEWPC = l5.TEMPDEWPC
gen l6TEMPDEWPC = l6.TEMPDEWPC
gen l7TEMPDEWPC = l7.TEMPDEWPC
gen l8TEMPDEWPC = l8.TEMPDEWPC
gen l9TEMPDEWPC = l9.TEMPDEWPC
gen l10TEMPDEWPC = l10.TEMPDEWPC
gen l11TEMPDEWPC = l11.TEMPDEWPC
gen l12TEMPDEWPC = l12.TEMPDEWPC
gen l13TEMPDEWPC = l13.TEMPDEWPC
gen l14TEMPDEWPC = l14.TEMPDEWPC
gen lag02TEMPC = (TEMPC+l1TEMPC+l2TEMPC)/3
gen lag35TEMPC = (l3TEMPC+l4TEMPC+l5TEMPC)/3
gen lag68TEMPC = (l6TEMPC+l7TEMPC+l8TEMPC)/3
gen lag911TEMPC = (l9TEMPC+l10TEMPC+l11TEMPC)/3
gen lag1214TEMPC = (l12TEMPC+l13TEMPC+l14TEMPC)/3
gen lag02TEMPDEWPC = (TEMPDEWPC+l1TEMPDEWPC+l2TEMPDEWPC)/3
gen lag35TEMPDEWPC = (l3TEMPDEWPC+l4TEMPDEWPC+l5TEMPDEWPC)/3
gen lag68TEMPDEWPC = (l6TEMPDEWPC+l7TEMPDEWPC+l8TEMPDEWPC)/3
gen lag911TEMPDEWPC = (l9TEMPDEWPC+l10TEMPDEWPC+l11TEMPDEWPC)/3
gen lag1214TEMPDEWPC = (l12TEMPDEWPC+l13TEMPDEWPC+l14TEMPDEWPC)/3
//Table S1-Pearson Correlation coefficients of daily new cases and deaths, vaccination and meteorological factors
pwcorr_a NC ND DailyVaccination TEMPC MAXC MINC DEWPC TEMPDEWPC WDSPms MXSPDms GUSTms SLPh STPh VISIB PRCPmm, star1(0.01) star5(0.05) star10(0.1)
//Table S2-Variance inflation factors of collinearity diagnose before univariate selection-the independent variables is 'daily new cases'
reg NC l14.DailyVaccination TEMPC MAXC MINC DEWPC TEMPDEWPC WDSPms MXSPDms GUSTms SLPh STPh VISIB PRCPmm
estat vif
//Table S2-Variance inflation factors of collinearity diagnose before univariate selection-the independent variables is 'daily new deaths'
reg ND l14.DailyVaccination TEMPC MAXC MINC DEWPC TEMPDEWPC WDSPms MXSPDms GUSTms SLPh STPh VISIB PRCPmm
estat vif
//Table S3(b)-Univariate selections of meteorological factors by using LSDV models-the independent variables is 'daily new cases'
****group 1 -temperature related 
reg NC TEMPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg NC MAXC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg NC MINC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg NC DEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
****group 2 -wind related 
reg NC WDSPms i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg NC MXSPDms i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg NC GUSTms i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
//Table S3(b)-Univariate selections of meteorological factors by using LSDV models-the independent variables is 'daily new cases'
****group 1 -temperature related 
reg ND TEMPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg ND MAXC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg ND MINC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg ND DEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
****group 2 -wind related 
reg ND WDSPms i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg ND MXSPDms i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
reg ND GUSTms i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
//Table S4-Variance inflation factors of collinearity diagnose after univariate selection-the independent variables is 'daily new cases'
reg NC l14.DailyVaccination TEMPC TEMPDEWPC WDSPms SLPh STPh VISIB PRCPmm
estat vif
//Table S4-Variance inflation factors of collinearity diagnose after univariate selection-the independent variables is 'daily new cases'
reg ND l14.DailyVaccination TEMPC TEMPDEWPC WDSPms SLPh STPh VISIB PRCPmm
estat vif
//Table S5-Effects of meteorological factors and vaccination variables on 'daily new cases' and 'daily new deaths'
reg NC TEMPC TEMPDEWPC l14.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
reg ND TEMPC TEMPDEWPC l14.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
//Table S8-Estimates of the 0-2 day lag, 3-5 day lag, 6-8 day lag, 9-11 day lag,1 2-14 day lag meteorological factors on 'daily new cases'
*****Set vaccination as the control variable
reg NC l14.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 0-2
reg NC l14.DailyVaccination lag02TEMPC lag02TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 3-5
reg NC l14.DailyVaccination lag35TEMPC lag35TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 6-8
reg NC l14.DailyVaccination lag68TEMPC lag68TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 9-11
reg NC l14.DailyVaccination lag911TEMPC lag911TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 12-14
reg NC l14.DailyVaccination lag1214TEMPC lag1214TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 0-14
reg NC l14.DailyVaccination lag02TEMPC-lag1214TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
//Table S8-Estimates of the 0-2 day lag, 3-5 day lag, 6-8 day lag, 9-11 day lag,1 2-14 day lag meteorological factors on 'daily new deaths'
*****Set vaccination as the control variable
reg ND l14.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 0-2 
reg ND l14.DailyVaccination lag02TEMPC lag02TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 3-5
reg ND l14.DailyVaccination lag35TEMPC lag35TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 6-8
reg ND l14.DailyVaccination lag68TEMPC lag68TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 9-11
reg ND l14.DailyVaccination lag911TEMPC lag911TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 12-14
reg ND l14.DailyVaccination lag1214TEMPC lag1214TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
*****lag day : 0-14
reg ND l14.DailyVaccination lag02TEMPC-lag1214TEMPDEWPC i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
//Table S9-Estimates of the 7-lag, 14-lag, 21-lag vaccination on 'daily new cases' by using LSDV model.
**lag day : 21
reg NC l21.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
**lag day : 14
reg NC l14.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
**lag day : 7
reg NC l7.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
//Table S9-Estimates of the 7-lag, 14-lag, 21-lag vaccination on 'daily new deaths' by using LSDV model.
**lag day : 21
reg ND l21.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
**lag day : 14
reg ND l14.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)
**lag day : 7
reg ND l7.DailyVaccination i.IDN Day,vce (cluster IDN)
estimates store OLS
esttab OLS,r2 se mtitles star(* 0.1 ** 0.05 *** 0.01)




