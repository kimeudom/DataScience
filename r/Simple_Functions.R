#Simple functions
#We start with the tapply functions
Veg <- read.table(file="Vegetation2.txt",header= TRUE)
names(Veg)
#We now calculate the mean 
m <-mean(Veg$R)
#and the mean per transect for the 8 transects
m1<-mean(Veg$R[Veg$Transect == 1])
m2<-mean(Veg$R[Veg$Transect == 2])
m3<-mean(Veg$R[Veg$Transect == 3])
m4<-mean(Veg$R[Veg$Transect == 4])
m5<-mean(Veg$R[Veg$Transect == 5])
m6<-mean(Veg$R[Veg$Transect == 6])
m7<-mean(Veg$R[Veg$Transect == 7])
m8<-mean(Veg$R[Veg$Transect == 8])
#We now display all the means

c(m1,m2,m3,m4,m5,m6,m7,m8)
#We can do this more efficiently using the tapply function
tapply(Veg$R, Veg$Transect, mean)
#OR
tapply(X = Veg$R, INDEX = Veg$Transect, FUN = mean)
# we do this for the mean, std deviation and length functions
Me<-tapply(Veg$R, Veg$Transect, mean)
Sd<-tapply(Veg$R, Veg$Transect, sd)
Le<-tapply(Veg$R, Veg$Transect, length)
c(Me,Sd,Le)
#We can do this more efficiently using the sapply funtion
#We obtain the means for only 4 of the numerical variables for the whole data set
#The output is a vector
Means4_S<-sapply(Veg[, 5:9], FUN= mean)
#If we use lapply the output is a list
Means4_L=lapply(Veg[, 5:9], FUN= mean)
#The variable that contains the data in lapply and sapply must be a
#data frame

#THE SUMMARY FUNCTION
#The argument can be a variable, the output 
#from a cbind command, or a data frame
#We implement it below
Z <-cbind(Veg$R, Veg$ROCK, Veg$LITTER)
#We name the columns appropriately
colnames(Z) <- c("R", "ROCK", "LITTER")
#apply the function to the data
#The summary command gives the minimum, first quartile, median, mean,
#third quartile, and maximum value of the variable.
summary(Z)
#We may also apply it as follows
summary(Veg[ , c("R","ROCK","LITTER")])
#OR
summary(Veg[ , c(5,6,7)])
#THE TABLE FUNCTION
#deer data from Vicente
#et al. (2006). The data were from multiple farms, months, years, and sexes
#he table function can be
#used to learn how many animals per farm were sampled, as well as the number
#of observations per sex and year
Deer <- read.table(file="Deer.txt", header= TRUE)
names (Deer)
str(Deer)
#We obtain the number of observations per farm
table(Deer$Farm)
#We crosstabulate Farm by Sex
table(Deer$Sex, Deer$Year)
table(Deer$Sex, Deer$Year)

#THE plot FUNCTION
#We use the Vegetation Data used earlier. These are grassland data from a monitoring program conducted in two temperate
#communities in Yellowstone National Park and the National Bison Range, USA.
#Suppose we want to make a plot of species richness versus
#the substrate variable ‘‘exposed soil,’’ denoted by BARESOIL.
#We illustrate this below
Veg <- read.table(file = "Vegetation2.txt", header = TRUE)
plot(Veg$BARESOIL, Veg$R)
#Alternatively, you can use
plot(x = Veg$BARESOIL, y = Veg$R)
#We can modify the plot to add more useful labels and add a title
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19))
#We can change the plotting characters using the pch option
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19), pch = 9)
#We can also identify the points by transect
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19), pch = Veg$Transect)
#We can also compare before 1974 and after 1974
#We recode time and put it is a new variable Time2 in the same data frame
Veg$Time2 <- Veg$Time
#on or Before 1974  coded as 1
Veg$Time2 [Veg$Time <= 1974] <- 1
#After 1974 coded as 16 
Veg$Time2 [Veg$Time > 1974] <- 16

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19), pch = Veg$Time2)
#We can change color of the points
Veg$Time2
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     col = 2)
#We use different colors for before 1974 and after 1974
Veg$Time2 <- Veg$Time
Veg$Time2 [Veg$Time <= 1974] <- 15
Veg$Time2 [Veg$Time > 1974] <- 16
#We create a new variable "Col2" to store the color information
Veg$Col2 <- Veg$Time
Veg$Col2 [Veg$Time <= 1974] <- 1
Veg$Col2 [Veg$Time > 1974] <- 2
#We plot and include the color option
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$Time2, col = Veg$Col2)
#We can change the size of the points
#We create a new variable for this
Veg$Cex2 <- Veg$Time
#We create a vector to do this and plot 2002 vs the others
Veg$Cex2[Veg$Time == 2002] <- 2
Veg$Cex2[Veg$Time != 2002] <- 1

#We plot the graph
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness",
     main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = 16, cex = Veg$Cex2)

#We can also add a smoothing line
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness",
     main = "Scatter plot", xlim = c(0, 45),
     ylim = c(4, 19))
M.Loess <- loess(R~BARESOIL, data = Veg)
Fit <- fitted(M.Loess)
lines(Veg$BARESOIL, Fit)

#We order the data to get a more useful graph

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19))
M.Loess <- loess(R ~ BARESOIL, data = Veg)
Fit <- fitted(M.Loess)
Ord1 <- order(Veg$BARESOIL)
lines(Veg$BARESOIL[Ord1], Fit[Ord1],
        lwd = 3, lty = 2, col=2)
