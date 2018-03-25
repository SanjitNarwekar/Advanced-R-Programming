# Author: Sanjt Narwekar
# Repo: https://github.com/SanjitNarwekar/Advanced-R-Programming


# function factorial_loop -----------------------------------------------------
#
# This function uses a for loop to calculate factorials. The function expects 
# only a postive integer as an input.
#
#------------------------------------------------------------------------------

# load libraries --------------------------------------------------------------

library(purrr)
library(installr)


# Define functions ------------------------------------------------------------

factorial_loop <- function(x) {
  
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
  
  for (i in (x - 1):1) {
    x <- abs(x)
    x <- x * i
  }
  x
}


