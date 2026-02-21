#Question 1
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)
library(data.table)
products <- fread("/anvil/projects/tdm/data/icecream/combined/products.csv")
reviews <- fread("/anvil/projects/tdm/data/icecream/combined/reviews.csv")
head(products$ingredients)
unique(trimws(unlist(strsplit(products$ingredients[1], ",|\\(|\\)"))))
unique(trimws(unlist(strsplit(products$ingredients[2], ",|\\(|\\)"))))
unique(trimws(unlist(strsplit(products$ingredients[3], ",|\\(|\\)"))))
getingredients <- function(x) {
    unique(trimws(unlist(strsplit(x, ",|\\(|\\)"))))
}    
getingredients(products$ingredients[55])
tail(sort(table(unlist(sapply(products$ingredients, getingredients), use.names=FALSE))), n=11)
myNewDF <- tail(sort(table(unlist(sapply(products$ingredients, getingredients), use.names=FALSE))), n=11)
dotchart(tail(sort(table(unlist(sapply(products$ingredients, getingredients), use.names=FALSE))), n=11))
barplot(myNewDF, main = "Ingredients vs Frequency", xlab = "", ylab = "Frequency", las = 2) #rotated axis with las command
head(products$review) #this doesn't work
plot(table(reviews$stars), type = "b", main = "Distrubtion of Reviews", xlab = "Rating", ylab = "Frequency", las = 2)




#Question 2
# trying to compile a function based on the code provided in the question. 
products_reviews_by_rating <- function(products_df, reviews_df, myrating) 
{  
    merge_results <- merge(products_df, reviews_df, by="key")
    products_reviews_results <- merge_results[merge_results$rating >= myrating, ]
    return(products_reviews_results)
}   




#Question 3
# writing psuedocode from method in Question 2

#method name before function key word
products_reviews_by_rating <- function(products_df, reviews_df, myrating) #creates a new function with the 3 parameters of prdocuts, reviews, and myrating
{  
    merge_results <- merge(products_df, reviews_df, by="key") #merges the product and review dataframe with the key provided 
    products_reviews_results <- merge_results[merge_results$rating >= myrating, ] #filters results based on if rating in merged is greater than rating in parameter of function
    return(products_reviews_results) #returns the filter results from previous line
} 
#end of entire code




#Question 4
my_selection <- products_reviews_by_rating(products, reviews, 4.5)
dim(my_selection)



#Question 5
# code here
number_of_products_with_ingredient <- function(ingredient)
{
    all_ingredients <- trimws(unlist(strsplit(products$ingredients, ",|\\(|\\)"))) #used similar syntax from question 1
    correct_ingredient <- all_ingredients == ingredient
    return(sum(correct_ingredient))
}  
