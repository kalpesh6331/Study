#####
#002#
#####

### HOUSE PRICE ANALYSIS ###

dataset_train <- read.csv("train.csv")
dataset_test <- read.csv("test.csv")

library(ggplot2)
ggplot() +
  geom_histogram(aes(x = dataset_train$SalePrice))

### GRAPH PLOTS ON DIFFERENT FIELDS vs PRICE ###
library(ggplot2)

ggplot(data=dataset_train, aes(x=MSZoning, y=SalePrice)) + geom_point()
#Here we have plotted all graphs and took relation into consideration against price
#We have selected only those params which seem relative to price

### CREATING RELATIVE DATASET ###
relative_train_ds <- dataset_train[1]
relative_train_ds <- cbind(relative_train_ds, dataset_train$BsmtFinSF1, dataset_train$Exterior1st, dataset_train$FullBath, dataset_train$GarageArea, dataset_train$GarageCars, dataset_train$GrLivArea, dataset_train$LotFrontage, dataset_train$MasVnrArea, dataset_train$Neighborhood, dataset_train$OverallQual, dataset_train$RoofStyle, dataset_train$SaleCondition, dataset_train$TotalBsmtSF, dataset_train$TotRmsAbvGrd, dataset_train$X1stFlrSF, dataset_train$X2ndFlrSF, dataset_train$YearBuilt, dataset_train$YearRemodAdd, dataset_train$Foundation, dataset_train$SalePrice)
relative_train_ds$Id <- NULL
colnames(relative_train_ds) <- c("BsmtFinSF1","Exterior1st","FullBath","GarageArea","GarageCars","GrLivArea","LotFrontage","MasVnrArea","Neighborhood","OverallQual","RoofStyle","SaleCondition","TotalBsmtSF","TotRmsAbvGrd","X1stFlrSF","X2ndFlrSF","YearBuilt","YearRemodAdd", "Foundation", "SalePrice")

relative_test_ds <- dataset_test[1]
relative_test_ds <- cbind(relative_test_ds, dataset_test$BsmtFinSF1, dataset_test$Exterior1st, dataset_test$FullBath, dataset_test$GarageArea, dataset_test$GarageCars, dataset_test$GrLivArea, dataset_test$LotFrontage, dataset_test$MasVnrArea, dataset_test$Neighborhood, dataset_test$OverallQual, dataset_test$RoofStyle, dataset_test$SaleCondition, dataset_test$TotalBsmtSF, dataset_test$TotRmsAbvGrd, dataset_test$X1stFlrSF, dataset_test$X2ndFlrSF, dataset_test$YearBuilt, dataset_test$YearRemodAdd, dataset_test$Foundation)
relative_test_ds$Id <- NULL
colnames(relative_test_ds) <- c("BsmtFinSF1","Exterior1st","FullBath","GarageArea","GarageCars","GrLivArea","LotFrontage","MasVnrArea","Neighborhood","OverallQual","RoofStyle","SaleCondition","TotalBsmtSF","TotRmsAbvGrd","X1stFlrSF","X2ndFlrSF","YearBuilt","YearRemodAdd", "Foundation")

### FACTORING CATEGORICAL DATA TRAINING_SET ###
str(relative_train_ds)
levels(relative_train_ds$Condition2)

relative_train_ds$Exterior1st = factor(relative_train_ds$Exterior1st,
                                       levels = c("AsbShng","AsphShn","BrkComm","BrkFace","CBlock","CemntBd","HdBoard","ImStucc","MetalSd","Plywood","Stone","Stucco","VinylSd","Wd Sdng","WdShing"),
                                       labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
relative_train_ds$Foundation = factor(relative_train_ds$Foundation,
                                      levels = c("BrkTil","CBlock","PConc","Slab","Stone","Wood"),
                                      labels = c(1,2,3,4,5,6))
relative_train_ds$Neighborhood = factor(relative_train_ds$Neighborhood,
                                        levels = c("Blmngtn","Blueste","BrDale","BrkSide","ClearCr","CollgCr","Crawfor","Edwards","Gilbert","IDOTRR","MeadowV","Mitchel","NAmes","NoRidge","NPkVill","NridgHt","NWAmes","OldTown","Sawyer","SawyerW","Somerst","StoneBr","SWISU","Timber","Veenker"),
                                        labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25))
relative_train_ds$RoofStyle = factor(relative_train_ds$RoofStyle,
                                     levels = c("Flat","Gable","Gambrel","Hip","Mansard","Shed"),
                                     labels = c(1,2,3,4,5,6))
relative_train_ds$SaleCondition = factor(relative_train_ds$SaleCondition,
                                         levels = c("Abnorml","AdjLand","Alloca","Family","Normal","Partial"),
                                         labels = c(1,2,3,4,5,6))


