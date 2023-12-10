genData <- function(npeople, lambda, tau){
	#param: npeople, number of people
	#param: lambda, the hazard
	#param: tau, the time people are followed (same for everyone)
	#return: dataframe with cols, t (time to event) and delta (censored, 1 = yes, 0 = no)

	#generate nepople values from uniform distribution b/w 0 and 1:
	y <- runif(npeople)

	#compute time to event
	t <- - log(1 - y) / lambda

	#compute delta marker 1 = event, 0 = no event

	delta <- as.integer(t > tau)

	# create dataframe, use tau as last known date for the censored

	df <- data.frame(t = pmin(t, tau), delta = delta)

	return(df)

}