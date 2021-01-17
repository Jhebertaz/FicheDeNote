###################
## FicheDeCalcul ##
###################

#################
## Sample Mean ##
#################

#n:taille
#sig:standart deviation
mux  = mu
sigx = sig/sqrt(n) 

####################
## Binomial Count ##
####################

#n:taille
#p:probability of success
mu  = n*p
sig = sqrt(n*p*(1-p))
binom.test()

#######################
## Sample Proportion ##
#######################

#n:taille
#p:proportion of success
mu  = p
sig = sqrt(p*(1-p)/n)

#########################
## Confidence Interval ##
#########################

conf_interval <-function(estimate,margin_error){
  ic<-(estimate*c(1,1)+c(-1,1)*margin_error)
  return(ic)
}

##############
## Estimate ##
##############

## Quantile Function ##

## QuantileToDensity
#z:Normal Distribution
#t:T Distribution
dist_density <- function(distribution="z",qq,dl=NULL){
  ifelse (distribution=="z",pnorm(q=qq,lower.tail = TRUE),
          ifelse(distribution=="t",pt(q=qq,df=dl,lower.tail = TRUE),
                 NA))
}

## DensityToQuantile
#z:Normal Distribution
#t:T Distribution
dist_quant <- function(distribution="z",pp=0.025,dl=NULL){
  ifelse (distribution=="z",qnorm(p=pp,lower.tail = TRUE),
          ifelse(distribution=="t",qt(p=pp,df=dl,lower.tail = TRUE),
                 NA))
}

#####################
## Margin of Error ##
#####################

m = dist_quantile*standart_error

#############
## Exemple ##
#############

#########################
## Comparing Two Means ##
#########################

## 7.2.56 ########################################
## Level
alpha <- 0.05
## Sizes
n1    <- 16
n2    <- 13
## Observed means
mu1   <- 1130
mu2   <- 781
## Estimated variances (Square-root)
s2    <- 6.0
s1    <- 191
## Standart Error
se    <- sqrt( ((s1^2)/n1) + ((s2^2)/n2))
# Conservative approach
dl    <- min(n1-1,n2-1)
## Critical value (alpha = 5% -> alpha/2 pour test bilatéral)
tstar <- qt(p=alpha/2,df=dl,lower.tail = F)
## Margin of Error
m     <- tstar*se 
## Two-sample t statistic
tt    <- (mu1-mu2)/se
### Confidence interval
IC    <- c(-1,1)*m + c(1,1)*(mu1-mu2)
## p-value for two-sided alternative (valeur-p du test bilatéral)
p_val <- 2*pt(q=abs(tt),df=dl,lower.tail = FALSE)
##################################################
## Conclusion ##
#La valeur-p du test bilatéral est < 0.05 (alpha=5%), 
## on rejette l’hypothèse (nulle) selon laquelle le score moyen au test est égal au niveau 5%
# Sinon
#La valeur-p du test bilatéral est > 0.05 (alpha=5%), 
## les données ne fournissent pas de preuve à l’encontre de l'hypothèse nulle au niveau 5%

###############################
## Comparing Two Proportions ##
###############################

## 8.64-68 ########################################

## Sizes
n1         = 358
n2         = 851
## Sample proportions
p1         = (29.9/100)
p2         = (20.8/100)
## Large-sample estimate of the difference in two population proportions
d_hat      = p1-p2
## Standard error of the difference d_hat
se_d_hat   = sqrt( ((p1*(1-p1))/n1) + ((p2*(1-p2))/n2) )
## Margin of error
## 0.975 =(1-C)/2
m          = qnorm(0.975)*se_d_hat
### Confidence intervalle
IC         = d_hat + c(-1,1)*m
### Significance test level alpha = 0.05 
### H0: p1=p2 vs Ha:p1=!=p2
## Pooled estimate
p_hat      = (p1*n1+p2*n2)/(n1+n2)
## Standard error of the estimate difference D
se_d_hat_p = sqrt( p_hat*(1-p_hat)*((1/n1) +(1/n2))   )
## z statistic
zz         = (p1-p2)/se_d_hat_p
## p-value for two-sided alternative (valeur-p du test bilatéral) 2P(Z>= |zz|)
p_val      = 2*pnorm(q=abs(zz),lower.tail = F)*100
##################################################