hw01-josh-seo
================
Josh Seo
2/23/18

HW1\_Part 2: Data Import
------------------------

``` r
library(readr)
#vector of column names
column_names <- c('symboling', 
                  'normalized-losses', 
                  'make', 'fuel_type', 
                  'aspiration', 
                  'num_of_doors', 
                  'body_style', 
                  'drive_wheels', 
                  'engine_location', 
                  'wheel_base', 
                  'length', 
                  'width', 
                  'height', 
                  'curb_weight', 
                  'engine_type', 
                  'num_of_cylinders', 
                  'engine_size', 
                  'fuel_system', 
                  'bore', 
                  'stroke', 
                  'compression_ratio', 
                  'horsepower', 
                  'peak_rpm', 
                  'city_mpg',
                  'highway_mpg', 
                  'price')

#vector of column types
column_types <- c('double',
                  'double',
                  'character',
                  'character',
                  'character',
                  'character',
                  'character',
                  'character',
                  'character',
                  'double',
                  'double',
                  'double',
                  'double',
                  'integer',
                  'character',
                  'character',
                  'integer',
                  'character',
                  'double',
                  'double',
                  'double',
                  'integer',
                  'integer',
                  'integer',
                  'integer',
                  'integer')

#import using read.csv
imports85_2 <- read.csv (file = 'imports-85.data',
                         header = TRUE, 
                         col.names = column_names, 
                         colClasses = column_types, 
                         sep = ",", 
                         na = "?")
str(imports85_2, vec.len=1)
```

    ## 'data.frame':    204 obs. of  26 variables:
    ##  $ symboling        : num  3 1 ...
    ##  $ normalized.losses: num  NA NA ...
    ##  $ make             : chr  "alfa-romero" ...
    ##  $ fuel_type        : chr  "gas" ...
    ##  $ aspiration       : chr  "std" ...
    ##  $ num_of_doors     : chr  "two" ...
    ##  $ body_style       : chr  "convertible" ...
    ##  $ drive_wheels     : chr  "rwd" ...
    ##  $ engine_location  : chr  "front" ...
    ##  $ wheel_base       : num  88.6 94.5 ...
    ##  $ length           : num  169 ...
    ##  $ width            : num  64.1 65.5 ...
    ##  $ height           : num  48.8 52.4 ...
    ##  $ curb_weight      : int  2548 2823 ...
    ##  $ engine_type      : chr  "dohc" ...
    ##  $ num_of_cylinders : chr  "four" ...
    ##  $ engine_size      : int  130 152 ...
    ##  $ fuel_system      : chr  "mpfi" ...
    ##  $ bore             : num  3.47 2.68 ...
    ##  $ stroke           : num  2.68 3.47 ...
    ##  $ compression_ratio: num  9 9 ...
    ##  $ horsepower       : int  111 154 ...
    ##  $ peak_rpm         : int  5000 5000 ...
    ##  $ city_mpg         : int  21 19 ...
    ##  $ highway_mpg      : int  27 26 ...
    ##  $ price            : int  16500 16500 ...

``` r
#import using read_csv
imports85_2 <- read_csv("imports-85.data",  
          col_names = column_names,
          col_types = list(
           'symboling' = col_double(),
           'normalized_losses' = col_character(),
           'make' = col_character(), 
           'fuel_type' = col_character(),
           'aspiration' = col_character(), 
           'num_of_doors' = col_character(),
           'body_style' = col_character(),
           'drive_wheels' = col_character(),
           'engine_location' = col_character(),
           'wheel_base' = col_double(),
           'length' = col_double(),
           'width' = col_double(),
           'height' = col_double(),
           'curb_weight' = col_integer(),
           'engine_type' = col_character(),
           'num_of_cylinders' = col_character(),
           'engine_size' = col_integer(),
           'fuel_system' = col_character(),
           'bore' = col_double(),
           'stroke' = col_double(),
           'compression_ratio' = col_double(),
           'horsepower' = col_integer(),
           'peak_rpm' = col_integer(),
           'city_mpg' = col_integer(),
           'highway_mpg' = col_integer(),
           'price' = col_integer()
                         ),
          na = "?"
        )
```

    ## Warning: The following named parsers don't match the column names:
    ## normalized_losses

