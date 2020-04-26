## FicheDeCalcul

## Variables


## Sample Mean
#n:taille
#sig:standart deviation
mux  = mu
sigx = sig/sqrt(n) 

## Binomial Count
#n:taille
#p:probability of success

mu  = n*p
sig = sqrt(n*p*(1-p))

## Sample Proportion
#n:taille
#p:proportion of success
mu  = p
sig = sqrt(p*(1-p)/n)


## Confidence Interval
conf_interval <-function(estimate,margin_error){
  ic<-(estimate*c(1,1)+c(-1,1)*margin_error)
  return(ic)
}

## Estimate

## Quantile Function
## QuantileToDensity
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
## Margin of Error
m = dist_quantile*standart_error
  
(sig/sqrt(n))
(s/sqrt(n))
m = tstar*(s/sqrt(n))

## Exemple
## 7.2.56
## intermittent recovery
n1  <- 16
mu1 <- 1130
s1  <- 191

n2  <- 13
mu2 <- 781
s2  <- 6.0
se  <- sqrt( ((s1^2)/n1) + ((s2^2)/n2))
tstar<- qt(p=0.025,df=12,lower.tail = F)
m   <- tstar*se 
tt  <- (mu1-mu2)/se
IC <- c(-1,1)*m + c(1,1)*(mu1-mu2)
2*pt(q=abs(tt),df=12,lower.tail = FALSE)


## 8.64-68
n1=358
p1=(29.9/100)
n2=851
p2=(20.8/100)
## Difference proportion
d=p1-p2
## standard error of the difference D
sed = sqrt( ((p1*(1-p1))/n1) + ((p2*(1-p2))/n2) )
## margin of error
m=qnorm(0.975)*sed
## confidence intervalle
ic = d + c(-1,1)*m
### Significance test level alpha = 0.05 H0: p1=p2 vs Ha=p1 neq p2
## pooled estimate
phat = (p1*n1+p2*n2)/(n1+n2)
## standard error of the estimate difference D
sedp=sqrt( phat*(1-phat)*((1/n1) +(1/n2))   )
## z statistic
zz=(p1-p2)/sedp
## 2P(Z>= |zz|)
2*pnorm(abs(zz),lower.tail = F)*100

