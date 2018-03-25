# Author: Sanjt Narwekar
# Repo: https://github.com/SanjitNarwekar/Advanced-R-Programming


# function factorial_reduce -----------------------------------------------------
#
# This function uses the reduce function to calculate factorials. The function expects 
# only a postive integer as an input.
#
#------------------------------------------------------------------------------

# load libraries --------------------------------------------------------------

library(purrr)
library(installr)



# Define functions ------------------------------------------------------------

factorial_reduce <- function(x) {
  
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
  
  reduce(1:x, `*`)
  
}


