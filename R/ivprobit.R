#'Foreign-Exchange Derivatives Use By Large U.S. Bank Holding Com-panies (1996-2000).
#'
#' @docType data
#' @name  eco
#' @usage data(eco)
#' @format A data frame with 794 rows and 22 variables
NULL


#'Instrumental Variables Probit function
#'
#'@param formula y~x|y1|x2 whre y is the dichotomous l.h.s.,x is the r.h.s. exogenous variables, 
#' y1 is the r.h.s. endogenous variables and x2 is the complete set of instruments
#'@param data the dataframe
#'@importFrom stats lm glm binomial coef as.formula model.frame model.matrix model.response na.omit update vcov pchisq printCoefmat pt
#'@import Formula
#'
#'@examples
#'############################################
#'# Fit the ivprobit model
#'############################################
#'# Load data
#'data(eco)
#'############################################
#'pro<-ivprobit(d2~ltass+roe+div|eqrat+bonus|ltass+roe+div+gap+cfa,eco)
#'summary(pro)
#'
#'@export
ivprobit<-function(formula,data){
  fm<-formula
  mf <- match.call(expand.dots = FALSE)
  m <- match(c("formula", "data", "subset", "na.action"), names(mf), 0)
  mf <- mf[c(1, m)]
  ffm <- Formula::Formula(fm)
  mf[[1]] <- as.name("model.frame")
  mf$formula <- ffm
  fffm<-update(ffm, ~ . -1| . -1|. -1)
  mf <- model.frame(formula=fffm, data=data)
  x1 <- model.matrix(fffm, data = mf, rhs = 1)
  y2 <- model.matrix(fffm, data = mf, rhs = 2)
  x <- model.matrix(fffm, data = mf, rhs = 3)
  y<-model.response(mf)
  y<- as.matrix(y)
  X<-as.matrix(x)
  Y<-as.matrix(y2)
  X1<-as.matrix(x1)
  one<-matrix(1,length(y),1)
  XX<-matrix(c(one,X),ncol=ncol(X)+1)
  XX1<-matrix(c(one,X1),ncol=ncol(X1)+1)
  Z<-cbind(XX1,Y)
  d<-invpd(t(XX)%*%XX)%*%t(XX)%*%Z
  kx = ncol(X)
  ky = ncol(Y)                               
  #-----------------------------
  lin<-lm(y2~X)
  yhat<-lin$fitted.values
  uhat<-lin$residuals
  #-----------------------------
  d<-chol2inv(chol(t(XX)%*%XX))%*%t(XX)%*%Z
  #step2
  prob<-glm(y~X+uhat,family=binomial(link="probit"))
  J=glmvcov(prob)
  alph=prob$coefficients 
  alpha=alph[1:(kx+1)]
  lam = alph[(kx+2):(kx+ky+1)]
  Jinv=J[1:(kx+1),1:(kx+1)]
  #step3
  prob2<-glm(y~X1+uhat+yhat,family = binomial("probit"))
  bet=prob2$coefficients
  beta = bet[(length(bet)-ky+1):length(bet)]
  rho = lam-beta
  #step4
  rhoY=Y%*%rho
  ry =  rhoY
  lin2<-lm(ry~X)
  v2=vcov(lin2)
  omega =(v2+Jinv)
  #step5
  cov=invpd(t(d)%*%invpd(omega)%*%d)
  se = sqrt(diag(cov))
  delt = cov%*%t(d)%*%invpd(omega)%*%alpha
  df=nrow(x1)-ncol(x)
  r1<-lm(y~X1+yhat)
  mr1<-cbind(y,X1,yhat)
  names<-c("Intercep",colnames(x1),colnames(y2))
  out<-list(coefficients=delt,se=se,tval=(delt/se),pval=2*pt(-abs(delt/se), df=df),df=df,names=names,mr1=mr1)
  class(out) <- "ivprobit"
  # Return results.
  return(out)
}

invpd<-function(mat){
  
  chol2inv(chol(mat))
  
}
glmvcov<-function(obj){
  so<-summary(obj,corr=F)
  so$dispersion * so$cov.unscaled
  
}

#' Summary
#' 
#' @param object is the object of the function
#' @param ... not used
#' @export
summary.ivprobit<-function(object,...)
{
  res<-cbind(coef(object),object$se,object$tval,object$pval)
  
  rownames(res) <- object$names
  colnames(res) <- c("Coef","S.E.","t-stat","p-val")
  printCoefmat(res,P.values=TRUE,has.Pvalue=TRUE)
  
}
