
library(quantmod)
library(xts)
library(PerformanceAnalytics)
library(pdfetch)

KLBF = "KLBF.JK"
mydata = pdfetch::pdfetch_YAHOO(KLBF,
                                from = as.Date("2014-01-01"),
                                to = as.Date("2021-12-31"))
mydata = as.data.frame(mydata)
mydata

?gets
getSymbols("KLBF.JK", from = "2014-01-01", to = "2021-12-31", src = "yahoo")
KLBF.JK
View(KLBF.JK)
chartSeries(KLBF.JK)




