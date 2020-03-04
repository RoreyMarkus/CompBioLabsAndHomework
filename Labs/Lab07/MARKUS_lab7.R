#Problem #1

#The area of a triangle can be calculated as 0.5 * base * height. Write a function named triangleArea that calculates and returns the area of a triangle when given two arguments (base and height).

#Demonstrate that your function works by calling it for an imaginary triangle that has a base of 10 units and a height of 9 units.

triangleArea <- function(a,b) {
  area <- ((a * b)/2)
  return(area)
}

triangleArea(10, 9)
#> triangleArea(10, 9)
#[1] 45






#Problem #2

#R has a built in function called abs() that returns the absolute value of a number, or the absolute value of each number in a numeric vector. Imagine that the abs() function did NOT exist.

#Part 2a. Write a function named myAbs() that calculates and returns absolute values. Show that your function works by using it on the following test cases:
  
myAbs <- function( x ) {
  
  if ( x < 0 ) {
    
    return( -x )
    
  } else {
    
    return( x )
    
  }
  
}



#  the number 5
myAbs(5)
#> myAbs(5)
#[1] 5

#the number -2.3
myAbs(-2.3)
#> myAbs(-2.3)
#[1] 2.3


#Part 2b. Revise your function to make it work on vectors (unless it already does). Demonstrate that your (revised) function works on the following vector:
  
#  c(1.1, 2, 0, -4.3, 9, -12)

myAbs(c(1.1, 2, 0, -4.3, 9, -12))


myAbs <- function (n) 
  {for (i in 1:length(n)){
    if ( n[i] < 0 ) {
      storage[i] <- n[i] * -1
    } else {
      storage[i] <- n[i]
    }
  }
      return( storage )
      
    }

#> myAbs(c(1.1, 2, 0, -4.3, 9, -12))
#[1]  1.1  2.0  0.0  4.3  9.0 12.0

#Problem #3

#Recall the "Fibonacci sequence" we worked with a few weeks ago: According to Wikipedia (https://en.wikipedia.org/wiki/Fibonacci_number, accessed Feb. 2017):
  
# " the Fibonacci numbers are the numbers in the following integer sequence, called the Fibonacci sequence, and characterized by the fact that every number after the first two is the sum of the two preceding ones: 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 , ...
#Often, especially in modern usage, the sequence is extended by one more initial term: 0 , 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 , ...
#By definition, the first two numbers in the Fibonacci sequence are either 1 and 1, or 0 and 1, depending on the chosen starting point of the sequence, and each subsequent number is the sum of the previous two."

#Using the information given in that quote, write a function that returns a vector of the first n Fibonacci numbers, where n is any integer >= 3. Your function should take two arguments: the user's desired value of n and the user's desired starting number (either 0 or 1 as explained in the quote above). Your function does NOT need to TEST if n is actually >= 3. (In other words, we are assuming that n >= 3. That is a sensible assumption because your for loop from lab 4 probably wouldn't work if you used n < 3.) However, note Bonus 3a below if you are interested.

fibvec <- rep(0,3)
fibSeq <- function (n, a) {
  if (a == 0){ 
  fibvec[1] <- 0
  fibvec[2] <- 1
  } else {
  fibvec[1] <- 1
  fibvec[2] <- 1
  }
  for ( n in seq(3,n) ) {( fibvec[n] <- fibvec[n-1] + fibvec[n-2]) }
  return(fibvec)}
  
 
fibSeq(11, 1) 






#Problem #4

#Part 4a. Write a function that takes two numbers as its arguments and returns the square of the difference between them. In other words, for any two numbers x and y your function should calculate and return the quantity (x - y) ^ 2.

sqrdif <- function(x, y){
  dif <- (x - y) ^ 2
  return(dif)
}
#Demonstrate that your function works by calling it with the numbers 3 and 5. (your function should return the number 4).
sqrdif(3, 5)
#> sqrdif(3, 5)
#[1] 4

#Call your function where the first argument is the vector c(2, 4, 6) and the second argument is the number 4. Your function should return the vector 4 0 4. This is a demonstration of R's abilities to vectorize operations.

sqrdif(c(2, 4, 6), 4)
#> sqrdif(c(2, 4, 6), 4)
#[1] 4 0 4


#Part 4b. Imagine that R did NOT have a function to calculate the average (i.e., arithmetic mean) of a vector of numbers. Write a function of your own that calculates the average of a vector of numbers. In other words, your function should take a vector of numbers as its argument, and it should return the average, but you can NOT use the mean() function. Hint: you will probably want to make use of the sum() function for efficiency.

avgfunc <- function(n) {
  avgstor <- sum(n)/length(n)
  return(avgstor)}
#Demonstrate that your function works by calling it with the vector c(5, 15, 10)

avgfunc(c(5, 15, 10))
#> avgfunc(c(5, 15, 10))
#[1] 10

#Demonstrate that your function works by calling it with the data you will find in the "DataForLab07.csv" file found in Sam's Lab07 directory. Remember: importing this data will, by default, create a data frame (not a vector). If your function works properly, the answer it returns will be approximately 108.9457.

lab7data <- read.csv("DataForLab07.csv")

avgfunc(c(lab7data$x))
#> avgfunc(c(lab7data$x))
#[1] 108.9457


#Part 4c. A very common quantity in a number of statistical analyses is some form of a "sum of squares." In technical terms, the sum of squares can be calculated as the sum of the squared deviations from the mean. In other words, for a given data set, one calculates the mean. Then, for each data point, the mean is subtracted from the data point, and the resulting difference is squared. All of these squared differences are then summed. For a different explanation, see this Wikipedia page on "Total Sum of Squares". Write a function that calculates and returns the sum of squares as defined here. Your function should take a vector of numeric data as its argument. Note: please write your sum of squares function so that it makes use of the functions written for the previous two parts of this problem. In other words, find a useful way to call those functions from within your sum of squares function.

sumsqrfunc <- function(n) {
  meanstor <- avgfunc(n)
  sumsqr <- sum(sqrdif(n, meanstor))
  return(sumsqr)}

#Demonstrate that your sum of squares function works by calling it with the data provided in the file "DataForLab07.csv". If your function works properly, the answer it returns will be approximately 179442.4.

sumsqrfunc(lab7data$x)
#> sumsqrfunc(lab7data$x)
#[1] 179442.4                                                                                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                                                                                                            