

#' @title die object
#' @description a die 
#' @param object - a vector that contains values on 6 sides
#' @param probability - a vector that contains probabilities of each sides being appeared.
#' @return table of sides and corresponding probabilities

#auxiliary function "check_prob" checks vaildity of the input "prob" for "die(sides, prob)"
check_prob <- function(prob) {
  #stop if the vector length is invalid
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 2")
  }
  #stop if the probabilities assigned are invalid
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
}

#auxiliary function "check_prob" checks vaildity of the input "sides" for "die(sides, prob)"
check_sides <- function(sides){
  if (length(sides) != 6 | !is.character(sides)) {
    stop("\n'sides' must be a character vector of length 6")}
}


#die function
die <- function(
  sides = c("1", "2", "3", "4", "5", "6"),
  prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)){
  ##stop if number of sides and/or prob are not valid.
  check_sides(sides)
  check_prob(prob)
  res <- list(
    sides = sides,
    prob = prob)
  class(res) <- "die"
  res
}


#print method for object of class "die"
print.die <- function(x) {
  cat('object "die"\n\n')
  side <- x$sides
  prob <- x$prob
  print(data.frame(side,prob))
  invisible(x)
}

# die with non-standard sides
weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
weird_die

# create a loaded die
loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
loaded_die

###bad sides
#bad_die <- die(sides = c('a', 'b', 'c', 'd', 'e'))
###removed to prevent error when knitting

###bad prob
#bad_die <- die(sides = c('a', 'b', 'c', 'd', 'e', 'f'), prob = c(0.2, 0.1, 0.1, 0.1, 0.5, 0.1))
###removed to prevent error when knitting

check_times <- function(times) {
  #stop if times is not integer
  if (times%%1 != 0) {
    stop("\n'times' must be an integer")}
  TRUE}


#create a fair die
fair_die <- die()

#roll function
roll <- function(die = fair_die, times = 1){
  #stop conditions
  if (class(die) != "die") {
    stop("\nroll() requires an object 'die'")
  }
  check_times(times)
  #roll
  res <- list(
  rolls = sample(die$sides, size = times, prob = die$prob, replace = TRUE),
  sides = die$sides,
  prob = die$prob,
  total = length(sample(die$sides, size = times, prob = die$prob, replace = TRUE))
  )
  class(res) <- "roll"
  res  
}


#print method for object of function "roll"
print.roll <- function(x) {
  cat('object "roll"\n\n')
  rolls <- x$rolls
  print(rolls)
  invisible(x)
}


#50 rolls of a fair die
set.seed(123)
fair50 <- roll(fair_die, times = 50)
fair50

#fair_50rolls
set.seed(123)
fair_50rolls <- roll(fair_die, times = 50)
fair_50rolls


#what's in fair50?
names(fair50)
fair50$rolls
fair50$sides
fair50$prob
fair50$total


# string die
str_die <- die(sides = c('a', 'b', 'c', 'd', 'e', 'f'),
               prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
# roll 20 times
set.seed(123)
str_rolls <- roll(str_die, times = 20)
names(str_rolls)
str_rolls

#Summary method
#summary.roll
summary.roll <- function(x) {
  side <- x$side
  #create a counter vector
  count <- vector()
  for (i in 1:6){
  count[i] <- length(which(x$rolls == x$sides[i]))}
  #create a proportion vector
  prop <- vector()
  for (i in 1:6){
    prop[i] <- count[i]/x$total}
  #class(res) <- "summary.roll"
  freqs <- data.frame(side, count, prop)
  list(freqs)
  res <- list(freqs)
  names(res) <- "freqs"
  class(res) <- "summary.roll"
  res
  }

#print.summary.roll
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}

#fair50 summary
fair50_sum <- summary(fair_50rolls)
fair50_sum
class(fair50_sum)
names(fair50_sum)


#Plots
plot.roll <- function(x, side = 1, ...) {
  #create a vector "a" that contains counts
  count <- vector()
  for (i in 1:6){
    count[i] <- length(which(x$rolls == x$sides[i]))}
  #create a vector "b" that contains proportions
  prop <- vector()
  for (i in 1:6){
    prop[i] <- count[i]/x$total
  }
  names(prop) <- x$sides
  barplot(prop, xlab = "sides of die", 
          ylab = "relative frequencies")
  title(sprintf("Frequencies in a series of %s die rolls", x$total))
}
plot(fair_50rolls)



#Additional Methods

#example
# roll fair die
set.seed(123)
fair_die <- die()
fair500 <- roll(fair_die, times = 500)
# summary method
summary(fair500)

# extracting roll in position 500
"[.roll" <- function(x, i) {
  x$rolls[i]}

fair500[500]

# replacing last roll
"[<-.roll" <- function(x, i, value) {
  #x is a "roll" object
  if (value != x$sides[1] & value != x$sides[2] & 
      value != x$sides[3] & value != x$sides[4] &
      value != x$sides[5] & value != x$sides[6]) {
    stop(sprintf('\nreplacing value must be %s', x$sides))}
  x$rolls[i] <- value
  x}
fair500[500] <- 1
fair500[500]
summary(fair500)


# adding 100 rolls
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament (must be positive)")}
  more_die <- die()
  more_roll <- roll(more_die, times = incr)
  res <- list(sides = obj$sides, 
              rolls = (c(obj$rolls, more_roll$rolls)), 
              prob = obj$prob, 
              total = obj$total + more_roll$total)
  class(res) <- "roll"
  res
  }
  
fair600 <- fair500 + 100
summary(fair600)

# plot method
plot(fair500, 500)

