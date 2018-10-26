# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State <- factor(dataset$State,
                        levels = c('New York', 'California', 'Florida'),
                        labels = c(1, 2, 3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split==T)
test_set <- subset(dataset, split==F)


# Fitting Multiple Linear Regression to the Training set
regressor <- lm(formula = Profit ~ ., data = training_set)# Profit ~ . means its a linear combination of all variables

# Predicting the Test set results
y_pred <- predict(regressor, newdata = test_set)

#Building the optimal model using Backword Elimination
regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset)
summary(regressor)
regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
summary(regressor)
regressor <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset)
summary(regressor)
regressor <- lm(formula = Profit ~ R.D.Spend, data = dataset)
summary(regressor)

#Plotting graph now
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$R.D.Spend, y=training_set$Profit), color="Red") +
  geom_line(aes(x=training_set$R.D.Spend, y=predict(regressor, newdata = training_set)), color="Blue")
