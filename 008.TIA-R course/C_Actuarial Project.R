#Task 1
library(tidyr)
library(dplyr)
library(ggplot2)

setwd("C:/Users/yseo0/Documents/Infinite Actuary - R Course/TIA_R_DataVizActProj_Files")
getwd()

Dental <- read.csv("DentalClaims.csv", na.strings=c(""))
Dental

summary(Dental)
str(Dental)

Dental$ID <- factor(Dental$ID)
Dental$Tier <- factor(Dental$Tier)
Dental$Procedure <- factor(Dental$Procedure)
Dental$Occupation <- factor(Dental$Occupation)
Dental$Provider <- factor(Dental$Provider)
Dental$Claim <- factor(Dental$Claim)

#Task 2
ggplot(data=Dental, aes(x=Claim)) +
  geom_histogram(stat="count", aes(fill=Claim))

p <- ggplot(Dental, aes(x=Claim, color=Gender,
                        fill=Gender))

p + geom_histogram(stat="count", aes(fill=Gender))

p + geom_histogram(stat="count") +
  facet_grid(.~Gender)

#Task 3
DentalClaims <- Dental[Dental$Claim == 1,]
DentalClaims
head(DentalClaims)
summary(DentalClaims)
nrow(DentalClaims)
nrow(Dental)

s <- ggplot(data=DentalClaims, aes(x=Age))
s + geom_density(fill="lightgreen")

q <- ggplot(data=DentalClaims, aes(x=Paid))
q + geom_density(fill="lightblue")

#Task 4
t <- ggplot(DentalClaims, aes(x=Provider,
                              y=Paid,
                              color=Provider))
t + geom_boxplot(size=1) 

t + geom_boxplot(size=1) + geom_jitter()

b <- ggplot(DentalClaims, aes(x=Provider,
                              y=Paid,
                              color=Provider))

b + geom_boxplot(size=1) + 
  geom_jitter() +
  xlab("Dental Provider Code") +
  ylab("Dental Claim Paid Dollars ($)") +
  ggtitle("How Much Do Dentists Charge?") +
  theme(axis.title.x = element_text(color="Black", size=20),
        axis.title.y = element_text(color="Black", size=20),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color = "DarkGreen",
                                  size = 20))

#Bonus
r <- ggplot(DentalClaims, aes(x=Age,
                              y=Paid,
                              color=Provider))
r + geom_point() +
  facet_grid(.~Procedure)

#Next - D


 

