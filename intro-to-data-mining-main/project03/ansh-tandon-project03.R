myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv")

options(jupyter.rich_display = F)

head(myDF)

dim(myDF)

str(myDF)

table(myDF$state)




table(myDF$year, useNA = "always")

head(myDF$year, n = 20)

head(is.na(myDF$year), n = 50)

#true values can convert to 1 and false can convert to 0
sum(is.na(myDF$year))

dim(myDF)[1]

sum(is.na(myDF$year)) / dim(myDF)[1] #less than 1% of values are NA

goodlatitudeDF <- subset(myDF, !is.na(myDF$lat))

dim(goodlatitudeDF)

goodlatitudeDF <- subset(myDF, !is.na(lat))

goodlatitudeDF <- myDF[!is.na(myDF$lat), ] #before comma conditions on rows, after comma conditions on columns

dim(myDF)

goodyearsDF <- subset(myDF, !is.na(myDF$year))

head(goodyearsDF)

missingyearsDF <- subset(myDF, is.na(myDF$year))

head(missingyearsDF)




aggregate(price ~ type, data = myDF, FUN = mean)

aggregate(price ~ year, data = myDF, FUN = mean)

subset(aggregate(price ~ year, data = myDF, FUN = mean), year>2002)

table(myDF$year)

which.max(table(myDF$year))

length(table(myDF$year))

table(myDF$year)[which.max(table(myDF$year))]




head(myDF$region_url )

tail(sort(table(myDF$region_url )), n = 1)

head(myDF$state)

tail(sort(table(myDF$state)), n = 3)




myyears <- subset(aggregate(price ~ year, data = myDF, FUN = mean), year>2002)$year

myprices <- subset(aggregate(price ~ year, data = myDF, FUN = mean), year>2002)$price

plot(myyears, myprice)

plot(myyears[myprices<500000], myprices[myprices<500000]) 

#ommitted car that are much larger in price as those values were not feasible

plot(myyears[myprices<500000], myprices[myprices<500000], type = "o")

#ommitted car that are much larger in price as those values were not feasible

plot(myyears[myprices<500000], myprices[myprices<500000], type = "h")

#ommitted car that are much larger in price as those values were not feasible