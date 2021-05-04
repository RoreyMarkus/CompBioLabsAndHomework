#Import the data sets
LargeAll.dat <- read.csv("Large_Scale_Data.csv") 
SmallAll.dat <- read.csv("Small_Scale_Data.csv") 

#Install various packages
install.packages("ggplot")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("cowplot")
install.packages("plotrix") 
library(plotrix)
library(cowplot)
library(dplyr)
library(ggplot)
library(tidyverse)

#view the data
view(LargeAll.dat)
view(SmallAll.dat)

#Subset the large scale data based on if its on colony


LargeOn <- subset(LargeAll.dat, PD_Colony == "On")
LargeOff <- subset(LargeAll.dat, PD_Colony == "Off")

#Calculate the diversity off colony

LGOffYuccasum <- sum(LargeOff$Yucca)
LGOffGrasssum <- sum(LargeOff$Grass)
LGOffOthersum <- sum(LargeOff$Other_Veg)

#change NA values to zero

zerovec <- which(is.na(LargeOff$Other_Veg))
LargeOff$Other_Veg[zerovec] <- 0

LGOffTot <- sum(LargeOff$Total_Veg)

LGOffn1 <- (LGOffTot * (LGOffTot - 1))
LGOffn2 <- ((LGOffYuccasum * (LGOffYuccasum - 1)) + (LGOffGrasssum * (LGOffGrasssum - 1 )) + (LGOffOthersum * (LGOffOthersum - 1)))

OFFDIV <- (1 - (LGOffn2/LGOffn1))
#0.5421104

#Calculate the diveristy on Colony
LGOnYuccasum <- sum(LargeOn$Yucca)
LGOnGrasssum <- sum(LargeOn$Grass)
LGOnOthersum <- sum(LargeOn$Other_Veg)

#change NA values to zero
zerovec <- which(is.na(LargeOn$Total_Veg))
LargeOn$Total_Veg[zerovec] <- 0

LGOnTot <- sum(LargeOn$Total_Veg)

LGOnn1 <- (LGOnTot * (LGOnTot - 1))
LGOnn2 <- ((LGOnYuccasum * (LGOnYuccasum - 1)) + (LGOnGrasssum * (LGOnGrasssum - 1 )) + (LGOnOthersum * (LGOnOthersum - 1)))

ONDIV <- (1 - (LGOnn2/LGOnn1))

#0.4996311

#Plot the Abundance vs Colony
veg_abundance_mean <- aggregate(Total_Veg ~ PD_Colony, data = LargeAll.dat, mean)


barplot(veg_abundance_mean[,2], beside = T, ylim = c(0, 25), 
        ylab = "Vegetation Abundance", 
        xlab = "Colony relation", 
        col = c("limegreen","lemonchiffon2"),
        names.arg = c("Off Colony", "On Colony"))


calcSE <- function(x){sd(x)/sqrt(length(x))}

veg_abundance_SE <- aggregate(Total_Veg ~ PD_Colony, data = LargeAll.dat, calcSE)

plotCI(barplot(veg_abundance_mean[,2], beside = T, 
               ylim = c(0, 50), 
               ylab = "Vegetation Abundance", 
               xlab = "Colony relation", 
               col = c("limegreen","lemonchiffon2"),
               names.arg = c("Off Colony", "On Colony"), 
               cex.axis = 1, cex.names = 1),
       veg_abundance_mean[,2], uiw = veg_abundance_SE[,2], add = T, pch = NA)


#Calculate Diversity for Small Scale

SMYuccaSum <- (sum(SmallAll.dat$Yucca)) * (sum(SmallAll.dat$Yucca)-1) 
SMGrassSum <- (sum(SmallAll.dat$Grass)) * (sum(SmallAll.dat$Grass)-1) 
SMCactusSum <- (sum(SmallAll.dat$Cactus)) * (sum(SmallAll.dat$Cactus)-1) 
SMOtherSum <- (sum(SmallAll.dat$Other_Veg)) * (sum(SmallAll.dat$Other_Veg)-1) 

SMTotSum <- (sum(SmallAll.dat$Total_Percent_Veg)) * (sum(SmallAll.dat$Total_Percent_Veg)-1) 

SumDIV <- (1 - ((SMYuccaSum + SMGrassSum + SMCactusSum + SMOtherSum)/ SMTotSum))
#The total diversity is 0.4979669



Yuccastuff <- ((SmallAll.dat$Yucca) * (SmallAll.dat$Yucca - 1))
Grassstuff <- ((SmallAll.dat$Grass) * (SmallAll.dat$Grass -1))
Cactusstuff <- ((SmallAll.dat$Cactus) * (SmallAll.dat$Cactus -1))
Otherstuff <- ((SmallAll.dat$Other_Veg) * (SmallAll.dat$Other_Veg -1))
Totalstuff <- ((SmallAll.dat$Total_Percent_Veg) * (SmallAll.dat$Total_Percent_Veg -1))

DIV <- (1 - ((Yuccastuff + Grassstuff + Cactusstuff + Otherstuff)/Totalstuff))

x <- SmallAll.dat$Dist_to_Burrow
y <- DIV

#plot the Plant diversity against distance to burrow
plot(x, y, ylab = "Plant Diversity", 
     xlab = "Distance to Nearest Burrow (m)",
     cex.lab = 1, cex.axis = 1)


#Plot the relationship between distance and vegetation cover
plot(Total_Percent_Veg ~ Dist_to_Burrow, data = SmallAll.dat, bty = "l", 
ylab = "Percent Vegetation Cover", 
xlab = "Distance to Nearest Burrow (m)",
cex.lab = 1, cex.axis = 1)
