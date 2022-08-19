library(mgcv)
#Table S3(a)-Univariate selections of meteorological factors by using GAMM models--the independent variable is "daily new cases"
##group 1 -temperature related
fit <- gamm(NC~s(TEMPC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(MAXC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(MINC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(DEWPC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
##group 2 -wind related
fit <- gamm(NC~s(WDSPms,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(MXSPDms,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(GUSTms,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
#Table S3(a)-Univariate selections of meteorological factors by using GAMM models--the independent variable is "daily new deaths"
##group 1 -temperature related
fit <- gamm(ND~s(TEMPC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(MAXC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(MINC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(DEWPC,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
##group 2 -wind related
fit <- gamm(ND~s(WDSPms,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(MXSPDms,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(GUSTms,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
##Table S3-Effects of meteorological factors and vaccination variables on 'daily new cases' by using GAMM models
fit <- gamm(NC~TEMPC
             +TEMPDEWPC
            +s(WDSPms,bs="ts")
            +s(SLPh,bs="ts")
            +s(STPh,bs="ts")
            +s(VISIB,bs="ts")
            +s(PRCPmm,bs="ts")
            +l14DailyVaccination,data=OM2,family=gaussian)
summary(fit$gam)
##WDSPms, SLPh were eliminated because of the close-to-0 edfs, VISIB was eliminated because of no-close-to-0 p-value.
fit <- gamm(NC~TEMPC
            +TEMPDEWPC
            +s(STPh,bs="ts")
            +s(PRCPmm,bs="ts")
            +l14DailyVaccination,data=OM2,family=gaussian)
summary(fit$gam)
##Table S3-Effects of meteorological factors and vaccination variables on 'daily new deaths' by using GAMM models
fit <- gamm(ND~TEMPC
            +TEMPDEWPC
            +s(WDSPms,bs="ts")
            +s(SLPh,bs="ts")
            +s(STPh,bs="ts")
            +s(VISIB,bs="ts")
            +s(PRCPmm,bs="ts")
            +l14DailyVaccination,data=OM2,family=gaussian)
summary(fit$gam)
##WDSPms, SLPh, VISIB were eliminated because of the close-to-0 edfs, PRCP was eliminated because of no-close-to-0 p-value.
fit <- gamm(ND~TEMPC
            +TEMPDEWPC
            +s(STPh,bs="ts")
            +l14DailyVaccination,data=OM2,family=gaussian)
summary(fit$gam)
##Table S9-Estimates of the 7-lag, 14-lag, 21-lag vaccination on 'daily new cases' by using GAMM model
fit <- gamm(NC~s(l7DailyVaccination,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(l14DailyVaccination,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(NC~s(l21DailyVaccination,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
##Table S9-Estimates of the 7-lag, 14-lag, 21-lag vaccination on 'daily new deaths' by using GAMM model
fit <- gamm(ND~s(l7DailyVaccination,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(l14DailyVaccination,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
fit <- gamm(ND~s(l21DailyVaccination,bs="tp"),data=OM2,family=gaussian)
plot(fit$gam)
summary(fit$gam)
