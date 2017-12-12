\name{ivProbit-package}
\alias{ivProbit-package}
\alias{ivProbit}
\docType{package}
\title{
Instrumental variables probit model 
}
\description{
ivprobit fit an Instrumental variables probit model using the generalized least squares estimator 
}
\details{
\tabular{ll}{
Package: \tab ivprobit\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-09-18\cr
License: \tab Artistic-2.0\cr
}
}

\author{
Zaghdoudi Taha

Zaghdoudi Taha <zedtaha@gmail.com>

}

\examples{
#load data
dat<-system.file("data","eco.RData",package="ivprobit")
load(dat)
pro<-ivprobit(d2~ltass+roe+div,cbind(eqrat,bonus)~ltass+roe+div+gap+cfa,mydata)
summary(pro)
}
