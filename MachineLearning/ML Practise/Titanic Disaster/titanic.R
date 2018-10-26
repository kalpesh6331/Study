#####
#001#
#####

### TITANIC DISASTER CHALLANGE ###

dataset_train <- read.csv("train.csv")
dataset_test <- read.csv("test.csv")

#Creating new dataset with required fields only
actual_train <- dataset_train[5:6]
actual_train <- cbind(actual_train, dataset_train$Pclass)
actual_train <- cbind(actual_train, dataset_train$Survived)
colnames(actual_train) <- c("sex", "age", "class", "survived")

actual_test <- dataset_test[4:5]
actual_test <- cbind(actual_test, dataset_test$Pclass)
actual_test <- cbind(actual_test, dataset_test$PassengerId)
colnames(actual_test) <- c("sex", "age", "class", "pid")

#Factoring sex column
actual_train$sex = factor(actual_train$sex,
                          levels = c("male", "female"),
                          labels = c(1, 0))

actual_test$sex = factor(actual_test$sex,
                          levels = c("male", "female"),
                          labels = c(1, 0))

#Taking care of missing data
actual_train$age <- ifelse(is.na(actual_train$age),
                          ave(actual_train$age, FUN = function(x) mean(x, na.rm = TRUE)),
                          actual_train$age)

actual_test$age <- ifelse(is.na(actual_test$age),
                      ave(actual_test$age, FUN = function(x) mean(x, na.rm = TRUE)),
                      actual_test$age)


#################
### USING KNN ###
#################
#Fitting KNN to training set
library(class)
knn_pred <- knn(train = actual_train[,-4],
              test = actual_train[,-4],
              cl = actual_train[, 4],
              k = 10)

# Making the Confusion Matrix
knn_cm <- table(actual_train[, 4], knn_pred)
knn_cm
#0   1
#0 495  54
#1 121 221

#################################
### USING LOGISTIC REGRESSION ### [MOST ACCURATE]
#################################
# Fitting Logistic Regression to the Training set
logistic_classifier <- glm(formula = survived ~.,
                  family = binomial,
                  data = actual_train)


# Predicting the Training set results
logistic_prob_pred <- predict(logistic_classifier, type = 'response', newdata = actual_train[-4])
logistic_pred <- ifelse(logistic_prob_pred > 0.5, 1, 0)

# Predicting the Test set results
logistic_prob_pred_testset <- predict(logistic_classifier, type = 'response', newdata = actual_test[-4])
logistic_pred_testset <- ifelse(logistic_prob_pred_testset > 0.5, 1, 0)

# Making the Confusion Matrix
cm <- table(actual_train[, 4], logistic_pred)
cm
#0   1
#0 470  79
#1  98 244

#Creating submission dataset
result_set_logisticregression <- cbind(actual_test$pid, logistic_pred_testset)
colnames(result_set) <- c("PassengerId", "Survived")
write.csv(result_set, "titanic_result_logisticregression.csv")

########################
### USING KERNEL SVM ###
########################
# Fitting Kernel SVM to the Training set
# install.packages('e1071')
library(e1071)
kernelsvm_classifier <- svm(formula = survived ~ .,
                  data = actual_train,
                  type = 'C-classification',
                  kernel = 'radial')


# Predicting the Training set results
kernelsvm_pred <- predict(kernelsvm_classifier, newdata = actual_train[-4])
kernelsvm_pred_test_set <- predict(kernelsvm_classifier, newdata = actual_test[-4])

# Making the Confusion Matrix
cm <- table(actual_train[,4], kernelsvm_pred)
cm
#0   1
#0 480  69
#1 101 241

#Creating submission dataset
kernelsvm_pred_test_set <- as.numeric(kernelsvm_pred_test_set)
kernelsvm_pred_test_set <- replace(kernelsvm_pred_test_set, kernelsvm_pred_test_set==1, 0)
kernelsvm_pred_test_set <- replace(kernelsvm_pred_test_set, kernelsvm_pred_test_set==2, 1)
result_set_kernelsvm <- cbind(actual_test$pid, kernelsvm_pred_test_set)

  
  
  
colnames(result_set_kernelsvm) <- c("PassengerId", "Survived")
write.csv(result_set_kernelsvm, "titanic_result_kernelsvm.csv")

#########################
### USING NAIVE BAYES ###
#########################
# Fitting naive bayes to the Training set
# install.packages('e1071')
library(e1071)
naivebayes_classifier <- naiveBayes(x = actual_train[-4],
                         y = actual_train$survived)

# Predicting the Training set results
naivebayes_pred = predict(naivebayes_classifier, newdata = actual_train[-4])

# Making the Confusion Matrix
cm = table(actual_train[, 4], naivebayes_pred)
cm


#0   1
#0 480  69
#1 101 241

###########################
### USING RANDOM FOREST ###
###########################
# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
library(randomForest)
set.seed(123)
randomforest_classifier = randomForest(x = actual_train[-4],
                          y = actual_train$survived,
                          ntree = 500)

# Predicting the Training set results
randomforest_prob_pred = predict(randomforest_classifier, newdata = actual_train[-4])
randomforest_pred <- ifelse(randomforest_prob_pred > 0.5, 1, 0)

# Predicting the Test set results
randomforest_prob_pred_testset = predict(randomforest_classifier, newdata = actual_test[-4])
randomforest_pred_testset <- ifelse(randomforest_prob_pred_testset > 0.5, 1, 0)

# Making the Confusion Matrix
cm = table(actual_train[, 4], randomforest_pred)
cm

#Creating submission dataset
result_set_randomforest <- cbind(actual_test$pid, randomforest_pred_testset)
colnames(result_set_kernelsvm) <- c("PassengerId", "Survived")
write.csv(result_set_kernelsvm, "titanic_result_randomforest.csv")
