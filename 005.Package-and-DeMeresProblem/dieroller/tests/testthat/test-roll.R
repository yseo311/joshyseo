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
