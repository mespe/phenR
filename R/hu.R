## Wrapper function for C code to calculate heat units
## M. Espe
## July 2015

##' Calculate heat units
##'
##' Takes a vector of daily minimum and maximum temperatures,
##'     and returns a vector of daily heat units
##'
##' @title Heat Units
##' @param tmin vector of daily minimum temperatures
##' @param tmax vector of daily maximum temperatures
##' @param tbase base cardinal temperature for development
##' @param topt optimimum temperature for development
##' @param thigh maximum temperature for development
##' @return vector of daily heat units
##' @author Matt Espe
heat_units <- function(tmin, tmax,
                       tbase = 8, topt = 30, thigh = 42)
{
    .C('heat_units', n = as.integer(length(tmin)),
       t_min = as.numeric(tmin),
       t_max = as.numeric(tmax),
       ans = as.numeric(rep(0, length(tmin))),
       t_base = as.numeric(tbase),
       t_opt = as.numeric(topt),
       t_high = as.numeric(thigh))$ans
    
}
