# Author: Sanjt Narwekar
# Repo: https://github.com/SanjitNarwekar/Advanced-R-Programming


# function factorial_mem -----------------------------------------------------
#
# This function uses memoisation to calculate factorials. The function expects 
# only a postive integer as an input.
#
#------------------------------------------------------------------------------

# load libraries --------------------------------------------------------------

library(purrr)
library(installr)

check.integer <- installr:::check.integer

# Create lookup table for memoization with 0 and 1 as  the 1st 2 values and 65 NA's
# This should give fast calculation of values of 0 and 1 and 65 other numbers sfter 
# they have been calculated atleast once.


fact_tbl <- c(rep(NA, 65))

factorial_mem <- function(x) {
  
  if (x == 0 ||  x == -0 || x == 1){
    return(1)
  }
  
  stopifnot(x>0)
  stopifnot(check.integer(x))
  
  
  if (!is.na(fact_tbl)[x])
    return(fact_tbl[x])
  fact_tbl[x] <<- x * factorial_mem(x - 1)
  fact_tbl[x]
}



