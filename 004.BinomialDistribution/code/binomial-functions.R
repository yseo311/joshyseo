#setwd("C:/Users/SEO/Desktop/영찬/학교/UCB/Spring 2018/Stat 133/hw-stat133/hw03/code")

##IS INTEGER############################
#' @title is function an integer
#' @description determines if x is an integer
#' @param x numerical value
#' @return logical determination
 
is_integer <- function(x){
  if (x %% 1 == 0){
                    return (TRUE)
                  } 
  else {
    return (FALSE)
        }
}

#' @examples 
#TRUEs
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)
#FALSEs
is_integer(2.1)
is_integer(pi)
is_integer(0.01)


##IS POSITIVE############################
#' @title is function positive
#' @description determines whether x is positive
#' @param x numerical value
#' @return logical determination

is_positive <- function (x) {
  if (x <= 0) {
    return(FALSE)
                } 
  else if (x >0){
    return (TRUE)
                }
}

#' @examples 
is_positive(0.01)
is_positive(2)
is_positive(-2)
is_positive(0)

##IS NONNEGATIVE############################
#' @title is function nonnegative
#' @description determines if x is a nonnegative
#' @param x numerical value
#' @return logical determination

is_nonnegative <- function (x) {
  if (x < 0) {
    return(FALSE)
            } 
  else if (x >= 0){
    return(TRUE)
                  }
}

#' @examples 
#TRUEs
is_nonnegative(0)
is_nonnegative(2)
#FALSEs
is_nonnegative(-0.00001)
is_nonnegative(-2)

##IS POSITIVE INTEGER############################
#' @title is function positive integer
#' @description determines if x is a positive and an integer
#' @param x numerical value
#' @return logical determination

is_positive_integer <- function(x){
  if (is_positive(x) & is_integer(x)){
    return(TRUE)
                                      } 
  else if (!is_positive(x)){
    return(FALSE)
                            } 
  else if (!is_integer(x)){
    return(FALSE)
                          }
}

#' @examples
#TRUEs
is_positive_integer(2)
is_positive_integer(2L)
#FALSEs
is_positive_integer(0)
is_positive_integer(-2)

##IS Nonnegative INTEGER############################
#' @title is function nonnegative integer
#' @description determines if x is nonnegative and integer
#' @param x numerical value
#' @return logical determination

is_nonneg_integer<- function(x){
  if (is_nonnegative(x) & is_integer(x)){
    return(TRUE)
  } 
  else if (!is_nonnegative(x)){
    return(FALSE)
  } 
  else if (!is_integer(x)){
    return(FALSE)
  }
}

#' @examples 
#TRUEs
is_nonneg_integer(0)
is_nonneg_integer(1)
#FALSEs
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)

##IS PROBABILITY############################
#' @title is function a probability
#' @description determines if x is a probability
#' @param x numerical value
#' @return logical determination
is_probability <- function(x){
  if (0<= x  & x<= 1){
    return(TRUE)
  } 
  else {
    return(FALSE)
  }
}

#' @examples 
#TRUEs
is_probability(0)
is_probability(0.5)
is_probability(1)
#FALSEs
is_probability(-1)
is_probability(1.000001)

##BIN FACTORIAl############################
#' @title factorial 
#' @description factorial of a nonnegative integer
#' @param x nonnegative integer
#' @return computed factorial
bin_factorial <- function(x){
  if(x==0 | x==1){
    return(1)
    }
  else{
    xfac=1
    for(i in 1:x){
      xfac<- xfac*((1:x)[i])
    } 
    return (xfac)
  }
  }

#' @examples 
bin_factorial(5)
bin_factorial(0)
  
##BIN COMBINATION############################
#' @title combination
#' @description number of combinations in which k successes can occur in n trials.
#' @param k nonnegative integer
#' @param n nonnegative integer
#' @return computed value
bin_combinations <- function(n, k){
  bin_factorial(n) / (bin_factorial(k) * bin_factorial(n-k))
}

#' @examples 
bin_combinations(n = 5, k = 2)
bin_combinations(10, 3)
bin_combinations(4, 4)


##BIN Probability############################
#' @title probability
#' @description calculate the probability with the given trials, successes, single probability)
#' @param trials nonnegative integer
#' @param success nonnegative integer
#' @param probability real number in between 0 and 1 (can be 0 or 1)
#' @return computed value

bin_probability <- function(trials, success, probability)
{if (is_nonneg_integer(trials) & is_nonneg_integer(success) & is_probability(probability)){
  bin_combinations(trials, success) * (probability ^ success) * ((1 - probability)^(trials - success))
}
  else{stop("invaid inputs")}}

#' @examples
bin_probability(trials = 5, success = 2, probability = 0.5)


##BIN distribution############################
#' @title distribution
#' @description finds the distribution
#' @param trial nonnegative integer
#' @param prob real number in between 0 and 1 (can be 0 or 1)
#' @return chart

bin_distribution <- function(trials, prob){
  col1 = c(0:trials) #index list
  col2 = col1 #probability column
  
  for (i in 0:trials){
      col2[1+i] = 
        bin_probability(prob=prob, trials=trials, success = i)
  } 
  
    return(data.frame(cbind(success = col1, probability = col2)))
}

#' @example
a = bin_distribution(trials = 5, prob = 0.5)
a
summary(a)



