## Functions to simulate phenology events given
## input parameters
## M. Espe
## Apr. 2016

## FOR TESTING
## set.seed(123)
## weather <- data.frame(tmin = rnorm(365, 20, 2),
##                       tmax = rnorm(365, 35, 2))

## span <- 100:275


## target_hu <- 2000
## n_sim <- 20
## start <- sample(1:15, size = n_sim, replace = TRUE)

##' Simulate phenology event
##'
##' This function simulates a phenology event given Tmin and Tmax values,
##'     a start (in index value of Tmin/Tmax) and a target heat unit.
##'     The event is considered to occur when the heat units exceed the target.
##' 
##' @title Simulate Phenology
##' @param start a integer vector of start indices. The start index must
##'     coincide with the Tmin and Tmax values. For example, if Tmin and Tmax
##'     are provided for then entire year and the desired start date is Apr 3rd,
##'     the day of year should be provided (94).However, if the first temperature
##'     values are for Apr 1st, the desired start index would be 3. 
##' @param tmin Minimum daily temperature
##' @param tmax Maximum daily temperature
##' @param target_hu The target heat units (i.e., the accumulated heat units
##'     after which the event occurs).
##' @param meas_error logical, should measurement error (+/- 2 days) be added
##'     to the results? (Note: for reproducibility, the set.seed should be used
##'     if adding this to simulations.)
##' @param ... Additional arguments passed to heat_units()
##' @return a vector of event indexes, corresponding to the indices for
##'     the temperature data.
##' @author Matt Espe
##' 
sim_phen <- function(start, tmin, tmax,
                     target_hu, meas_error = TRUE, ...)
    {
        n_sim <- length(start)
        hh <- heat_units(weather$tmin, weather$tmax, ...)

        end <- sapply(start, function(i) {
            tmp <- cumsum(hh)
            ## Add some noise to the measurement
            which(tmp - tmp[i] > target_hu)[1] 
        })
        if(meas_error)
            end <- end + sample(-2:2, n_sim, replace = TRUE)

        return(end)
    }
