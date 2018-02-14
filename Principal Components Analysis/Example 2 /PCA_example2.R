#load data (data on 8 body measumerment of 305 girls)
#this data consist of the correlations among the variables rather than the original data. 
data<- Harman23.cor

#step 1: how many components? 
library(psych)
fa.parallel(data$cov, n.obs = 302, fa="pc", n.iter = 100, show.legend = FALSE, main = "Scree Plot with Parallel Analysis")

#from this graph we can see that 2 principal components can be extracted from this data set. 

#step 2: extract the 2 components
princ_comp<-principal(data$cov, nfactors = 2, rotate = "none")
princ_comp

#2 components explain 82% of variance of the variables. 