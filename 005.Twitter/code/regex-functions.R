#2.1) Splitting Characters
split_chars <- function(x) {
  func <- strsplit(x, "")
  return(unlist(func))
}

split_chars('Go Bears!')
split_chars('Expecto Patronum')


#2.2) Number of Vowels 
vowels <- c("a","e","i","o","u")
num_vowels <- function(y){
  num_vowels = vector(mode = "integer", length = 5)
  for (j in seq_along(vowels)) {
    num_aux = str_count(tolower(y), vowels[j])
    num_vowels[j] = sum(num_aux)
  }
  names(num_vowels) = vowels
  num_vowels
}

vec <- c('G','o','','B','e','a','r','s','!')
num_vowels(vec)


#2.3) Counting Vowels
count_vowels <- function(z){
  z <- tolower(z)
  character <- split_chars(z)
  vowel <- num_vowels(character)
  return(vowel)
}

count_vowels("The quick brown fox jumps over the lazy dog")
count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")



#2.4) Reversing Characters
reverse_chars <- function(string)
{
  string_split = strsplit(string, split = "")
  rev_order = nchar(string):1
  reversed_chars = string_split[[1]][rev_order]
  paste(reversed_chars, collapse="")
}

reverse_chars("gattaca")
reverse_chars("Lumox Maxima")


#2.5) Reversing Sentences by Words
reverse_words <- function(string)
{
  string_split = strsplit(as.character(string), split = " ")
  string_length = length(string_split[[1]])
  if (string_length == 1) {
    reversed_string = string_split[[1]]
  } else {
    reversed_split = string_split[[1]][string_length:1]
    reversed_string = paste(reversed_split, collapse = " ")
  }
  return(reversed_string)
}

reverse_words("sentence! this reverse")
reverse_words("string")