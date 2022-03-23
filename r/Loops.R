#We use loops to perform repetitive tasks.
#The task here is to produce 27 graphs fr 27 nests of arrival 
#time vs negotiations per chick 

Owls <- read.table(file = "Owls.txt", header = TRUE)
AllNests <- unique(Owls$Nest)
 for (i in 1:27){
  Nest.i <- AllNests[i]
  Owls.i <- Owls[Owls$Nest == Nest.i, ]
  YourFileName <- paste(Nest.i, ".jpg", sep = "")
  jpeg(file = YourFileName)
  plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
       xlab = "Arrival Time",
       ylab = "Negotiation behaviour", main = Nest.i)
  dev.off()
 }
