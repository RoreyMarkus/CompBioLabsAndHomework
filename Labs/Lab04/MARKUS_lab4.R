#Write a “for loop” that prints the word “hi” to the console 10 times
for (i in seq(1,10)) {print("hi")}
#Tim currently has $10 in his piggy bank. Each week his parents give him an allowance of $5. Each week he also buys 2 packs of gum. If the packs of gum cost $1.34 each (with tax included), how much money will Tim have in total eight weeks from now? Write a for loop that prints (to the console) his total amount of money each week for the next 8 weeks
#set variables for how much money will be spent on each thing, and how much will be gained
gum <- 1.34
weeks <- 1:8
Startmoney <- 10
n <- Startmoney
Weeklyallowance <- 5
#make a for loop to determine how much he will have over 8 weeks
for (i in weeks) {
  print(n <- n - (2 * gum) + Weeklyallowance)
}

#A conservation biologist estimates that, under current conditions, a population she is studying will shrink by 5% each year. Suppose the current population size is 2000 individuals. What is the expected population size each year for the next seven years? Write a for loop that calculates it and prints each year’s size to the console.
#set variables for how many years, the initial population, the rate of shrinkage, and the composite population
years <- 1:8
initpop <- 2000
shrinkage <- 0.95
comppop <- initpop
#stick those variable into a for loop that will compound yearly based on the shrinkage
for (i in years) {
  print(comppop <- comppop * shrinkage)
}

#Here is the discrete-time logistic growth equation, used in many models of population abundance over time:
#n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
#where n[t] is the abundance of the population at time t, n[t – 1] is the abundance of the population in the previous time step, r is the intrinsic growth rate of the population, and K is the environmental carrying capacity for the population. Suppose that right now is time 1 (i.e., the current time step is t = 1). If n[1] = 2500, K = 10000, and r = 0.8, then what do you predict for the value of n[12]? Write a for loop that answers this question and that also prints out the abundance of the population each time step.
#make the vector for time so it isnt magic
timevec <- 2:12
#make a recepticle for abundance numbers and set the first value at 2500
popsteps <- rep(NA, 12)
popsteps[1] <- 2500
#set K as the carrying capacity of 10000
K <- 10000
#set the rate as a variable
r <- 0.8
#print the first value
print(popsteps[1])
#use the for loop to print the other values
for (i in timevec){
  instep <- (K - popsteps[i-1])/ K
print( popsteps[i] <- popsteps[i-1] + ((r * popsteps[i-1]) * instep))
}



#Practice some basics of array indexing using for loops   5a. Use the rep command to make a vector of 18 zeros (see Cheat Sheet above if you are unsure of the syntax to use). If you do this correctly, your vector should look like this when displayed in the RStudio console.
#make a vector of 0's
zerovec <- rep(0,18)

#Suppose you write a for loop that looks something like this:
 # for ( i in seq(1,18) ) { ... }
#This is a loop that is iterated 18 times. Replace the "..." with code that will make the loop store 3 times the ith value of the iterator variable (i) in the ith spot of the vector you created in part a. If you do this correctly, your vector should now look like this in the console: [1] 3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54
#set 3 as a variable so it isnt magic, then put it into the correctly coded for loop
multfac <- 3
for ( i in seq(1,18) )  {print ( zerovec[i] <- i * multfac )}


#Repeat part a to make a new vector of zeros. Then, make the first entry of that vector have a value of 1. If you do this correctly, your vector should look like this in the console: [1] 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# make that new vector of 0's
newzerovec <- rep(0,18)
#set the first value of the vector
newzerovec[1] <- 1


#Write a for loop so that starting with the second entry of the vector created in part c, the value stored in that position in the vector is equal to one plus twice the value of the previous entry (i.e., 1 + (2 * previous entry) ). If you do this correctly, your vector should look like this when you are done: [1] 1 3 7 15 31 63 127 255 511 1023 2047 4095 8191 16383 32767 65535 131071 262143


for ( i in seq(2,18) )  {print ( newzerovec[i] <- (1 + (2 * (newzerovec[i-1]))))}
print(newzerovec)


#the Fibonacci numbers are the numbers in the following integer sequence, called the Fibonacci sequence, and characterized by the fact that every number after the first two is the sum of the two preceding ones: 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 , ...
#Often, especially in modern usage, the sequence is extended by one more initial term: 0 , 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 , ...
#By definition, the first two numbers in the Fibonacci sequence are either 1 and 1, or 0 and 1, depending on the chosen starting point of the sequence, and each subsequent number is the sum of the previous two.
#Using the information given in that quote (and using a for loop), write code that makes a vector of the first 20 Fibonacci numbers, where the first number is 0 (zero).
#make an empty vector
fibseq <- rep(0,20)
#set the first two values as 0 and 1
fibseq[1] <- 0
fibseq[2] <- 1
#Use those in a for loop to get the first 20 digits of the fibonacci sequence 
for ( i in seq(3,20) ) {( fibseq[i] <- fibseq[i-1] + fibseq[i-2]) }
#print to make sure the values are correct
print(fibseq)


#Redo question 4 from part I above. Make two vectors, one called "time" that stores the time steps (1 to 12), and one called "abundance" that stores the data on population abundances predicted from the discrete-time logistic equation. Then, make a plot of the results (i.e., plot(time, abundance)).
#MAking vectors, the one from step 4 already had all data so just copy it under a new name
time <- seq(1,12)
abundance <- popsteps
#plot them ✌️
plot(time, abundance)

