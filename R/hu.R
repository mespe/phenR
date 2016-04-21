## Wrapper function for C code to calculate heat units
## M. Espe
## July 2015

##' Calculate heat units
##'
##' Takes a vector of daily minimum and maximum temperatures,
##'     and returns a vector of daily heat units. Heat units are
##'     calculated by summing over approximated hourly temperatures.
##'
##' @title Heat Units
##' @param tmin vector of daily minimum temperatures
##' @param tmax vector of daily maximum temperatures
##' @param t_base base cardinal temperature for development
##' @param t_opt optimimum temperature for development 
##' @param t_high maximum temperature for development 
##'
##' @return vector of daily heat units
##' @author Matt Espe 
heat_units <- function(tmin, tmax,
                       t_base = 8, t_opt = 30, t_high = 42)
{
    if(!all(tmax > tmin))
       stop("Tmax must be greater than associated Tmin")
    if(any(is.na(c(tmin, tmax))))
       stop("NAs not allowed")
           
    .C('heat_units', n = as.integer(length(tmin)),
       t_min = as.numeric(tmin),
       t_max = as.numeric(tmax),
       ans = as.numeric(rep(0, length(tmin))),
       t_base = as.numeric(t_base),
       t_opt = as.numeric(t_opt),
       t_high = as.numeric(t_high),
       cos_vals = as.numeric(cos(0.2618 * -13:10) / 2))$ans
    
}
