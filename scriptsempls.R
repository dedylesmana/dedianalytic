
#SEMPLS

rm(list = ls())

library(plspm)

mydata = read.csv(file.choose(), header = T)
View(mydata)
str(mydata)
dim(mydata)
summary(mydata[, 1:20])

#Penentuan variabel
#X1 = Budaya Organisasi
#X2 = Motivasi Kerja
#X3 = Kompensasi
#Y1 = Kepuasan Kerja
#Y2 = Kinerja Karyawan

#questions of indicators
X1.1 = "inovasi dan pengambilan resiko"
X1.2 = "perhatian hal detail"
X1.3 = "orientasi hasil"
X1.4 = "orientasi manusia"
X1.5 = "orientasi tim"
X1.6 = "agresivitas"
X1.7 = "stabilitas"

X2.1 = "kebutuhan akan pencapaian"
X2.2 = "kebutuhan akan kekuasaan"
X2.3 = "kebutuhan akan afiliasi"

X3.1 = "kompensasi langsung"
X3.2 = "kompensasi tidak langsung"

Y1.1 = "gaji"
Y1.2 = "pekerjaan itu sendiri"
Y1.3 = "rekan kerja"
Y1.4 = "promosi"
Y1.5 = "supervisi (pengawasan)"

Y2.1 = "kualitas"
Y2.2 = "kuantitas"
Y2.3 = "ketepatan waktu"

#put questions
budaya = c(X1.1, X1.2, X1.3, X1.4, X1.5, X1.6, X1.7)
motivasi = c(X2.1, X2.2, X2.3)
kompensasi = c(X3.1, X3.2)
kepuasan = c(Y1.1, Y1.2, Y1.3, Y1.4, Y1.5)
kinerja = c(Y2.1, Y2.2, Y2.3)

#correlation of indicators
cor(mydata[, 1:5])
cor(budaya[, 1:7])
budaya = as.data.frame(mydata)
cor(budaya[, 1:7])
cor(motivasi[, 1:3])
motivasi = as.data.frame(mydata)
cor(motivasi[, 1:3])
kompensasi = as.data.frame(mydata)
cor(kompensasi[, 1:2])
kepuasan = as.data.frame(mydata)
cor(kepuasan[, 1:5])
kinerja = as.data.frame(mydata)
cor(kinerja[, 1:3])

#create model
budaya = c(0,0,0,0,0)
motivasi = c(0,0,0,0,0)
kompensasi = c(0,0,0,0)
kepuasan = c(1,1,1,0,0)
kinerja = c(1,1,1,1,0)

mydata2 = rbind(budaya, motivasi, kompensasi, kepuasan, kinerja)
colnames(mydata2) = rownames(mydata2)
innerplot(mydata2, box.size = 0.1, box.col = "brown", txt.col = "black")
?innerplot

#outer model
mydata3 = list(1:7, 8:10, 11:12, 13:17, 18:20)
mydata4 = rep("A", 5)
mydata_pls = plspm(mydata, mydata2, mydata3, modes = mydata4)
mydata_pls

#check undimensional
mydata_pls$unidim
mydata_pls$crossloadings
mydata_pls$inner_model
mydata_pls$path_coefs
mydata_pls$gof
mydata_pls$effect
summary(mydata_pls)


