check_sides <- function(sides){
  #stop if there are more or less than six sides
  #stop if the side values are not character
  if (length(sides) != 6 | !is.character(sides)) {
    stop("\n'sides' must be a character vector of length 6")}
}
