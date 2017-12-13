---
title: 'ivporbit:An R package to estimate the instrumental variables probit model'
authors: 
   -name: Taha Zaghdoudi
    orcid: 0000-0002-4488-5774
    affiliation: 1
affiliations:
   -name: Faculty of Law, Economics and Management of Jendouba, Tunisia
   index: 1
date: 13 December 2017
bibliography: paper.bib
---

# Summary
Many econometrics study are focused in various kinds of misspecification
in the limited-dependent variable models such as correlation between
regressors and error term which produce inconsistent results. To avoid
this problem we apply the instrumental variable method in which we use
the correlated variables as instruments. A two-stage method are used by
some authors [@blundell2004endogeneity] to fit the probit model but
it produce non efficient result.

However, [@newey1987efficient] expose an efficient way to
estimate limited-dependent variable model by using the Amemiya's
Generalized Least Squares estimators [@Amemiya1978]. The idea is to
include in the two-stage model a continuous endogenous regressor. This
method is used when the MLE fail to estimate the model.

[ivprobit CRAN](https://cran.r-project.org/web/packages/ivprobit/index.html)

[Repository](https://github.com/cran/ivprobit)

[Archive](https://zenodo.org/record/1109726#.Wi_UzlXibIU)

# References
