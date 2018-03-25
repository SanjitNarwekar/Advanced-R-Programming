# Author: Sanjt Narwekar
# Repo: https://github.com/SanjitNarwekar/Advanced-R-Programming


# function factorial_func -----------------------------------------------------
#
# This function uses recursion to calculate factorials. The function expects 
# only a postive integer as an input.
#
#------------------------------------------------------------------------------

# load libraries --------------------------------------------------------------

library(purrr)
library(microbenchmark)
library(installr)



# Define functions ------------------------------------------------------------

factorial_func <- function(x) {
  
  check.integer <- installr:::check.integer
  
  if (x == 0 ||  x == -0 || x == 1){
    return(1)
  }
  
  if (!check.integer(x)){
    message("Input ",x," is not an integer. abs(x) used. Results will not tally with internal R function")
    
  }
  
  if ( x < 0 ){
    message("Input ",x," is not positive. abs(x) used. Results will not tally with internal R function")
  }
  
  x * factorial_func(x - 1)
  x
}



# Test functions --------------------------------------------------------------

input <- c(4.5, 1.5)

# Check if all functions produce the same results. R's built-in function
# factorial() is used to compare the results
factorial(input)
map_dbl(input, factorial_reduce)
