# Modul2_Probstat_5025211001

### Nama : Andika Laksana Putra
### NRP  : 5025211001

## 1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴

|Responden|  X  |  Y  |
|---------|-----|-----|
|    1    |  78 |  100|
|    2    |  75 |   95|
|    3    |  67 |   70|
|    4    |  77 |   90|
|    5    |  70 |   90|
|    6    |  72 |   90|
|    7    |  78 |   89|
|    8    |  74 |   90|
|    9    |  77 |  100|

### Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas 

pertama kita masukkan masing-masing nilai kedalam x dan y. lalu mencari standar deviasi memanfaatkan fungsi `sd(val)`, dengan rincian kode sebagai berikut :

```R
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd(x-y)
```
sehingga hasilnya dapat dilihat dibawah ini

![1A](https://user-images.githubusercontent.com/110555492/207238925-cf324d07-dd16-43b0-aa3e-e443fc6910a1.png)

### b. carilah nilai t (p-value) 

untuk mencari nilai p-value dari uji t, maka kita bisa memanfaatkan fungsi `t.test(val_1, val_2, paired)`, yang nantinya akan mengeluarkan 3 nilai yaitu nilai t, df(degree of freedom), dan p-value. dengan rincian kode sebagai berikut

```R
t.test(y, x, paired = TRUE)
```

Sehingga hasilnya dapat dilihat dibawah ini.

![image](https://user-images.githubusercontent.com/110555492/207239956-e2e1a699-f266-4947-a956-d35e40897a45.png)

### c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

diketahui bahwa 𝛼 bernilai 0.05, maka apabila dibandingkan nilai 𝛼 dengan p-value didapatkan fakta bahwa nilai p value lebih kecil dibandingkan 𝛼. Sehingga apabila didapatkan kondisi seperti ini artinya kita **tolak H0** dan dapat diambil kesimpulan bahwa **ada pengaruh signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴**

## 2. (Hipotesa 1 sampel) 
## Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

kita perlu meelakukan install package menggunakan fungsi `install.packages(name)` dan memanggil library "BSDA"

```R
install.packages("BSDA")
library(BSDA)
```

### a. Apakah Anda setuju dengan klaim tersebut?

Setuju, karena cukup memungkinkan klaim tersebut valid

### b. Jelaskan maksud dari output yang dihasilkan! 

dari kasus diatas, bisa kita lihat bahwa kita perlu menggunakan rumus t (Standar Deviasi Populasi tidak diketahui) dengan memanfaatkan fungsi `tsum.test(sample_mean, sample_std, sample_n)`, dengan rincian kode sebagai berikut:

```R
mean_samp = 23500
std_samp = 3900
n_samp = 100

tsum.test(mean_samp, std_samp, n_samp)
```
sehingga hasilnya dapat dilihat sebagai berikut

![2B](https://user-images.githubusercontent.com/110555492/207245613-5bca250a-778e-48b0-bb6d-51d4ba59b9ab.png)

dapat dilihat bahwa didapatkan hasil `t = 60.256`, `df = 99`, dan `p-value < 2.2e-16`. dari data tersebut nantinya kita bisa memanfaatkan p-value untuk mengambil keputusan.

### c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

karena 𝛼 = 0.05 (1 - CI) dan hasil dari p-value perhitungan ketika dibandingkan p-value lebih kecil dari 𝛼, maka dapat dikatakan bahwa **rata-rata mobil yang dikemudikan lebih dari 20.000 km pertahun.**

## 3. (Hipotesa 2 sampel) 
## Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

|Nama Kota/Atribut|  Bandung  |  Bali  |
|-----------------|-----------|--------|
|  Jumlah Saham   |     19    |   27   |
|  Sampel Mean    |    3.64   |   2.79 |
|Sampel Standar Deviasi|  1.67  |   1.32 |

## Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05) ? Buatlah :
### a. H0 dan H1(3)

$H_0$ : μ1 - μ2 = 0 (Tidak ada perbedaan rata-rata saham Bandung dengan Bali) 

$H_1$ : μ1 - μ2 ≠ 0 (Ada perbedaan rata-rata saham Bandung dengan Bali)

### b. Hitung Sampel Statistik(3)

karena dari kasus diatas tidak diketahui Standar Deviasi Populasi keduanya dan tidak diasumsikan bahwa Std_populasi_1 = Std_populasi_2, maka kita memanfaatkan uji t `tsum.test()`. dengan rincian kode dibawah ini:

```R
mean_samp1 = 3.64
std_samp1 = 1.67
n_samp1 = 19

mean_samp2 = 2.79
std_samp2 = 1.32
n_samp2 = 27

tsum.test(mean_samp1, std_samp1, n_samp1, 
          mean_samp2 , std_samp2, n_samp2,
          alternative = "greater", var.equal = TRUE)
```
maka dapat dilihat hasilnya dibawah ini :
![3B](https://user-images.githubusercontent.com/110555492/207252169-e185c247-d63e-4543-b1de-9d0581481fc3.png)

### c. Lakukan Uji Statistik (df =2)(5)

pertama kita perlu memanfaatkan library mosaic untuk menggambar grafik uji t. lalu kita menggunakan fungsi `plotDist()' untuk visualisasi uji t dengan df = 2

```R
df = 2

plotDist(dist = 't', df)
```
sehingga hasilnya seperti berikut
![3C](https://user-images.githubusercontent.com/110555492/207259433-7d377759-6514-4c32-a75c-362cc4b3dc26.png)

### d. Nilai Kritikal(3)

untuk mencari critical value, kita memanfaatkan fungsi `qchisq()` sebagai berikut:
```R
p = 0.05
qchisq(p, df, lower.tail = FALSE)
```
didapatkan hasil:

![3D](https://user-images.githubusercontent.com/110555492/207260611-ff55bf44-be21-458b-ba07-7dd289f13499.png)

### e. Keputusan(3)

Dari p-value yang didapatkan sebelumnya, maka ketika dibandingkan dengan nilai 𝛼 makan didapatkan keputusan **tolak $H_0$** karena nilai p-value kurang dari 𝛼.

### f. Kesimpulan(3)

kesimpulan yang dapat diambil ketika **tolak $H_0$** adalah **ada perbedaan signifikan rata-rata saham di Bandung dengan Bali**

## 4. (Anova satu arah)
## Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Jika : 

diketahui dataset  https://intip.in/datasetprobstat1 

$H_0$ : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

### Maka Kerjakan atau Carilah:
### a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Pertama, kita melakukan input dataset diatas memanfaatkan fungsi `read.table()` sehingga bisa kita melakukan grouping nantinya. 
```R
dataset = read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", h = TRUE)
```
setelah itu melakukan grouping sesuai dengan label yang diketahui dan membagi tiap masing-masing subset kedalam variabel teretentu.
```R
dataset$Group <- as.factor(dataset$Group)
dataset$Group = factor(dataset$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataset$Group)

oren <- subset(dataset, Group == "Kucing Oren")
hitam <- subset(dataset, Group == "Kucing Hitam")
putih <- subset(dataset, Group == "Kucing Putih")
```
selanjutnya, kita melakukan draw plot kuantil normal untuk masing-masing subset dengan menggunakan fungsi `qqnorm()` dan `qqline()`
```R
qqnorm(oren$Length, main = "Kucing Oren")
qqline(oren$Length)

qqnorm(hitam$Length, main = "Kucing Hitam")
qqline(hitam$Length)

qqnorm(putih$Length, main = "Kucing Putih")
qqline(putih$Length)
```
sehingga gambar dari grafik masing-masing subset diatas ialah dibawah ini
![image](https://user-images.githubusercontent.com/110555492/207298819-a9a3084c-e8d5-40da-96e5-ae698d6399c6.png)
![image](https://user-images.githubusercontent.com/110555492/207298831-fc869c62-7f7e-47d3-8d90-9dfa574f1f76.png)
![image](https://user-images.githubusercontent.com/110555492/207298849-b30bb594-b36a-4784-ae0e-bf26f41bf09b.png)

### b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

Untuk mencari _homogeneity of variances_ dari dataset diatas, maka kita bisa memanfaatkan fungsi `bartlett.test()` dengan rincinan kode dibawah ini
```R
bartlett.test(Length ~ Group, data = dataset)
```
sehingga didapatkan hasil seperti dibawah ini, 
![image](https://user-images.githubusercontent.com/110555492/207299804-c9f1f1a6-ea3c-470c-b593-66a459e596ba.png)

### c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

dalam membuat model linear dari Anova satu arah kita bisa memanfaatkan fungsi `lm()` dengan fungsi `anova()` dengan rincian kode seperti dibawah ini
```R
model1 = lm(Length ~ Group, data = dataset)
anova(model1)
```
sehingga hasilnya akan seperti dibawah ini
![image](https://user-images.githubusercontent.com/110555492/207303272-206ae5b7-6ce7-467c-bd60-79c987ec9a43.png)
### d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?

dari jawaban sebelumnya, dapat dilihat bahwa p-value yang didapatkan ialah 0.0013 dan 𝛼 yang diketahui ialah 0.05. maka apabila dibandingkan nilai p-value lebih kecil dari 𝛼. Sehingga dapat disimpulkan bahwa **terdapat perbedaan panjang antara ketiga spesies kucong tersebut**

### e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

untuk melakukan verifikasi jawaban model 1 sesuai dengan permintaan soal 4e, maka kita bisa memanfaatkan fungsi `TukeyHSD()` dengan parameter model 1. rincian kodenya dapat dilihat sebagai beikut
```R
TukeyHSD(aov(model1))
```
lalu, hasilnya dapat dilihat sebagai berikut:
![image](https://user-images.githubusercontent.com/110555492/207304668-543bc9bf-14c7-41f5-8720-09e6e5755ad6.png)

### f. Visualisasikan data dengan ggplot2

untuk membuat visualisasi data memanfaatkan ggplot, maka kita menggunakan fungsi ggplot() dengan parameter dataset sebelumnya
```R
library("ggplot2")

ggplot(dataset, aes(x = Group, y = Length)) + geom_boxplot(fill = "lightblue", colour = "black") + scale_x_discrete()
```
sehingga gambar plot bisa dilihat dibawah ini:
![image](https://user-images.githubusercontent.com/110555492/207310137-19b58e69-45d5-4c6a-9aa2-2d432c78e25e.png)

## 5. (Anova dua arah)
## Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

### a. Buatlah plot sederhana untuk visualisasi data

untuk membuat plot sederhana visualisasi data, kita bisa memanfaatkan fungsi `qplot()`, namun sebelum itu kita perlu mengimport data menggunakan fungsi `read_csv(nama_data)` terlebih dahulu. untuk rincian kodenya dapat dilihat sebagai berikut:

```R
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL = read_csv("GTL.csv")
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```
sehingga, plot dapat dilihat dibawah ini
![image](https://user-images.githubusercontent.com/110555492/207313118-63c92ed4-346e-40cc-a9b5-43a13d4deacf.png)

### b. Lakukan uji ANOVA dua arah untuk 2 faktor

untuk melakukan uji Anova 2 arah pada data ini kita menggunakan fungsi `aov()` dengan memanfaatkan variabel _as factor_ dalam datanya.

```R
GTL$Glass = as.factor(GTL$Glass)
GTL$Temp_Factor = as.factor(GTL$Temp)

anova = aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
sehingga didapatkan hasil sebagai berikut:
![image](https://user-images.githubusercontent.com/110555492/207314985-1d08cd6e-dfca-44e5-853e-8553440d0510.png)

### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

kita dapat memanfaatkan fungsi `group_by()` dan `summarise()` untuk dapat menambahkan tampilan mean dan sd dari masing-masing record data, dengan rincian kode sebagai berikut:
```R
data_summary <- group_by(GTL, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light)) %>% arrange(desc(mean))
print(data_summary)
```
sehingga tampilan table yang baru akan seperti berikut:

![image](https://user-images.githubusercontent.com/110555492/207318747-609cc014-45c9-481b-88fc-1438c93ac4b5.png)

### d. Lakukan uji Tukey

untuk melakukan uji Tukey seperti sebelumnya, kita akan memanfaatkan fungsi TukeyHSD() dengan parameter anova dari hasil sebelumnya. rincian kodenya sebagai berikut:
```R
Tukey = TukeyHSD(anova)
print(Tukey)
```
sehingga dapat dilihat hasilnya sebagai berikut:
![image](https://user-images.githubusercontent.com/110555492/207320721-8bbb7afd-dfd7-4df0-9099-fb05bfd1a717.png)

### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

Hal pertama yang perlu kita lakukan ialah membuat compact letter display dengan fungsi `multicompLetters4()`, selanjutnya kita tambahkan compact letter tersebut kedalam tabel sehingga dapat kita bandingkan dengan mudah. rincian kode dapat dilihat sebagai berikut:

```R
tukey.cld = multcompLetters4(anova, tukey)
cld = as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey = cld$Letters
print(tukey.cld)
print(data_summary)
```
sehingga dapat dilihat compact letter dan tampilan table yang baru dibawah ini
![image](https://user-images.githubusercontent.com/110555492/207322525-742bad3c-3d1a-46ca-9d23-ba81dfb9894d.png)
