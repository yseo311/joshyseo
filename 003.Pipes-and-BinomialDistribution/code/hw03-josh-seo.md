HW3
================
Josh Seo
3/19/18

    #Bash commands (window user)
    2.1
    cut -d "," -f 2 nba2017-roster.csv | tail +2 | sort | uniq | head -n 5 > team-names.txt

    2.2
    cut -d "," -f 3 nba2017-roster.csv | tail +2 | sort | uniq | head -n 5 > position-names.txt

    2.3
    cut -d "," -f 7 nba2017-roster.csv | tail +2 | sort -n | uniq -c | head -n 5 > experience-counts.txt

    2.4
    grep -e LAC -e team nba2017-roster.csv > LAC.csv
    cat LAC.csv

    2.5
    grep -e LAL nba 2017-roster.csv | cut -d "," -f 6 | tail +2 | sort -n | uniq -c

    **2.6
    cut -c 2 -d "," -f 2 nba2017-roster.csv | sort | grep CLE | uniq -c

    2.7
    grep -e GSW -e team nba2017-roster.csv | cut -d "," -f 1,4,5 > gsw-height-weight.csv
    cat gsw-height-weight.csv

    2.8
    (cut -d "," -f 1,8 nba2017-roster.csv | grep salary & sort -k 8 -n -r -t "," nba2017-roster.csv | cut -d "," -f 1,8 | head -n 10) > top10-salaries.csv

``` r
#1 Assume that the “successful” event is getting a “six” when rolling a die. Consider rolling a fair die 10 times. Use bin_probability() to find the probability of getting exactly 3 sixes.
source('./code/binomial-functions.R')

bin_probability(10,3,(1/6))
```

    ## [1] 0.1550454

``` r
#2 Use bin_distribution() to obtain the distribution of the number of “sixes” when rolling a loaded die 10 times, in which the number “six” has probability of 0.25. Make a plot of this distribution.
z <- bin_distribution(10, 0.25)
z
```

    ##    success  probability
    ## 1        0 5.631351e-02
    ## 2        1 1.877117e-01
    ## 3        2 2.815676e-01
    ## 4        3 2.502823e-01
    ## 5        4 1.459980e-01
    ## 6        5 5.839920e-02
    ## 7        6 1.622200e-02
    ## 8        7 3.089905e-03
    ## 9        8 3.862381e-04
    ## 10       9 2.861023e-05
    ## 11      10 9.536743e-07

``` r
plot(z)
```

![](images/part%203-1.png)

``` r
#3 Use bin_probability(), and a for loop, to obtain the probability of getting more than 3 heads in 5 tosses with a biased coin of 35% chance of heads.
j = 0
answer <- for(i in 4:5){
  j <- j + bin_probability(5,i,0.35)
}
j
```

    ## [1] 0.0540225

``` r
#4 Use bin_distribution() to obtain the probability distribution of the number of heads when tossing a loaded coin 15 times, with 35% chance of heads. Make a plot of this distribution.
w <- bin_distribution(trials = 15, prob = 0.35)
w
```

    ##    success  probability
    ## 1        0 1.562069e-03
    ## 2        1 1.261672e-02
    ## 3        2 4.755531e-02
    ## 4        3 1.109624e-01
    ## 5        4 1.792469e-01
    ## 6        5 2.123387e-01
    ## 7        6 1.905604e-01
    ## 8        7 1.319264e-01
    ## 9        8 7.103729e-02
    ## 10       9 2.975066e-02
    ## 11      10 9.611752e-03
    ## 12      11 2.352527e-03
    ## 13      12 4.222484e-04
    ## 14      13 5.246873e-05
    ## 15      14 4.036056e-06
    ## 16      15 1.448841e-07

``` r
plot(w)
```

![](images/part%203-2.png)
