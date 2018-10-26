# Data Preprocessing Template

##############################################

# Importing the dataset
# getwd()
# setwd("C:/Kalpesh/Personal/Study/ML/Machine Learning A-Z Dataset/Part 1 - Data Preprocessing")

dataset <- read.csv("Data.csv")
# dataset <- dataset[, 2:3]
head(dataset)

#As you can see in the dataset, there is missing data
#Taking care of missing data, add mean of column wherever the data is missing
# dataset$Age <- ifelse(is.na(dataset$Age),
#                       ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
#                       dataset$Age)
# 
# dataset$Salary <- ifelse(is.na(dataset$Salary),
#                          ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
#                          dataset$Salary)

#Categorical Data
#Here we are encoding the categorical values in numericals
# dataset$Country <- factor(dataset$Country,
#                           levels=c("France", "Spain", "Germany"),
#                           labels=c(1, 2, 3))
# 
# dataset$Purchased <- factor(dataset$Purchased,
#                             levels=c("Yes","No"),
#                             labels=c(1, 0))

#Splitting the Dataset into the Training Set and Test Set
#install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.8) #Splitting training set
training_set <- subset(dataset, split == TRUE) #assigning training set
test_set <- subset(dataset, split == FALSE) #assigning test set

#Feature Scaling
#This includes getting data in mostly simillar ranges in order to avoid large differences
#Scale only columns which are numerical, in our dataset, Age and Salary are numerical (str(dataset))
# training_set[, 2:3] <- scale(training_set[, 2:3])
# test_set[, 2:3] <- scale(test_set[, 2:3])