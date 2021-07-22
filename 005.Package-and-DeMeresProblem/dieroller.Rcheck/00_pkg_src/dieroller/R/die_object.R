

#' @title check_prob
#' @description check if the input probability is valid
#' @param prob - probability of appearance of each side of a die.
#' @return stops if the probability is not valid
check_prob <- function(prob) {
  #stop if the vector length is invalid
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 2")}
  #stop if the probabilities are either negative or greater than 1
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")}
  #stop if the total probability is not 1
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")}
}

#' @title check_sides
#' @description check if the input sides is valid
#' @param sides - character string of a die's sides
#' @return stops if the sides are not valid
check_sides <- function(sides){
  #stop if there are more or less than six sides
  #stop if the side values are not character
  if (length(sides) != 6 | !is.character(sides)) {
    stop("\n'sides' must be a character vector of length 6")}
}

#' @title die
#' @description creates a valid die
#' @param sides sides of a die
#' @param prob probability of each side to appear
#' @return a die with class "die"
die <- function(
  sides = c("1", "2", "3", "4", "5", "6"),
  prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)){
  ##stop if number of sides and/or prob are not valid.
  check_sides(sides)
  check_prob(prob)
  #res is the result(output) as a list
  res <- list(
    sides = sides,
    prob = prob)
  #assign class
  class(res) <- "die"
  res}

#' @title print.die
#' @description modify the print method of die()
#' @param x a created die
#' @return modified print method
print.die <- function(x) {
  cat('object "die"\n\n')
  side <- x$sides
  prob <- x$prob
  print(data.frame(side,prob))
  invisible(x)
}

#' @title check_times
#' @description check the validity of the input value as a number of die roll
#' @param times number of rolls
#' @return validity TRUE or FALSE
check_times <- function(times) {
  #stop if times is not integer
  if (times%%1 != 0) {
    stop("\n'times' must be an integer")}
  TRUE
  }

#' @title fair_die
#' @description creates a fair die with sides 1~6
#' @return a fair die
fair_die <- die()


#' @title roll
#' @description rolls a die
#' @param die a die created by die() function
#' @param times number of rolls
#' @return result of roll(s) that has a class "roll"
roll <- function(die = fair_die, times = 1){
  #stop conditions
  if (class(die) != "die") {
    stop("\nroll() requires an object 'die'")
  }
  check_times(times)
  #roll: return the result(output) as a list
  res <- list(
  rolls = sample(die$sides, size = times, prob = die$prob, replace = TRUE),
  sides = die$sides,
  prob = die$prob,
  total = length(sample(die$sides, size = times, prob = die$prob, replace = TRUE))
  )
  #assign class
  class(res) <- "roll"
  res
}

#' @title print.roll
#' @description modifies the print method of roll()
#' @param x a created roll object
#' @return modified print method of roll()
print.roll <- function(x) {
  cat('object "roll"\n\n')
  rolls <- x$rolls
  print(rolls)
  invisible(x)
}

#' @title summary.roll
#' @description modifies the summary method of a roll
#' @param x a created roll object
#' @return modified summary method
summary.roll <- function(x) {
  #create a side vector
  side <- x$side
  #create a counter vector
  count <- vector()
  for (i in 1:6){
  count[i] <- length(which(x$rolls == x$sides[i]))}
  #create a proportion vector
  prop <- vector()
  for (i in 1:6){
    prop[i] <- count[i]/x$total}
  #freqs as a dataframe
  freqs <- data.frame(side, count, prop)
  list(freqs)
  #result as a list
  res <- list(freqs)
  names(res) <- "freqs"
  #assign class
  class(res) <- "summary.roll"
  res
  }

#' @title print.summary.roll
#' @description modifies the print method of summary.roll
#' @param x roll
#' @return modified print method of summary.roll
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}



#' @title plot.roll
#' @description defines a plot function for roll
#' @param x roll
#' @return a plot for roll result
plot.roll <- function(x, side = 1, ...) {
  #create a count vector
  count <- vector()
  for (i in 1:6){
    count[i] <- length(which(x$rolls == x$sides[i]))}
  #create a proprotion vector
  prop <- vector()
  for (i in 1:6){
    prop[i] <- count[i]/x$total
  }
  #create a name vector
  names(prop) <- x$sides
  #create a plot
  barplot(prop, xlab = "sides of die",
          ylab = "relative frequencies")
  #title
  title(sprintf("Frequencies in a series of %s die rolls", x$total))
}

#' @title extraction function
#' @description enable extracting an element from roll
#' @param x roll
#' @param i index number
#' @return extraction enabled
"[.roll" <- function(x, i) {
  x$rolls[i]}

#' @title replacement method
#' @description enable replacing an element of roll
#' @param x roll
#' @param i index number
#' @return replacement enabled
"[<-.roll" <- function(x, i, value) {
  #x is a "roll" object
  if (value != x$sides[1] & value != x$sides[2] &
      value != x$sides[3] & value != x$sides[4] &
      value != x$sides[5] & value != x$sides[6]) {
    stop(sprintf('\nreplacing value must be %s', x$sides))}
  x$rolls[i] <- value
  x}

#' @title addition method
#' @description enable adding rolls to an input roll
#' @param obj roll
#' @param incr number of rolls user wants to add
#' @return input rolls + new rolls
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
  res}
