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
