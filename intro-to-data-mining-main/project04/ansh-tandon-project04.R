x <- 7
if (x > 0){
  print ("Positive number")
}
#this is alright but R is not like this

x <- -10
if(x >= 0){
  print("Non-negative number")
} else {
  print("Negative number")
}

options(jupyter.rich_data = F)

x <- c(-10,3,1,-6,19,-3,12,-1)
mysigns <- rep("Positive numbers or zero", times=8)
mysigns
mysigns[x < 0] <- "Negative number"
mysigns
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=26,repr.matrix.max.rows=200)
myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv", stringsAsFactors = TRUE)
head(myDF, n = 10)
head(myDF$state)
class(myDF$state)
table(myDF$state)
length(table(myDF$state))
tail(sort(table(myDF$state)))
dim(subset(myDF, price>=2000))
mean(myDF$price)





#example
myDF$pricecategory <- cut(myDF$price, breaks = c(-Inf,100000, 15000, Inf), lables = c("cheap", "expensive", "very expensive"))

#Question 2A
myDF$mileage_category <- cut(myDF$odometer, breaks = c(-Inf, 50000, 100000, 150000, Inf), labels = c("Low", "Moderate", "High", "Very High"))

#Question 2B
myDF$has_VIN <- c(myDF$VIN)

#Question 2C
mynchar <- nchar(as.character(myDF$description))

head(mynchar, n = 50)

myDF$description_length <- cut(mynchar, breaks = c(-Inf, 50, 100, 200, 500, Inf), labels = c("Very Short", "Short", "Medium", "Long", "Very Long"))




table(myDF$mileage_category)
str(table(myDF$has_VIN))
dim(myDF)
426880-118265
table(myDF$description_length)





myTexasDF <- subset(myDF, state == "tx")
summary(myTexasDF)
tail(sort(table(myDF$state)))
populareStateDF <- subset(myDF, state == "ca")
myFavoriteDF <- subset(myDF, state == "ny")





options(jupyter.rich_display=TRUE) #change the rich data to be True
options(repr.matrix.max.cols=26,repr.matrix.max.rows=200)
myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv", stringsAsFactors = TRUE)
dim(myDF)
myTexasDF <- subset(myDF, state == "tx" & !is.na(lat) & !is.na(long)) #remove NA values from column
dim(myTexasDF)
library(leaflet) #loading the new leaflet
library(sf) #loading SF library
points <- st_as_sf(myTexasDF, coords=c("long", "lat"), crs=4326) #load points to be plotted into map
addCircleMarkers(addTiles(leaflet(myTexasDF)), radius = 1) #make the map


popularStateDF <- subset(myDF, state == "ca" & !is.na(lat) & !is.na(long))
points <- st_as_sf(popularStateDF, coords=c("long", "lat"), crs=4326) #load points to be plotted into map
addCircleMarkers(addTiles(leaflet(popularStateDF)), radius = 1) #make the map


myFavoriteDF <- subset(myDF, state == "ny" & !is.na(lat) & !is.na(long))
points <- st_as_sf(myFavoriteDF, coords=c("long", "lat"), crs=4326) #load points to be plotted into map
addCircleMarkers(addTiles(leaflet(myFavoriteDF)), radius = 1) #make the map

