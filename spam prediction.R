install.packages("caret")
library(caret)
install.packages("kernlab")
library(kernlab)
View(spam)
# STEP 1
# we are trying to build an algorithm that predicts spam from non spam. We are using the spam data set
# What we did was split the spam data into training (75%) and testing (25%), called Data Slicing.
inTrain <- createDataPartition(y=spam$type, p=0.75, list = FALSE)
head(inTrain)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(spam)
dim(training)
str(training)
dim(testing)
str(testing)

set.seed(32343)
# STEP 2 
# Next Step we fit a model. Use all variables in the training data set to predict type
modelFit <- train(type~., data = training, method = "glm")
modelFit

# Some results:
# Generalized Linear Model 

# 3451 samples
# 57 predictor
# 2 classes: 'nonspam', 'spam'

# Resampling results
# Accuracy   Kappa      Accuracy SD  Kappa SD  
# 0.9177176  0.8268451  0.008658224  0.01757575

# STEP 3
# CREATE PREDICTIONS
# on the testing data set 
predictions <- predict(modelFit, newdata = testing)
predictions

# STEP 4 <- EVALUATE MODEL FIT  USING confusionMatrix command
# pass in the predictions you obtained from the predict command used on testing data set
# and then the actual outcome on the testing sample

confusionMatrix(predictions, testing$type )

# Confusion Matrix result and Statistics

#Reference
#Prediction nonspam spam
#nonspam     668   48
#spam         29  405

#Accuracy : 0.933          
#95% CI : (0.917, 0.9468)
#No Information Rate : 0.6061         
#P-Value [Acc > NIR] : < 2e-16        

#Kappa : 0.8587         
#Mcnemar's Test P-Value : 0.04024        

#Sensitivity : 0.9584         
#Specificity : 0.8940         
#Pos Pred Value : 0.9330         
#Neg Pred Value : 0.9332         
#Prevalence : 0.6061         
#Detection Rate : 0.5809         
#Detection Prevalence : 0.6226         
#Balanced Accuracy : 0.9262         

#'Positive' Class : nonspam