``` r
str(imports85_2, vec.len=1)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    205 obs. of  26 variables:
    ##  $ symboling        : num  3 3 ...
    ##  $ normalized-losses: int  NA NA ...
    ##  $ make             : chr  "alfa-romero" ...
    ##  $ fuel_type        : chr  "gas" ...
    ##  $ aspiration       : chr  "std" ...
    ##  $ num_of_doors     : chr  "two" ...
    ##  $ body_style       : chr  "convertible" ...
    ##  $ drive_wheels     : chr  "rwd" ...
    ##  $ engine_location  : chr  "front" ...
    ##  $ wheel_base       : num  88.6 88.6 ...
    ##  $ length           : num  169 ...
    ##  $ width            : num  64.1 64.1 ...
    ##  $ height           : num  48.8 48.8 ...
    ##  $ curb_weight      : int  2548 2548 ...
    ##  $ engine_type      : chr  "dohc" ...
    ##  $ num_of_cylinders : chr  "four" ...
    ##  $ engine_size      : int  130 130 ...
    ##  $ fuel_system      : chr  "mpfi" ...
    ##  $ bore             : num  3.47 3.47 ...
    ##  $ stroke           : num  2.68 2.68 ...
    ##  $ compression_ratio: num  9 9 ...
    ##  $ horsepower       : int  111 111 ...
    ##  $ peak_rpm         : int  5000 5000 ...
    ##  $ city_mpg         : int  21 21 ...
    ##  $ highway_mpg      : int  27 27 ...
    ##  $ price            : int  13495 16500 ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 26
    ##   .. ..$ symboling        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ normalized-losses: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ make             : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ fuel_type        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ aspiration       : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ num_of_doors     : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ body_style       : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ drive_wheels     : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ engine_location  : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ wheel_base       : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ length           : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ width            : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ height           : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ curb_weight      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ engine_type      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ num_of_cylinders : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ engine_size      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ fuel_system      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" ...
    ##   .. ..$ bore             : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ stroke           : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ compression_ratio: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" ...
    ##   .. ..$ horsepower       : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ peak_rpm         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ city_mpg         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ highway_mpg      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   .. ..$ price            : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" ...
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" ...
    ##   ..- attr(*, "class")= chr "col_spec"

HW1\_Part 3: Technical Questions - Importing Data
-------------------------------------------------

``` r
#   a. If we do not define any column names and import a data using read.csv, it does not show the column names.It prints just the data.
#   b. If we do not define any column nammes and import a data using read.csv with the header=FALSE, it prints the vector number on the top of each column as in forms of V1, V2,...
#   c. If we do not specify how missing values are codified when reading the table functions, it will keep its value as "?" and it will cause errors when using functions with the data.
#   d. Not as told in the question, when tested, the data imported with column types specified had smaller object size than the data with column types not specified. We can assume that assigning integer type to a value with double value would limit and decrease the size of the data.
#   e. If the data frame 'dat' is converted into a R matrix, then the data frame will be come an array with certain degree with numeric values. 
```

HW1\_Part 4: Practice Base Plotting
-----------------------------------

``` r
#historgram
colors <- c("red", "blue", "green", "yellow", 
            "cyan", "magenta", "black", "white", "purple")
hist(imports85_2$price, col=colors)
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
#box-plot
boxplot(imports85_2$horsepower, 
        data = imports85_2, 
        horizontal = TRUE, 
        main = "Horsepower of Automobile", 
        xlab = "Automobile", 
        ylab = "HP")
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-3-2.png)

``` r
typeof(imports85_2$horsepower)
```

    ## [1] "integer"

``` r
summary(imports85_2$horsepower)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##    48.0    70.0    95.0   104.3   116.0   288.0       2

``` r
#bar-plot
count <- sort(table(imports85_2$body_style), decreasing = TRUE)
barplot(count,
        main="Body Style Frequency", 
        xlab = "Body Style",
        ylab = "Frequency"
        )
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-3-3.png)

