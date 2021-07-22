########################################################################################
#Prep
#setwd("C:/Users/SEO/Desktop/Josh/School/UCB/Spring 2018/Stat 133/hw-stat133/hw04/code")
#install.packages("XML")
#rm(list=ls())
library(XML)
library(dplyr)
library(stringr)
library(ggplot2)
########################################################################################



#read_archive#
read_archive <- function(x){
  complete_url <- paste0('http://cran.r-project.org/src/contrib/Archive/',x)
  tbl_html <- readHTMLTable(complete_url)
  data.frame(tbl_html)
}

raw_data <- read_archive('stringr')
raw_data
#read_archive_end#


#clean_archive#
version_names = function(a){
  str_sub(
    unlist(str_split(a$NULL.Name, pattern = '_' ))[c(TRUE, FALSE)]
              )
}

version_numbers = function(a){
  str_sub(
    str_replace(
    unlist(str_split(a$NULL.Name, pattern = '_' ))[c(FALSE, TRUE)],
    pattern = '.tar.gz',
    replacement = ''
    )
  )
}

version_dates = function(a){
  str_sub(a$NULL.Last.modified, end = -7)
}

version_sizes = function(a){
  size_value <- as.numeric(str_replace(a$NULL.Size, pattern = "K|M", replacement = ''))
  size_unit <- str_sub(a$NULL.Size, start = -1)
  which_size_unit <- size_unit == "M" 
  size_value[which_size_unit] <- size_value[which_size_unit] * 1000
  a$NULL.Size <- size_value
}

clean_archive <- function(y){
  y$NULL.Description <- NULL
  index<- which(is.na(y$NULL.Size))
  y <- y[-c(2,index),]
  y <- data.frame(
    as.character(version_names(y)),
    as.character(version_numbers(y)),
    as.Date(version_dates(y)),
    as.numeric(version_sizes(y))
  )
  colnames(y) <- c("name", "version", "date", "size")
  return(y)
  }


write.table(clean_archive(raw_data), file = "../data/splyr-archive.csv", 
            sep = ",",
            col.names = TRUE,
            row.names = FALSE)

z <- clean_archive(raw_data)

#clean_archive_END#

#PLOTTING#
plot_archive <- function(z){
  ggplot(data = z) +
    geom_step(aes(x = z$date, y = z$size)) +
    ggtitle("timeline of version sizes") +
    xlab("date") + ylab("Size (Kilobytes)")
}

plot_archive(z)
#PLOTTING_END#

