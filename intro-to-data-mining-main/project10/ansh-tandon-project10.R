#Question 1
library(data.table)
options(jupyter.rich_display = F)
options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)
orders <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
vendors<- fread("/anvil/projects/tdm/data/restaurant/vendors.csv")
head(vendors)
head(vendors$vendor_tag_name)
table(vendors$vendor_tag_name)
grep("Fries", vendors$vendor_tag_name)
grepl("Fries", vendors$vendor_tag_name)
newDFOne <- subset(vendors, grepl("Fries", vendor_tag_name))
dim(newDFOne)
myDFTwo <- vendors[grep("Fries", vendors$vendor_tag_name),  ]
dim(myDFTwo)




#Question 2
head(vendors$delivery_charge)
length(vendors$delivery_charge)
table(vendors$delivery_charge) #these are the counts: 41 of 0 and 59 of 0.7
prop.table(table(vendors$delivery_charge)) #these are the percentages




#Question 3
vendors$delivery_charge[vendors$vendor_category_id == 2]
table(vendors$delivery_charge[vendors$vendor_category_id == 2])
prop.table(table(vendors$delivery_charge[vendors$vendor_category_id == 2]))
vendors$delivery_charge[vendors$vendor_category_id == 3]
table(vendors$delivery_charge[vendors$vendor_category_id == 3])
prop.table(table(vendors$delivery_charge[vendors$vendor_category_id == 3]))




#Question 4
table(vendors$delivery_charge[vendors$vendor_category_id == 2])
table(vendors$delivery_charge[vendors$vendor_category_id == 3])
tapply(vendors$delivery_charge, vendors$vendor_category_id, table)
tapply(vendors$delivery_charge, vendors$vendor_category_id, function(x) {table(x)})
tapply(vendors$delivery_charge, vendors$vendor_category_id, function(x) {prop.table(table(x))})




#Question 5
tapply(vendors$delivery_charge, vendors$vendor_category_id, table)
sapply(tapply(vendors$delivery_charge, vendors$vendor_category_id, table), prop.table, simplify=FALSE)