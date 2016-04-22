## Functions to simulate phenology events given
## input parameters
## M. Espe
## Apr. 2016

span <- 100:275
hh <- heat_units(weather$tmin[span], weather$tmax[span])

target_hu <- 2000
n_sim <- 20
start <- sample(1:15, size = n_sim, replace = TRUE)

end <- sapply(start, function(i) {
    tmp <- cumsum(hh)
    which(tmp - tmp[i] > target_hu)[1]
})

cbind(start, end)
