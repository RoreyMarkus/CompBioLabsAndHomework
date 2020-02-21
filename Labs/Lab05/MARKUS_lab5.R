#Create a variable named x and assign a numeric value of your choosing to it. On the next line of code, write an if-else statement that checks if the value is larger than 5. Your code should print a message about whether the value is larger or smaller than 5.
x <- 5
if(x > 5) {
  print("larger than 5")
}else{
  print("smaller than or equal to 5")
}

#From Sam's GitHub folder for Lab05, obtain and import the file "ExampleData.csv". Note that, by default in R, it will be imported as a data frame (even though it may look like a vector to you)! This has consequences for how you can access its data. Refer back to Lab03 for the ways of working with and accessing/changing data in data frames. For example, even with a data frame having only one variable, you can't index into it the way you would with a vector. You can do things like myVec <- myDataFrame$varname or myVec <- myDataFrame[[1]] to get numeric data "out" of a data frame object and into a new object that R recognizes as a vector if you wish to make some of the operations below simpler to code. Note the double set of square braces on the latter example.

ExampleData <- read.csv("ExampleData.csv")

Data <- read.csv("ExampleData.csv")
myVec <- ExampleData$x
threshold <- 0
mynewVec <- myVec > threshold
myVec[mynewVec]

#Using a for() loop, write code that checks each value in the imported data and changes every negative value to be NA. Note: NA is an actual value in R that acts as a placeholder and/or signifies that data are missing/absent/not-applicable for a particular position in a data object.
for (i in 1:length(myVec)) {
    if (myVec[i] < 0){
      myVec[i] <- NA
    }
}
  
#Using vectorized code (no loop) that makes use of "logical" indexing, change all those NA values with NaN. Note that NaN is a numeric value meaning "not a number". Also note that R has a function, is.na(), for testing if something is an NA. You can NOT use == on NA values or NaN values.

theNAVec <- is.na(myVec)
myVec[theNAVec] <- NaN
theotherNA <- (myVec < threshold) #this will only work if the negative values have not already been set to NA
myVec[theotherNA] <- NaN
#Using a which() statement and integer indexing (again, no loop), change all those NaN values with a zero. Note that R has a function, is.nan(), for testing if something is an NaN. You can NOT use == on NA values or NaN values.

zerovec <- which(is.nan(myVec))
myVec[zerovec] <- 0


#d. Use code to determine how many of the values from the imported data fall in the range between 50 and 100 (inclusive of those endpoints).


midmyvec <- (50 <= myVec & myVec <= 100)
sum(midmyvec)
sum(50 <= myVec & myVec <= 100)

# Using any method of your choice, create a new vector of data that has all the values from the imported data that fall in the range between 50 and 100. Do NOT dynamically grow the array, however. This vector should be named "FiftyToOneHundred".
FiftyToOneHundred <- myVec[midmyvec]

#. Use write.csv() to save your vector to a file named "FiftyToOneHundred.csv". Please use all default settings with write.csv(). In other words, assuming that your current working directory is your own directory for your work for Lab05, save it with the command write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

write.csv(x= FiftyToOneHundred, file = "FiftyToOneHundred.csv")


#Import the data on CO2 emissions from last week's lab ("CO2_data_cut_paste.csv" from Lab04). Read the accompanying metadata (in a plain text file in the same directory) to learn what the data represent. Use code to answer the following questions. Hint: you do NOT need to use any loops here. Use some combination of which(), logical operators, and/or indexing:

CO2data <- read.csv("CO2_data_cut_paste.csv")


#What was the first year for which data on "Gas" emissions were non-zero?
print(CO2data$Year[CO2data$Gas > 0][1])
#1885

#During which years were "Total" emissions between 200 and 300 million metric tons of carbon?
print((CO2data$Year[CO2data$Total < 300 & CO2data$Total > 200]))
#1879 1880 1881 1882 1883 1884 1885 1886 1887

#n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
#p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])

#First, set up parameter values. Use the following:

#totalGenerations <- 1000
#initPrey <- 100 	# initial prey abundance at time t = 1
#initPred <- 10		# initial predator abundance at time t = 1
#a <- 0.01 		# attack rate
#r <- 0.2 		# growth rate of prey
#m <- 0.05 		# mortality rate of predators
#k <- 0.1 		# conversion constant of prey into predators
#n prey abundance
#predator abundance

totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

#Second, create a time vector, and make two additional vectors to store results, one for the values of n over time, and the other to store values of p. Note that the time vector is literally meant to be just a sequence of numbers representing time steps from 1 to totalGenerations and that it is NOT needed until the fifth and sixth steps below.
timevec <- 1:1000
nresults <- 1:1000
presults <- 1:1000
nresults[1] <- initPrey
presults[1] <- initPred
#Third, write a loop that implements the calculations.
#n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
#p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])

for (i in 2:totalGenerations){
  nresults[i] <- (nresults[i-1] +(r * nresults[i-1])-(a * nresults[i-1] * presults[i-1]))
  if (nresults[i] < 0){
    nresults[i] <- 0}
  presults[i] <- (presults[i-1] + (k * a * nresults[i-1] * presults[i-1]) - (m * presults[i-1]))
}




#Fourth, in this model it is possible that the predators may kill off all the prey. Due to the discrete nature of how time is considered in this model (time proceeds in discrete jumps from one generation to the next), it is possible that the calculations as given can result in negative numbers. So, add some if statements to your code to check for negative numbers each generation. If, for example, a given value of prey abundance is negative, then that value should be set to be zero.

#I already did that in the last step with an If

#Fifth, make a plot of the abundances of prey and predators over time (see cheat sheet above for using plot() and lines()).
Time <- totalGenerations
Abundance <- 850
plot(timevec, nresults, type = "l", xlab = "Generations", ylab = "Abundance", main = "Predator Prey Model", col = "blue" )
lines(presults, col = "red" )
legend("topright", legend = c("Prey", "Predator"), col = c("blue","red"), lwd = 1)

#Sixth, create a matrix of your results named "myResults" in which the first column is named "TimeStep", the second column is named "PreyAbundance", and the third column is named "PredatorAbundance". Write this matrix to a csv in your Lab05 working directory with the command write.csv(x = myResults, file = "PredPreyResults.csv")
TimeStep <- timevec
PreyAbundance <- nresults
PredatorAbundance <- presults
myResults  <- cbind(TimeStep, PreyAbundance, PredatorAbundance)
write.csv(x = myResults, file = "PredPreyResults.csv")









