#####
#002#
#####

### HOUSE PRICE ANALYSIS ###

dataset_train <- read.csv("train.csv")
dataset_test <- read.csv("test.csv")

### GRAPH PLOTS ON DIFFERENT FIELDS vs PRICE ###
library(ggplot2)

ggplot(data=dataset_train, aes(x=MSZoning, y=SalePrice)) + geom_point()
#Here we have plotted all graphs and took relation into consideration against price
#We have selected only those params which seem relative to price

### CREATING RELATIVE DATASET ###
relative_train_ds <- dataset_train[1]
relative_train_ds <- cbind(relative_train_ds, dataset_train$BldgType, dataset_train$BsmtFinSF1, dataset_train$BsmtHalfBath, dataset_train$BsmtQual, dataset_train$CentralAir, dataset_train$Condition1, dataset_train$Condition2, dataset_train$Exterior1st, dataset_train$Foundation, dataset_train$FullBath, dataset_train$GarageArea, dataset_train$GarageCars, dataset_train$GarageType, dataset_train$GrLivArea, dataset_train$LandContour, dataset_train$LotFrontage, dataset_train$MasVnrArea, dataset_train$MSZoning, dataset_train$Neighborhood, dataset_train$OverallQual, dataset_train$RoofStyle, dataset_train$SaleCondition, dataset_train$SaleType, dataset_train$TotalBsmtSF, dataset_train$TotRmsAbvGrd, dataset_train$X1stFlrSF, dataset_train$X2ndFlrSF, dataset_train$YearBuilt, dataset_train$YearRemodAdd, dataset_train$SalePrice)
relative_train_ds$Id <- NULL
colnames(relative_train_ds) <- c("BldgType","BsmtFinSF1","BsmtHalfBath","BsmtQual","CentralAir","Condition1","Condition2","Exterior1st","Foundation","FullBath","GarageArea","GarageCars","GarageType","GrLivArea","LandContour","LotFrontage","MasVnrArea","MSZoning","Neighborhood","OverallQual","RoofStyle","SaleCondition","SaleType","TotalBsmtSF","TotRmsAbvGrd","X1stFlrSF","X2ndFlrSF","YearBuilt","YearRemodAdd", "SalePrice")

relative_test_ds <- dataset_test[1]
relative_test_ds <- cbind(relative_test_ds, dataset_test$BldgType, dataset_test$BsmtFinSF1, dataset_test$BsmtHalfBath, dataset_test$BsmtQual, dataset_test$CentralAir, dataset_test$Condition1, dataset_test$Condition2, dataset_test$Exterior1st, dataset_test$Foundation, dataset_test$FullBath, dataset_test$GarageArea, dataset_test$GarageCars, dataset_test$GarageType, dataset_test$GrLivArea, dataset_test$LandContour, dataset_test$LotFrontage, dataset_test$MasVnrArea, dataset_test$MSZoning, dataset_test$Neighborhood, dataset_test$OverallQual, dataset_test$RoofStyle, dataset_test$SaleCondition, dataset_test$SaleType, dataset_test$TotalBsmtSF, dataset_test$TotRmsAbvGrd, dataset_test$X1stFlrSF, dataset_test$X2ndFlrSF, dataset_test$YearBuilt, dataset_test$YearRemodAdd)
relative_test_ds$Id <- NULL
colnames(relative_test_ds) <- c("BldgType","BsmtFinSF1","BsmtHalfBath","BsmtQual","CentralAir","Condition1","Condition2","Exterior1st","Foundation","FullBath","GarageArea","GarageCars","GarageType","GrLivArea","LandContour","LotFrontage","MasVnrArea","MSZoning","Neighborhood","OverallQual","RoofStyle","SaleCondition","SaleType","TotalBsmtSF","TotRmsAbvGrd","X1stFlrSF","X2ndFlrSF","YearBuilt","YearRemodAdd")


### FACTORING CATEGORICAL DATA TRAINING_SET ###
str(relative_train_ds)
levels(relative_train_ds$Condition2)
relative_train_ds$BldgType = factor(relative_train_ds$BldgType,
                          levels = c("1Fam","2fmCon","Duplex","Twnhs","TwnhsE"),
                          labels = c(1, 2, 3, 4, 5))
relative_train_ds$BsmtQual = factor(relative_train_ds$BsmtQual,
                                    levels = c("Ex", "Fa", "Gd", "TA"),
                                    labels = c(1, 2, 3, 4))
relative_train_ds$CentralAir = factor(relative_train_ds$CentralAir,
                                    levels = c("Y", "N"),
                                    labels = c(1, 2))
