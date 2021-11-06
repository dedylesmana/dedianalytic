setwd('D:/My Channel Youtube/R Studio')

#membuat variabel
X = 20
X

X <- 40
X 

#panggil dataset
kinerja <- read.csv('Uji beda paired.csv')
kinerja = read.delim('clipboard')
View(kinerja)
head(kinerja)
names(kinerja)
dim(kinerja)
str(kinerja)

#statistik deskriptif
summary(kinerja)
library('Hmisc')
describe(kinerja)

#Hipotesis
H0 ; tidak terdapat perbedaan
Ha : terdapat perbedaan

kinerja$selish <- kinerja$Sebelum.Covid.19 - kinerja$Selama.Covid.19
View(kinerja)

shapiro.test(kinerja$selish)

t.test(kinerja$Sebelum.Covid.19, kinerja$Selama.Covid.19, paired = TRUE)