### FACTORING CATEGORICAL DATA TEST_SET ###
str(relative_test_ds)
levels(relative_test_ds$Condition2)

relative_test_ds$Exterior1st = factor(relative_test_ds$Exterior1st,
                                      levels = c("AsbShng","AsphShn","BrkComm","BrkFace","CBlock","CemntBd","HdBoard","ImStucc","MetalSd","Plywood","Stone","Stucco","VinylSd","Wd Sdng","WdShing"),
                                      labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
relative_test_ds$Foundation = factor(relative_test_ds$Foundation,
                                     levels = c("BrkTil","CBlock","PConc","Slab","Stone","Wood"),
                                     labels = c(1,2,3,4,5,6))
relative_test_ds$Neighborhood = factor(relative_test_ds$Neighborhood,
                                       levels = c("Blmngtn","Blueste","BrDale","BrkSide","ClearCr","CollgCr","Crawfor","Edwards","Gilbert","IDOTRR","MeadowV","Mitchel","NAmes","NoRidge","NPkVill","NridgHt","NWAmes","OldTown","Sawyer","SawyerW","Somerst","StoneBr","SWISU","Timber","Veenker"),
                                       labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25))
relative_test_ds$RoofStyle = factor(relative_test_ds$RoofStyle,
                                    levels = c("Flat","Gable","Gambrel","Hip","Mansard","Shed"),
                                    labels = c(1,2,3,4,5,6))
relative_test_ds$SaleCondition = factor(relative_test_ds$SaleCondition,
                                        levels = c("Abnorml","AdjLand","Alloca","Family","Normal","Partial"),
                                        labels = c(1,2,3,4,5,6))

### TAKING CARE OF MISSING DATA TRAINING_SET ###
sapply(relative_train_ds, function(x) sum(is.na(x))) #Check how many missing variables
str(relative_train_ds)


