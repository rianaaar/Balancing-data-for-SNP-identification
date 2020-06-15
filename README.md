# Balancing-data-for-SNP-identification
### Data
Dataset terdiri dari 17637 data dengan 25 *variables* yaitu 24 fitur *predictive*, dan data label atau kelas.
Data kelas terdiri dari kelas +1 yang mengidentifikasikan SNP *Positive* dan kelas -1 yang mengidentifikasikan SNP *Negative*.
### Metode
Metode yang digunakan adalah Support Vector Machine (SVM) menggunakan formula C-classification dengan Radial Basis Function (RBF)
### Praproses
Distribusi kelas tidak seimbang sehingga perlu dilakukan penyeimbangan data.
Pada analisis ini digunakan teknik Over-Under-sampling yaitu Random Over-Sampling Examples (ROSE) menggunakan package ROSE di RStudio.
Perbedaan distribusi kelas sebelum dan sebelum sampling dapat dilihat pada Gambar.
![Alt Text](https://user-images.githubusercontent.com/46989222/84623925-8985c300-af0a-11ea-957e-e4554e86d2d9.PNG)
### *Modeling*
Training data dilakukan menggunakan package e1071 untuk SVM dengan traincontrol 10-fold cross validation.
Sebelumnya dilakukan pembagian data sebesar 70% untuk data latih dan 30% untuk data tes.
Model terbaik dihasilkan dengan nilai c = 16 dan sigma = 0.0356.
### Evaluasi Model
*Precision* | FPR | FNR | *Sensitivity* | *Specificity* | *F-measure*
-----| -----| -----|------|------|------
0.97 | 0.02 | 0.03 | 0.97 | 0.97 | 0.97

Model terbaik diperoleh dari data hasil sampling dengan *f-measure* sebesar 97%.
*f-measure* menunjukan kemampuan model dalam memetakan kelas positif dan tidak memetakan kelas negatif ke kelas positif.
*Precision* berarti model mampu memprediksi SNP positif sebesar 97%.
*Sensitivity* berarti bahwa dari semua SNP positif yang diprediksi 97% adalah benar SNP positif sedangkan
*specificity* berarti bahwa dari semua SNP negatif yang diprediksi 97% adalah benar SNP negatif.
FPR adalah proporsi kesalahan kelas positif yang diprediksi sebagai kelas negatif, sebanyak 2% saja data yang salah prediksi.
FNR adalah proporsi kesalahan kelas negatif yang diprediksi sebagai kelas positif, sebanyak 3% data yang salah prediksi.
Nilai *Sensitivity* dan *specificity* tinggi sedangkan nilai FPR dan FNR rendah berarti model sangat baik untuk klasifikasi SNP.
