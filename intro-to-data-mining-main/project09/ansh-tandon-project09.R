#Question 1
benfords_law <- function(d) log10(1+1/d)
benfords_law(1)
benfords_law(2)
benfords_law(9)
digits <-1:9
bf_val<-benfords_law(digits)
bf_val
plot(digits, bf_val, xlab = "digits", ylab="probabilities", main="Benfords Law Plot Line")



#Question 2
-6384.52 #want to return 6
7223.0026 #want to return a 7
0.0037291 #want to return a 3
first_digit <- function(number) {
    number <- abs(number)
    if (number != 0) {
      while (number >= 10) {
        number <- number/10
      }
      while (number < 1) {
        number <- number*10
      }  
      number <- floor(number)
    }        
    return(number)

}
first_digit(-6384.52)
first_digit(7223.0026)
first_digit(0.0037291)



#Question 3
library(data.table)
myDF <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
head(myDF)
head(myDF$grand_total)
sapply(head(myDF$grand_total), first_digit)
myDF$fd_grand_total <- sapply(myDF$grand_total, first_digit)
head(myDF$fd_grand_total)



#Question 4
table(myDF$fd_grand_total)
plot(table(myDF$fd_grand_total))
plot(table(myDF$fd_grand_total) / length(myDF$fd_grand_total))



#Question 5
head(myDF$delivery_date)
tail(myDF$delivery_date, n=100)
head(myDF$delivery_date, n=100)
as.Date(head(myDF$delivery_date, n=10))
as.Date(head(myDF$delivery_date, n=10)) <= as.Date("2019-09-15")
as.Date(head(myDF$delivery_date, n=10)) <= as.Date("2019-02-15")
find_orders <- function(start_date, end_date) {
    orders_by_dates <- subset(myDF, ((myDF$delivery_date >= start_date) & (myDF$delivery_date <= end_date)))
    return(orders_by_dates)
}    
dim(myDF)
myresultDF <- find_orders("2019-07-31", "2019-08-01")
dim(myresultDF)
myresultDF <- find_orders("2019-07-31", "2019-08-15")
dim(myresultDF)
myresultDF <- find_orders("2019-08-10", "2019-08-15")
dim(myresultDF)
head(myresultDF)
tail(myresultDF)