\name{ivprob}
\alias{ivprob}
\title{Instrumental Variables Probit function}
\usage{
ivprob(y, x1, y2, x)
}
\arguments{
  \item{y}{is the dichotomous l.h.s.}

  \item{x1}{is the r.h.s. exogenous variables}

  \item{y2}{is the r.h.s. endogenous variables}

  \item{x}{is the complete set of instruments}
}
\value{
Coefficients: a named vector of coefficients

se: a named vector of standard error

tval: a named vector of wald statistics

pval: a named vector P-values

df: the degree of freedom
}
\description{
Instrumental Variables Probit function
}
\author{
Zaghdoudi Taha
}

