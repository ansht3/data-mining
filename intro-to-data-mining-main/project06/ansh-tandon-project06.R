myDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv", stringsAsFactors=TRUE)
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)
head(myDF)
table(myDF$Games)
my1980DF <- subset(myDF, Year == "1980")
table(my1980DF$NOC)
head(myDF$Name)
head(myDF$Name[duplicated(myDF$Name)])
myduplicatedathletes <- unique(myDF$Name[duplicated(myDF$Name)])
dim(myDF)
mynewDF <- subset(myDF, Name %in% myduplicatedathletes)
dim(mynewDF)



tapply(myDF$Age, myDF$NOC, mean)
myDFMax <- tapply(myDF$Height, myDF$Sport, max, na.rm = TRUE)
myDFMaxSorted <- sort(myDFMax)
tail(myDFMaxSorted)



myDF <- read.csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv", stringsAsFactors = TRUE)
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=50, repr.matrix.max.rows=200)
head(myDF)
str(myDF)
table(myDF$MonthOfDeath)
class(myDF$MonthOfDeath)
month_order <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
myDF$MonthOfDeath <- factor(myDF$MonthOfDeath)
levels(myDF$MonthOfDeath) <- month_order
head(myDF$MonthOfDeath, n=50)
table(myDF$MonthOfDeath)




head(myDF)
table(myDF$Sex)
table(myDF$Race)
sort(table(myDF$Race), decreasing = TRUE)
myFemale <- myDF[myDF$Sex == "F", ]
tapply(myFemale$Age, myFemale$Race, mean, na.rm = TRUE)
myMale <- myDF[myDF$Sex == "M", ]
tapply(myMale$Age, myMale$Race, mean, na.rm = TRUE)



myDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv", stringsAsFactors=TRUE)
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)
head(myDF)
meanResults <- tapply(myDF$Weight, myDF$NOC, mean, na.rm = TRUE)
barplot(meanResults, main = "Mean of Athletes Weight vs. Country of Origin", xlab = "Country", ylab = "Weight")
myDF <- read.csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv", stringsAsFactors = TRUE)
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=50, repr.matrix.max.rows=200)
head(myDF)
myFemale <- myDF[myDF$Sex == "F", ]
meanFemaleResults <- tapply(myFemale$Age, myFemale$Race, mean, na.rm = TRUE)