relative_train_ds$Condition1 = factor(relative_train_ds$Condition1,
                                      levels = c("Artery","Feedr","Norm","PosA","PosN","RRAe","RRAn","RRNe","RRNn"),
                                      labels = c(1,2,3,4,5,6,7,8,9))
relative_train_ds$Condition2 = factor(relative_train_ds$Condition2,
                                      levels = c("Artery","Feedr","Norm","PosA","PosN","RRAe","RRAn","RRNn"),
                                      labels = c(1,2,3,4,5,6,7,8))
relative_train_ds$Exterior1st = factor(relative_train_ds$Exterior1st,
                                      levels = c("AsbShng","AsphShn","BrkComm","BrkFace","CBlock","CemntBd","HdBoard","ImStucc","MetalSd","Plywood","Stone","Stucco","VinylSd","Wd Sdng","WdShing"),
                                      labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
relative_train_ds$Foundation = factor(relative_train_ds$Foundation,
                                      levels = c("BrkTil","CBlock","PConc","Slab","Stone","Wood"),
                                      labels = c(1,2,3,4,5,6))
relative_train_ds$GarageType = factor(relative_train_ds$GarageType,
                                      levels = c("2Types","Attchd","Basment","BuiltIn","CarPort","Detchd"),
                                      labels = c(1,2,3,4,5,6))
relative_train_ds$LandContour = factor(relative_train_ds$LandContour,
                                      levels = c("Bnk","HLS","Low","Lvl"),
                                      labels = c(1,2,3,4))
relative_train_ds$MSZoning = factor(relative_train_ds$MSZoning,
                                       levels = c("C (all)","FV","RH","RL","RM"),
                                       labels = c(1,2,3,4,5))
relative_train_ds$Neighborhood = factor(relative_train_ds$Neighborhood,
                                    levels = c("Blmngtn","Blueste","BrDale","BrkSide","ClearCr","CollgCr","Crawfor","Edwards","Gilbert","IDOTRR","MeadowV","Mitchel","NAmes","NoRidge","NPkVill","NridgHt","NWAmes","OldTown","Sawyer","SawyerW","Somerst","StoneBr","SWISU","Timber","Veenker"),
                                    labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25))
relative_train_ds$RoofStyle = factor(relative_train_ds$RoofStyle,
                                    levels = c("Flat","Gable","Gambrel","Hip","Mansard","Shed"),
                                    labels = c(1,2,3,4,5,6))
relative_train_ds$SaleCondition = factor(relative_train_ds$SaleCondition,
                                     levels = c("Abnorml","AdjLand","Alloca","Family","Normal","Partial"),
                                     labels = c(1,2,3,4,5,6))
relative_train_ds$SaleType = factor(relative_train_ds$SaleType,
                                         levels = c("COD","Con","ConLD","ConLI","ConLw","CWD","New","Oth","WD"),
                                         labels = c(1,2,3,4,5,6,7,8,9))

### FACTORING CATEGORICAL DATA TEST_SET ###
str(relative_test_ds)
levels(relative_test_ds$Condition2)
relative_test_ds$BldgType = factor(relative_test_ds$BldgType,
                                    levels = c("1Fam","2fmCon","Duplex","Twnhs","TwnhsE"),
                                    labels = c(1, 2, 3, 4, 5))
relative_test_ds$BsmtQual = factor(relative_test_ds$BsmtQual,
                                    levels = c("Ex", "Fa", "Gd", "TA"),
                                    labels = c(1, 2, 3, 4))
relative_test_ds$CentralAir = factor(relative_test_ds$CentralAir,
                                      levels = c("Y", "N"),
                                      labels = c(1, 2))
relative_test_ds$Condition1 = factor(relative_test_ds$Condition1,
                                      levels = c("Artery","Feedr","Norm","PosA","PosN","RRAe","RRAn","RRNe","RRNn"),
                                      labels = c(1,2,3,4,5,6,7,8,9))
relative_test_ds$Condition2 = factor(relative_test_ds$Condition2,
                                      levels = c("Artery","Feedr","Norm","PosA","PosN","RRAe","RRAn","RRNn"),
                                      labels = c(1,2,3,4,5,6,7,8))
