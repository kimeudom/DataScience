#Finding zeros and missing data

#we construct a function that finds the number of missing values in each variable
Veg <- read.table(file = "Vegetation2.txt",header = TRUE)
NAPerVariable <- function(X1) {
  D1 <- is.na(X1)
  colSums(D1)
}

#We appy the function to the vegetation data
NAPerVariable(Veg[,5:24])

#Finding number of zeros
Parasite<-read.table(file="CodParasite.txt",header=TRUE)
NAPerVariable(Parasite)

#Function to find zeros per variable
ZerosPerVariable <- function(X1) {
  D1 = (X1 == 0)
  colSums(D1,na.rm = TRUE)
}

ZerosPerVariable(Parasite)
#A function with multiple arguments
VariableInfo <- function(X1, Choice1) {
  if (Choice1 == "Zeros"){ D1 = (X1 == 0) }
  if (Choice1 == "NAs") { D1 <- is.na(X1)}
  colSums(D1, na.rm = TRUE)
}
#Check for zeros
VariableInfo(Parasite, "Zeros")
#Check for missing values

VariableInfo(Parasite, "NAs")
#These functions crash if the choices are missing or misspelt

VariableInfo(Parasite, "zeroos")
#We partially solve this by setting a default value for the output
VariableInfo <- function(X1, Choice1 = "Zeros") {
  if (Choice1 == "Zeros"){ D1 = (X1 == 0) }
  if (Choice1 == "NAs") { D1 <- is.na(X1)}
  colSums(D1, na.rm = TRUE)
}
#we test the function
VariableInfo(Parasite)
VariableInfo(Parasite, "NAs")
#We now fix the mispelling problem
VariableInfo <- function(X1, Choice1 = "Zeros") {
  if (Choice1 == "Zeros"){ D1 = (X1 == 0) }
  if (Choice1 == "NAs") { D1 <- is.na(X1)}
  if (Choice1 != "Zeros" & Choice1 != "NAs") {
    print("You made a typo")} else {
      colSums(D1, na.rm = TRUE)}
}
#We test it out
VariableInfo(Parasite, "abracadabra")






