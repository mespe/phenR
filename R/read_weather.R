## Functions to read an Oryza weather file
## M. Espe
## Apr. 2016

##' Read Oryza weather files
##'
##' Function to read weather files formated for Oryza into R.
##'
##' @title Read Oryza Weather
##' @param file_path The full file path for the weather file to be read in
##'
##' @return a data.frame with 9 columns (stn, year, day, srad, tmin, tmax, vp, wind, and precip).
##' @author Matt Espe
read_weather <- function(file_path){

    lines <- readLines(file_path, n = 50)
    
    comments <- grep("^[*]|^[!]", lines)
    weather <- read.table(ff[1], skip = max(comments) + 1, sep = ",")
    colnames(weather) <- c("stn", "year", "day", "srad",
                           "tmin", "tmax", "vp", "wind", "precip")
    return(weather)
}