relative_test_ds$Exterior1st = factor(relative_test_ds$Exterior1st,
                                       levels = c("AsbShng","AsphShn","BrkComm","BrkFace","CBlock","CemntBd","HdBoard","ImStucc","MetalSd","Plywood","Stone","Stucco","VinylSd","Wd Sdng","WdShing"),
                                       labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
relative_test_ds$Foundation = factor(relative_test_ds$Foundation,
                                      levels = c("BrkTil","CBlock","PConc","Slab","Stone","Wood"),
                                      labels = c(1,2,3,4,5,6))
relative_test_ds$GarageType = factor(relative_test_ds$GarageType,
                                      levels = c("2Types","Attchd","Basment","BuiltIn","CarPort","Detchd"),
                                      labels = c(1,2,3,4,5,6))
relative_test_ds$LandContour = factor(relative_test_ds$LandContour,
                                       levels = c("Bnk","HLS","Low","Lvl"),
                                       labels = c(1,2,3,4))
relative_test_ds$MSZoning = factor(relative_test_ds$MSZoning,
                                    levels = c("C (all)","FV","RH","RL","RM"),
                                    labels = c(1,2,3,4,5))
relative_test_ds$Neighborhood = factor(relative_test_ds$Neighborhood,
                                        levels = c("Blmngtn","Blueste","BrDale","BrkSide","ClearCr","CollgCr","Crawfor","Edwards","Gilbert","IDOTRR","MeadowV","Mitchel","NAmes","NoRidge","NPkVill","NridgHt","NWAmes","OldTown","Sawyer","SawyerW","Somerst","StoneBr","SWISU","Timber","Veenker"),
                                        labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25))
relative_test_ds$RoofStyle = factor(relative_test_ds$RoofStyle,
                                     levels = c("Flat","Gable","Gambrel","Hip","Mansard","Shed"),
                                     labels = c(1,2,3,4,5,6))
relative_test_ds$SaleCondition = factor(relative_test_ds$SaleCondition,
                                         levels = c("Abnorml","AdjLand","Alloca","Family","Normal","Partial"),
                                         labels = c(1,2,3,4,5,6))
relative_test_ds$SaleType = factor(relative_test_ds$SaleType,
                                    levels = c("COD","Con","ConLD","ConLI","ConLw","CWD","New","Oth","WD"),
                                    labels = c(1,2,3,4,5,6,7,8,9))

### TAKING CARE OF MISSING DATA TRAINING_SET ###
sapply(relative_train_ds, function(x) sum(is.na(x))) #Check how many missing variables
str(relative_train_ds)



relative_train_ds$LotFrontage <- ifelse(is.na(relative_train_ds$LotFrontage),
                                        round(ave(relative_train_ds$LotFrontage, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                        relative_train_ds$LotFrontage)
relative_train_ds$GarageType <- ifelse(is.na(relative_train_ds$GarageType),
                                        2,
                                        relative_train_ds$GarageType)
relative_train_ds$BsmtQual <- ifelse(is.na(relative_train_ds$BsmtQual),
                                       4,
                                       relative_train_ds$BsmtQual)
relative_train_ds$MasVnrArea <- ifelse(is.na(relative_train_ds$MasVnrArea),
                                       round(ave(relative_train_ds$MasVnrArea, FUN = function(x) mean(x, na.rm = TRUE)), digits = 0),
                                       relative_train_ds$MasVnrArea)

#Converting factors to num just to match the dataset
relative_train_ds$Exterior1st <- as.numeric(levels(relative_train_ds$Exterior1st))[relative_train_ds$Exterior1st]
relative_train_ds$MSZoning <- as.numeric(levels(relative_train_ds$MSZoning))[relative_train_ds$MSZoning]
relative_train_ds$SaleType <- as.numeric(levels(relative_train_ds$SaleType))[relative_train_ds$SaleType]


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
relative_test_ds$GarageType <- ifelse(is.na(relative_test_ds$GarageType),
                                      2,
                                      relative_test_ds$GarageType)
relative_test_ds$BsmtQual <- ifelse(is.na(relative_test_ds$BsmtQual),
                                    4,
                                    relative_test_ds$BsmtQual)
relative_test_ds$BsmtHalfBath <- ifelse(is.na(relative_test_ds$BsmtHalfBath),
                                    0,
                                    relative_test_ds$BsmtHalfBath)
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
relative_test_ds$SaleType <- ifelse(is.na(relative_test_ds$SaleType),
                                        9,
                                        relative_test_ds$SaleType)
relative_test_ds$MSZoning <- ifelse(is.na(relative_test_ds$MSZoning),
                                    4,
                                    relative_test_ds$MSZoning)



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
write.csv(result_set_slr, "houseprice_result_slr2.csv")

######################################
### USING RANDOM FOREST REGRESSION ###
######################################
library(randomForest)
set.seed(1234)
rf_regressor <- randomForest(x = relative_train_ds[1:29],
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
write.csv(result_set_rf, "houseprice_result_rf.csv")

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
write.csv(result_set_svm, "houseprice_result_svm.csv")