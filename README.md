# ivprobit-1.1
ivprobit fit an Instrumental variables probit model using the generalized least squares estimator
# Example
 
 To dwonload the package you can just type install.packages("ivprobit") in R or Rstudio.
 
```R
# load the package 
 library(ivprobit)
```

The data we use in this example represents the Foreign-Exchange Derivatives Use By Large U.S. Bank Holding Companies from 1996 to 2000.

```R
# load the database
 data(eco)
  ```

The function is :

1. The formula is y~x|y2|z
2. y: the dichotomous l.h.s vector
2. x:  the r.h.s. exogenous variables matrix.
3. y2:  the r.h.s. endogenous variables vector or matrix
4. z:  the complete set of instruments (a matrix)
 data: the dataframe

 In this example we have d2 the dichotomus l.h.s vector, the r.h.s exogenous variables are (ltass,roe and div), the r.h.s. endogenous variables matrix is (eqrat,bonus) and the instrumental variables are (ltass,roe,div,gap,cfa).

```R
# fit the instrumental probit model
 pro<-ivprobit(d2~ltass+roe+div|eqrat+bonus|ltass+roe+div+gap+cfa,eco)
 # the results summary
 summary(pro)
 ```
# License
All code is licensed [GPL-3](https://www.gnu.org/licenses/gpl-3.0.en.html)
