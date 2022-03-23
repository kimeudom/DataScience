#We demonstrate the pie chart using the avian influenza 
#the data represent the numbers of confirmed human
#cases of Avian Influenza A/(H5N1) reported to the World Health Organization
#(WHO). The data for several countries were taken from the WHO website at
#www.who.int

BFcases<-read.table(file = "BirdFluCases.txt", header = TRUE)
#We check if the Bird Flu Cases have increased over the years
Cases <- rowSums(BFcases[, 2:16])
#Name the rows by year
names(Cases) <- BFcases[, 1]
#Check the content of Cases
#We now construct different types of pie charts
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
pie(Cases, main = "Ordinary pie chart")
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)),
      clockwise = TRUE, main = "Grey colours")
pie(Cases, col = rainbow(6), clockwise = TRUE,
      main = "Rainbow colours")
library(plotrix)
pie3D(Cases, labels = names(Cases), explode = 0.1,
        main = "3D pie chart", labelcex = 0.6)

#BAR CHARTS AND STRIP CHARTS
BFDeaths <- read.table(file = "BirdFluDeaths.txt",header = TRUE)
Deaths <- rowSums(BFDeaths[, 2:16])
names(Deaths) <- BFDeaths[, 1]
Deaths
#wE can compare the cases to the deaths over time using bar plots
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
#Plot cases over the years
barplot(Cases , main = "Bird flu cases")
#Combine the cases and deaths into a new variable Counts
Counts <- cbind(Cases, Deaths)
barplot(Counts)
barplot(t(Counts), col = gray(c(0.5, 1)))
barplot(t(Counts), beside = TRUE)


#core samples were taken at 45 stations on
# nine beaches along the Dutch coastline
#marine benthic species were
#determined in each sample with over 75 identified.

#Import the data
Benthic <- read.table(file = "RIKZ2.txt",
                      header = TRUE)
#The variable Bent.M contains the mean richness values, and Bent.sd the
#standard deviation, for each of the nine beaches
Bent.M <- tapply(Benthic$Richness,
                   INDEX = Benthic$Beach, FUN = mean)
Bent.sd <- tapply(Benthic$Richness,
                    INDEX = Benthic$Beach, FUN = sd)
#Wecombine these ito a matrix
MSD <- cbind(Bent.M, Bent.sd)
#Create a Bar Plot
barplot(Bent.M, xlab = "Beach", ylim = c(0, 20),
        ylab = "Richness", col = rainbow(9))
#vertical lines indicating standard deviations are added using the function
#arrows to draw an arrow between two points with coordinates
#(x 1 , y 1 ) and (x2 ,y2 ). Telling R to draw an arrow between the points (x, y 1 ) and (x, y 2 ), will produce a
#vertical arrow, as both points have the same x-value. The y 1 -value is the mean, and
#the y 2 -value is the mean plus the standard deviation.

bp <- barplot(Bent.M, xlab = "Beach", ylim = c(0,20),ylab = "Richness", col = rainbow(9))
arrows(bp, Bent.M, bp, Bent.M + Bent.sd, lwd = 1.5, angle = 90, length = 0.1)
#draw a box around the curve
box()
#The Strip Chart for the Benthic Data
Benth.le <- tapply(Benthic$Richness,
                   INDEX = Benthic$Beach, FUN = length)
#Compute the standard errors
Bent.se <- Bent.sd / sqrt(Benth.le)


stripchart(Benthic$Richness ~ Benthic$Beach,
           vert = TRUE, pch = 1, method = "jitter",
           jit = 0.05, xlab = "Beach", ylab = "Richness")
points(1:9, Bent.M, pch = 16, cex = 1.5)
arrows(1:9, Bent.M,
         1:9, Bent.M + Bent.se, lwd = 1.5,
         angle = 90, length = 0.1)
arrows(1:9, Bent.M,
         1:9, Bent.M - Bent.se, lwd = 1.5,
         angle = 90, length = 0.1)

Owls <- read.table(file = "Owls.txt", header = TRUE)
boxplot(Owls$NegPerChick)
# we see five potential outliers
#Its purpose is threefold: detection of outliers, and displaying
#heterogeneity of distribution and effects of explanatory variables.
#We draw box plots by different categories and investigate mixed effects
par(mfrow = c(2,2), mar = c(3, 3, 2, 1))
boxplot(NegPerChick ~ SexParent, data = Owls)
boxplot(NegPerChick ~ FoodTreatment, data = Owls)
boxplot(NegPerChick ~ SexParent * FoodTreatment,
        data = Owls)
boxplot(NegPerChick ~ SexParent * FoodTreatment,
          names = c("F/Dep", "M/Dep", "F/Sat", "M/Sat"),
          data = Owls)

#If the categories are many
par(mar = c(2, 2, 3, 3))
boxplot(NegPerChick ~ Nest, data = Owls,
          axes = FALSE, ylim = c (-3, 8.5))
axis(2, at = c(0, 2, 4, 6, 8))
text(x = 1:27, y = -2, labels = levels(Owls$Nest),
       cex = 0.75, srt = 65)
# We use the benthic data
# boxplot of Richness by Beach
Benthic <- read.table(file = "RIKZ2.txt",header= TRUE)
boxplot(Richness ~ Beach, data = Benthic,col = "grey", xlab = "Beach", ylab = "Richness")
#=================================================
#CLEVELAND DOT PLOTS
#==================================================
#Useful for outlier detection
Deer <- read.table("Deer.txt", header = TRUE)
par (mfrow = c (1, 2))
dotchart(Deer$LCT, xlab = "Length (cm)",
         ylab = "Observation number")
#Grouped by sex 
Isna <- is.na(Deer$Sex)
 dotchart(Deer$LCT[!Isna],
           groups = factor(Deer$Sex[!Isna]),
           xlab = "Length (cm)",
           ylab = "Observation number grouped by sex", col=2)



