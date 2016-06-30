## Functions to calibrate a simple phenology model
## M. Espe
## June 2016

tmp <- cumsum(hh)

obs <- tmp[end] - tmp[start] 
mean(obs)