relative_train_ds$LotFrontage <- ifelse(is.na(relative_train_ds$LotFrontage),
                                        round(ave(relative_train_ds$LotFrontage, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                        relative_train_ds$LotFrontage)
relative_train_ds$MasVnrArea <- ifelse(is.na(relative_train_ds$MasVnrArea),
                                       round(ave(relative_train_ds$MasVnrArea, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                       relative_train_ds$MasVnrArea)

#Converting factors to num just to match the dataset
relative_train_ds$Exterior1st <- as.numeric(levels(relative_train_ds$Exterior1st))[relative_train_ds$Exterior1st]
#relative_train_ds$MSZoning <- as.numeric(levels(relative_train_ds$MSZoning))[relative_train_ds$MSZoning]
#relative_train_ds$SaleType <- as.numeric(levels(relative_train_ds$SaleType))[relative_train_ds$SaleType]


### TAKING CARE OF MISSING DATA TEST_SET ###
sapply(relative_test_ds, function(x) sum(is.na(x))) #Check how many missing variables
str(relative_test_ds)

relative_test_ds$Exterior1st <- ifelse(is.na(relative_test_ds$Exterior1st),
                                       3,
                                       relative_test_ds$Exterior1st)
relative_test_ds$MasVnrArea <- ifelse(is.na(relative_test_ds$MasVnrArea),
                                      round(ave(relative_test_ds$MasVnrArea, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                      relative_test_ds$MasVnrArea)
relative_test_ds$LotFrontage <- ifelse(is.na(relative_test_ds$LotFrontage),
                                       round(ave(relative_test_ds$LotFrontage, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                       relative_test_ds$LotFrontage)
relative_test_ds$GarageCars <- ifelse(is.na(relative_test_ds$GarageCars),
                                      2,
                                      relative_test_ds$GarageCars)
relative_test_ds$GarageArea <- ifelse(is.na(relative_test_ds$GarageArea),
                                      round(ave(relative_test_ds$GarageArea, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                      relative_test_ds$GarageArea)
relative_test_ds$BsmtFinSF1 <- ifelse(is.na(relative_test_ds$BsmtFinSF1),
                                      round(ave(relative_test_ds$BsmtFinSF1, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                      relative_test_ds$BsmtFinSF1)
relative_test_ds$TotalBsmtSF <- ifelse(is.na(relative_test_ds$TotalBsmtSF),
                                       round(ave(relative_test_ds$TotalBsmtSF, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                       relative_test_ds$TotalBsmtSF)



#Getting correlation matrics
#cor(as.numeric(relative_train_ds$BldgType), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$Condition2), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$Condition1), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$CentralAir), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$Foundation), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$LandContour), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$Neighborhood), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$SaleCondition), relative_train_ds$SalePrice)
#cor(as.numeric(relative_train_ds$RoofStyle), relative_train_ds$SalePrice)
#cor(relative_train_ds$BsmtFinSF1, relative_train_ds$SalePrice)
#cor(relative_train_ds$BsmtHalfBath, relative_train_ds$SalePrice)
#cor(relative_train_ds$BsmtQual, relative_train_ds$SalePrice)
#cor(relative_train_ds$Exterior1st, relative_train_ds$SalePrice)
#cor(relative_train_ds$FullBath, relative_train_ds$SalePrice)
#cor(relative_train_ds$GarageArea, relative_train_ds$SalePrice)
#cor(relative_train_ds$GarageCars, relative_train_ds$SalePrice)
#cor(relative_train_ds$GarageType, relative_train_ds$SalePrice)
#cor(relative_train_ds$GrLivArea, relative_train_ds$SalePrice)
#cor(relative_train_ds$LotFrontage, relative_train_ds$SalePrice)
#cor(relative_train_ds$MasVnrArea, relative_train_ds$SalePrice)
#cor(relative_train_ds$MSZoning, relative_train_ds$SalePrice)
#cor(relative_train_ds$OverallQual, relative_train_ds$SalePrice)
#cor(relative_train_ds$SaleType, relative_train_ds$SalePrice)
#cor(relative_train_ds$TotalBsmtSF, relative_train_ds$SalePrice)
#cor(relative_train_ds$TotRmsAbvGrd, relative_train_ds$SalePrice)
#cor(relative_train_ds$X1stFlrSF, relative_train_ds$SalePrice)
#cor(relative_train_ds$X2ndFlrSF, relative_train_ds$SalePrice)
#cor(relative_train_ds$YearBuilt, relative_train_ds$SalePrice)
#cor(relative_train_ds$YearRemodAdd, relative_train_ds$SalePrice)

str(relative_train_ds)
### APPLYING REGRESSION ALGORITHMS ###

######################################
### USING SIMPLE LINEAR REGRESSION ###
######################################
sl_regressor <- lm(formula = SalePrice ~ ., data = relative_train_ds)
training_set_pred <- predict(sl_regressor, newdata = relative_train_ds)
test_set_pred <- predict(sl_regressor, newdata = relative_test_ds)

### PLOTTING GRAPH actual salary vs predicted salary ###

library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set_pred, y = relative_train_ds$SalePrice)) +
  xlab("Predicted Price") +
  ylab("Actual Price")

### CREATING SUBMISSION DOC ###
result_set_slr <- cbind(dataset_test$Id, test_set_pred)
colnames(result_set_slr) <- c("Id", "SalePrice")
write.csv(result_set_slr, "houseprice_result_slr_adv.csv")

######################################
### USING RANDOM FOREST REGRESSION ###
######################################
library(randomForest)
set.seed(1234)
rf_regressor <- randomForest(x = relative_train_ds[1:19],
                             y = relative_train_ds$SalePrice,
                             ntree = 500)

# Predicting a new result with Random Forest Regression
rf_training_set_pred <- predict(rf_regressor, newdata = relative_train_ds)
rf_test_set_pred <- predict(rf_regressor, newdata = relative_test_ds)

### PLOTTING GRAPH actual salary vs predicted salary ###
library(ggplot2)
ggplot() +
  geom_point(aes(x = rf_training_set_pred, y = relative_train_ds$SalePrice)) +
  xlab("Predicted Price") +
  ylab("Actual Price")

### CREATING SUBMISSION DOC ###
result_set_rf <- cbind(dataset_test$Id, rf_test_set_pred)
colnames(result_set_rf) <- c("Id", "SalePrice")
write.csv(result_set_rf, "houseprice_result_rf_adv.csv")

#######################################
### USING SUPPORT VECTOR REGRESSION ###
#######################################

library(e1071)
svm_regressor <- svm(formula = SalePrice ~ ., 
                     data = relative_train_ds, 
                     type = 'eps-regression')
summary(svm_regressor)

# Predicting a new result
svm_training_set_pred <- predict(svm_regressor, newdata = relative_train_ds)
svm_test_set_pred <- predict(svm_regressor, newdata = relative_test_ds)

### PLOTTING GRAPH actual salary vs predicted salary ###
library(ggplot2)
ggplot() +
  geom_point(aes(x = svm_training_set_pred, y = relative_train_ds$SalePrice)) +
  xlab("Predicted Price") +
  ylab("Actual Price")

### CREATING SUBMISSION DOC ###
result_set_svm <- cbind(dataset_test$Id, svm_test_set_pred)
colnames(result_set_svm) <- c("Id", "SalePrice")
write.csv(result_set_svm, "houseprice_result_svm_adv.csv")