
source("genData.R")
source("emSteps.R")

#generate data
df <- genData(npeople = 1e3, lambda = 1/80, tau = 100)

#initial guess for lambda(hazard)
lam <- 1/50


for(i in 1:10){
	z <- eStep(df, lam)
	lam <- mStep(df, z)
	print(lam)
}