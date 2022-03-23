#typing in small datasets with R
#seven body measurements taken from approximately 1100
#saltmarsh sharp-tailed sparrows 
#size of the head and wings, tarsus length, weight
# use the c function to genarate data for each variable
# first generate the wing measurements

Wingcrd <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
# we now view the first value in this variable
Wingcrd [1]
#we can view the first 4 values in Wingcrd
Wingcrd [1 : 4]
#we can view all values except the second
Wingcrd [-2]
#We can sum up all the values in the variable and store it in a variable called S.wing
S.wing<-sum(Wingcrd)
#We enter the remaining three variables
Tarsus <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6,21.5)
Head <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Wt <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6,15.7)
#one bird is missing the head measurements hence, this can cause a problem with some functions
sum(Head)
#we get NA as the output
#we can solve this using 
sum(Head, na.rm = TRUE)
#we get the mean for head measurments
mean(Head, na.rm=TRUE)
#get the smallest value for Head
min(Head,na.rm=TRUE)
#Get the largest value for Head
max(Head,na.rm=TRUE)
#We now combine the data using different functions
#We first use the c,cbind and rbind commands
#We start with the "c" command
BirdData <- c(Wingcrd, Tarsus, Head, Wt) 
#we make a vector to distinguish the given variables
Id <- c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
        2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4)
#we can do this more efficiently as follows
Id <- rep(c(1, 2, 3, 4), each = 8)
# Or as below
Id <- rep(1 : 4, each = 8)
#Or as below
a <- seq(from = 1, to = 4, by = 1)
Id<-rep(a, each = 8)
#We now create the variable names
VarNames <- c("Wingcrd", "Tarsus", "Head", "Wt")
Id2 <- rep(VarNames, each = 8)
#we now use the cbind function to get the data into columns and store it in a variable Z
Z <- cbind(Wingcrd,Tarsus, Head, Wt)
Z <- rbind(Wingcrd, Tarsus, Head, Wt)
#we can access the first column of the data 
Z[,1]
#or
Z[1 : 8, 1]
#We can access the second row using 
Z[2,]
#or
Z[2,1:4]
#The following commands are also valid
Z[1, 1]
#extract only the second and third columns
Z[, 2 : 3]
#extract the element in the 4th row and 4th columns
X <- Z[4, 4]
#extract the 4th column
Y <- Z[, 4]
#Sow all except the third column
W <- Z[, -3]
#show the 1st, 3rd and 4th columns
D <- Z[, c(1, 3, 4)]
#show all except the 1st and 3rd column
E <- Z[, c(-1, -3)]
#The following will not work because there is no 9th row nor 5th column
Z[9,5]
#We can avoid this by checking the size of the matrix
n<-dim(Z)
# we can get number of rows only
Zrow<-n[1]
#Or number of columns
Zcol<-n[2]
# To combine the data as rows we use rbind

Z2 <- rbind(Wingcrd,Tarsus, Head, Wt)
#combining data using a matrix
#First create an 8 by 4 Matrix
Dmat <- matrix(nrow = 8, ncol = 4)
#We can populate the four columns of the matrix directly
Dmat[, 1] <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
Dmat[, 2] <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Dmat[, 3] <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8,32.5, NA)
Dmat[, 4] <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6,15.6, 15.7)
#We can add column names to the matrix
colnames(Dmat) <- c("Wingcrd", "Tarsus", "Head","Wt")
rownames(Dmat) <- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8")
#We can achieve the same as follows
Dmat2 <- as.matrix(cbind(Wingcrd, Tarsus, Head, Wt))
#Special operators for matrices A and B are t(A) for transpose, A %*% B for
#matrix multiplication, and solve (A) for inverse.
#We now combine the Data using dataframe function

Dfrm<-data.frame(WC= Wingcrd,
                  TS =Tarsus,
                   H=Head,
                   W= Wt) 
#We can easily add variables to a data frame
#We add a variable the is square root of the weight)
Dfrm <- data.frame(WC=Wingcrd,
                   TS=Tarsus,
                   HD=Head,
                   W=Wt,
                   Wsq=sqrt(Wt))

Dfrm <- data.frame(WC=Wingcrd,
                   TS=Tarsus,
                   HD=Head,
                   W=Wt,
                   Wsq=Wingcrd+Tarsus)
