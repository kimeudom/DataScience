
##assigning objects to variables numbers
x <- 11
y <- 7
# overwrite the value for y
y <- 9
#remove y from the workspace
rm(y)
#restore y since we will use it later
y <- 9
##Check what is in the workspace
ls()
#Assign characters to variables
yy <- "martin"
#add subtract multiply or divide two numbers
x + y
x - y
x * y
x / y
#Exponents, logs and trigonometric functions
y^2
x^2 + y^2
sqrt(y)
y^(1/2)
log(y)
log10(y)
sin(x)
abs(-14)
##Creating vectors and matrices
x1<-c(1,3,5,7,9)
#get length of the vector
length(x1)
#create a vector of characters or names
gender=c("male","female")
##Create sequences of vectors
seq(from=1, to=7,by=1)
rep(1,times=10)
rep(seq(from=2, to=5, by=0.25), times=5)
rep(1:3, times=5)
rep(c("m","f"),times=6)
x<-1:5
y<-c(1,3,5,7,9)
x+10
x*10
x+y
x-y
x*y
x/y
#Extract some components of a vector
y[3]
##extract all components except the third
y[-3]
##Extract the first 3 components
y[1:3]
#extract the first and the fifth components
y[c(1,5)]
#extract all components except the 1st and the 5th
y[-c(1,5)]
##extract all entries that are less than 6
y[y<6]
##Entering matrices in R
A=matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,byrow=T)
#exract entry in position A(1,2)
A[1,2] 
#extract entries (1,2) and (3,2)
A[c(1,3),2]
###Exract the second row
A[2, ]
##Extract the first coloumn
A[,1]
#Multiply the matrix by a number
10*A
#check dimensions for A
dim(A)
##Multiply 2 matrices
B=matrix(c(1,2,5,9,1,0), nrow=3, byrow=T)
A%*%B
###Generate the identity matrix matrix
d=rep(1,times=5)
diag(d)
##Find the inverse of a matrix
M<-matrix(c(2,2,3,3,5,9,5,6,7),ncol=3 )
solve(M)
K<-diag(c(1,1,1))
AB<-cbind(M,K)

T<-matrix(c(1,1,1,2,6,2,1,1,4,1,0,-1,-1,0,-11), nrow=3, byrow=T)
b=c(12,11,-13)
AG=cbind(T,b)

