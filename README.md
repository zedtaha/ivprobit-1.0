---
output: github_document
---

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1109726.svg)](https://doi.org/10.5281/zenodo.1109726)

# ivprobit-1.1

ivprobit fits an instrumental variables probit model using the generalized least squares estimator. To dwonload the package you can just type `install.packages("ivprobit")` in R or Rstudio.

# Example


```r
# load the package 
library(ivprobit)
```

The data we use in this example represents the Foreign-Exchange Derivatives Use By Large U.S. Bank Holding Companies from 1996 to 2000.


```r
# load the database
data(eco)
```

The function uses a formula interface, with two arguments:

1. The formula is specified using `y~x|y2|z` notation, where:
    1. y: the dichotomous l.h.s vector
    2. x: the r.h.s. exogenous variables matrix
    3. y2: the r.h.s. endogenous variables vector or matrix
    4. z: the complete set of instruments (a matrix)
2. data: the dataframe

In this example we have d2 the dichotomus l.h.s vector, the r.h.s exogenous variables are (ltass,roe and div), the r.h.s. endogenous variables matrix is (eqrat,bonus) and the instrumental variables are (ltass,roe,div,gap,cfa).


```r
# fit the instrumental probit model
pro <- ivprobit(d2 ~ ltass+roe+div|eqrat+bonus|ltass+roe+div+gap+cfa, data = eco)
# the results summary
summary(pro)
```

```
##                 Coef        S.E.  t-stat   p-val  
## Intercep -1.6862e+01  9.7317e+00 -1.7327 0.08355 .
## ltass     9.4760e-01  6.2070e-01  1.5267 0.12724  
## roe       6.6492e-02  1.1312e-01  0.5878 0.55684  
## div       2.0378e-06  4.2745e-06  0.4767 0.63368  
## eqrat     9.4371e+00  1.2937e+01  0.7295 0.46593  
## bonus    -1.4173e-06  2.8163e-06 -0.5032 0.61493  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
# License

All code is licensed [GPL-3](https://www.gnu.org/licenses/gpl-3.0.en.html)
