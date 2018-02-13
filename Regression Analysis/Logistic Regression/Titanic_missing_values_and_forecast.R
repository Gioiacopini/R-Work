#titanic dataset predictions 

#read csv file 
titanic<- read.csv("titanic.csv", header = TRUE)

#check for missing values 
summary(titanic)

#identify number of complete cases 
sum(complete.cases(titanic))

#indentify number of incomplete cases 
sum(!complete.cases(titanic))

#check variables correlation with each other using a corrgram plot
install.packages("corrgram")
library(corrgram)

corrgram(titanic)

#check correlation between the incomplete cases and the other variables.
missing_data<-titanic
missing_data$missing<-as.numeric(!complete.cases(titanic))

corrgram(missing_data)

#impute missing values using multiple imputation
install.packages("mice")
library(mice)

multiple_imputation <- mice( subset(titanic, select = c('survived', 'fare', 'pclass', 'sex', 'age', 'embarked')), m = 5, maxit = 10)
titanic_complete<-complete(multiple_imputation)

sum(complete.cases(titanic_complete))

#split the dataset in train data and test data 

#first 1000 rows is train data 
train_titanic <- titanic_complete[1:1000,]

#remaining observations form the test dataset
test_titanic <- titanic_complete[1001:1309,]

#predict using logistic regression on train set
log_reg<- glm(survived ~ pclass + sex + age , data = titanic_complete)
summary(log_reg)

#we see that pclass, sex, and age is significant in predicting survival 
#we can now assess the model with test set
#subset the test set and select only the statistically significant variables
test2<-subset(test_titanic, select=c(3,4,5))

#make prediction on survival rate
results<- predict(log_reg, newdata = test2, type = "response")

#assign results to 0 or 1 
results<- ifelse(results>0.5,1,0)

#calculate accuracy of resutls comparing it to train set actual results
mean(results==test_titanic$survived)

#this resturn an accuracy value of 81%