library(caTools)
getwd()
setwd("Infinite Actuary - R Course")

dataset = read.csv("DataSimplelinear.csv")

set.seed(123)

split = sample.split(dataset$Premium, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Single variable linear regression

library(ggplot2)
ggplot(data=training_set, aes(x=training_set$NumberEmployees,
                              y=training_set$Premium)) +
  geom_point(color='red') +
  geom_smooth(method=lm, se=FALSE)

simplereg <- lm(data=training_set,
                formula = Premium ~ NumberEmployees)
summary(simplereg)

test_set$PremiumPredict <- predict(simplereg,
                                   newdata = test_set)
summary(simplereg)

PremPred246 <- 39862.017 + 77.194*(246)
PremPred246

coefficients(simplereg)
b0 <- coef(simplereg)[1]
b1 <- coef(simplereg)[2]
PremPred246 <- b0 + b1*(246)
PremPred246

ggplot() + 
  geom_point(aes(x=test_set$NumberEmployees,
                 y=test_set$Premium),
             color='red') +
  geom_point(aes(x=test_set$NumberEmployees,
                 y=test_set$PremiumPredict),
             color='green',
             size=3) +
  geom_line(aes(x=test_set$NumberEmployees,
                y=test_set$PremiumPredict),
            color='blue')

#Multivariable linear regression
stocks <- read.csv("Data_Equities.csv")
stocks

str(stocks)

stocks$MarketCapt <- factor(stocks$MarketCap,
                            levels = c('Small','Mid','Large'),
                            labels = c(1,2,3))

mreg <- lm(formula = ReturnThisYear ~ .,
           data=stocks)
summary(mreg)

mreg <- lm(formula = ReturnThisYear ~ SalesGrowth +
             ProfitGrowth +
             EquityGrowth,
           data=stocks)
summary(mreg)

#Stepwise linear regression

swreg <- lm(formula = ReturnThisYear ~ ReturnPreviousYear +
              SalesGrowth +
              ProfitGrowth +
              EquityGrowth +
              MarketCap,
            data=stocks)
summary(swreg)

swreg <- lm(formula = ReturnThisYear ~ ReturnPreviousYear +
              SalesGrowth +
              ProfitGrowth +
              EquityGrowth +
              MarketCap,
            data=stocks)
summary(swreg)

swreg <- lm(formula = ReturnThisYear ~ ReturnPreviousYear +
              SalesGrowth +
              ProfitGrowth +
              EquityGrowth,
            data=stocks)
summary(swreg)

swreg <- lm(formula = ReturnThisYear ~ SalesGrowth +
              ProfitGrowth +
              EquityGrowth,
            data=stocks)
summary(swreg)

#Polynomial linear regression
stocks$ProfitGrowthSq <- (stocks$ProfitGrowth)^2
preg <- lm(formula = ReturnThisYear ~ SalesGrowth + ProfitGrowthSq +
             EquityGrowth,
           data=stocks)
summary(preg)

#Logistic Regression
#Confusion Matrix
#___________Actual
#Predict |_0_|_1_|
#_______0|_4_|_1_|
#_______1|_1_|_4_|

#Actual & Prediction are both 0: 4 cases
#Actual & Prediction are both 1: 4 cases
#Actual & Prediction are different: 2 cases 
#Error Rate 2/10

Policies <- read.csv("IndividualLifePolicies.csv")
summary(Policies)

set.seed(123)
split = sample.split(Policies$BoughtPolicy, SplitRatio=0.75)
training_set = subset(Policies, split == TRUE)
test_set = subset(Policies, split == FALSE)

#Feature Scaling
#a method to standardize the range of independent variables or features of data
#aka "data normalization" and generally performed during the data preprecessing step


#age varied from 18 to 60 and Salary vaired from 15,000 to 150,000
#after scaling, now they vary from appx. -3 to 3
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

summary(training_set)

ggplot(data=training_set, aes(x=Age, y=Salary))+
  geom_point()

#Fitting Logistic Regression to the Training set
logisticreg <- glm(formula = BoughtPolicy ~.,
                   family = binomial,
                   data = training_set)

#Predicting the Test set results
prob = predict(logisticreg, type = 'response',
               newdata = test_set[-3]) #NOT taking 3rd column

prob

#If probability is greater than 50%, then classify as 1
prediction = ifelse(prob > 0.5, 1, 0)
prediction
#"The" confusion table
results = table(test_set[,3], prediction)
results
#Error Rate = (7+10)/100 = 17%



#Project#
Dental <- read.csv("DentalClaims.csv", na.strings=c(""))
str(Dental)

Dental$ID <- NULL
Dental$Tier <- factor(Dental$Tier)
Dental$Procedure <- factor(Dental$Procedure)
Dental$Occupation <- factor(Dental$Occupation)
Dental$Claim <- factor(Dental$Claim)
Dental$Gender <- factor(Dental$Gender,
                        levels = c('M', 'F'),
                        labels = c(1,2))
Dental$Provider <- factor(Dental$Provider,
                          levels = c('N','A','B','C'),
                          labels = c(1,2,3,4))
str(Dental)

DentalClaims <- Dental[Dental$Claim == 1,]
head(DentalClaims)
summary(DentalClaims)
nrow(DentalClaims)
summary(Dental)

DentalClaims$Claim <- NULL
set.seed(123)

split = sample.split(DentalClaims$Paid, SplitRatio = 0.75)
training_set = subset(DentalClaims, split == TRUE)
test_set = subset(DentalClaims, split == FALSE)

reg <- lm(formula = Paid ~.,
          data=training_set)
summary(reg)


reg <- lm(formula = Paid ~ Provider,
          data=DentalClaims)
summary(reg) #R-squared = 0.03226

reg <- lm(formula = Paid ~ Procedure,
          data=DentalClaims)
summary(reg) #R-squared = 0.9752

test_set$PaidPredict <- predict(reg,newdata=test_set)
test_set$Residual <- test_set$Paid - test_set$PaidPredict
#AE: Actual to Expected
test_set$AE = test_set$Paid / test_set$PaidPredict 


mreg <- lm(formula = Paid~.,
           data=training_set)
summary(mreg) #Adj R Sq = 0.9992

mreg <- lm(formula = Paid ~ Procedure +
             Provider,
           data=training_set) 
summary(mreg) #Adj R Sq = 0.9991

test_set$PaidPredictM <- predict(mreg,
                                 newdata = test_set)
test_set$ResidualM <- test_set$Paid - test_set$PaidPredictM


mydf <- data.frame(
  Tier = c('1'),
  Gender = c('1'),
  Age = 35,
  Procedure = c('4'),
  Occupation = c('1'),
  Provider = c('3')
)

mypred <- predict(mreg, newdata = mydf)
mypred


DentalBinary <- read.csv("DentalClaims.csv", na.strings=c(""))
DentalBinary <- DentalBinary[,c(2,3,4,6,8)]
set.seed(123)

split = sample.split(DentalBinary$Claim, SplitRatio = 0.75)
training_setGLM = subset(DentalBinary, split == TRUE)
test_setGLM = subset(DentalBinary, split == FALSE)

logisticreg <- glm(formula = Claim ~ .,
                   family = binomial,
                   data = training_setGLM)

prob <- predict(logisticreg, type = 'response',
                newdata = test_setGLM[-5])
prob

prediction = ifelse(prob>0.5, 1, 0)
prediction

results = table(test_setGLM[,5], prediction)
results #Error rate 25%

summary(logisticreg)

#Model is accurate 90~100%; 80~90% (good model), 70%~80% (okay)

logisticreg <- glm(formula = Claim ~ Tier + Gender,
                   family = binomial,
                   data = training_setGLM)
prob <- predict(logisticreg, type = 'response',
                newdata = test_setGLM[-5])
prob

prediction = ifelse(prob>0.5, 1, 0)
prediction

results = table(test_setGLM[,5], prediction)
results #Error rate 24%

summary(logisticreg)

#Annuity data
library(caret)
library(rpart)
library(rpart.plot)
library(e1071)
library(ggplot2)
#install.packages("recipes")

getwd()
#setwd("../")
#setwd("Program Files/R/R-3.5.0")
#list.files()

ann <- read.csv("Annuities.csv")
#View(ann)

#head(ann)
#summary(ann)
#str(ann)

ann$Region <- as.factor(ann$Region)
ann$MaritalStatus <- as.factor(ann$MaritalStatus)
#str(ann)

#f <- ggplot(data=ann, aes(x=AnnuitySold)) + geom_bar()
#g <- ggplot(data=ann, aes(x=Age)) + geom_density()
#h <- ggplot(data=ann, aes(x=EducationLevel, fill=AnnuitySold)) +
  #geom_bar()

#j <- ggplot(data=ann, aes(x=Cars, fill=AnnuitySold)) +
  #geom_bar()
#k <- ggplot(data=ann, aes(x=MaritalStatus, fill=AnnuitySold)) +
  #geom_bar()
#m <- ggplot(data=ann, aes(x=Gender, fill=AnnuitySold)) +
  #geom_bar()

#table(ann$AnnuitySold)

ann$HasSLDebt <- as.factor(ifelse(ann$StudentLoanDebt>0, "Y", "N"))
#table(ann$AnnuitySold, ann$HasSLDebt)
#table(ann$AnnuitySold, ann$EducationLevel)

ann$HighIncome <- as.factor(ifelse(ann$AnnualIncome>80000, "Y", "N"))
#table(ann$AnnuitySold, ann$HighIncome)


#Make an interaction variable
ann$NoSLDebt.HighIncome <- as.factor(ifelse(ann$AnnualIncome>80000 &
                                              ann$StudentLoanDebt == 0,
                                            "Y","N"))
ann$NoSLDebt.HighIncome <- NULL
#table(ann$AnnuitySold, ann$NoSLDebt.HighIncome)


#Partition the data
set.seed(123)
partition <- createDataPartition(ann$AnnuitySold,
                                 list=FALSE,p=0.75)
training <- ann[partition,]
test <- ann[-partition,]

nrow(ann)
nrow(training)
nrow(test)

table(ann$AnnuitySold)
table(training$AnnuitySold)
table(test$AnnuitySold)

#Building a decision tree
dt <- rpart(AnnuitySold ~ .,
            data = training)
dt 



#Create decision tree plot
rpart.plot(dt)
rpart.plot(dt, type = 1, extra=101)


#set cutoff point
cutoff <- 0.5
print("Train confusion matrix")

#Create decision tree model
predicted <- predict(dt, type = "prob")[,1]
predicted

#translate the prediction to N or Y
predict.final <- as.factor(ifelse(predicted > cutoff, "N", "Y"))

#Compare the decision tree model results vs. actual results
confusionMatrix(predict.final, factor(training$AnnuitySold))

#Closer look
training["200",]

#Apply training decision tree model to the test set
predicted <- predict(dt, newdata = test, type = "prob")[,1]
predicted

#Translate the prediction to N or Y
predict.final <- as.factor(ifelse(predicted > cutoff, "N", "Y"))

#Compare the decision tree model results vs. actual results
confusionMatrix(predict.final, factor(test$AnnuitySold)) #Again, strong at 90% accuracy


#Decision Tree with custom parameters
#This is a model honing in on specific variables
#with more specific parameters
dt2 <- rpart(AnnuitySold ~ StudentLoanDebt + ChildrenNum,
             data = training,
             control = rpart.control(
               minbucket = 10, #minbucket = increase the observations in a split
               cp = .02, #increase the complex parameter
               maxdepth = 10), #limit the depth of the tree
             parms = list(split = "gini") #split by gini coefficient
             )

rpart.plot(dt2, type = 1, extra=101)

predicted <- predict(dt2, newdata = test, type = "prob")[,1]
predicted
predict.final <- as.factor(ifelse(predicted > cutoff, "N", "Y"))
predict.final
confusionMatrix(predict.final, factor(test$AnnuitySold))


#Random Forest

#install.packages("randomForest")
library("randomForest")
#rfNews()

#Building a Random Forest model

set.seed(100)

#use caret version of random forest
str(training)

rf <- train(AnnuitySold ~ .,
            data = training,
            method = "rf")

plot(rf)

plot(varImp(rf),top=15,
     main = "Variable Importance of Classification Random Forest")

cutoff <- 0.5 #set cutoff value

print("Training confusion matrix")
predicted <- predict(rf, type = "prob")[,1]
predicted.final <- as.factor(ifelse(predicted > cutoff, "N", "Y"))
confusionMatrix(predicted.final,
                factor(training$AnnuitySold))

print("Testing confusion matrix")
predicted <- predict(rf, newdata=test,
                     type = "prob")[,1]
predictd.final <- as.factor(ifelse(predicted > cutoff, "N","Y"))
confusionMatrix(predicted.final,
                factor(training$AnnuitySold))

rf_2 = randomForest(AnnuitySold ~.,
                    data = training,
                    ntree=500, #number of trees being used. typically 100~500 or more
                    mtry=9, #number of predictors that chooses each node. The bigger the greater accuracy
                    importance=TRUE)
rf_2
predicted <- predict(rf_2, newdata = test,
                     type = "prob")[,1]
predicted.final <- as.factor(ifelse(predicted > cutoff,
                                    "N","Y"))
confusionMatrix(predicted.final,factor(test$AnnuitySold))


