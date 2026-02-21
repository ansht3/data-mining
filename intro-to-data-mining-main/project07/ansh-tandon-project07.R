#Question 1
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)
library(data.table)
products <- fread("/anvil/projects/tdm/data/icecream/combined/products.csv")
reviews <- fread("/anvil/projects/tdm/data/icecream/combined/reviews.csv")
titles <- fread("/anvil/projects/tdm/data/movies_and_tv/titles.csv")
episodes <- fread("/anvil/projects/tdm/data/movies_and_tv/episodes.csv")
ratings <- fread("/anvil/projects/tdm/data/movies_and_tv/ratings.csv")
head(products$ingredients, n = 1)
dim(products)
guargum <- products[grepl("GUAR GUM", products$ingredients)]
dim(guargum)
length(grep("GUAR GUM", products$ingredients))
sort(table(guargum$rating), decreasing = TRUE)



#Question 2
names(products)
names(reviews)
class(products$brand)
class(reviews$brand)
class(products$key)
class(reviews$key)
class(products$ingredients)
class(reviews$ingredients) #going to fail in merge because of this data type
bigDF <- merge(products, reviews, by=c("brand", "key"))
dim(products)
dim(reviews)
dim(bigDF)
head(bigDF)



#Question 3
head(episodes)
StrangerThingsDF <- subset(episodes, show_title_id=="tt4574334")
dim(StrangerThingsDF)
head(titles)
head(ratings)
merge(StrangerThingsDF, titles, by.x = "show_title_id", by.y = "title_id")
merge(merge(merge(merge(StrangerThingsDF, titles, by.x="show_title_id", by.y="title_id"),
          titles, by.x="episode_title_id", by.y="title_id"), 
          ratings, by.x="show_title_id", by.y="title_id"),
          ratings, by.x="episode_title_id", by.y="title_id")
StrangerThingsBigMergedDF <- merge(merge(merge(merge(StrangerThingsDF, titles, by.x="show_title_id", by.y="title_id"),
          titles, by.x="episode_title_id", by.y="title_id"), 
          ratings, by.x="show_title_id", by.y="title_id"),
          ratings, by.x="episode_title_id", by.y="title_id")
dim(StrangerThingsBigMergedDF)
head(StrangerThingsBigMergedDF)
head(StrangerThingsBigMergedDF[order(StrangerThingsBigMergedDF$rating.y), ])
head(StrangerThingsBigMergedDF[order(StrangerThingsBigMergedDF$rating.y, decreasing = TRUE), ], n=5) #final output



#Question 4
StrangerThingsBigMergedDF[ (StrangerThingsBigMergedDF$season_number == 3) & (StrangerThingsBigMergedDF$rating.y < 8.5), ]
subset(StrangerThingsBigMergedDF, (season_number == 3) & (rating.y < 8.5))




#Question 5
myseason <- 3
subset(StrangerThingsBigMergedDF, (season_number == myseason) & (rating.y < 8.5))

#This is fine as variable name is different
season_number <- 3
subset(StrangerThingsBigMergedDF, (season_number == season_number) & (rating.y < 8.5))

#This is wrong don't do this