

#Turn the logistic growth model code into a function that takes r (the intrinsic growth rate), K (the carrying capacity), the total number of generations, and the initial population size as its arguments.

growfunc <- function(r, K, timeend, n) {
  Time <- 1:timeend
  for (i in 2:timeend){
    n[i] = n[i-1] + ( r * n[i-1] * (K - n[i-1])/K )
    print(n[i])
  }
  #Add code to the function so that it produces a plot of the data it generates (i.e., it should plot abundance over time). Note that the axes should be labeled appropriately.
  Abundance <- n
  plot(Time, Abundance)
#Write  lines of code that writes the data set to a file (also in your Lab08 directory). The data file should have two columns: the first column should be "generations", and the second column should be "abundance".  
  growframe <- data.frame(Time, Abundance)
  colnames(growframe)[1] <- "Generations"
  colnames(growframe)[2] <- "Abundance"
  write.csv(growframe, "Generation_Abundances.csv")
}
# Following the function, write a line(s) of code that calls the function (you choose the parameter values).
growfunc(.6, 5000, 14, 2500)
