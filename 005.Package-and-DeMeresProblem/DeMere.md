Chevalier De Mere’s problem
================
Josh Seo
April 24, 2018

``` r
knitr::opts_chunk$set(echo = TRUE)
#setwd("C:/Users/SEO/Desktop/Josh/School/UCB/Spring 2018/Stat 133/hw-stat133/hw05")
library(dieroller)
```

Problem 1
=========

``` r
#create a fair die
fair_die <- die()
#roll the die 4000 times
rolls_4000 <- roll(fair_die, 4000)

#a is a sequence of numbers 1, 5, 9, 13,...,3997
a <- seq(1, 4000, 4)

#b is a sequence of numbers 4, 8, 12, 16,...,4000
b <- seq(4, 4000, 4)

#c is a list that will contain number of "6" in every 4 rolls
c <- vector()

#Count the number of "6" in [1:4], [5:8],...,[3997:4000] and store it in c[1:1000]
for (i in 1:1000){
c[i] <- sum(rolls_4000$rolls[a[i]:b[i]] == "6")
}

#count the number of "4-roll-game" that has at least one "6"
sum(c[1:1000] != 0)
```

    ## [1] 506

``` r
#Relative frequency of "4-roll-game" with at least one "6"
sum(c[1:1000] != 0)/1000
```

    ## [1] 0.506

``` r
#Analytical Computation
1 - (5/6)^4
```

    ## [1] 0.5177469

``` r
#Result
#We can conclude that the empirical data we obtained through the experiment is very close to the analytically computed value
```

Problem 2
=========

``` r
#roll the die 48000 times
rolls_48000 <- roll(fair_die, 48000)

#x is a sequence of every odd numbers
x <- seq(1, 48000, 2)

#y is a sequence of every even numbers
y <- seq(2, 48000, 2)

#z is a list that will contain number of "6" in every 4 rolls
z <- vector()

#Count the number of "6" in every couple rolls
for (i in 1:24000){
z[i] <- sum(rolls_48000$rolls[x[i]:y[i]] == "6")
}

#count the number of double-"6" in every 24 double-rolls
  #m is a sequence of 1, 25, 49,..., 23977
  m <- seq(1, 24000, 24)
  #n is a sequence of  24, 48, 72,..., 24000
  n <- seq(24, 24000, 24)
  #k is a number of double-"6" in every 24 double-rolls
  k <- vector()
    for (l in 1:1000){
      k[l] <- sum(z[m[l]:n[l]] == 2)
    }

#Number of "24-double-roll-game" in which there is at least one double "6"
sum(k[1:1000] != 0)
```

    ## [1] 451

``` r
#Relative frequency of "24-roll-game" with at least one double "6"
sum(k[1:1000] != 0)/1000
```

    ## [1] 0.451

``` r
#Analytical Computation
1 - (35/36)^24
```

    ## [1] 0.4914039

``` r
#Result
#We can conclude that the empirical data we obtained through the experiment is very close to the analytically computed value
```
