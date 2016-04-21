# phenR

Basic package for calculating heat units and calibrating phenology models in R

## Installation

Requires a C compiler to install. For Windows users, install Rtools.

Then, use the `devtools` package to install directly from github.

```r
library(devtools)
install_github("mespe/phenR")
```

**NOTE: Functions might change as packages is being developed.**

TO DO:

  - [ ] Add wrapper function to sum heat units over a specified period
  
  - [X] Warnings and checks on heat\_units()
  
  - [ ] Add function to read weather files
  
  - [ ] Function to calibrate a phenology model given input data
  
  
Please report any issues with code or data to Matt Espe <mespe@ucdavis.edu>
