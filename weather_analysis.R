setwd("C:\\Users\\lenovco\\Onedrive\\Desktop\\R Datasets\\Weather Data")
getwd()
#Read Data 
Chicago<- read.csv("Chicago-F.csv", row.names = 1)
Chicago
#We have used row.names=1 so that it takes the row names from the first column and the values in the first column become row names 
NewYork<- read.csv("NewYork-F.csv", row.names = 1)
Houston<- read.csv("Houston-F.csv", row.names = 1)
SanFrancisco<- read.csv("SanFrancisco-F.csv", row.names = 1)

Chicago
NewYork
Houston
SanFrancisco

is.data.frame(Chicago)

#Convert DataFrame to Matrix
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

is.matrix(Chicago)

#Lets put these into a list 
Weather <- list(Chicago = Chicago, NewYork= NewYork, Houston = Houston, SanFrancisco = SanFrancisco)
Weather

#Lets try it out 
Weather[[3]]
Weather[3]
Weather$Houston
?apply

apply(Chicago, 1, mean)
# Analyze one city 
apply(Chicago,1, max)
apply(Chicago, 1, min)
# For Practice 
apply(Chicago, 2, max)
apply(Chicago, 2, min)
#Compare 
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)
                                #<<<<< deliverable but there is a faster way
# Using lapply 
?lapply
mynewlist <- lapply(Weather, t) #t(Weather$Chicago), t(Weather$NewYork), t(Weather$Houston), t(Weather$SanFrancisco)
#example 2
lapply(Weather, rbind, NewRow = 1:12)
#example 3 
?rowMeans
rowMeans(Chicago) #identical to apply apply(Chicago, 1, mean)
lapply(Weather, rowMeans)
# deliveerable, even better but will improve 

#Combining lapply with []
Weather
Weather$Chicago[1,1]
Weather[[1]][1,1]

lapply(Weather, "[",1,1) #This line of code runs Weather[[i]] by default, we are adding the next square brackets to specify the row number and the column number
lapply(Weather, "[",1,)
lapply(Weather, "[",,3)

#Adding our own functions 
lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[,12])

lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,], 2))
                                                  #deliverable 2: temp fluctuations. Will improve

#Using sapply()
?sapply

#AvgHifg_F for july 
lapply(Weather, "[", 1,7)
sapply(Weather, "[", 1,7)
#AvgHigh_F for 4th quarter
lapply(Weather, "[", 1, 10:12)
sapply(Weather, "[", 1, 10:12)

#Another Example 
round(sapply(Weather, rowMeans),2) #deliverable 1: Awesome 

#Another Example 
sapply(Weather, function(z) round((z[1,]-z[2,])/z[2,], 2))  #deliverable 2: Awesome 

# if we add simplify = FALSE, sapply will return a list

# Nesting apply functions
lapply(Weather, rowMeans)

Chicago
apply(Chicago, 1, max)
#Apply across whole list
sapply(Weather, apply,1, max) # preferred approach 

#Other way 
sapply(Weather, function(x) apply(x,1,max))

#Deliverables 
sapply(Weather, apply,1, max) #deliverable 3
sapply(Weather, apply,1, min) #deliverable 4

# very advanced tutorial 
#which.max()
?which.max
Chicago[1,]
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
#Doing it for all the rows. We will have to lappy or sapply over components of the list
apply(Chicago, 1, function(x) names(which.max(x)))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.min(x))))

