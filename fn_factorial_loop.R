# Author: Sanjt Narwekar
# Repo: https://github.com/SanjitNarwekar/Mastering-Software-Development-in-R


# function factorial_loop -----------------------------------------------------
#
# This function uses a for loop to calculate factorials. The function expects 
# only a postive integer as an input..
#
#------------------------------------------------------------------------------

# load libraries --------------------------------------------------------------

library(purrr)
library(microbenchmark)
library(installr)


# Define functions ------------------------------------------------------------

factorial_loop <- function(x) {
  
  if (x == 0 ||  x == -0 || x == 1){
    return(1)
  }
  
  if (!check.integer(x)){
    message("Input ",x," is not an integer. abs(x) used. Results will not tally with internal R function")
    
  }
  
  if ( x < 0 ){
    message("Input ",x," is not positive. abs(x) used. Results will not tally with internal R function")
  }
  
  for (i in (x - 1):1) {
    x <- abs(x)
    x <- x * i
  }
  x
}

# Test functions --------------------------------------------------------------

input <- c(4.5, 1.5)

# Check if all functions produce the same results. R's built-in function
# factorial() is used to compare the results
factorial(input)
map_dbl(input, factorial_loop)