#Created by: Aar Riana
data_positif = read.csv("sampel_positif.csv")
str(data_positif)
data_negatif = read.csv("sampel_negatif.csv")
str(data_negatif)
dataset = rbind(data_positif,data_negatif)
str(dataset)
summary(dataset)

#### praproses #####
dataset$kelas = as.factor(dataset$kelas)
plot(dataset$kelas, main = "distribusi kelas",col = c("blue","red"))
dataset = dataset[,2:25]
#cek missing value
library(mice)
md.pattern(dataset)
library(caret)
#balancing data
library(ROSE)
data_balanced <- ROSE(kelas ~ ., data = dataset, seed = 1)$data
plot(data_balanced$kelas, main = "distribusi kelas sampling",col = c("blue","red"))
#data slicing
library(e1071)
set.seed(3033)
data_train <- createDataPartition(y = data_balanced$kelas, p= 0.7, list = FALSE)
training <- data_balanced[data_train,]
testing <- data_balanced[-data_train,]
summary(training$kelas) ; summary(testing$kelas)

###### Modeling #####
trctrl <- trainControl(method = "cv", number = 10)
set.seed(3233)
svm_model <- train(kelas ~., data = training, method = "svmRadial",
                   trControl=trctrl,
                   preProcess = c("center", "scale"),
                   tuneLength = 10)
svm_model

##### Evaluasi ######
test_pred <- predict(svm_model, newdata = testing)
cs <- table(test_pred, testing$kelas)
TP = cs[1,1]
TN = cs[2,2]
FP = cs[1,2]
FN = cs[2,1]
#Accuracy
akurasi = (TP +TN)/(TP+TN+FP+FN)
#Precision/PPV 
precision = TP / (TP + FP)
#Recall/Sensitivity/TPR
recall = TP / (TP + FN)
#specificity/TNR
specificity = TN / (TN + FP)
#FPR
FPR = FP / (FP+TN)
#F-score
F_Score = 2*(precision*recall)/(precision + recall)
#FNR
FNR = FN / (TP + FN)
