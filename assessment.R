#set wotking directory 

install.packages("pacman")
library(pacman)

pacman::p_load(rmarkdown)

#read data and create a data set 
file.choose()
leaders<- read.csv("leaders.csv", header = TRUE)
summary(leaders)


leaders

#question 1 
table(leaders$result)

leaders$success<- ifelse(leaders$result == "dies between a day and a week" |
                         leaders$result == "dies between a week and a month" |
                         leaders$result == "dies within a day after the attack" |
                         leaders$result == "dies, timing unknown", 1, 0)

table(leaders$success)

#table that tells me the percentage of the deaths VS survivors
prop.table(table(leaders$success))

#question 2
#a)
beforemax<- max(leaders$politybefore)
beforemin<- min(leaders$politybefore)

leaders$polity.pre01<-(leaders$politybefore-beforemin)/(beforemax-beforemin)

#shorter formula
leaders$polity.pre01<-(leaders$politybefore-min(leaders$politybefore))/(max(leaders$politybefore)-min(leaders$politybefore))

#b)
aftermax<- max(leaders$polityafter)
aftermin<- min(leaders$polityafter)

leaders$polity.post01<-(leaders$polityafter-aftermin)/(aftermax-aftermin)

#shorter formula
leaders$polity.post01<-(leaders$polityafter-min(leaders$polityafter))/(max(leaders$polityafter)-min(leaders$polityafter))

#Quqestion 3 - cross sectional comparison

avg_success_post<- mean(leaders[leaders$success==1,"polity.post01"])
avg_fail_post<-mean(leaders[leaders$success==0, "polity.post01"])

#cannot be assessed because of significance
#comment this

#question 4 - before and after analysis 

bef_after<- (mean(leaders[leaders$success==1,"polity.post01"]))-(mean(leaders[leaders$success==1,"polity.pre01"]))


#question 5 - difference in difference
avg_success_post<- mean(leaders[leaders$success==1,"polity.post01"])
avg_success_pre<- mean(leaders[leaders$success==1,"polity.pre01"])

avg_fail_post<-mean(leaders[leaders$success==0, "polity.post01"])
avg_fail_pre<-mean(leaders[leaders$success==0, "polity.pre01"])

diff_bef_after_fail<-(mean(leaders[leaders$success==0, "polity.post01"]))-(mean(leaders[leaders$success==0, "polity.pre01"]))
diff_bef_after_success<-(mean(leaders[leaders$success==1,"polity.post01"]))-(mean(leaders[leaders$success==1,"polity.pre01"]))

diff_of_diff<- (diff_bef_after_fail)-(diff_bef_after_success)

#question 6

leaders$warbefore<- ifelse(leaders$interwarbefore==1|leaders$civilwarbefore==1,1,0)
leaders$warafter <- ifelse(leaders$interwarafter==1|leaders$civilwarafter==1,1,0)

#difference in difference estimate