``` r
#stars-plot
turbo.data <- data.frame(imports85_2[imports85_2$aspiration == "turbo",])
stars(turbo.data[c(10:13, 26)], locations = NULL, len=1, key.loc = c(18,10),
      key.labels = c("wheel_base", "length", "width", "height", "price"),
      scale = TRUE, radius  =  TRUE, full = TRUE,
      col.segments = 1:5, col.stars = NA, col.lines = NA,
      main = "Turbo Summary")
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-3-4.png)

HW1\_Part 5: Summaries
----------------------

``` r
#What is the mean price of fuel_type gas cars?
mean(imports85_2$price[imports85_2$fuel_type=="gas"], na.rm = TRUE)
```

    ## [1] 12916.41

``` r
#What is the mean price of fuel_type diesel cars?
mean(imports85_2$price[imports85_2$fuel_type=="diesel"], na.rm = TRUE)
```

    ## [1] 15838.15

``` r
#What is the make of the car with twelve num_of_cylinders?
imports85_2$make[imports85_2$num_of_cylinders == "twelve"]
```

    ## [1] "jaguar"

``` r
#What is the price of the car with the largest amount of hoursepower?
imports85_2$price[max(imports85_2$horsepower, na.rm = TRUE)]
```

    ## [1] NA

``` r
#what is the bottom 10th percentile of city_mpg?
quantile(imports85_2$city_mpg, 0.1)
```

    ## 10% 
    ##  17

``` r
#what is the top 10th percentile of highway_mpg?
quantile(imports85_2$highway_mpg, 0.9)
```

    ## 90% 
    ##  38

``` r
#what is the median price of those cars in the bottom 10th percentile of city_mpg?
Bottom10_citympg.data <- data.frame(
  imports85_2[imports85_2$city_mpg <= quantile(imports85_2$city_mpg, 0.1),]
  )
median(Bottom10_citympg.data$price, na.rm = TRUE)
```

    ## [1] 32250

HW1\_Part 6: Technical Questions - Data Frames
----------------------------------------------

``` r
#    a. If you attempt to use names that do not exist after the $ operator, it returns NULL
#    b. 4. mtcars[ ,mpg] fails to return, because the vector mpg is not written in the quotes("").
#    c. For a data frame [] the bracket is single square operator. two coordinates separated by comma thus cell value from first column = 1 numeric coordinate use "mpg". [[]] is to select single element
#    d. YES. When we assign names to the column, we can either use c() or list() to combine the list of more than one names we want to give to the columns at once. But the order is very important, as it counts the order by the vector number.
#    e. as.list gives TRUE or FALSE value to the names. So, if you do not specify, it would return error regarding false values.
#    f. Use as.data.frame(abc)
```

HW1\_Part 7: Correlations of quantitative variables
---------------------------------------------------

``` r
library(stats)
library(corrplot)
```

    ## corrplot 0.84 loaded

``` r
qdat <- na.omit(imports85_2[-c(1:9, 15, 16, 18)])
Q <- cor(qdat)

#Correlogram 1
corrplot.mixed(Q, lower = "number", upper = "color", lower.col = "pink", number.cex = .7)
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
#Correlogram 1
corrplot(Q, method = "circle", order = "hclust", tl.col = "green", tl.srt = 45, bg = "lavender")
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-6-2.png)

``` r
#We can replace "lower" or "upper" with "color", "number", "pie", "circle", etc. If "lower" is a number, number.cex returns the size of it. You can change or assign a color with "lower.col".

#It seems like some variables (i.e. rpm, mpg's) have strong negative correlations as shown in red, while all other values except stroke and compression ration have strong positive correlations as shown in blue. The two excetions in white do not have strong correlations.
```

HW1\_Part 8: Principal Components Analysis
------------------------------------------

``` r
#Run PCA
#Ref: "stats:::print.summary.princomp"
pca_prcomp <- prcomp(qdat, scale. = TRUE)
eigenvalue <- pca_prcomp$sdev^2
eigenvalue_rounded <- round(eigenvalue, digits = 2)
PoV <- pca_prcomp$sdev^2/sum(pca_prcomp$sdev^2)
cumsum(PoV)
```

    ##  [1] 0.5379868 0.7007890 0.7876557 0.8526282 0.8961241 0.9258172 0.9487172
    ##  [8] 0.9680133 0.9766068 0.9845068 0.9903346 0.9949218 0.9985929 1.0000000

``` r
#tabulation
matrix <- matrix(c(eigenvalue, PoV*100 , cumsum(PoV)*100), ncol = 3)
colnames(matrix) <- c("Eigenvalue", "PoV", "Cum. Sum")
PoV_rounded <- round(matrix, digits = 2)
#three PC's
PoV_rounded[1:3,]
```

    ##      Eigenvalue   PoV Cum. Sum
    ## [1,]       7.53 53.80    53.80
    ## [2,]       2.28 16.28    70.08
    ## [3,]       1.22  8.69    78.77

