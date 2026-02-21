myDF <- read.csv("/anvil/projects/tdm/data/flights/subset/1995.csv")

head(myDF)

dim(myDF)

summary(myDF)

str(myDF)

class(myDF$Distance)

my_airports <- myDF$Origin

head(my_airports)

class(my_airports)

head(my_airports, 250)

250-13

str(myDF$Origin[myDF$Origin == "IND"])

str(myDF$Dest[myDF$Dest == "IND"])

myDF[894,]$Origin

myDF[894,]$Dest

str(myDF$Distance[myDF$Distance < 200])

sort(table(myDF$UniqueCarrier))

tail(sort(table(myDF$TailNum)), 11)

hist(myDF$Distance, main="Flight Distances", xlab = "Distance (miles)", ylab="Count", col="lightblue")
