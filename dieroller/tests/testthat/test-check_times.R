check_times <- function(times) {
  #stop if times is not integer
  if (times%%1 != 0) {
    stop("\n'times' must be an integer")}
  TRUE
}