``` r
#PCA plots

# loadings or weights
loadings <- pca_prcomp$rotation 
round(loadings, 3)
```

    ##                      PC1    PC2    PC3    PC4    PC5    PC6    PC7    PC8
    ## wheel_base         0.288 -0.292  0.130 -0.240  0.040 -0.091  0.293 -0.295
    ## length             0.328 -0.163  0.127 -0.147  0.007 -0.003  0.228 -0.017
    ## width              0.324 -0.126 -0.052 -0.093 -0.129 -0.124  0.459 -0.197
    ## height             0.111 -0.400  0.476 -0.392  0.002  0.082 -0.605  0.026
    ## curb_weight        0.352 -0.062 -0.054  0.015 -0.057 -0.046  0.013  0.136
    ## engine_size        0.322  0.081 -0.250  0.182 -0.084 -0.175 -0.269 -0.241
    ## bore               0.259  0.004  0.166  0.394  0.317  0.764  0.029 -0.223
    ## stroke             0.052 -0.115 -0.704 -0.479  0.433  0.194 -0.136 -0.014
    ## compression_ratio  0.015 -0.520 -0.284  0.168 -0.499  0.316  0.066  0.476
    ## horsepower         0.298  0.302 -0.141  0.086 -0.131  0.065 -0.240  0.053
    ## peak_rpm          -0.081  0.446  0.058 -0.527 -0.490  0.441  0.122 -0.124
    ## city_mpg          -0.309 -0.272 -0.114  0.086 -0.155  0.034 -0.028 -0.459
    ## highway_mpg       -0.319 -0.222 -0.115  0.088 -0.141  0.063 -0.061 -0.470
    ## price              0.319  0.070 -0.135  0.107 -0.366 -0.110 -0.335 -0.266
    ##                      PC9   PC10   PC11   PC12   PC13   PC14
    ## wheel_base         0.318 -0.404  0.352 -0.409 -0.102  0.092
    ## length             0.448  0.277 -0.647  0.170 -0.153 -0.164
    ## width             -0.660  0.362  0.100  0.077 -0.059  0.023
    ## height            -0.179  0.164  0.096  0.069 -0.038  0.012
    ## curb_weight        0.183  0.058  0.161  0.219  0.850  0.109
    ## engine_size        0.212 -0.018  0.320  0.569 -0.383  0.088
    ## bore              -0.095 -0.071  0.004  0.040  0.009 -0.006
    ## stroke            -0.073 -0.025 -0.084 -0.025  0.020 -0.023
    ## compression_ratio  0.030 -0.071  0.064 -0.025 -0.170  0.030
    ## horsepower         0.180  0.544  0.184 -0.579 -0.072 -0.088
    ## peak_rpm           0.076 -0.067  0.078  0.177  0.013  0.021
    ## city_mpg           0.100  0.139  0.142  0.037  0.186 -0.698
    ## highway_mpg        0.128  0.279 -0.165 -0.080  0.097  0.665
    ## price             -0.268 -0.436 -0.459 -0.209  0.117 -0.068

``` r
eigs <- eigenvalue
eigs_perc <- 100 * eigs / sum(eigs)
eigs_cum <- cumsum(eigs_perc)

eigs_df <- data.frame(
  eigenvalue = eigs,
  percentage = eigs_perc,
  'cumulative percentage' = eigs_cum
)

print(round(eigs_df, 4), print.gap = 2)
```

    ##     eigenvalue  percentage  cumulative.percentage
    ## 1       7.5318     53.7987                53.7987
    ## 2       2.2792     16.2802                70.0789
    ## 3       1.2161      8.6867                78.7656
    ## 4       0.9096      6.4973                85.2628
    ## 5       0.6089      4.3496                89.6124
    ## 6       0.4157      2.9693                92.5817
    ## 7       0.3206      2.2900                94.8717
    ## 8       0.2701      1.9296                96.8013
    ## 9       0.1203      0.8594                97.6607
    ## 10      0.1106      0.7900                98.4507
    ## 11      0.0816      0.5828                99.0335
    ## 12      0.0642      0.4587                99.4922
    ## 13      0.0514      0.3671                99.8593
    ## 14      0.0197      0.1407               100.0000

``` r
plot(pca_prcomp$x, type = "n", las = 1)
abline(h = 0, v = 0)
points(pca_prcomp$x[ ,1], pca_prcomp$x[ ,2], pch = 19, 
       col = "#88888877")
title(main = "PC Plot of Customers")
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-7-1.png)

``` r
plot(loadings[,1], loadings[,2],
     xlim=c(-1,1), ylim=c(-1,1),
     main='Loadings for PC1 vs. PC2',
     xlab="PC1", ylab="PC2")
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-7-2.png)

``` r
biplot(pca_prcomp, scale = 0, main = "Biplot")
```

![](hw01-josh-seo_files/figure-markdown_github/unnamed-chunk-7-3.png)
