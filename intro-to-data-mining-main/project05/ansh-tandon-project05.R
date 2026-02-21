myDF <- read.csv("/anvil/projects/tdm/data/election/escaped2020sample.txt", sep="|")
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)
head(myDF)


head(myDF$TRANSACTION_DT)
library(lubridate, warn.conflicts = FALSE)
myDF$newdates <-mdy(myDF$TRANSACTION_DT)
class(myDF$TRANSACTION_DT)
class(myDF$newdates)
head(myDF$newdates)
myDF$TRANSACTION_YR <- year(myDF$newdates)
head(myDF$TRANSACTION_YR)
table(myDF$TRANSACTION_YR)
sumOfResults <- tapply(myDF$TRANSACTION_AMT, myDF$TRANSACTION_YR, sum)
barplot(sumOfResults, main = "Total Amount of Transactions versus Years", xlab = "Years", ylab = "Total Amount of Transactions")




my2020DF <- subset(myDF, TRANSACTION_YR == "2020")
dim(my2020DF)
my2020DF$TRANSACTION_MONTH <- month(my2020DF$newdates)
head(my2020DF)
tapply(my2020DF$TRANSACTION_AMT, my2020DF$TRANSACTION_MONTH, sum)
sumOfResults <- tapply(my2020DF$TRANSACTION_AMT, my2020DF$TRANSACTION_MONTH, sum)
barplot(sumOfResults, main = "Total Amount of Transactions versus Month in 2020", xlab = "Month", ylab = "Total Amount of Transactions")




head(sort(tapply(myDF$TRANSACTION_AMT, myDF$NAME, sum)))
tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$NAME, sum)))
sumResults <- tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)
sumResults

tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)))
tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$ZIP_CODE, sum)), n = 10)



sumOfResults <- tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)))
barplot(sumOfResults, main = "Total Amount of Money Donated vs. State in Top 5 States", xlab = "State", ylab = "Total Amount of Money Donated")
sumResults <- tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$ZIP_CODE, sum)), n = 10)
barplot(sumResults, main = "Total Amount of Money Donated versus ZipCode in Top 10 Zipcodes", xlab = "Zipcode", ylab = "Total Amount of Money Donated")




sumOfResults <- tapply(myDF$TRANSACTION_DT, myDF$STATE, sum)
barplot(sumOfResults, main = "Transaction Date vs. States", xlab = "States", ylab = "Transaction Date")
plot(sumOfResults, main = "Transaction Date vs. States (Scatter)", xlab = "States", ylab = "Transaction Date")
