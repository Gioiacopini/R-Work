# Principal Components Analysis (PCA)

The goal of PCA is to replace a large number of correlated variables with a smaller number of uncorrelated variables while capturing as much information as in the original variables as possible.

The derived variables are called principal components and are linear combinations of the observed variables.
The first principal component is the one that accounts for the most variance in the original set of variables. The second principal component, and all the others to follow, also maximise the variance accounted for however, they are uncorrelated with all other principal components.

To put PCA into practice I used the data set USJudgeRatings which contains lawyer's ratings of state judges in the US Superior Court.

The variables in the dataset are listed below:
1. CONT = N. of contacts of lawyer with judge
2. INTG = Judical integrity
3. DMNR = Demeanor
4. DILG = Diligence
5. CFMG = Case flow managing
6. DECI = Prompt decisions
7. PREP = Preparation for trial
8. FAMI = Familiarity with law
9. ORAL = Sound oral rulings
10. WRIT = Sound written rulings
11. PHSY = Physical ability
12. RTEN = Worthy of retention

My goal is to simplify the data and I will approach this problem with PCA. 