#we can access a coloumn in the data frame as follows
Dfrm$WC
# a dataframe can combine different types of data
#Using the list function to combine data
x1 <- c(1, 2, 3)
x2 <- c("a", "b", "c", "d")
x3 <- 3
x4 <- matrix(nrow = 2, ncol = 2)
x4[, 1] <- c(1, 2)
x4[, 2] <- c( 3, 4)
#We now put all these in a list
Y <- list(x1 = x1, x2 = x2, x3 = x3, x4 = x4)
#R stores results of some functions in lists. We will see this later
#We can create a list that contains all our data 
AllData <- list(BirdData = BirdData, Id = Id2, Z = Z,
                VarNames = VarNames)


#IMPORTING DATA INTO R

#a tab-delimited ascii file that contains no blank cells or names with spaces,

Squid <- read.table(file ="squid.txt",
                    header = TRUE)


#the data is stored in a data frame
#We can extract the variable names
names(Squid)
#we can get the status of each variable using the str (structure) function
str(Squid)
#we can access variables using the $ sign 
Squid$GSI
#Or as the 6th column   
Squid[,6]
#We can then compute statistics for the variable
mean(Squid$GSI)
#Using the attach command we can directly access variables in the Squid Data frame 
attach(Squid)
#now we can just type GSI to access the variable GSI  
boxplot(GSI)
#We can undo this using the detach command
detach(Squid)

#WORKING WITH SUBSETS OF DATA
#We wish to access data for males only
#Check how the variable sex is coded
Squid$Sex
#Or more efficiently using
unique(Squid$Sex)
# 1 is for male and 2 for female
# We now select the males and store in the variable Sel
Sel <- Squid$Sex == 1
#This sets all male as TRUE and others FALSE
#we can now select only males from the data
SquidM <- Squid[Sel, ]
#we can also do both lines in one command
SquidM <- Squid[Squid$Sex == 1, ]
#We can also extract data for females only
SquidF <- Squid[Squid$Sex == 2, ]
#We can extract Data for locations 1,2 and 3 only in a variety of ways
Squid123 <- Squid[Squid$Location == 1 |Squid$Location == 2 | Squid$Location == 3, ]
Squid123 <- Squid[Squid$Location != 4, ]
Squid123 <- Squid[Squid$Location < 4, ]
Squid123 <- Squid[Squid$Location <= 3, ]
Squid123 <- Squid[Squid$Location >= 1 &Squid$Location <= 3, ]
Squid123 <- Squid[Squid$Year > 1, ]

#We now extract male data from location 1
SquidM.1 <- Squid[Squid$Sex == 1 & Squid$Location == 1,]
#We can extract males from locations 1 and 2 only
SquidM.12 <- Squid[Squid$Sex == 1 & (Squid$Location == 1 | Squid$Location == 2), ]
#ORDERING THE DATA
#We order the data by month
Ord1 <- order(Squid$Month)
Squid[Ord1, ]
#we can also order only one variable
Squid$GSI[Ord1]

#COMBINING TWO DATA SETS WITH A COMMON IDENTIFIER
#Import the data files into R
Sq1 <- read.table(file = "squid1.txt",header = TRUE)
Sq2 <- read.table(file = "squid2.txt",header = TRUE)
#wE then merge the files and store in a SquidMerged
SquidMerged <- merge(Sq1, Sq2, by = "Sample")
#Observe that case that are missing in either of the files are ommited
#We cthis using the following 
SquidMerged <- merge(Sq1, Sq2, by = "Sample", all = TRUE)
#EXPORTING DATA
#We export the Male Data from the squid data
SquidM <- Squid[Squid$Sex == 1, ]
write.table(SquidM,
              file = "MaleSquid.txt",
              sep = "    ", quote = FALSE, append = FALSE, na = "NA")

#RECODING CATEGORICAL VARIABLES
#In the squid data location is coded (1,2,3,and 4) and sex is coded (1,2)
#We can check this using str
str(Squid)
unique(Squid$Location)
#We create new variables in the data file recoded as nominal
Squid$fLocation <- factor(Squid$Location)
Squid$fSex <- factor(Squid$Sex)
#We Relabel the levels as male or female
Squid$fSex <- factor(Squid$Sex, levels = c(1, 2),labels = c("M", "F"))
#the factors can now be used in other functions
boxplot(GSI ~fSex, data = Squid) 
M1 <- lm(GSI ~fSex + fLocation, data = Squid)
#To select the males after changing the variables to factors, we use the "" marks
SquidM <- Squid[Squid$fSex == "1", ]




