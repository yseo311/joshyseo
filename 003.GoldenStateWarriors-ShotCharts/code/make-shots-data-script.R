#title: Data Prep 
#description: Data preparation phase, of which the goal is to create a csv data file "shots-data.csv" that will contain the required variables to be used in the visualization phase.
#input(s):stephen-curry.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, andre-iguodala.csv
#outputs(): adjusted data sets, combined data set, summaries, etc.
library(readr)
library(ggplot2)
library(dplyr)
#set working directory
#setwd("C:/Users/SEO/Desktop/영찬/학교/UCB/Spring 2018/Stat 133/hw-stat133/hw02")

#PART 2.1 & PART 3

#data import
curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)

#adjust data: add name
curry["name"] = "Stephen Curry"
green["name"] = "Draymond Green"
durant["name"] = "Kevin Durant"
thompson["name"] = "Klay Thompson"
iguodala["name"] = "Andre Iguodala"

#adjust data: shots made and missed
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "made_shot"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "missed_shot"
green$shot_made_flag[green$shot_made_flag == "y"] <- "made_shot"
green$shot_made_flag[green$shot_made_flag == "n"] <- "missed_shot"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "made_shot"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "missed_shot"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "made_shot"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "missed_shot"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "made_shot"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "missed_shot"

#adjust data: minute scored
mutate(curry, minute = ((period*12) - minutes_remaining)) -> curry
mutate(green, minute = ((period*12) - minutes_remaining)) -> green
mutate(durant, minute = ((period*12) - minutes_remaining)) -> durant
mutate(thompson, minute = ((period*12) - minutes_remaining)) -> thompson
mutate(iguodala, minute = ((period*12) - minutes_remaining)) -> iguodala
mutate(shots_data, minute = ((period*12) - minutes_remaining)) -> shots_data


#sink summary
sink(file = "./output/stephen-curry-summary.txt")
summary(curry)
sink()
sink(file = "./output/draymond-green-summary.txt")
summary(green)
sink()
sink(file = "./output/kevin-durant-summary.txt")
summary(durant)
sink()
sink(file = "./output/klay-thompson-summary.txt")
summary(thompson)
sink()
sink(file = "./output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

#combine dataframes
shots_data <- rbind(curry, green, durant, thompson, iguodala)
write.csv(shots_data, file = "./data/shots-data.csv")


#shots_data_summary
sink(file = "./output/shots-data-summary.txt")
summary(shots_data)
sink()



