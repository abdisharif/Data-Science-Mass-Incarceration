## Load Data
Data <- read.csv("")

# Third chart Data
Dat <- Data[2:31,c(1:3,4,5)]

boxplot(Dat, xlab = "Asian", ylab = "Total")
