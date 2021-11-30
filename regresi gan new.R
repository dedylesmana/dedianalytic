rm(list=ls())

#install and call packages
library(readr)
library(lmtest)
library(nortest)
library(car)
library(MASS)
library(ggplot2)
library(GGally)

#Input data
dataku = read.delim('clipboard')
View(dataku)
dataku = dataku[c(2,3,4,5,6)]
dataku = dataku [, -1] #menghilangkan kolom ke -1
View(dataku)
dataku = dataku[c(2,3,4,5,6)]
colnames(dataku) = c("MarketTiming_Un", "StockSelection_Un", "MarketTiming_Con",
                     "StockSelection_Con", "Sharpe_Ratio")
View(dataku)
str(dataku)
dim(dataku)

modelreg = lm(Sharpe_Ratio~MarketTiming_Un+StockSelection_Un+MarketTiming_Con+
            StockSelection_Con, data = dataku)
options(scipen = 999)
options(scipen = 0, digit =4)
summary(modelreg)
cor(dataku)

library(PerformanceAnalytics)
dataku = dataku [, c(1,2,3,4,5)]
chart.Correlation (dataku, histogram = TRUE, pch = 19)

residual = modelreg$residuals
boxplot(residual)
hist(x=residual, freq = FALSE, col = "yellow")
lines(x=density(x=residual), col = "blue")

#Asumpstion test
#Normality test
shapiro.test(residual)
qqnorm(residual)

#Multicolinierity Test
#Vif (Variance Inflation Factor) > 10,00 dan Tolerance < 0,10
library(olsrr)
ols_vif_tol(modelreg)

#Multikol dengan PCA 
#cek KMO
library(psych)
KMO (dataku)
library(factoextra)
library(dplyr)
pca1 = prcomp(dataku, scale = TRUE)
pca1
fviz_eig(pca1) # View Scree Plot
get_eigenvalue(pca1)
#PC1 = 0,590X1 - 0,121X2 + 0,585X3 - 0,289X4
psc1 = as.data.frame(pca1$x)
psc2 = psc1%>% select(1:4)
y1 = dataku %>% select(Sharpe_Ratio)
datapca = cbind(y1, psc2)
modelreg2 = lm(Sharpe_Ratio~., data = datapca)
summary(modelreg2)
car::vif(modelreg2)
#model akhir - z(y) = 0,122 + 0,045PC1 - 0,035PC2 + 0,076PC3 - 0,010PC4

#Autocorekation Test
modelreg3 = lm(Sharpe_Ratio~., data = dataku)
summary(modelreg3)
durbinWatsonTest(modelreg3)

#Heteroscedasticity Test
par(mfrow=c(1,2))
plot(modelreg)
rnorm(residual, mean = , sd = )




