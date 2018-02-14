#Principal Components Analysis
#set working directory and install package for PCA
install.packages("psych")
library(psych)

#load data
data<- USJudgeRatings

#step1: decide how many componets to retain
#method: I will select the number of components to retain by examining the eigenvalues of the KxK correlation matrix among the variables.
# Kaiser-Harris criterion suggests retaining components with eigenvalues greater than 1. 

#the following code shows the scree test based on the observed eigenvalues.
fa.parallel(data[,-1], fa="pc", n.iter = 100, show.legend = FALSE, main = "Scree Plot with Parallel Analysis")
# from this plot we can see that only 1 component has a eigenvalue greater than 1, therefore we will estraxt 1  principal component

#step2 Extracting the component. 
princ_comp<- principal(data[,-1], nfactors = 1)
princ_comp
#from this we can see that the PC accounts for 92percent of variance of the all the variables. 
#the PC1 column contains the correcation of the variables with the ptincipla component. 
#the h2 column contains the component communalities (the amount of variance in each variable explained by the component)
#the u2 column contains the uniqueness of the compoment (the amount of variance not accounted for by the component)

#the goal of PCA is to replace a larger set of correlated variables with a smaller set of derived variables. to do so, 
#we need to obtain scored for each observation on the components
head(princ_comp$scores)
