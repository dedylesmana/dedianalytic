
library(plm)

data ("Gasoline", package = "plm")
View(data)

gasoline.ce = plm(lgaspcar~lincomep+lrpmg+lcarpcap, data = Gasoline, model = 
                    "pooling")
gasoline.ce
summary(gasoline.ce)

berganda.lm = lm (lgaspcar~lincomep+lrpmg+lcarpcap, data = Gasoline)
summary(berganda.lm)

gasoline.fe = plm(lgaspcar~lincomep+lrpmg+lcarpcap, data = Gasoline, model = 
                    "within")
fixef(gasoline.fe)
summary(gasoline.fe)

gasoline.re = plm(lgaspcar~lincomep+lrpmg+lcarpcap, data = Gasoline, model = 
                    "random")
ranef(gasoline.re)
summary(gasoline.re)

#chow test
pFtest(gasoline.fe, gasoline.ce)

#hasuman test
phtest(gasoline.re, gasoline.fe)

#Lm test or Breusch pagan
plmtest(gasoline.ce)

plmtest(gasoline.re, effect = "time", type = "bp")
plmtest(gasoline.re, effect = "individual", type = "bp")

plmtest(gasoline.re, effect = "twoway", type = "bp")

