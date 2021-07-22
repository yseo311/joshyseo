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
