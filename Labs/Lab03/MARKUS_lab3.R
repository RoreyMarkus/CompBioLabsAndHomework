#lab step #3: making two variables to represent the number of guests and the bags of chips

bags_of_chips <- 5
guests <- 8
#lab step #5: creating a variable for how many bags of chips each guest will eat
chips_per_guest <- 0.4
#lab step #7:using the variables to find out how many leftover chip bags there will be
leftover_chips <- bags_of_chips - ((guests + 1) * chips_per_guest)
#lab step#8 : making vectors for 4 people
selfvec <- c(7,9,8,1,2,3,4,6,5)                             
Pennyvec <- c(5,9,8,3,1,2,4,7,6)
Lennyvec <- c(6,5,4,9,8,7,3,2,1)
Stewievec <- c(1,9,5,6,8,7,2,3,4)
#lab step#9: access and store Penny's ranking for IV, same with Lenny
PennyIV <- Pennyvec[4]
LennyIV <- Lennyvec[4]
#lab step #10: Concatenate all 4 sets of rankings into a single data object
allrank <- cbind(selfvec, Pennyvec, Lennyvec, Stewievec)
str(PennyIV)
str(Pennyvec)
str(allrank)
#lab step #11 They all look different, PennyIV is one number, Pennyvec is a row, and Allrank is a matrix
#lab step #12 Make a "data frame" using the 4 vectors of rankings.
rankingframe <- data.frame(allrank)
as.data.frame(allrank)
#lab step #13: the cbind command made a matrix, and data.frame made a table from that matrix
#lab step #14: making episode names into a vector
epnames <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")
help("row.names")

#lab step #15:  name the rows of Allrank
row.names(rankingframe) <- epnames
print(allrank)
#lab step #16:Access the third row of the matrix
allrank[3,]
#lab step #17: Access the fourth column of the dataframe
rankingframe[,4]
#lab step #18 Access your ranking for Episode V.
rankingframe[5,1]
#lab step #19 Access Penny’s ranking for Episode II.
rankingframe[2,2]
#lab step #(20) Access everyone’s rankings for episodes IV – VI.
rankingframe[4:6,]
#lab step #(21) Access everyone’s rankings for episodes II, V, and VII.
rankingframe[c(2,5,7),]
#lab step #(22) Access rankings for just Penny and Stewie for just episodes IV and VI.
rankingframe[c(4,6),c(2,4)]
#lab step #23 switch Lenny’s rankings for Episodes II and V
rankingframe[c(2,5),3] <- rankingframe[c(5,2),3] 
#lab step #24 accessing the data with names
rankingframe["III", "Pennyvec"]
#lab step #25 undo the switch made in step 23
rankingframe[c("II","V"),"Lennyvec"] <- rankingframe[c("V","II"),"Lennyvec"]
#lab step #26 re-do the switch from step 23
rankingframe$Lennyvec[c(2,5)] <- rankingframe$Lennyvec[c(5,2)]
