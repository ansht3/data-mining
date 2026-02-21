system("hostname", intern=TRUE)


# calculate memory (in bytes) on anvil A sub-cluster using R
1000*256*1000000000

# calculate memory (in TB) on anvil A sub-cluster using Python
1000*256*0.001


dat <- read.csv("/anvil/projects/tdm/data/disney/flight_of_passage.csv")

head(dat)

flight_of_passage <- dat

rm(dat)

head(flight_of_passage)