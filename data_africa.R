rm(list = ls())

#instal and call packages
library(Amelia) #packages missing data
library(Zelig) #packages missing data
library(pander) #rendering output
library(visreg) #visualisasi
library(lmtest) #regresi model
library(sjmisc) #transformation data
library(datasets)
library(VIM) #visualisasi and imputation data
library(missMDA) #multivariate data analysis
library(naniar) #summary missing data

#load data
data("africa", package = "Amelia")
View(africa)
str(africa)

dim(na.omit(africa))
gg_miss_var(africa)
dinar = summary(aggr(africa, sortVar = TRUE))$combinations
matrixplot(africa, sortby = 2)

pct_miss(africa) #percentage of missing value
n_miss(africa) #count of missing data
n_complete(africa)

#listwise method
summary(lm(gdp_pc~infl+trade+civlib+population, data = africa, na.action = na.omit))

vis_miss(africa, sort_miss = TRUE)





