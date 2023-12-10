eStep <- function(data, lambda){
	#param: data, survival data
	#param: lambda, current estimate of the hazard
	#return: the expected time to event for censored data

	#tau, the time people are followed (same for everyone)
	tau <- data[data$delta == 1, ]$t[1] # censorship time is same for everyone so we take the first value

	# E[Z|Z>tau]
	return( tau + 1 / lambda )
}

mStep <- function(data, z_expected){
	#param: data, survival data
	#param: z_expected, E[Z|Z>tau]
	#return: estimate of hazard (lambda) using MLE estimator

	# number of uncensored people
	n <- sum(data$delta == 0)

	#number of censored people
	m <- sum(data$delta == 1)

	#sum of t for uncensored
	sum_t <- sum(data[data$delta == 0,]$t)

	lambda_mle <- (n + m) / (sum_t + m * z_expected)

	return(lambda_mle)
}
