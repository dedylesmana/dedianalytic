

## Struktur Data
## Vektor
nama = c ("Maeda", "Midori", "Aori")
nama
class(nama)

berat = c (55, 65, 75)
berat
class(berat)
berat2 = c ("55", "65")
berat2
class(berat2)

X = seq(2:18)
X
return = seq(from=1, to=10)
return
rep(2:4, 5)
rep(seq(2, 8, by=2), 2)
rep(1:2, each=3)
paste("B", 1:6, sep="")
paste0("B",rep(1:2, each=3))

## Factor
tingkatpendidikan = c("SD", "SMP", "SMA", "S1", "S2", "S3")
tingkatpendidikan

## Matrix
matrix(1:8, 2, 4)
matrix(1:8, ncol = 2)
cbind(1:4, 5:12)
rbind(1:4, 5:12)
matrix(1:15, 3, 5, byrow = TRUE)
matrix(1:8, 2, 4, byrow = TRUE)

## List
daftar = list("maeda", "aoi", c (2, 4, 8), TRUE, FALSE, 2.5)
daftar
daftar2 = list(2, 10L, TRUE, "Seribu", 20+2i)
daftar2
perguruantinggi = list(university = "ABC", Kota = "XYZ")
perguruantinggi
fakultas = list(prodi="Manajemen", Akreditasi = "B", jumlah_mahasiswa = 100)
fakultas
perguruantinggi$university
fakultas$jumlah_mahasiswa
length(perguruantinggi)

## Data Frame
nilai_mahasiswa = data.frame(names = c("Maeda", "Midori", "Aori"), gender = c(
                              "Laki-Laki", "Perempuan",  "Perempuan"), values =
                               c(80, 82, 85))
nilai_mahasiswa
View(nilai_mahasiswa)
nilai_mahasiswa[1:2,]
nilai_mahasiswa2 = data.frame(names = c("Maeda", "Midori", "Aori"), gender = c(
  "Laki-Laki", "Perempuan",  "Perempuan"), height = c(160, 170, 177), education
  = c("S1", "S2", "S3"))
nilai_mahasiswa2
class(nilai_mahasiswa2)
str(nilai_mahasiswa2)

##array
array1 = c (1:20)
array1
array2 = array(array1, dim = c(2, 4, 2))
array2
length(array2)
2 %in% array2


  
  
  
  
  
