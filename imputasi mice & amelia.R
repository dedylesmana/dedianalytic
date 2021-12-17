
library(mice) #Imputation missing data
library(VIM) #visualization imputation
library(Amelia) #imputation missing data
library(naniar) #summary missing data
library(lattice) #plotting
library(ggplot2) #plotting 
library(datasets) #dataset

#load data df_melbourneourne housing
mydata = read.csv(file.choose(), header = T)
View(mydata)
str(mydata)
summary(mydata)
md.pattern(mydata)
md.pairs(mydata)
mice_plot <- aggr(mydata, col=c('blue','red'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(mydata), cex.axis=.5,
                  gap=3, ylab=c("Missing data","Pattern"))
sort(sapply(mydata, function(x) { sum(is.na(x)) }), decreasing=TRUE)
missmap(mydata)

#impute botstrap
??aregImpute
df_melbourne = data.frame(mydata)
head(df_melbourne, 2)
data1 = sum(!complete.cases(mydata))
print(paste0("missing values before imputation:", data1))
library(Hmisc)
impute_arg = aregImpute (~Rooms + Price + Bedroom2 + Bathroom + Car + Landsize +
        BuildingArea + YearBuilt + Lattitude + Longtitude, data = df_melbourne,
        n.impute = 5, nk=0, tlinear = F, B = 75)
impute_arg
imputed = impute.transcan(impute_arg, data = df_melbourne, imputation = 1, 
        list.out = TRUE, pr = FALSE, check = FALSE)
melbou = as.data.frame(do.call(cbind,imputed))
mhp_1=cbind.data.frame(df_melbourne$Suburb,melbou$Rooms,
      melbou$Price, melbou$Bedroom2, melbou$Bathroom,melbou$Car,melbou$Landsize,
      melbou$BuildingArea,melbou$YearBuilt,melbou$Lattitude, melbou$Longtitude, 
      df_melbourne$Regionname)
colnames(mhp_1) = c ("Suburb", "Rooms", "Price", "Bedroom2","Bathroom", "Car",
                     "Landsize", "BuildingArea", "YearBuilt", "Lattitude", 
                     "Longtitude", "Regionname")
View(mhp_1)
sui2 = sum (!complete.cases(mhp_1))
print(paste0("Data Missing Setelah Imputasi: ", sui2))
kor.dataku = as.data.frame(mhp_1[,c(2,3,4,5,6,7,8,9,10,11)])
str(kor.dataku)
library(corrplot)
?corrplot
corrplot(cor(as.matrix(kor.dataku)), method = "circle", type ="full", color = 
        "blue", title = "Korelasi Matrik Housing")

